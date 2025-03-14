//
//  RecipeTitle.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct RecipeTitle: View {
    @EnvironmentObject var container: DIContainer
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.custom(container.Theme.Typography.Title.typeFace,
                    size: container.Theme.Typography.Title.size))
    }
}
