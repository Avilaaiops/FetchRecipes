//
//  RecipeList.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct RecipeList: View {
    let recipes: [Recipe]
    var refresh: () -> Void
    
    public init(recipes: [Recipe], refresh: @escaping () -> Void) {
        self.recipes = recipes
        self.refresh = refresh
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack {
                    ForEach(recipes, id: \.uuid) { recipe in
                        RecipeRow(recipe: recipe)
                    }
                }
            }
        }
    }
}
