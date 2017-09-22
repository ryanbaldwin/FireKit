//
//  Resource.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Resource) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Base Resource.
 *
 *  This is the base resource type for everything.
 */
open class Resource: FHIRAbstractResource {
	override open class var resourceType: String {
		get { return "Resource" }
	}

    @objc public dynamic var id: String?
    @objc public dynamic var pk = UUID().uuidString
    override open static func primaryKey() -> String? { return "pk" }
    @objc public dynamic var implicitRules: String?
    @objc public dynamic var language: String?
    @objc public dynamic var meta: Meta?
    public func upsert(meta: Meta?) {
        upsert(prop: &self.meta, val: meta)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case implicitRules = "implicitRules"
        case language = "language"
        case meta = "meta"
    }
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.implicitRules = try container.decodeIfPresent(String.self, forKey: .implicitRules)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.meta = try container.decodeIfPresent(Meta.self, forKey: .meta)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.implicitRules, forKey: .implicitRules)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.meta, forKey: .meta)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Resource.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Resource. Will return empty instance: \(error))")
		}
		return Resource.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Resource else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        id = o.id
        implicitRules = o.implicitRules
        language = o.language
        FireKit.populate(&self.meta, from: o.meta)
    }
}

