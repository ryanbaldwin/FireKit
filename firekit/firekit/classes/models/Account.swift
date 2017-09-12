//
//  Account.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Account) on 2017-09-11.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["activePeriod"] {
				presentKeys.insert("activePeriod")
				if let val = exist as? FHIRJSON {
					upsert(activePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "activePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["balance"] {
				presentKeys.insert("balance")
				if let val = exist as? FHIRJSON {
					upsert(balance: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "balance", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["coveragePeriod"] {
				presentKeys.insert("coveragePeriod")
				if let val = exist as? FHIRJSON {
					upsert(coveragePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "coveragePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["currency"] {
				presentKeys.insert("currency")
				if let val = exist as? FHIRJSON {
					upsert(currency: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "currency", wants: FHIRJSON.self, has: type(of: exist)))
				}
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
			if let exist = js["owner"] {
				presentKeys.insert("owner")
				if let val = exist as? FHIRJSON {
					upsert(owner: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "owner", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
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
		
		if let activePeriod = self.activePeriod {
			json["activePeriod"] = activePeriod.asJSON()
		}
		if let balance = self.balance {
			json["balance"] = balance.asJSON()
		}
		if let coveragePeriod = self.coveragePeriod {
			json["coveragePeriod"] = coveragePeriod.asJSON()
		}
		if let currency = self.currency {
			json["currency"] = currency.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let owner = self.owner {
			json["owner"] = owner.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
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
			let clone = try JSONDecoder().decode(Account.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Account. Will return empty instance: \(error))")
		}
		return Account.init()
	}
}

