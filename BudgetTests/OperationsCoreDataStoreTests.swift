//
//  OperationsCoreDataStoreTests.swift
//  Budget
//
//  Created by William Archimède on 29/07/2017.
//  Copyright © 2017 William Archimede. All rights reserved.
//

import XCTest
import CoreData
@testable import Budget

class OperationsCoreDataStoreTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRetrieveOperationsShouldReturn_EmptyArray_When_EmptyBase() {
        // given
        let container = NSPersistentContainer(name: "DataPersistenceControllerTests")
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        container.persistentStoreDescriptions = [persistentStoreDescription]
        let sut = OperationsCoreDataStore(persistentContainer: container)

        // when
        let (operations, error) = sut.fetchOperations()
        // then
        XCTAssertNil(error)
        XCTAssertNotNil(operations)
        XCTAssertEqual(operations.count, 0)
    }
    
}
