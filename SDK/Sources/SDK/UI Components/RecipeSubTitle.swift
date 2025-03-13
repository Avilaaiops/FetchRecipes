
//
//  RecipeSubTitle.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct RecipeSubTitle: View {
    @EnvironmentObject var container: DIContainer
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .font(.custom(container.Theme.Typography.SubTitle.typeFace, size: container.Theme.Typography.SubTitle.size))
    }
}
