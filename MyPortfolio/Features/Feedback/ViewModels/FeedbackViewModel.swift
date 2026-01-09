//
//  FeedbackViewModel.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

enum FeedbackViewState {
    case loading
    case showForm
    case showSubmitted(String)
}

@MainActor
final class FeedbackViewModel: ObservableObject {
    @Published var feedbackQuestionList: [FeedbackQuestion] = loadFeedBackData()
    @Published var pdfURL: URL?
    @Published var showPDFPreview = false
    @Published var requiresContactPopUpBeforeProceeding = false
    @Published private(set) var viewState: FeedbackViewState = .loading
    
    private let userContactRepository: UserContactRepository
    private let feedBackSubmissionRepository: FeedBackSubmissionRepository
    
    init(userContactRepository: UserContactRepository, feedSubmissionRepository: FeedBackSubmissionRepository) {
        self.userContactRepository = userContactRepository
        self.feedBackSubmissionRepository = feedSubmissionRepository
    }
    
    func onAppear() {
        loadFeedback()
    }
    
    private func loadFeedback() {
        do {
            if let feedback = try feedBackSubmissionRepository.fetchSubmittedFeedback() {
                viewState = .showSubmitted(feedback.signedPDFURL ?? "")
            } else {
                viewState = .showForm
            }
        } catch {
            viewState = .showForm
        }
    }
    
    
    func reviewAndSubmitFeedback(appState: AppState) {
        if !appState.hasProvidedContactDetails {
            requiresContactPopUpBeforeProceeding = true
        }
        else {
            proceedToReview()
        }
    }
    
    func proceedToReview() {
        pdfURL = generatePDF()
        if pdfURL != nil {
            showPDFPreview = true
        }
    }
    
    
    func generatePDF() -> URL? {
    
        do {
            let url = try FeedBackPDFGenerator.generatePDF(from: feedbackQuestionList)
            return url
        } catch {
            print("Error generating PDF: \(error)")
            return nil
        }
        
    }
    
    func submitFeedBack(signedPDF: URL) {
        let pdfPath = signedPDF.path
        let responseJSON = feedbackToJSONString(questions: feedbackQuestionList)
        
        feedBackSubmissionRepository.saveUserFeedBack(feedBackPDFURL: pdfPath, feedBackResponseJSON: responseJSON)
        viewState = .showSubmitted(pdfPath)
        
    }

}

