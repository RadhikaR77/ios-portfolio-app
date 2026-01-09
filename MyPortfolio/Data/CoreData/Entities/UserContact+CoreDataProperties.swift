//
//  UserContact+CoreDataProperties.swift
//  MyPortfolio
//
//  Created by Radhika on 01/01/26.
//
//

import Foundation
import CoreData


extension UserContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserContact> {
        return NSFetchRequest<UserContact>(entityName: "UserContact")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var contactNumber: String?
    @NSManaged public var createdDate: Date?
    @NSManaged public var companyName: String?

}

extension UserContact : Identifiable {

}
