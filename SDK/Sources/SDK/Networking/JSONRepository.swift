//
//  JSONRepository.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation
import Combine

public protocol JSONRepository {
    var session: URLSession { get }
    var baseURL: String { get }
}

public extension JSONRepository {
    func call<T>(endpoint: APICall, httpCodes: HTTPCodes = .success) async throws -> T where T: Decodable {
        let request = try endpoint.urlRequest(baseURL: baseURL)
        guard let (data, response) = try await session.data(for: request) as? (Data, HTTPURLResponse),
              httpCodes.contains(response.statusCode) else {
            throw APIError.unexpectedResponse
        }
        return try data.requestJSON(as: RecipesCollection.self).recipes as! T
    }
}

public extension Data {
    func requestJSON<T: Decodable>(as type: T.Type, using decoder: JSONDecoder = .init()) throws -> T {
        return try decoder.decode(type, from: self)
    }
}
