//
//  AsyncImageLoader.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI
import Combine

class AsyncImageLoader : ObservableObject {
    @Published var image: UIImage?
    
    private(set) var isLoading = false
    private let url: URL?
    private var cache: RecipeImageCacheData
    
    public init(url: URL?, cache: RecipeImageCacheData) {
        self.url = url
        self.cache = cache
    }
    
    func load() {
        guard !isLoading else { return }
        
        Task { @MainActor in
            do {
                if(cache.cacheData.keys.contains(url!.absoluteString)) {
                    image = UIImage(data: cache.cacheData[url!.absoluteString]!)
                } else {
                    let data = try await downloadImageData(from: url)
                    cache.cacheData[url!.absoluteString] = data
                    image = UIImage(data: data)
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func downloadImageData(from url: URL?) async throws -> Data {
        let request = URLRequest(url: url!)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
