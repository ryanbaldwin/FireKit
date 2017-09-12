//
//  Organization.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Organization) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A grouping of people or organizations with a common purpose.
 *
 *  A formally or informally recognized grouping of people or organizations formed for the purpose of achieving some
 *  form of collective action.  Includes companies, institutions, corporations, departments, community groups,
 *  healthcare practice groups, etc.
 */
open class Organization: DomainResource {
	override open class var resourceType: String {
		get { return "Organization" }
	}

    public let active = RealmOptional<Bool>()
    public let address = RealmSwift.List<Address>()
    public let contact = RealmSwift.List<OrganizationContact>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: String?
    @objc public dynamic var partOf: Reference?
    public func upsert(partOf: Reference?) {
        upsert(prop: &self.partOf, val: partOf)
    }
    public let telecom = RealmSwift.List<ContactPoint>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case active = "active"
        case address = "address"
        case contact = "contact"
        case identifier = "identifier"
        case name = "name"
        case partOf = "partOf"
        case telecom = "telecom"
        case type = "type"
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

        self.active.value = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.address.append(objectsIn: try container.decodeIfPresent([Address].self, forKey: .address) ?? [])
        self.contact.append(objectsIn: try container.decodeIfPresent([OrganizationContact].self, forKey: .contact) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.partOf = try container.decodeIfPresent(Reference.self, forKey: .partOf)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.active.value, forKey: .active)
        try container.encode(Array(self.address), forKey: .address)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.partOf, forKey: .partOf)
        try container.encode(Array(self.telecom), forKey: .telecom)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["active"] {
				presentKeys.insert("active")
				if let val = exist as? Bool {
					self.active.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "active", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? [FHIRJSON] {
					if let vals = Address.instantiate(fromArray: val, owner: self) as? [Address] {
						if let realm = self.realm { realm.delete(self.address) }
						self.address.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = OrganizationContact.instantiate(fromArray: val, owner: self) as? [OrganizationContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
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
			if let exist = js["partOf"] {
				presentKeys.insert("partOf")
				if let val = exist as? FHIRJSON {
					upsert(partOf: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "partOf", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let active = self.active.value {
			json["active"] = active.asJSON()
		}
		if address.count > 0 {
			json["address"] = Array(address.map() { $0.asJSON() })
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let partOf = self.partOf {
			json["partOf"] = partOf.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Organization.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Organization. Will return empty instance: \(error))")
		}
		return Organization.init()
	}
}


/**
 *  Contact for the organization for a certain purpose.
 */
open class OrganizationContact: BackboneElement {
	override open class var resourceType: String {
		get { return "OrganizationContact" }
	}

    @objc public dynamic var address: Address?
    public func upsert(address: Address?) {
        upsert(prop: &self.address, val: address)
    }
    @objc public dynamic var name: HumanName?
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }
    @objc public dynamic var purpose: CodeableConcept?
    public func upsert(purpose: CodeableConcept?) {
        upsert(prop: &self.purpose, val: purpose)
    }
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case name = "name"
        case purpose = "purpose"
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

        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
        self.name = try container.decodeIfPresent(HumanName.self, forKey: .name)
        self.purpose = try container.decodeIfPresent(CodeableConcept.self, forKey: .purpose)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.purpose, forKey: .purpose)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? FHIRJSON {
					upsert(address: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? FHIRJSON {
					upsert(name: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["purpose"] {
				presentKeys.insert("purpose")
				if let val = exist as? FHIRJSON {
					upsert(purpose: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "purpose", wants: FHIRJSON.self, has: type(of: exist)))
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
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let purpose = self.purpose {
			json["purpose"] = purpose.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OrganizationContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OrganizationContact. Will return empty instance: \(error))")
		}
		return OrganizationContact.init()
	}
}

