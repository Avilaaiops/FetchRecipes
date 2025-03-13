//
//  MetalTheme.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation
import SwiftUI

public struct MetalTheme: Theme {
    
    public var Colors: Colors
    public var Layout: Layout
    public var Typography: Typography
    public var Images : Images

    public init() {
        self.Colors = MetalColors()
        self.Layout = StandardLayout()
        self.Typography = MetalTypography()
        self.Images = MetalImages()
    }
}

public struct MetalImages: Images {
    public var BackgroundImage: Image
    
    init() {
        BackgroundImage = Image(uiImage: UIImage(named: "MetalBG3", in: Bundle.module, compatibleWith: nil)!)
    }
}
