//
//  Typography.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public protocol Typography {
    
    var Title: AppFont { get }
    var SubTitle: AppFont { get }
    var Body: AppFont { get }
    var Button: AppFont { get }
    
}

public struct AppFont {
    
    public let typeFace: String
    public let size: CGFloat
    public let lineSpacing: CGFloat
    
    public init(typeFace: String, size: CGFloat, lineSpacing: CGFloat) {
        self.typeFace = typeFace
        self.size = size
        self.lineSpacing = lineSpacing
    }
    
}
