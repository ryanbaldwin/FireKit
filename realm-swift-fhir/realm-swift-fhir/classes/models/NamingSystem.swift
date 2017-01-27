//
//  NamingSystem.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/NamingSystem) on 2017-01-27.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  System of unique identification.
 *
 *  A curated namespace that issues unique symbols within that namespace for the identification of concepts, people,
 *  devices, etc.  Represents a "System" used within the Identifier and Coding data types.
 */
open class NamingSystem: DomainResource {
	override open class var resourceType: String {
		get { return "NamingSystem" }
	}

	public let contact = RealmSwift.List<NamingSystemContact>()
	public dynamic var date: DateTime?
	public dynamic var description_fhir: String?
	public dynamic var kind: String?
	public dynamic var name: String?
	public dynamic var publisher: String?
	public dynamic var replacedBy: Reference?
	public dynamic var responsible: String?
	public dynamic var status: String?
	public dynamic var type: CodeableConcept?
	public let uniqueId = RealmSwift.List<NamingSystemUniqueId>()
	public dynamic var usage: String?
	public let useContext = RealmSwift.List<CodeableConcept>()

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(date: DateTime, kind: String, name: String, status: String, uniqueId: [NamingSystemUniqueId]) {
		self.init(json: nil)
		self.date = date
		self.kind = kind
		self.name = name
		self.status = status
		self.uniqueId.append(objectsIn: uniqueId)
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = NamingSystemContact.instantiate(fromArray: val, owner: self) as? [NamingSystemContact] {
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "date"))
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["kind"] {
				presentKeys.insert("kind")
				if let val = exist as? String {
					self.kind = val
				}
				else {
					errors.append(FHIRJSONError(key: "kind", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "kind"))
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["publisher"] {
				presentKeys.insert("publisher")
				if let val = exist as? String {
					self.publisher = val
				}
				else {
					errors.append(FHIRJSONError(key: "publisher", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["replacedBy"] {
				presentKeys.insert("replacedBy")
				if let val = exist as? FHIRJSON {
					self.replacedBy = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "replacedBy", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["responsible"] {
				presentKeys.insert("responsible")
				if let val = exist as? String {
					self.responsible = val
				}
				else {
					errors.append(FHIRJSONError(key: "responsible", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					self.type = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["uniqueId"] {
				presentKeys.insert("uniqueId")
				if let val = exist as? [FHIRJSON] {
					if let vals = NamingSystemUniqueId.instantiate(fromArray: val, owner: self) as? [NamingSystemUniqueId] {
						self.uniqueId.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "uniqueId", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "uniqueId"))
			}
			if let exist = js["usage"] {
				presentKeys.insert("usage")
				if let val = exist as? String {
					self.usage = val
				}
				else {
					errors.append(FHIRJSONError(key: "usage", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["useContext"] {
				presentKeys.insert("useContext")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						self.useContext.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "useContext", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let replacedBy = self.replacedBy {
			json["replacedBy"] = replacedBy.asJSON()
		}
		if let responsible = self.responsible {
			json["responsible"] = responsible.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if uniqueId.count > 0 {
			json["uniqueId"] = Array(uniqueId.map() { $0.asJSON() })
		}
		if let usage = self.usage {
			json["usage"] = usage.asJSON()
		}
		if useContext.count > 0 {
			json["useContext"] = Array(useContext.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class NamingSystemContact: BackboneElement {
	override open class var resourceType: String {
		get { return "NamingSystemContact" }
	}

	public dynamic var name: String?
	public let telecom = RealmSwift.List<ContactPoint>()

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["telecom"] {
				presentKeys.insert("telecom")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						self.telecom.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "telecom", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Unique identifiers used for system.
 *
 *  Indicates how the system may be identified when referenced in electronic exchange.
 */
open class NamingSystemUniqueId: BackboneElement {
	override open class var resourceType: String {
		get { return "NamingSystemUniqueId" }
	}

	public dynamic var period: Period?
	public let preferred = RealmOptional<Bool>()
	public dynamic var type: String?
	public dynamic var value: String?

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(type: String, val: String) {
		self.init(json: nil)
		self.type = type
		self.value = val
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					self.period = Period(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["preferred"] {
				presentKeys.insert("preferred")
				if let val = exist as? Bool {
					self.preferred.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "preferred", wants: Bool.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
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
			else {
				errors.append(FHIRJSONError(key: "value"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let preferred = self.preferred.value {
			json["preferred"] = preferred.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
}

