//
//  FeedbackView.swift
//  MyPortfolio
//
//  Created by Radhika on 28/12/25.
//

import SwiftUI

import SwiftUI

struct FeedbackView: View {

    // MARK: - State & Dependencies

    @StateObject var viewModel: FeedbackViewModel
    @EnvironmentObject private var appState: AppState

    @State private var signedPDFURL: URL?

    /// Callback provided by RootContainerView
    /// Used when contact popup must be shown before proceeding
    let requestContactPopup: (
        _ onCompletion: @escaping () -> Void
    ) -> Void

    // MARK: - Body

    var body: some View {
        ZStack {

            switch viewModel.viewState {

            case .loading:
                ProgressView()
                
            case .showForm:
                feedbackQuestionsUI

            case .showSubmitted(let pdfURL):
                SubmittedFeedbackView(pdfURL: pdfURL)

                
            }

        }
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: signedPDFURL) {
            guard let signedPDFURL else { return }
            viewModel.submitFeedBack(signedPDF: signedPDFURL)
        }
        .onChange(of: viewModel.requiresContactPopUpBeforeProceeding) {
            guard viewModel.requiresContactPopUpBeforeProceeding else { return }

            requestContactPopup {
                viewModel.proceedToReview()
            }

            viewModel.requiresContactPopUpBeforeProceeding = false
        }
    }

    // MARK: - Questions UI 

    private var feedbackQuestionsUI: some View {
        VStack(alignment: .leading) {

            Text("Quick Feedback")
                .font(.custom("Montserrat-Bold", size: 32))
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
                .padding(.top, 20)

            Text("Your feedback helps me improve the app.")
                .font(.custom("Montserrat-Bold", size: 16))
                .multilineTextAlignment(.leading)
                .padding(.leading, 20)
                .padding(.top, 10)
                .padding(.bottom, 1)

            ScrollView {
                ForEach($viewModel.feedbackQuestionList) { $feedBackQuestion in
                    switch feedBackQuestion.type {

                    case .multipleChoice:
                        MultiChoiceCell(
                            answer: $feedBackQuestion.answer,
                            question: feedBackQuestion.question,
                            options: feedBackQuestion.options ?? []
                        )

                    case .rating:
                        RatingCell(
                            answer: $feedBackQuestion.answer,
                            question: feedBackQuestion.question
                        )

                    case .text:
                        TextViewCell(
                            answer: $feedBackQuestion.answer,
                            question: feedBackQuestion.question
                        )
                    }
                }
            }

            Button {
                viewModel.reviewAndSubmitFeedback(appState: appState)
            } label: {
                Text("Review & Sign")
                    .font(.custom("Montserrat-Medium", size: 16))
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200, height: 40)
                    .background(Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.top, 10)

        }
        .background(Color.gray.opacity(0.2))
        .sheet(isPresented: $viewModel.showPDFPreview) {
            if let pdfURL = viewModel.pdfURL {
                NavigationStack {
                    PDFPreviewView(
                        pdfURL: pdfURL,
                        signedPDFURL: $signedPDFURL
                    )
                }
            }
        }
    }
}


