//
//  RecipeList.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct RecipeList: View {
    let recipes: [Recipe]
    
    public init(recipes: [Recipe]) {
        self.recipes = recipes
    }
    
    public var body: some View {
        List(self.recipes, id: \.uuid) { recipe in
            RecipeRow(recipe: recipe)
        }
    }
}
