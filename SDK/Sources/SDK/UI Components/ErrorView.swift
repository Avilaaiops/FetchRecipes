//
//  Error.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/14/25.
//

import SwiftUI

public struct ErrorView: View {
    @EnvironmentObject var container: DIContainer
    let text: String
    var refresh: () -> Void
    
    public init(text: String, refresh: @escaping () -> Void) {
        self.text = text
        self.refresh = refresh
    }
    
    public var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                Image("errorimg", bundle: Bundle.module)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 93.0, height: 93.0, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                Text(text)
                    .font(.custom(container.Theme.Typography.Title.typeFace, size: container.Theme.Typography.Title.size))
            }
            .frame(minWidth:0, maxWidth:.infinity, alignment: .center)
            .padding(10)
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        .refreshable {
            refresh()
        }
    }
}
