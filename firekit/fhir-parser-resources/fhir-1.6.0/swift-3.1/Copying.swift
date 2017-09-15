//
//  Copying.swift
//  FireKit
//
//  Created by Ryan Baldwin on 2017-08-09.
//  Copyright © 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation

// MARK: NSCopying

extension Resource: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return FHIRAbstractBase.instantiate(from: self.asJSON(), owner: nil)
    }
}

extension Element: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return type(of: self).init(json: self.asJSON())
    }
}

// MARK: Populatable

public protocol Populatable {
    func populate(from other: Self)
}

extension Populatable where Self: Resource {
    public func populate(from other: Self) {
        _ = self.populate(from: other.asJSON())
    }
}

extension Populatable where Self: Element {
    public func populate(from other: Self) {
        _ = self.populate(from: other.asJSON())
    }
}

extension Resource: Populatable {}
extension Element: Populatable  {}