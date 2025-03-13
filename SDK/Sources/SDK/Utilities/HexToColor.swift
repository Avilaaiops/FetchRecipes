//
//  HexToColor.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/13/25.
//

import SwiftUI

public extension Color {
    /// Creates a new `Color` 🎨 object from a hex value (e. g. "#18B5DF"), represented as a `String`.
    /// - Parameters:
    ///   - hex: A hex value, not case sensitive, represented as a `String`
    static func hex(_ hex: String) -> Self {
        let scanner = Scanner(string: hex.replacingOccurrences(of: "#", with: ""))
            scanner.currentIndex = .init(utf16Offset: 0, in: hex)
            var rgbValue: UInt64 = 0
            scanner.scanHexInt64(&rgbValue)

            let r = (rgbValue & 0xff0000) >> 16
            let g = (rgbValue & 0xff00) >> 8
            let b = rgbValue & 0xff

            return Self.init(
                red: Double(r) / 0xff,
                green: Double(g) / 0xff,
                blue: Double(b) / 0xff,
                opacity: 1
            )
        }
}
