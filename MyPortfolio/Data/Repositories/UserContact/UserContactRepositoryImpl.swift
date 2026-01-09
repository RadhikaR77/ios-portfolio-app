//
//  UserContactRepositoryImpl.swift
//  MyPortfolio
//
//  Created by Radhika on 06/01/26.
//

import CoreData


final class UserContactRepositoryImpl : UserContactRepository {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func save(name: String?, email: String?, contactNumber: String?, company: String? ) {
        let entity = UserContact(context: context)
        entity.id = UUID()
        entity.name = name
        entity.contactNumber = contactNumber
        entity.email = email
        entity.companyName = company
        entity.createdDate = Date()

        saveContext()
    }

    private func saveContext() {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("Failed to save contact:", error)
        }
    }
}
