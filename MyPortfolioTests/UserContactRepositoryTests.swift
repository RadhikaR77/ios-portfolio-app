//
//  UserContactRepositoryTests.swift
//  MyPortfolioTests
//
//  Created by Radhika on 08/01/26.
//

import XCTest
import CoreData
@testable import MyPortfolio

final class UserContactRepositoryTests: XCTestCase {

    var context: NSManagedObjectContext!
    var repository: UserContactRepository!

    override func setUp() {
        super.setUp()

        let container = NSPersistentContainer(name: "PortfolioApp")

        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType

        container.persistentStoreDescriptions = [description]

        container.loadPersistentStores { _, error in
            XCTAssertNil(error)
        }

        context = container.viewContext

        repository = UserContactRepositoryImpl(context: context)
    }

    override func tearDown() {
        context = nil
        repository = nil
        super.tearDown()
    }
    
    func test_saveUserContact_createsEntity() {
        let name = "User"
        let email = "user@test.com"
        let phone = "9999999999"
        let company = "PortfolioApp"

        repository.save(
            name: name,
            email: email,
            contactNumber: phone,
            company: company
        )

       
        let request: NSFetchRequest<UserContact> = UserContact.fetchRequest()

        do {
            let results = try context.fetch(request)

            XCTAssertEqual(results.count, 1)

            let savedContact = results.first
            XCTAssertEqual(savedContact?.name, name)
            XCTAssertEqual(savedContact?.email, email)
            XCTAssertEqual(savedContact?.contactNumber, phone)
            XCTAssertEqual(savedContact?.companyName, company)

        } catch {
            XCTFail("Fetch failed: \(error)")
        }
    }

}

