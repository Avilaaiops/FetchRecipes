//
//  CancelBag.swift
//  SDK
//
//  Created by Wesley Mitchell on 3/6/25.
//

import Combine

final public class CancelBag {
    fileprivate(set) var subscriptions = Set<AnyCancellable>()
    
    public init() {}
    
    public func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
