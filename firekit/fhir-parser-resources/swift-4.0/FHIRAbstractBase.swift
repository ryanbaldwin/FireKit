//
//  FHIRAbstractBase.swift
//  SwiftFHIR
//
//  Created by Pascal Pfiffner on 7/2/14.
//  2014, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import Realm
import RealmSwift
/**
 *  Abstract superclass for all FHIR data elements.
 */
open class FHIRAbstractBase: Object, Codable, NSCopying, Populatable {

        /// The name of the resource or element.
    open class var resourceType: String {
            return "FHIRAbstractBase"
        }

    required public init() {
        super.init()
    }

    required public init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }

    required public init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    // Codable - Default implementations which do nothing.
    public required init(from decoder: Decoder) throws {
        super.init()
    }

    public func encode(to encoder: Encoder) throws {
    }

    // MARK: - Realm Element convenience method
    func upsert<T: Element>(prop: inout T?, val: T?) {
        guard let value = val else {
            prop?.cascadeDelete()
            prop = nil
            return
        }
        
        if prop == nil {
            prop = T.init()
        }
        prop?.populate(from: value as Any)
    }

    // ugh, this is so lame.
    func upsert<T: Resource>(prop: inout T?, val: T?) {
        guard let value = val else {
            prop?.cascadeDelete()
            prop = nil
            return
        }
        
        if prop == nil {
            prop = T.init()
        }
        prop?.populate(from: value as Any)
    }

    public func copy(with zone: NSZone? = nil) -> Any {
        return FHIRAbstractBase()
    }

    /// Populates this instance from the values in the other instance.
    /// The base FHIRAbstractBase version of this function does nothing.
    ///
    /// - Parameter other: The other instance of matching type from which
    ///                    the values are to be copied.
    public func populate(from other: Any) {
        // nothing to populate.
    }
}
