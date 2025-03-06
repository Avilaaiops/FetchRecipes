//
//  Theme.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

public protocol Theme {
    var Typography: Typography { get }
    var Colors: Colors { get }
    var Layout: Layout { get }
    var Images: Images { get }
}
