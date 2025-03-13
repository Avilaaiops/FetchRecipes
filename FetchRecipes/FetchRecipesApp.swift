//
//  FetchRecipesApp.swift
//  FetchRecipes
//
//  Created by Wesley Mitchell on 3/4/25.
//

import SwiftUI
import SwiftData
import SDK

@main
struct FetchRecipesApp: App {
    @Environment(\.scenePhase) var scenePhase
    @StateObject var dicontainer = DIFactory.DependencyContainer
    
    var body: some Scene {
        WindowGroup {
            RecipesView()
                .environmentObject(dicontainer)
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .background {
                        ImageCacheStorage.shared.setImageCache(cache: dicontainer.cache)
                    }
                }
        }
    }
}

extension FetchRecipesApp {
    struct DIFactory {
        static public var DependencyContainer: DIContainer = { () -> DIContainer in
            var cache = ImageCacheStorage.shared.getImageCache()
            let container = DIContainer(cache: cache)
            return container
        }()
    }
}
