//
//  Organization.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Organization) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Organization else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        active.value = o.active.value

        for (index, t) in o.address.enumerated() {
            guard index < self.address.count else {
                self.address.append(t)
                continue
            }
            self.address[index].populate(from: t)
        }
    
        if self.address.count > o.address.count {
            for i in self.address.count...o.address.count {
                self.address.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.contact.enumerated() {
            guard index < self.contact.count else {
                self.contact.append(t)
                continue
            }
            self.contact[index].populate(from: t)
        }
    
        if self.contact.count > o.contact.count {
            for i in self.contact.count...o.contact.count {
                self.contact.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                self.identifier.remove(objectAtIndex: i)
            }
        }
        name = o.name
        FireKit.populate(&self.partOf, from: o.partOf)

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        if self.telecom.count > o.telecom.count {
            for i in self.telecom.count...o.telecom.count {
                self.telecom.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.type, from: o.type)
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

    public override func populate(from other: Any) {
        guard let o = other as? OrganizationContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.address, from: o.address)
        FireKit.populate(&self.name, from: o.name)
        FireKit.populate(&self.purpose, from: o.purpose)

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        if self.telecom.count > o.telecom.count {
            for i in self.telecom.count...o.telecom.count {
                self.telecom.remove(objectAtIndex: i)
            }
        }
    }
}

