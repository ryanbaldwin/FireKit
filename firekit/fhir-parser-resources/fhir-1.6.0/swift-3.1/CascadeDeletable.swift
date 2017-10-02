//
//  Realm+Extensions.swift
//  FireKit
//
//  Created by Ryan Baldwin on 2017-08-09.
//  Copyright © 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation
import RealmSwift

public protocol CascadeDeletable {
    func cascadeDelete() throws
}

public CascadeDeletableError: Error, CustomStringConvertible {
    var error: Error
    var object: CascadeDeletable

    public var description: String {
        return "Failed to cascadeDelete \(type(of: object)): \(error)"
    }

    public CascadeDeletableError(_ error: Error, object: CascadeDeletable) {
        self.error = error
        self.object = object
    }
}

extension FHIRAbstractBase: CascadeDeletable {
    /// Cascade deletes all RealmSwift Objects which are a child of this instance, as well as this instance itself.
    ///
    /// - Warning: This method may only be called during a write transaction.
    public func cascadeDelete() throws {
        // Go through each array first and cascade delete any CascadeDeletables we find.
        do {
            try objectSchema.properties.lazy
                .filter { $0.type == .array }
                .forEach { property in
                    if let object = value(forKey: property.name) {
                        try (object as? CascadeDeletable)?.cascadeDelete()
                    }
                }
        } catch let error {
            throw CascadeDeletableError(error, object: self)
        }

        // Go deep-first on each CasecadeDeletable relationship
        do {
            try objectSchema.properties.lazy
                .filter { $0.type == .object }
                .forEach { property in
                    if let object = value(forKey: property.name) as? RealmSwift.Object {
                        guard !object.isInvalidated else { return }

                        guard let cascadable = object as? CascadeDeletable else {
                            object.realm?.delete(object)
                            return
                        }

                        try cascadable.cascadeDelete()
                    }
                }
        } catch let error {
            throw CascadeDeletableError(error, object: self)
        }

        realm?.delete(self)
    }
}

extension RealmSwift.List: CascadeDeletable {

    /// Iterates through the list and calls `cascadeDelete` on each element, if the element is `CascadeDeletable`,
    /// otherwise it will attempt to delete the element using the realm managing the element.
    ///
    /// - Warning: This method may only be called during a write transaction.
    public func cascadeDelete() throws {
        do {
            try forEach { object in
                guard let cascadable = object as? CascadeDeletable else {
                object.realm?.delete(object)
                return
            }

            try cascadable.cascadeDelete()
        }
    } catch let error {
        throw CascadeDeletableError(error, object: self)
    }
}
