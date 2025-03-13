//
//  StandardLayout.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation
import SwiftUI

public struct StandardLayout : Layout {
    public let ButtonLayout: ButtonLayout
    
    public init() {
        ButtonLayout = StandardButtonLayout()
    }
}

public struct StandardButtonLayout : ButtonLayout {
    public let CornerRadius: CGFloat
    public let Padding: CGFloat
    
    public init() {
        CornerRadius = CGFloat(4)
        Padding = CGFloat(10)
    }
}
