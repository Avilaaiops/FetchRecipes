//
//  DIContainer.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation

open class DIContainer: ObservableObject {
    public var cache: RecipeImageCacheData
    @Published public var Theme: Theme
    
    
    public init(cache: RecipeImageCacheData) {
        self.cache = cache
        self.Theme = DefaultTheme()
    }
    
    public func updateTheme() {
        self.Theme = MetalTheme()
    }
}
