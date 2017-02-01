//
//  Address.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Address) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A postal address.
 *
 *  There is a variety of postal address formats defined around the world. This format defines a superset that is the
 *  basis for all addresses around the world.
 */
open class Address: Element {
	override open class var resourceType: String {
		get { return "Address" }
	}

	public dynamic var city: String?
	
	public dynamic var country: String?
	
	public dynamic var district: String?
	
	public let line = RealmSwift.List<RealmString>()
	
	public dynamic var period: Period?
	
	public dynamic var postalCode: String?
	
	public dynamic var state: String?
	
	public dynamic var text: String?
	
	public dynamic var type: String?
	
	public dynamic var use: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["city"] {
				presentKeys.insert("city")
				if let val = exist as? String {
					self.city = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "city", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["country"] {
				presentKeys.insert("country")
				if let val = exist as? String {
					self.country = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "country", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["district"] {
				presentKeys.insert("district")
				if let val = exist as? String {
					self.district = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "district", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["line"] {
				presentKeys.insert("line")
				if let val = exist as? [String] {
					self.line.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "line", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					self.period = Period(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["postalCode"] {
				presentKeys.insert("postalCode")
				if let val = exist as? String {
					self.postalCode = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "postalCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["state"] {
				presentKeys.insert("state")
				if let val = exist as? String {
					self.state = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "state", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let city = self.city {
			json["city"] = city.asJSON()
		}
		if let country = self.country {
			json["country"] = country.asJSON()
		}
		if let district = self.district {
			json["district"] = district.asJSON()
		}
		if line.count > 0 {
			json["line"] = Array(line.map() { $0.value })
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let postalCode = self.postalCode {
			json["postalCode"] = postalCode.asJSON()
		}
		if let state = self.state {
			json["state"] = state.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		
		return json
	}
}

