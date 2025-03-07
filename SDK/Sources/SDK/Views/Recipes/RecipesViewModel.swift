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
        @Published var recipes: Loadable<RecipesCollection>
        var cancellationToken: AnyCancellable?
        var repository: RecipesRepository
        
        init(repository: RecipesRepository, recipes: Loadable<RecipesCollection> = .notRequested) {
            self.repository = repository
            _recipes = .init(initialValue: recipes)
        }
        
        func fetchRecipes() {
            refetchRecipes(recipesSubject: loadableSubject(\.recipes))
            //httpRequest()
        }
        
        func refetchRecipes(recipesSubject: LoadableSubject<RecipesCollection>) {
            let cancelBag = CancelBag()
            recipesSubject
                .wrappedValue.setIsLoading(cancelBag: cancelBag)
            
            cancellationToken = repository.fetchRecipes()
                .mapError({ (error) -> Error in
                    self.recipes = .failed(error)
                    return error
                })
                .sinkToLoadable { [weak self] in
                    self?.recipes = $0
                }
        }
        
        func httpRequest() {
            let url = URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json")! // note, https, not http

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    error == nil,
                    let data = data,
                    let string = String(data: data, encoding: .utf8)
                else {
                    print(error ?? "Unknown error")
                    return
                }

                print(string)
            }
            task.resume()
        }
            
    }
}
