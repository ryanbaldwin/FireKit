//
//  Account.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Account) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  None.
 *
 *  A financial tool for tracking value accrued for a particular purpose.  In the healthcare field, used to track
 *  charges for a patient, cost centres, etc.
 */
open class Account: DomainResource {
	override open class var resourceType: String {
		get { return "Account" }
	}

    @objc public dynamic var activePeriod: Period?
    public func upsert(activePeriod: Period?) {
        upsert(prop: &self.activePeriod, val: activePeriod)
    }
    @objc public dynamic var balance: Quantity?
    public func upsert(balance: Quantity?) {
        upsert(prop: &self.balance, val: balance)
    }
    @objc public dynamic var coveragePeriod: Period?
    public func upsert(coveragePeriod: Period?) {
        upsert(prop: &self.coveragePeriod, val: coveragePeriod)
    }
    @objc public dynamic var currency: Coding?
    public func upsert(currency: Coding?) {
        upsert(prop: &self.currency, val: currency)
    }
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: String?
    @objc public dynamic var owner: Reference?
    public func upsert(owner: Reference?) {
        upsert(prop: &self.owner, val: owner)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case activePeriod = "activePeriod"
        case balance = "balance"
        case coveragePeriod = "coveragePeriod"
        case currency = "currency"
        case description_fhir = "description"
        case identifier = "identifier"
        case name = "name"
        case owner = "owner"
        case status = "status"
        case subject = "subject"
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

        self.activePeriod = try container.decodeIfPresent(Period.self, forKey: .activePeriod)
        self.balance = try container.decodeIfPresent(Quantity.self, forKey: .balance)
        self.coveragePeriod = try container.decodeIfPresent(Period.self, forKey: .coveragePeriod)
        self.currency = try container.decodeIfPresent(Coding.self, forKey: .currency)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.owner = try container.decodeIfPresent(Reference.self, forKey: .owner)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.activePeriod, forKey: .activePeriod)
        try container.encodeIfPresent(self.balance, forKey: .balance)
        try container.encodeIfPresent(self.coveragePeriod, forKey: .coveragePeriod)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.owner, forKey: .owner)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Account.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Account. Will return empty instance: \(error))")
		}
		return Account.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Account else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.activePeriod, from: o.activePeriod)
        FireKit.populate(&self.balance, from: o.balance)
        FireKit.populate(&self.coveragePeriod, from: o.coveragePeriod)
        FireKit.populate(&self.currency, from: o.currency)
        description_fhir = o.description_fhir

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
        FireKit.populate(&self.owner, from: o.owner)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populate(&self.type, from: o.type)
    }
}

