//
//  NamingSystem.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/NamingSystem) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
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
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var kind: String?
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var replacedBy: Reference?
    public func upsert(replacedBy: Reference?) {
        upsert(prop: &self.replacedBy, val: replacedBy)
    }
    @objc public dynamic var responsible: String?
    @objc public dynamic var status: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    public let uniqueId = RealmSwift.List<NamingSystemUniqueId>()
    @objc public dynamic var usage: String?
    public let useContext = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(date: DateTime, kind: String, name: String, status: String, uniqueId: [NamingSystemUniqueId]) {
        self.init()
        self.date = date
        self.kind = kind
        self.name = name
        self.status = status
        self.uniqueId.append(objectsIn: uniqueId)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case date = "date"
        case description_fhir = "description"
        case kind = "kind"
        case name = "name"
        case publisher = "publisher"
        case replacedBy = "replacedBy"
        case responsible = "responsible"
        case status = "status"
        case type = "type"
        case uniqueId = "uniqueId"
        case usage = "usage"
        case useContext = "useContext"
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


        if let contactVals = try container.decodeIfPresent([NamingSystemContact].self, forKey: .contact) {
          // NamingSystemContact: FHIRJSON
        }
        // DateTime: String
        if let dateVal = try container.decodeIfPresent(DateTime.self, forKey: .date) {
          self.date = dateVal
        }
        // String: String
        if let description_fhirVal = try container.decodeIfPresent(String.self, forKey: .description_fhir) {
          self.description_fhir = description_fhirVal
        }
        // String: String
        if let kindVal = try container.decodeIfPresent(String.self, forKey: .kind) {
          self.kind = kindVal
        }
        // String: String
        if let nameVal = try container.decodeIfPresent(String.self, forKey: .name) {
          self.name = nameVal
        }
        // String: String
        if let publisherVal = try container.decodeIfPresent(String.self, forKey: .publisher) {
          self.publisher = publisherVal
        }
        // Reference: FHIRJSON
        if let replacedByVal = try container.decodeIfPresent(Reference.self, forKey: .replacedBy) {
          self.replacedBy = replacedByVal
        }
        // String: String
        if let responsibleVal = try container.decodeIfPresent(String.self, forKey: .responsible) {
          self.responsible = responsibleVal
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        // CodeableConcept: FHIRJSON
        if let typeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .type) {
          self.type = typeVal
        }
        if let uniqueIdVals = try container.decodeIfPresent([NamingSystemUniqueId].self, forKey: .uniqueId) {
          // NamingSystemUniqueId: FHIRJSON
        }
        // String: String
        if let usageVal = try container.decodeIfPresent(String.self, forKey: .usage) {
          self.usage = usageVal
        }
        if let useContextVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) {
          // CodeableConcept: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.replacedBy, forKey: .replacedBy)
        try container.encodeIfPresent(self.responsible, forKey: .responsible)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(self.uniqueId.flatMap { $0 }, forKey: .uniqueId)
        try container.encodeIfPresent(self.usage, forKey: .usage)
        try container.encode(self.useContext.flatMap { $0 }, forKey: .useContext)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = NamingSystemContact.instantiate(fromArray: val, owner: self) as? [NamingSystemContact] {
						if let realm = self.realm { realm.delete(self.contact) }
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
					upsert(replacedBy: Reference(json: val, owner: self))
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
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["uniqueId"] {
				presentKeys.insert("uniqueId")
				if let val = exist as? [FHIRJSON] {
					if let vals = NamingSystemUniqueId.instantiate(fromArray: val, owner: self) as? [NamingSystemUniqueId] {
						if let realm = self.realm { realm.delete(self.uniqueId) }
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
						if let realm = self.realm { realm.delete(self.useContext) }
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
*/
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

    @objc public dynamic var name: String?
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case telecom = "telecom"
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


        // String: String
        if let nameVal = try container.decodeIfPresent(String.self, forKey: .name) {
          self.name = nameVal
        }
        if let telecomVals = try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) {
          // ContactPoint: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.telecom.flatMap { $0 }, forKey: .telecom)
    }
/*
	
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
						if let realm = self.realm { realm.delete(self.telecom) }
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
*/
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

    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let preferred = RealmOptional<Bool>()
    @objc public dynamic var type: String?
    @objc public dynamic var value: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String, val: String) {
        self.init()
        self.type = type
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case period = "period"
        case preferred = "preferred"
        case type = "type"
        case value = "value"
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


        // Period: FHIRJSON
        if let periodVal = try container.decodeIfPresent(Period.self, forKey: .period) {
          self.period = periodVal
        }
        // Bool: Bool
        if let preferredVal = try container.decodeIfPresent(Bool.self, forKey: .preferred) {
          self.preferred.value = preferredVal
        }
        // String: String
        if let typeVal = try container.decodeIfPresent(String.self, forKey: .type) {
          self.type = typeVal
        }
        // String: String
        if let valueVal = try container.decodeIfPresent(String.self, forKey: .value) {
          self.value = valueVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.preferred.value, forKey: .preferred)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.value, forKey: .value)
    }
/*
	
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
*/
}

