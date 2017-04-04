//
//  Ratio.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Ratio) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
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
    
    public dynamic var denominator: Quantity?        
    public func upsert(denominator: Quantity?) {
        upsert(prop: &self.denominator, val: denominator)
    }    
    public dynamic var numerator: Quantity?        
    public func upsert(numerator: Quantity?) {
        upsert(prop: &self.numerator, val: numerator)
    }

	
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
}

