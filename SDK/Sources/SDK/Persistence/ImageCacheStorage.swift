//
//  ImageCacheStorage.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//
import SwiftUI
import Foundation

public struct ImageCacheStorage {
    public static let shared = ImageCacheStorage()
    
    private init() {}
    
    public func getImageCache() -> RecipeImageCacheData {
        if Storage.fileExists("imagecache.json", in: .caches) {
            return Storage.retrieve("imagecache.json", from: .caches, as: RecipeImageCacheData.self)
        } else {
            let cache = [String: Data]()
            let cacheContainer = RecipeImageCacheData(cacheData: cache)
            Storage.store(cacheContainer, to: .caches, as: "imagecache.json")
            return cacheContainer
        }
    }
    
    public func setImageCache(cache: RecipeImageCacheData) {
        Storage.store(cache, to: .caches, as: "imagecache.json")
    }
}
