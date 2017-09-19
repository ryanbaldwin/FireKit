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
    func populate(from other: Self)
}

extension Populatable where Self: Resource {
    public func populate(from other: Resource) {
        // deep first
        
    }
}

extension Element: Populatable {
    public func populate(from other: Element) {
        objectSchema.properties.lazy
            .filter{ $0.type == .object }
            .forEach{ property in
                // deep first, down the Element tree
                if let object = value(forKey: property.name) as? Element {
                    guard !object.isInvalidated else { return }
                    
                    if let other = value(forKey: property.name) as? Element {
                        object.populate(from: other)
                    }
                }
        }
    }
}
