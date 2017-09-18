//
//  Copying.swift
//  FireKit
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation

// MARK: Populatable

public protocol Populatable {
    func populate(from other: Self)
}

extension Populatable where Self: Resource {
    public func populate(from other: Self) {
        // TODO: FIX
//        _ = self.populate(from: other.asJSON())
    }
}

extension Populatable where Self: Element {
    public func populate(from other: Self) {
        // TODO: FIX
//        _ = self.populate(from: other.asJSON())
    }
}

extension Resource: Populatable {}
extension Element: Populatable  {}
