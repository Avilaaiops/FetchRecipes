//
//  AppButton.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import Foundation
import SwiftUI

public struct AppButton {
    public static func Primary(label: String, action: @escaping () -> Void,
                               style: ButtonStyle = ButtonStyle.Solid,
                               size: ButtonSize = ButtonSize.Standard) -> AppPrimitiveButton {
        return AppPrimitiveButton(label: label, action: action,color:ButtonColor.Primary, style: style, size:size)
    }
    public static func Secondary(label: String, action: @escaping () -> Void,
                               style: ButtonStyle = ButtonStyle.Solid,
                               size: ButtonSize = ButtonSize.Standard) -> AppPrimitiveButton {
        return AppPrimitiveButton(label: label, action: action,color:ButtonColor.Secondary, style: style, size:size)
    }
    public static func Error(label: String, action: @escaping () -> Void,
                               style: ButtonStyle = ButtonStyle.Solid,
                               size: ButtonSize = ButtonSize.Standard) -> AppPrimitiveButton {
        return AppPrimitiveButton(label: label, action: action,color:ButtonColor.Error, style: style, size:size)
    }
}
