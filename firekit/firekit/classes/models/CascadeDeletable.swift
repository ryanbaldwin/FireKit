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

extension FHIRAbstractBase: CascadeDeletable {
    /// Cascade deletes all RealmSwift Objects which are a child of this instance, as well as this instance itself.
    ///
    /// - Warning: This method may only be called during a write transaction.
    public func cascadeDelete() {
        // Go through each array first and cascade delete any CascadeDeletables we find.
        try! objectSchema.properties.lazy
            .filter { $0.type == .array }
            .forEach { property in
                if let object = value(forKey: property.name) {
                    try (object as? CascadeDeletable)?.cascadeDelete()
                }
        }
        
        // Go deep-first on each CasecadeDeletable relationship
        try! objectSchema.properties.lazy
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
        
        realm?.delete(self)
    }
}

extension RealmSwift.List: CascadeDeletable {
    
    /// Iterates through the list and calls `cascadeDelete` on each element, if the element is `CascadeDeletable`,
    /// otherwise it will attempt to delete the element using the realm managing the element.
    ///
    /// - Warning: This method may only be called during a write transaction.
    public func cascadeDelete() {
        try! forEach { object in
            guard let cascadable = object as? CascadeDeletable else {
                object.realm?.delete(object)
                return
            }
            
            try cascadable.cascadeDelete()
        }
    }
}
