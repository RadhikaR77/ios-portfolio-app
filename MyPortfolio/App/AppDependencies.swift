//
//  AppDependencies.swift
//  MyPortfolio
//
//  Created by Radhika on 02/01/26.
//

import CoreData

final class AppDependencies {
    let userContactRepository: UserContactRepository
    let feedBackSubmissionRepository: FeedBackSubmissionRepository

    init(context: NSManagedObjectContext) {
        self.userContactRepository = UserContactRepositoryImpl(context: context)
        self.feedBackSubmissionRepository = FeedBackSubmissionRepositoryImpl(context: context)
    }
}

