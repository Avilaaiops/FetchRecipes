//
//  RecipesRepository.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation
import Combine

protocol RecipesJSONRepository: JSONRepository {
    func fetchRecipes() -> AnyPublisher<RecipesCollection, Error>
}

public struct RecipesRepository: RecipesJSONRepository {
    
    public let session: URLSession
    public let baseURL: String
    public let bgQueue = DispatchQueue(label: "bg_parse_queue")
    
    init(session: URLSession, baseURL: String) {
        self.session = session
        self.baseURL = baseURL
    }
    
    public func fetchRecipes() -> AnyPublisher<RecipesCollection, Error> {
        return call(endpoint: API.allRecipes)
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
            return "/recipes.json"
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
