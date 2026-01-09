//
//  FeedBackSubmissionRepositoryImpl.swift
//  MyPortfolio
//
//  Created by Radhika on 07/01/26.
//
import CoreData

final class FeedBackSubmissionRepositoryImpl: FeedBackSubmissionRepository {
    
    private let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func fetchSubmittedFeedback() throws -> FeedBackSubmission? {
        let request: NSFetchRequest<FeedBackSubmission> = FeedBackSubmission.fetchRequest()
        request.fetchLimit = 1
        request.sortDescriptors = [
            NSSortDescriptor(key: "createdDate", ascending: false)
        ]
        return try context.fetch(request).first
    }
    
    func saveUserFeedBack(feedBackPDFURL: String?, feedBackResponseJSON: String?){
        let feedBackEntity = FeedBackSubmission(context: context)
        feedBackEntity.id = UUID()
        feedBackEntity.createdDate = Date()
        feedBackEntity.responseJSON = feedBackResponseJSON
        feedBackEntity.signedPDFURL = feedBackPDFURL
        saveContext()
    }
    
    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        }
        catch {
            print("Error saving context: \(error)")
        }
    }
}

