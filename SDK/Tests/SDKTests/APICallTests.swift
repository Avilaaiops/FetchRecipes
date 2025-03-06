//
//  APICallTests.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import XCTest
@testable import SDK

class APICallTests: XCTestCase {

    struct MockAPICall: APICall {
        var path: String
        var method: String
        var headers: [String: String]?
        var bodyData: Data?

        func body() throws -> Data? {
            return bodyData
        }
    }

    func testURLRequestSuccess() throws {
        let apiCall = MockAPICall(path: "/test", method: "GET", headers: ["Content-Type": "application/json"], bodyData: nil)
        let baseURL = "https://mock.com"
        let request = try apiCall.urlRequest(baseURL: baseURL)

        XCTAssertEqual(request.url?.absoluteString, "https://mock.com/test")
        XCTAssertEqual(request.httpMethod, "GET")
        XCTAssertEqual(request.allHTTPHeaderFields?["Content-Type"], "application/json")
        XCTAssertNil(request.httpBody)
    }

    func testURLRequestInvalidURL() {
        let apiCall = MockAPICall(path: "invalid url", method: "GET", headers: nil, bodyData: nil)
        let baseURL = "https://mock.com"

        XCTAssertThrowsError(try apiCall.urlRequest(baseURL: baseURL)) { error in
            XCTAssertEqual(error as? APIError, APIError.invalidURL)
        }
    }

    func testAPIErrorDescriptions() {
        XCTAssertEqual(APIError.invalidURL.localizedDescription, "Invalid URL")
        XCTAssertEqual(APIError.httpCode(404).localizedDescription, "Unexpected HTTP code: 404")
        XCTAssertEqual(APIError.unexpectedResponse.localizedDescription, "Unexpected response from the server")
        XCTAssertEqual(APIError.imageProcessing([]).localizedDescription, "Unable to load image")
    }
}
