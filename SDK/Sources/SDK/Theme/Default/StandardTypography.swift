//
//  Typography.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct StandardTypography: Typography {
    
    public let Title: AppFont
    public let SubTitle: AppFont
    public let Body: AppFont
    public let Button: AppFont
    
    public init() {
        self.Title = AppFont(typeFace: "Helvetica Neue UltraLight Italic", size: 40, lineSpacing: 8)
        self.SubTitle = AppFont(typeFace: "Helvetica Neue", size: 25, lineSpacing: 8)
        self.Body = AppFont(typeFace: "Helvetica Neue", size: 16, lineSpacing: 12)
        self.Button = AppFont(typeFace: "Helvetica Neue", size: 20, lineSpacing: 8)
    }
}
