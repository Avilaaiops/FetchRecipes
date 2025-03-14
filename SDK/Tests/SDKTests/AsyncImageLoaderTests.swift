//
//  AsyncImageLoaderTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//


import XCTest
import Combine
@testable import SDK

class AsyncImageLoaderTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    func testLoadImageFromCache() throws {
        // Given
        let url = URL(string: "https://example.com/image.png")
        let imageData = UIImage(named: "testImage")!.pngData()!
        var cache = RecipeImageCacheData(cacheData: [url!.absoluteString: imageData])
        let loader = AsyncImageLoader(url: url, cache: cache)

        // When
        let expectation = self.expectation(description: "Image loaded from cache")
        loader.$image.sink { image in
            if image != nil {
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        loader.load()

        // Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(loader.image, UIImage(data: imageData))
    }

    func testLoadImageFromNetwork() throws {
        // Given
        let url = URL(string: "https://example.com/image.png")
        let imageData = UIImage(named: "testImage")!.pngData()!
        var cache = RecipeImageCacheData(cacheData: [:])
        let loader = AsyncImageLoader(url: url, cache: cache)

        // Mock URLSession
        URLProtocolMock.testURLs = [url: imageData]
        URLProtocolMock.response = URLResponse(url: url!, mimeType: "image/png", expectedContentLength: imageData.count, textEncodingName: nil)
        URLProtocol.registerClass(URLProtocolMock.self)

        // When
        let expectation = self.expectation(description: "Image loaded from network")
        loader.$image.sink { image in
            if image != nil {
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        loader.load()

        // Then
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(loader.image, UIImage(data: imageData))
        XCTAssertEqual(cache.cacheData[url!.absoluteString], imageData)
    }
}

// Mock URLProtocol to intercept network requests
class URLProtocolMock: URLProtocol {
    static var testURLs = [URL?: Data]()
    static var response: URLResponse?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let url = request.url, let data = URLProtocolMock.testURLs[url] {
            client?.urlProtocol(self, didReceive: URLProtocolMock.response!, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
