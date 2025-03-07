//
//  RecipeRow.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct RecipeRow: View {
    let recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    public var body: some View {
        Text(recipe.name)
    }
}
