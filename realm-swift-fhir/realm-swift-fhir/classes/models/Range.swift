//
//  Range.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Range) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
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

	public dynamic var high: Quantity?						
		
		
			public func upsert(high: Quantity?) {
				upsert(prop: &self.high, val: high)
			}
	
	public dynamic var low: Quantity?						
		
		
			public func upsert(low: Quantity?) {
				upsert(prop: &self.low, val: low)
			}
	

	
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
}

