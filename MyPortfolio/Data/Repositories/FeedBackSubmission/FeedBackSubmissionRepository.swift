//
//  FeedBackSubmissionRepository.swift
//  MyPortfolio
//
//  Created by Radhika on 07/01/26.
//

protocol FeedBackSubmissionRepository {
    func saveUserFeedBack(feedBackPDFURL: String?, feedBackResponseJSON: String?)
    func fetchSubmittedFeedback() throws -> FeedBackSubmission?
}

