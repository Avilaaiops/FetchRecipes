//
//  APICallTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//

import XCTest
@testable import SDK

class APICallTests: XCTestCase {

    struct MockAPICall: APICall {
        var path: String
        var method: String
        var headers: [String: String]?
        var requestBody: Data?

        func body() throws -> Data? {
            return requestBody
        }
    }

    func testURLRequestSuccess() {
        let apiCall = MockAPICall(
            path: "/test",
            method: "GET",
            headers: ["Content-Type": "application/json"],
            requestBody: nil
        )

        do {
            let request = try apiCall.urlRequest(baseURL: "https://example.com")
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/test")
            XCTAssertEqual(request.httpMethod, "GET")
            XCTAssertEqual(request.allHTTPHeaderFields?["Content-Type"], "application/json")
            XCTAssertNil(request.httpBody)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    func testURLRequestInvalidURL() {
        let apiCall = MockAPICall(
            path: "invalid url",
            method: "GET",
            headers: nil,
            requestBody: nil
        )

        XCTAssertThrowsError(try apiCall.urlRequest(baseURL: "https://example.com")) { error in
            XCTAssertEqual(error as? APIError, APIError.invalidURL)
        }
    }

    func testURLRequestWithBody() {
        let requestBody = "{\"key\":\"value\"}".data(using: .utf8)
        let apiCall = MockAPICall(
            path: "/test",
            method: "POST",
            headers: ["Content-Type": "application/json"],
            requestBody: requestBody
        )

        do {
            let request = try apiCall.urlRequest(baseURL: "https://example.com")
            XCTAssertEqual(request.url?.absoluteString, "https://example.com/test")
            XCTAssertEqual(request.httpMethod, "POST")
            XCTAssertEqual(request.allHTTPHeaderFields?["Content-Type"], "application/json")
            XCTAssertEqual(request.httpBody, requestBody)
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }
}
