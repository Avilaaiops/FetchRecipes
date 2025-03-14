//
//  Container.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct AppViewContainer<Content: View>: View {
    
    @EnvironmentObject var dicontainer: DIContainer
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 0) {
                content
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(dicontainer.Theme.Images.BackgroundImage
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
        )
    }
}
