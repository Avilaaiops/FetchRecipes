//
//  RecipeimageData.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation

public class RecipeImageCacheData : Codable {
    public init(cacheData: [String: Data]) {
        self.cacheData = cacheData
    }
    public var cacheData: [String: Data]
}
