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
        HStack {
            RecipeImage(url: recipe.photoURLSmall ?? recipe.photoURLLarge ?? nil)
            Text(recipe.name)
        }
        .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
        .padding(5)
        .background(Color.mint)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
