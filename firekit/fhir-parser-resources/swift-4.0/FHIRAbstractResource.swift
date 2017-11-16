//
//  FHIRAbstractResource.swift
//  SwiftFHIR
//
//  Created by Pascal Pfiffner on 7/2/14.
//  2014, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//
import Foundation
import Realm

/**
 *  Abstract superclass for all FHIR resource models.
 */
open class FHIRAbstractResource: FHIRAbstractBase {
    private enum CodingKeys: String, CodingKey {
        case resourceType
    }
    
    /// A specific version id, if the instance was created using `vread`.
    @objc open dynamic var _versionId: String?
    override open var description: String {
        return "<\(type(of: self).resourceType)>"
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
        
        let thisResourceType = type(of: self).resourceType
        guard thisResourceType != Resource.resourceType else {
            // Any resource can be decoded. Example, a MedicationOrder into a BundleEntry.
            return
        }
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        guard let decodedResourceType = try container.decodeIfPresent(String.self, forKey: .resourceType) else { return }
        
        guard decodedResourceType == thisResourceType else {
            let context = DecodingError.Context(codingPath: decoder.codingPath,
                                                debugDescription: """
                Attempting to decode a \(decodedResourceType) into a \(thisResourceType)
                """)
            throw DecodingError.typeMismatch(type(of: self), context)
        }
    }
    
    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type(of: self).resourceType, forKey: .resourceType)
    }

    public override func populate(from other: Any) {
        guard let o = other as? FHIRAbstractResource else {
            print("Tried to populate a FHIRAbstractResource from \(type(of: other)). Skipping.")
            return
        }
        super.populate(from: other)
        _versionId = o._versionId
    }
}
