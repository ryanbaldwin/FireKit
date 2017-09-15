//
//  Copying.swift
//  FireKit
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation

// MARK: NSCopying

// func copy<T: Codable>(_ value: T) throws -> T {
//     let data = try JSONEncoder().encode(value)
//     return try JSONDecoder().decode(T.self, from: data)
// }

// extension Resource: NSCopying {
//     public func copy(with zone: NSZone? = nil) -> Any {
//         do {
//             return try FireKit.copy(self)
//         } catch let error {
//             print("Failed to copy Element: \(error)")
//             print("Returning empty \(type(of: self))")
//         }
//         return type(of: self).init()
//     }
// }

// extension Element: NSCopying {
//     public func copy(with zone: NSZone? = nil) -> Any {
//         do {
//             return try FireKit.copy(self)
//         } catch let error {
//             print("Failed to copy Element: \(error)")
//             print("Returning empty \(type(of: self))")
//         }
//         return type(of: self).init()
//     }
// }

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
