//
//  RecipesView.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct RecipesView: View {
    @EnvironmentObject var dicontainer: DIContainer
    @ObservedObject var viewModel: RecipesViewModel
    
    public init() {
        let repository = RecipesRepositoryFactory.create()
        viewModel = RecipesViewModel(repository: repository)
    }

    public var body: some View {
        AppViewContainer {
            MetalModeToggle()
            content
        }
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

private extension RecipesView {
    var notRequestedView: some View {
        Text("").onAppear(perform: self.viewModel.fetchRecipes)
    }
    
    func loadingView() -> some View {
        ProgressView()
    }
    
    func loadedView(_ recipes: [Recipe]) -> some View {
        if recipes.count > 0 {
            return AnyView(RecipeList(recipes: recipes, refresh: self.viewModel.fetchRecipes))
        } else {
            return AnyView(
                ErrorView(text: "I'm sorry Dave, there are no recipes here.")
                    .refreshable {
                        self.viewModel.fetchRecipes()
                    }
            )
        }
    }
    
    func failedView(_ error: Error) -> some View {
        ErrorView(text: "We have the results of the network call. It didn't want to work for you today.")
            .refreshable {
                self.viewModel.fetchRecipes()
            }
    }
}
