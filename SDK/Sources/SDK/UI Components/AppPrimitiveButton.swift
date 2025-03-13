//
//  AppPrimitiveButton.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public struct AppPrimitiveButton: View {

    @EnvironmentObject var dicontainer: DIContainer
    var label: String
    var action: () -> Void
    let color: ButtonColor
    let style: ButtonStyle
    let size: ButtonSize

    public var body: some View {
        Button(label, action: action)
            .modifier(AppButtonStyle(color: color, style: style, size:size))
    }
}

struct AppButtonStyle : ViewModifier {
    
    @EnvironmentObject var dicontainer: DIContainer
    let color: ButtonColor
    let style: ButtonStyle
    let size: ButtonSize
    
    func body(content: Content) -> some View {
        switch color {
        case ButtonColor.Primary:
             return AnyView(content
                .padding(dicontainer.Theme.Layout.ButtonLayout.Padding)
                .foregroundColor(dicontainer.Theme.Colors.Brand.OnPrimary)
                .background(dicontainer.Theme.Colors.Brand.Primary)
                .cornerRadius(dicontainer.Theme.Layout.ButtonLayout.CornerRadius)
                .font(.custom(dicontainer.Theme.Typography.Button.typeFace,
                              size: dicontainer.Theme.Typography.Button.size)))
        case ButtonColor.Secondary:
            return AnyView(content
                .padding(dicontainer.Theme.Layout.ButtonLayout.Padding)
                .foregroundColor(dicontainer.Theme.Colors.Brand.OnSecondary)
                .background(dicontainer.Theme.Colors.Brand.Secondary)
                .cornerRadius(dicontainer.Theme.Layout.ButtonLayout.CornerRadius)
                .font(.custom(dicontainer.Theme.Typography.Button.typeFace,
                              size: dicontainer.Theme.Typography.Button.size)))
        case ButtonColor.Error:
            return AnyView(content
                .padding(dicontainer.Theme.Layout.ButtonLayout.Padding)
                .foregroundColor(dicontainer.Theme.Colors.Semantic.OnError)
                .background(dicontainer.Theme.Colors.Semantic.Error)
                .cornerRadius(dicontainer.Theme.Layout.ButtonLayout.CornerRadius)
                .font(.custom(dicontainer.Theme.Typography.Button.typeFace,
                              size: dicontainer.Theme.Typography.Button.size)))
        default:
            return AnyView(content
                .padding(dicontainer.Theme.Layout.ButtonLayout.Padding)
                .foregroundColor(dicontainer.Theme.Colors.Brand.OnPrimary)
                .background(dicontainer.Theme.Colors.Brand.Primary)
                .cornerRadius(dicontainer.Theme.Layout.ButtonLayout.CornerRadius))
        }
    }
}

public enum ButtonColor {
    case Primary
    case Secondary
    case Tertiary
    case Success
    case Warning
    case Error
    case Information
}
public enum ButtonSize {
    case Small
    case Standard
    case Large
}
public enum ButtonStyle {
    case Solid
    case Outline
    case Text
}
