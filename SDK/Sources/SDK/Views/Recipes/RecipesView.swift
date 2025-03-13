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
        Container {
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

//struct RecipesView_Previews: PreviewProvider {
//    public static var previews: some View {
//        RecipesView()
//    }
//}

private extension RecipesView {
    var notRequestedView: some View {
        Text("").onAppear(perform: self.viewModel.fetchRecipes)
    }
    
    func loadingView() -> some View {
        ProgressView()
    }
    
    func loadedView(_ recipes: [Recipe]) -> some View {
        RecipeList(recipes: recipes, refresh: self.viewModel.fetchRecipes)
    }
    
    func failedView(_ error: Error) -> some View {
        Image("errorimg", bundle: Bundle.module)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 93.0, height: 93.0)
            .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
