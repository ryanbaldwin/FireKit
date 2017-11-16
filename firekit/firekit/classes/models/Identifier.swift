//
//  Identifier.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Identifier) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  An identifier intended for computation.
 *
 *  A technical identifier - identifies some entity uniquely and unambiguously.
 */
open class Identifier: Element {
	override open class var resourceType: String {
		get { return "Identifier" }
	}

    @objc public dynamic var assigner: Reference?
    public func upsert(assigner: Reference?) {
        upsert(prop: &self.assigner, val: assigner)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var system: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var use: String?
    @objc public dynamic var value: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case assigner = "assigner"
        case period = "period"
        case system = "system"
        case type = "type"
        case use = "use"
        case value = "value"
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

        self.assigner = try container.decodeIfPresent(Reference.self, forKey: .assigner)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.assigner, forKey: .assigner)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.use, forKey: .use)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Identifier.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Identifier. Will return empty instance: \(error))")
		}
		return Identifier.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Identifier else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.assigner, from: o.assigner)
        FireKit.populate(&self.period, from: o.period)
        system = o.system
        FireKit.populate(&self.type, from: o.type)
        use = o.use
        value = o.value
    }
}

