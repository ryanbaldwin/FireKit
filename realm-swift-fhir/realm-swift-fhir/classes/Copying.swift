//
//  Copying.swift
//  RealmSwiftFHIR
//
//  Created by Ryan Baldwin on 2017-02-15.
//  Copyright © 2017 University Health Network. All rights reserved.
//

import Foundation

extension Resource: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return FHIRAbstractBase.instantiate(from: self.asJSON(), owner: nil)
    }
}

extension Element: NSCopying {
    public func copy(with zone: NSZone? = nil) -> Any {
        return type(of: self).init(json: self.asJSON())
//        return FHIRAbstractBase.instantiate(from: self.asJSON(), owner: nil)
    }
}
