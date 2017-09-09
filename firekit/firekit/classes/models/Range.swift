//
//  Range.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Range) on 2017-09-09.
//  2017, SMART Health IT.
//

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


        // Quantity: FHIRJSON
        if let highVal = try container.decodeIfPresent(Quantity.self, forKey: .high) {
          self.high = highVal
        }
        // Quantity: FHIRJSON
        if let lowVal = try container.decodeIfPresent(Quantity.self, forKey: .low) {
          self.low = lowVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.high, forKey: .high)
        try container.encodeIfPresent(self.low, forKey: .low)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["high"] {
				presentKeys.insert("high")
				if let val = exist as? FHIRJSON {
					upsert(high: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "high", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["low"] {
				presentKeys.insert("low")
				if let val = exist as? FHIRJSON {
					upsert(low: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "low", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let high = self.high {
			json["high"] = high.asJSON()
		}
		if let low = self.low {
			json["low"] = low.asJSON()
		}
		
		return json
	}
*/
}

