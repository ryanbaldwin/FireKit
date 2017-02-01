//
//  HumanName.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/HumanName) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Name of a human - parts and usage.
 *
 *  A human's name with the ability to identify parts and usage.
 */
open class HumanName: Element {
	override open class var resourceType: String {
		get { return "HumanName" }
	}

	public let family = RealmSwift.List<RealmString>()
	
	public let given = RealmSwift.List<RealmString>()
	
	public dynamic var period: Period?
	
	public let prefix = RealmSwift.List<RealmString>()
	
	public let suffix = RealmSwift.List<RealmString>()
	
	public dynamic var text: String?
	
	public dynamic var use: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["family"] {
				presentKeys.insert("family")
				if let val = exist as? [String] {
					self.family.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "family", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["given"] {
				presentKeys.insert("given")
				if let val = exist as? [String] {
					self.given.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "given", wants: Array<String>.self, has: type(of: exist)))
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
			if let exist = js["prefix"] {
				presentKeys.insert("prefix")
				if let val = exist as? [String] {
					self.prefix.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "prefix", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["suffix"] {
				presentKeys.insert("suffix")
				if let val = exist as? [String] {
					self.suffix.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "suffix", wants: Array<String>.self, has: type(of: exist)))
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
		
		if family.count > 0 {
			json["family"] = Array(family.map() { $0.value })
		}
		if given.count > 0 {
			json["given"] = Array(given.map() { $0.value })
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if prefix.count > 0 {
			json["prefix"] = Array(prefix.map() { $0.value })
		}
		if suffix.count > 0 {
			json["suffix"] = Array(suffix.map() { $0.value })
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		
		return json
	}
}

