//
//  RecipesView.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct RecipesView: View {
    @ObservedObject var viewModel: RecipesViewModel
    
    public init() {
        let repository = RecipesRepositoryFactory.create()
        viewModel = RecipesViewModel(repository: repository)
    }

    public var body: some View {
        content
    }
    
    private var content: AnyView {
        switch viewModel.recipes {
        case .notRequested: return AnyView(notRequestedView)
        case .isLoading: return AnyView(loadingView())
        case let .loaded(recipes): return AnyView(loadedView(recipes))
        case let .failed(error): return AnyView(failedView(error))
        }
   }
}

struct RecipesView_Previews: PreviewProvider {
    public static var previews: some View {
        RecipesView()
    }
}

private extension RecipesView {
    var notRequestedView: some View {
        Text("").onAppear(perform: self.viewModel.fetchRecipes)
    }
    
    func loadingView() -> some View {
        ProgressView()
    }
    
    func loadedView(_ recipes: RecipesCollection) -> some View {
        RecipeList(recipes: recipes.recipes)
    }
    
    func failedView(_ error: Error) -> some View {
        Text("Failed")
    }
}
