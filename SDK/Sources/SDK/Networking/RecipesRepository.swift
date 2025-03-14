//
//  RecipesRepository.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation
import Combine

protocol RecipesJSONRepository: JSONRepository {
    var fetchRecipes: [Recipe] { get async throws }
}

public struct RecipesRepository: RecipesJSONRepository {
    
    public let session: URLSession
    public let baseURL: String
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    public var fetchRecipes: [Recipe] {
        get async throws {
            return try await call(endpoint: API.allRecipes)
        }
    }
    
}

extension RecipesRepository {
    enum API {
        case allRecipes
    }
}

extension RecipesRepository.API: APICall {
    
    var path: String {
        switch self {
        case .allRecipes:
            return "/recipes-malformed.json"
        }
    }
    
    var method: String {
        switch self {
        case .allRecipes:
            return "GET"
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "application/json"]
    }
    
    func body() throws -> Data? {
        return nil
    }
    
}
