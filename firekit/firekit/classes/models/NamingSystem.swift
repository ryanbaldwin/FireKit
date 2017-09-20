//
//  NamingSystem.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/NamingSystem) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

        self.contact.append(objectsIn: try container.decodeIfPresent([NamingSystemContact].self, forKey: .contact) ?? [])
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.replacedBy = try container.decodeIfPresent(Reference.self, forKey: .replacedBy)
        self.responsible = try container.decodeIfPresent(String.self, forKey: .responsible)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.uniqueId.append(objectsIn: try container.decodeIfPresent([NamingSystemUniqueId].self, forKey: .uniqueId) ?? [])
        self.usage = try container.decodeIfPresent(String.self, forKey: .usage)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.replacedBy, forKey: .replacedBy)
        try container.encodeIfPresent(self.responsible, forKey: .responsible)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(Array(self.uniqueId), forKey: .uniqueId)
        try container.encodeIfPresent(self.usage, forKey: .usage)
        try container.encode(Array(self.useContext), forKey: .useContext)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NamingSystem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NamingSystem. Will return empty instance: \(error))")
		}
		return NamingSystem.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? NamingSystem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

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
        FireKit.populate(&self.date, from: o.date)
        description_fhir = o.description_fhir
        kind = o.kind
        name = o.name
        publisher = o.publisher
        FireKit.populate(&self.replacedBy, from: o.replacedBy)
        responsible = o.responsible
        status = o.status
        FireKit.populate(&self.type, from: o.type)

        for (index, t) in o.uniqueId.enumerated() {
            guard index < self.uniqueId.count else {
                self.uniqueId.append(t)
                continue
            }
            self.uniqueId[index].populate(from: t)
        }
    
        if self.uniqueId.count > o.uniqueId.count {
            for i in self.uniqueId.count...o.uniqueId.count {
                self.uniqueId.remove(objectAtIndex: i)
            }
        }
        usage = o.usage

        for (index, t) in o.useContext.enumerated() {
            guard index < self.useContext.count else {
                self.useContext.append(t)
                continue
            }
            self.useContext[index].populate(from: t)
        }
    
        if self.useContext.count > o.useContext.count {
            for i in self.useContext.count...o.useContext.count {
                self.useContext.remove(objectAtIndex: i)
            }
        }
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

        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NamingSystemContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NamingSystemContact. Will return empty instance: \(error))")
		}
		return NamingSystemContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? NamingSystemContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        name = o.name

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

        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.preferred.value = try container.decodeIfPresent(Bool.self, forKey: .preferred)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.preferred.value, forKey: .preferred)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NamingSystemUniqueId.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NamingSystemUniqueId. Will return empty instance: \(error))")
		}
		return NamingSystemUniqueId.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? NamingSystemUniqueId else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.period, from: o.period)
        preferred.value = o.preferred.value
        type = o.type
        value = o.value
    }
}

