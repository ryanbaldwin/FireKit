//
//  Populatable.swift
//  FireKit-iOS
//
//  Created by Ryan Baldwin on 2017-09-18.
//  Copyright © 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation
import RealmSwift

public protocol Populatable {
    func populate(from other: Any)
}

/// Attempts to populate `target` with values from `other`.
///
/// - Parameters:
///   - target: The `Populatable` object whose values are to be updated
///   - other: The `Populatable` source of those values
/// - Attention: This function _must_ be called from within a Realm `write` transaction
func populate<T: RealmSwift.Object>(_ target: inout T?, from other: T?) where T: Populatable {
    guard target != nil else {
        target = other?.copy() as? T
        return
    }
    
    guard other != nil else {
        guard let cascadable = target as? CascadeDeletable else {
            target?.realm?.delete(target!)
            target = nil
            return
        }
        
        // force try, as populate<T> should be called from within 
        // realm write transaction.
        try! cascadable.cascadeDelete()
        target = nil
        return
    }
    
    target?.populate(from: other as Any)
}
