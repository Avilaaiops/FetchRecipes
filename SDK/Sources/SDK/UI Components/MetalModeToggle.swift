//
//  MetalModeToggle.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct MetalModeToggle: View {
    @EnvironmentObject var dicontainer: DIContainer
    @State private var isMetal = false
    
    public init() {}
    
    public var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Spacer()
                .frame(minWidth: 20, maxWidth: .infinity)
            Toggle(isOn: $isMetal) {
                Text("Enable Metal Mode")
            }
            .onChange(of: isMetal) { value in
                if(value) {
                    dicontainer.updateTheme()
                } else {
                    dicontainer.Theme = DefaultTheme()
                }
                print(value)
            }
            Spacer()
                .frame(minWidth: 20, maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .background(Color.red)
    }
}
