//
//  CachedRecipeImage.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct CachedRecipeImage<Placeholder: View> : View {
    @StateObject private var loader: AsyncImageLoader
    private let placeholder: Placeholder
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        cache: RecipeImageCacheData,
        @ViewBuilder placeholder: () -> Placeholder,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)
    ) {
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: AsyncImageLoader(url: url, cache: cache))
    }
    
    public var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
}

