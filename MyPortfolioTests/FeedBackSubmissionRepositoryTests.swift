//
//  FeedBackSubmissionRepositoryTests.swift
//  MyPortfolioTests
//
//  Created by Radhika on 08/01/26.
//

import XCTest
import CoreData
@testable import MyPortfolio

final class FeedBackSubmissionRepositoryTests: XCTestCase {

    var context: NSManagedObjectContext!
    var repository: FeedBackSubmissionRepository!

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

        repository = FeedBackSubmissionRepositoryImpl(context: context)
    }

    override func tearDown() {
        context = nil
        repository = nil
        super.tearDown()
    }
    
    func test_saveUserFeedBack_createsEntity(){
        let response = "testing"
        let pdfPath = "path"
        repository.saveUserFeedBack(feedBackPDFURL: pdfPath, feedBackResponseJSON: response)
        
        let request : NSFetchRequest<FeedBackSubmission> = FeedBackSubmission.fetchRequest()
        do {
            let results = try context.fetch(request)

            XCTAssertEqual(results.count, 1)

            let savedContact = results.first
            XCTAssertEqual(savedContact?.signedPDFURL, pdfPath)
            XCTAssertEqual(savedContact?.responseJSON, response)

        } catch {
            XCTFail("Fetch failed: \(error)")
        }
    }

}
