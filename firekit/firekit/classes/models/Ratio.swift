//
//  Ratio.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Ratio) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A ratio of two Quantity values - a numerator and a denominator.
 *
 *  A relationship of two Quantity values - expressed as a numerator and a denominator.
 */
open class Ratio: Element {
	override open class var resourceType: String {
		get { return "Ratio" }
	}

    @objc public dynamic var denominator: Quantity?
    public func upsert(denominator: Quantity?) {
        upsert(prop: &self.denominator, val: denominator)
    }
    @objc public dynamic var numerator: Quantity?
    public func upsert(numerator: Quantity?) {
        upsert(prop: &self.numerator, val: numerator)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case denominator = "denominator"
        case numerator = "numerator"
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

        self.denominator = try container.decodeIfPresent(Quantity.self, forKey: .denominator)
        self.numerator = try container.decodeIfPresent(Quantity.self, forKey: .numerator)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.denominator, forKey: .denominator)
        try container.encodeIfPresent(self.numerator, forKey: .numerator)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Ratio.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Ratio. Will return empty instance: \(error))")
		}
		return Ratio.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Ratio else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.denominator, from: o.denominator)
        FireKit.populate(&self.numerator, from: o.numerator)
    }
}

