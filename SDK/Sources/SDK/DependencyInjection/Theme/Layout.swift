//
//  Layout.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Foundation
import SwiftUI

public protocol Layout {
    var ButtonLayout : ButtonLayout { get }
}

public protocol ButtonLayout {
    var CornerRadius: CGFloat { get }
    var Padding: CGFloat { get }
}
public protocol HStackLayout {
    var Padding: CGFloat { get }
}
