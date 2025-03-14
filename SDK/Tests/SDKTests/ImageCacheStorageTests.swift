//
//  ImageCacheStorageTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//


import XCTest
@testable import SDK

class ImageCacheStorageTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        // Clear the caches directory before each test
        Storage.clear(.caches)
    }

    override func tearDownWithError() throws {
        // Clear the caches directory after each test
        Storage.clear(.caches)
        try super.tearDownWithError()
    }

    func testGetImageCacheWhenFileExists() throws {
        // Create a test cache
        let testCache = RecipeImageCacheData(cacheData: ["testKey": Data()])
        Storage.store(testCache, to: .caches, as: "imagecache.json")

        // Retrieve the cache using ImageCacheStorage
        let retrievedCache = ImageCacheStorage.shared.getImageCache()

        // Verify the retrieved cache is the same as the test cache
        XCTAssertEqual(retrievedCache.cacheData, testCache.cacheData)
    }

    func testGetImageCacheWhenFileDoesNotExist() throws {
        // Ensure the cache file does not exist
        XCTAssertFalse(Storage.fileExists("imagecache.json", in: .caches))

        // Retrieve the cache using ImageCacheStorage
        let retrievedCache = ImageCacheStorage.shared.getImageCache()

        // Verify the retrieved cache is empty
        XCTAssertTrue(retrievedCache.cacheData.isEmpty)
    }

    func testSetImageCache() throws {
        // Create a test cache
        let testCache = RecipeImageCacheData(cacheData: ["testKey": Data()])

        // Store the cache using ImageCacheStorage
        ImageCacheStorage.shared.setImageCache(cache: testCache)

        // Retrieve the cache directly from storage
        let retrievedCache: RecipeImageCacheData = Storage.retrieve("imagecache.json", from: .caches, as: RecipeImageCacheData.self)

        // Verify the stored and retrieved caches are the same
        XCTAssertEqual(retrievedCache.cacheData, testCache.cacheData)
    }
}