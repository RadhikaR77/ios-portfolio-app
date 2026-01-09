//
//  FeedBackSubmission+CoreDataProperties.swift
//  MyPortfolio
//
//  Created by Radhika on 01/01/26.
//
//

import Foundation
import CoreData


extension FeedBackSubmission {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FeedBackSubmission> {
        return NSFetchRequest<FeedBackSubmission>(entityName: "FeedBackSubmission")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var createdDate: Date?
    @NSManaged public var signedPDFURL: String?
    @NSManaged public var responseJSON: String?

}

extension FeedBackSubmission : Identifiable {

}
