//
//  Colors.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import SwiftUI

public protocol Colors {
    var Brand: BrandColors { get }
    var Semantic: SemanticColors { get }
    var Neutral: NeutralColors { get }
    
    var Background: Color { get }
    var Surface: Color { get }
    var OnBackground: Color { get }
    var OnSurface: Color { get }
}

public protocol BrandColors {
    var Primary: Color { get }
    var PrimaryVariant: Color { get }
    
    var Secondary: Color { get }
    var SecondaryVariant: Color { get }
    
    var Tertiary: Color { get }
    var TertiaryVariant: Color { get }
    
    var OnPrimary: Color { get }
    var OnSecondary: Color { get }
    var OnTertiary: Color { get }
}

public protocol SemanticColors {
    var Success: Color { get }
    var Error: Color { get }
    var Warning: Color { get }
    var Information: Color { get }
    
    var OnError: Color { get }
    var OnWarning: Color { get }
    var OnSuccess: Color { get }
    var OnInformation: Color { get }
}

public protocol NeutralColors {
    var NeutralOne: Color { get }
    var NeutralTwo: Color { get }
    var NeutralThree: Color { get }
    var NeutralFour: Color { get }
    var NeutralFive: Color { get }
    var NeutralSix: Color { get }
    var NeutralSeven: Color { get }
    var NeutralEight: Color { get }
}
