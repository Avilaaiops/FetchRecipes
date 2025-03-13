//
//  StandardColors.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation
import SwiftUI

public struct StandardColors: Colors {
    
    public var Brand: BrandColors
    public var Semantic: SemanticColors
    public var Neutral: NeutralColors
    
    public var Background: Color
    public var Surface: Color
    public var OnBackground: Color
    public var OnSurface: Color


    public init() {
        self.Brand = StandardBrandColors()
        self.Semantic = StandardSemanticColors()
        self.Neutral = StandardNeutralColors()
        
        Background = Color.hex("#ffffff")
        Surface = Color.hex("#94462B")
        OnBackground = Color.hex("#70d6ff")
        OnSurface = Color.hex("#70d6ff")
    }
}

public struct StandardBrandColors: BrandColors {
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
        Primary = Color.hex("#2B6BDD")
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

public struct StandardSemanticColors: SemanticColors {
    
    public let Success: Color
    public let Error: Color
    public let Warning: Color
    public let Information: Color
    
    public var OnSuccess: Color
    public var OnError: Color
    public var OnWarning: Color
    public var OnInformation: Color

    public init() {
        self.Success = Color.hex("#34C759")
        self.Error = Color.hex("#FF2D55")
        self.Warning = Color.hex("#FF9500")
        self.Information = Color.hex("#007AFF")
        
        self.OnSuccess = Color.hex("#313531")
        self.OnError = Color.hex("#313531")
        self.OnWarning = Color.hex("#313531")
        self.OnInformation = Color.hex("#f4f7fa")
    }
}

public struct StandardNeutralColors: NeutralColors {
    public let NeutralOne: Color
    public let NeutralTwo: Color
    public let NeutralThree: Color
    public let NeutralFour: Color
    public let NeutralFive: Color
    public let NeutralSix: Color
    public let NeutralSeven: Color
    public let NeutralEight: Color

    public init() {
        self.NeutralOne = Color.hex("#FFFFFF")
        self.NeutralTwo = Color.hex("#FAFAFA")
        self.NeutralThree = Color.hex("#F5F6F7")
        self.NeutralFour = Color.hex("#E4E9EF")
        self.NeutralFive = Color.hex("#E2E2E2")
        self.NeutralSix = Color.hex("#8E8E93")
        self.NeutralSeven = Color.hex("#6D727A")
        self.NeutralEight = Color.hex("#16171A")
    }
}
