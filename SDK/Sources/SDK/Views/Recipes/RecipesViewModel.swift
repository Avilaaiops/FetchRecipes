//
//  RecipesViewModel.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation
import Combine

extension RecipesView {
    class RecipesViewModel: ObservableObject {
        @Published var recipes: Loadable<[Recipe]>
        var cancellationToken: AnyCancellable?
        var repository: RecipesRepository
        
        init(repository: RecipesRepository, recipes: Loadable<[Recipe]> = .notRequested) {
            self.repository = repository
            _recipes = .init(initialValue: recipes)
        }
        
        func fetchRecipes() {
            refetchRecipes(recipesSubject: loadableSubject(\.recipes))
        }
        
        func refetchRecipes(recipesSubject: LoadableSubject<[Recipe]>) {
            recipesSubject.wrappedValue = .isLoading(last: recipesSubject.wrappedValue.value)
            
            Task.detached { @MainActor in
                do {
                    let recipes = try await self.repository.fetchRecipes
                    self.recipes = .loaded(recipes)
                } catch(let error) {
                    self.recipes = .failed(error)
                }
            }
        }
    }
}
