//
//  JSONRepositoryTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//

import XCTest
import Combine
@testable import SDK

class JSONRepositoryTests: XCTestCase {
    
    struct MockAPICall: APICall {
        var path: String
        var method: String
        var headers: [String: String]?
        var requestBody: Data?
        
        func body() throws -> Data? {
            return requestBody
        }
    }
    
    class MockJSONRepository: JSONRepository {
        var session: URLSession
        var baseURL: String
        
        init(session: URLSession, baseURL: String) {
            self.session = session
            self.baseURL = baseURL
        }
    }
    
    func testCallSuccess() async throws {
        let mockSession = URLSession(configuration: .ephemeral)
        let repository = MockJSONRepository(session: mockSession, baseURL: "https://example.com")
        let apiCall = MockAPICall(path: "/test", method: "GET", headers: nil, requestBody: nil)
        
        let jsonData = """
        {
            "recipes": [
                {
                    "cuisine": "Italian",
                    "name": "Spaghetti Carbonara",
                    "photo_url_large": "https://example.com/photo_large.jpg",
                    "photo_url_small": "https://example.com/photo_small.jpg",
                    "uuid": "123e4567-e89b-12d3-a456-426614174000",
                    "source_url": "https://example.com/recipe",
                    "youtube_url": "https://youtube.com/watch?v=dQw4w9WgXcQ"
                }
            ]
        }
        """.data(using: .utf8)!
        
        let urlResponse = HTTPURLResponse(url: URL(string: "https://example.com/test")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
        
        URLProtocolMock.testURLs = [URL(string: "https://example.com/test")!: (jsonData, urlResponse)]
        URLProtocolMock.requestHandler = { request in
            return (urlResponse, jsonData)
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        let session = URLSession(configuration: configuration)
        repository.session = session
        
        do {
            let recipes: [Recipe] = try await repository.call(endpoint: apiCall)
            XCTAssertEqual(recipes.count, 1)
            XCTAssertEqual(recipes.first?.name, "Spaghetti Carbonara")
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
    
    func testCallFailure() async throws {
        let mockSession = URLSession(configuration: .ephemeral)
        let repository = MockJSONRepository(session: mockSession, baseURL: "https://example.com")
        let apiCall = MockAPICall(path: "/test", method: "GET", headers: nil, requestBody: nil)
        
        let urlResponse = HTTPURLResponse(url: URL(string: "https://example.com/test")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
        
        URLProtocolMock.testURLs = [URL(string: "https://example.com/test")!: (Data(), urlResponse)]
        URLProtocolMock.requestHandler = { request in
            return (urlResponse, Data())
        }
        
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [URLProtocolMock.self]
        let session = URLSession(configuration: configuration)
        repository.session = session
        
        do {
            let _: [Recipe] = try await repository.call(endpoint: apiCall)
            XCTFail("Expected error not thrown")
        } catch {
            XCTAssertEqual(error as? APIError, APIError.unexpectedResponse)
        }
    }
}
