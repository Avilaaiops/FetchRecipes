//
//  RecipeImage.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct RecipeImage: View {
    @EnvironmentObject var container: DIContainer
    let url: URL?
    
    public init(url: URL?) {
        self.url = url
    }
    
    public var body: some View {
        CachedRecipeImage(url: url!,
                          cache: container.cache,
                          placeholder: { ProgressView() },
                          image: { Image(uiImage: $0).resizable() }
        )
        .frame(width: 93.0, height: 93.0)
        .aspectRatio(contentMode: .fill)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
