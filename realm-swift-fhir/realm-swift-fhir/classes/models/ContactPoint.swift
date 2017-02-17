//
//  ContactPoint.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ContactPoint) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Details of a Technology mediated contact point (phone, fax, email, etc.).
 *
 *  Details for all kinds of technology mediated contact points for a person or organization, including telephone,
 *  email, etc.
 */
open class ContactPoint: Element {
	override open class var resourceType: String {
		get { return "ContactPoint" }
	}

	public dynamic var period: Period?						
		
		
			public func upsert(period: Period?) {
				upsert(prop: &self.period, val: period)
			}
	
	public let rank = RealmOptional<Int>()
	
	public dynamic var system: String?						
		
		
	
	public dynamic var use: String?						
		
		
	
	public dynamic var value: String?						
		
		
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rank"] {
				presentKeys.insert("rank")
				if let val = exist as? Int {
					self.rank.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "rank", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["system"] {
				presentKeys.insert("system")
				if let val = exist as? String {
					self.system = val
				}
				else {
					errors.append(FHIRJSONError(key: "system", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["use"] {
				presentKeys.insert("use")
				if let val = exist as? String {
					self.use = val
				}
				else {
					errors.append(FHIRJSONError(key: "use", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let rank = self.rank.value {
			json["rank"] = rank.asJSON()
		}
		if let system = self.system {
			json["system"] = system.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
}

