//
//  Quantity.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Quantity) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A measured or measurable amount.
 *
 *  A measured amount (or an amount that can potentially be measured). Note that measured amounts include amounts that
 *  are not precisely quantified, including amounts involving arbitrary units and floating currencies.
 */
open class Quantity: Element {
	override open class var resourceType: String {
		get { return "Quantity" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var comparator: String?
    @objc public dynamic var system: String?
    @objc public dynamic var unit: String?
    @objc public dynamic var value: RealmDecimal?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case comparator = "comparator"
        case system = "system"
        case unit = "unit"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.comparator = try container.decodeIfPresent(String.self, forKey: .comparator)
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.unit = try container.decodeIfPresent(String.self, forKey: .unit)
        self.value = try container.decodeIfPresent(RealmDecimal.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.comparator, forKey: .comparator)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.unit, forKey: .unit)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Quantity.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Quantity. Will return empty instance: \(error))")
		}
		return Quantity.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Quantity else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code
        comparator = o.comparator
        system = o.system
        unit = o.unit
        value = o.value
    }
}

