//
//  Ratio.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Ratio) on 2017-09-10.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["denominator"] {
				presentKeys.insert("denominator")
				if let val = exist as? FHIRJSON {
					upsert(denominator: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "denominator", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["numerator"] {
				presentKeys.insert("numerator")
				if let val = exist as? FHIRJSON {
					upsert(numerator: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "numerator", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let denominator = self.denominator {
			json["denominator"] = denominator.asJSON()
		}
		if let numerator = self.numerator {
			json["numerator"] = numerator.asJSON()
		}
		
		return json
	}
*/
}

