//
//  MetalColors.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation
import SwiftUI

public struct MetalColors: Colors {
    
    public var Brand: BrandColors
    public var Semantic: SemanticColors
    public var Neutral: NeutralColors
    
    public var Background: Color
    public var Surface: Color
    public var OnBackground: Color
    public var OnSurface: Color


    public init() {
        self.Brand = MetalBrandColors()
        self.Semantic = StandardSemanticColors()
        self.Neutral = StandardNeutralColors()
        
        Background = Color.hex("#ffffff")
        Surface = Color.hex("#aaaaaa")
        OnBackground = Color.hex("#70d6ff")
        OnSurface = Color.hex("#70d6ff")
    }
}

public struct MetalBrandColors: BrandColors {
    public let Primary: Color
    public let PrimaryVariant: Color
    
    public let Secondary: Color
    public let SecondaryVariant: Color
    
    public let Tertiary: Color
    public let TertiaryVariant: Color
    
    public let OnPrimary: Color
    public let OnSecondary: Color
    public let OnTertiary: Color
    
    public init() {
        Primary = Color.hex("#000000")
        PrimaryVariant = Color.hex("#173A78")
        
        Secondary = Color.hex("#f36f21")
        SecondaryVariant = Color.hex("#70d6ff")
        
        Tertiary = Color.hex("#70d6ff")
        TertiaryVariant = Color.hex("#70d6ff")
        
        OnPrimary = Color.hex("ffffff")
        OnSecondary = Color.hex("#70d6ff")
        OnTertiary = Color.hex("#70d6ff")
    }
}
