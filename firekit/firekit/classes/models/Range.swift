//
//  Range.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Range) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Set of values bounded by low and high.
 *
 *  A set of ordered Quantities defined by a low and high limit.
 */
open class Range: Element {
	override open class var resourceType: String {
		get { return "Range" }
	}

    @objc public dynamic var high: Quantity?
    public func upsert(high: Quantity?) {
        upsert(prop: &self.high, val: high)
    }
    @objc public dynamic var low: Quantity?
    public func upsert(low: Quantity?) {
        upsert(prop: &self.low, val: low)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case high = "high"
        case low = "low"
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

        self.high = try container.decodeIfPresent(Quantity.self, forKey: .high)
        self.low = try container.decodeIfPresent(Quantity.self, forKey: .low)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.high, forKey: .high)
        try container.encodeIfPresent(self.low, forKey: .low)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Range.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Range. Will return empty instance: \(error))")
		}
		return Range.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Range else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.high, from: o.high)
        FireKit.populate(&self.low, from: o.low)
    }
}

