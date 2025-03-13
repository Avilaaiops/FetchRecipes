//
//  Container.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public struct Container<Content: View>: View {
    
    //@EnvironmentObject var krakenApp: KrakenApp
    let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color.white)
        .edgesIgnoringSafeArea(.all)
    }
}
