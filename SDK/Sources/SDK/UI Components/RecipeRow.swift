//
//  RecipeRow.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct RecipeRow: View {
    @EnvironmentObject var container: DIContainer
    let recipe: Recipe
    
    public init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    public var body: some View {
        HStack(alignment:.top) {
            RecipeImage(url: recipe.photoURLSmall ?? recipe.photoURLLarge ?? nil)
            VStack(alignment: .leading) {
                RecipeTitle(text: recipe.name)
                RecipeSubTitle(text: recipe.cuisine)
            }
        }
        .frame(minWidth:0, maxWidth: .infinity, alignment: .leading)
        .padding(5)
        .background(container.Theme.Colors.Surface)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
