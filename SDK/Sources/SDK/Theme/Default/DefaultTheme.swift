//
//  DefaultTheme.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation
import SwiftUI

public struct DefaultTheme: Theme {
    
    public var Colors: Colors
    public var Layout: Layout
    public var Typography: Typography
    public var Images : Images

    public init() {
        self.Colors = StandardColors()
        self.Layout = StandardLayout()
        self.Typography = StandardTypography()
        self.Images = SampleImages()
    }
}

public struct SampleImages: Images {
    public var BackgroundImage: Image
    
    init() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            BackgroundImage = Image(uiImage: UIImage(named: "sogboipad", in: Bundle.module, compatibleWith: nil)!)
        } else {
            BackgroundImage = Image(uiImage: UIImage(named: "sogbo", in: Bundle.module, compatibleWith: nil)!)
        }
    }
}
