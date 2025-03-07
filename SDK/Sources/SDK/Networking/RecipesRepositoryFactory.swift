//
//  RecipesRepositoryFactory.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation

struct RecipesRepositoryFactory {
    
    init() {}
    
    static func create() -> RecipesRepository {
        let configuration = URLSessionConfiguration.default
        
        let session = URLSession(configuration: configuration)
        let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net"
        
        return RecipesRepository(session: session, baseURL: baseURL)
    }
}
