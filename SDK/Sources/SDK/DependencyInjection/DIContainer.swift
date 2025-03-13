//
//  DIContainer.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation

open class DIContainer: ObservableObject {
    public var cache: RecipeImageCacheData
    public var Theme: Theme
    
    
    public init(cache: RecipeImageCacheData) {
        self.cache = cache
        self.Theme = DefaultTheme()
    }
}
