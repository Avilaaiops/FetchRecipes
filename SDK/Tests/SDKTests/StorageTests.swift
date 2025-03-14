//
//  StorageTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//


import XCTest
@testable import SDK

class StorageTests: XCTestCase {

    struct TestStruct: Codable, Equatable {
        let id: Int
        let name: String
    }

    let testObject = TestStruct(id: 1, name: "Test")
    let fileName = "testFile.json"

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Clear the documents directory before each test
        Storage.clear(.documents)
    }

    override func tearDownWithError() throws {
        // Clear the documents directory after each test
        Storage.clear(.documents)
        try super.tearDownWithError()
    }

    func testStoreAndRetrieve() throws {
        // Store the test object
        Storage.store(testObject, to: .documents, as: fileName)
        
        // Retrieve the test object
        let retrievedObject: TestStruct = Storage.retrieve(fileName, from: .documents, as: TestStruct.self)
        
        // Verify the stored and retrieved objects are the same
        XCTAssertEqual(testObject, retrievedObject)
    }

    func testFileExists() throws {
        // Store the test object
        Storage.store(testObject, to: .documents, as: fileName)
        
        // Verify the file exists
        XCTAssertTrue(Storage.fileExists(fileName, in: .documents))
    }

    func testRemoveFile() throws {
        // Store the test object
        Storage.store(testObject, to: .documents, as: fileName)
        
        // Remove the file
        Storage.remove(fileName, from: .documents)
        
        // Verify the file does not exist
        XCTAssertFalse(Storage.fileExists(fileName, in: .documents))
    }

    func testClearDirectory() throws {
        // Store the test object
        Storage.store(testObject, to: .documents, as: fileName)
        
        // Clear the documents directory
        Storage.clear(.documents)
        
        // Verify the file does not exist
        XCTAssertFalse(Storage.fileExists(fileName, in: .documents))
    }
}
