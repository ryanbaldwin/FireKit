//
//  Contract.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Contract) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Contract.
 *
 *  A formal agreement between parties regarding the conduct of business, exchange of information or other matters.
 */
open class Contract: DomainResource {
	override open class var resourceType: String {
		get { return "Contract" }
	}

    public let action = RealmSwift.List<CodeableConcept>()
    public let actionReason = RealmSwift.List<CodeableConcept>()
    public let actor = RealmSwift.List<ContractActor>()
    @objc public dynamic var applies: Period?
    public func upsert(applies: Period?) {
        upsert(prop: &self.applies, val: applies)
    }
    public let authority = RealmSwift.List<Reference>()
    @objc public dynamic var bindingAttachment: Attachment?
    public func upsert(bindingAttachment: Attachment?) {
        upsert(prop: &self.bindingAttachment, val: bindingAttachment)
    }
    @objc public dynamic var bindingReference: Reference?
    public func upsert(bindingReference: Reference?) {
        upsert(prop: &self.bindingReference, val: bindingReference)
    }
    public let domain = RealmSwift.List<Reference>()
    public let friendly = RealmSwift.List<ContractFriendly>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var issued: DateTime?
    public let legal = RealmSwift.List<ContractLegal>()
    public let rule = RealmSwift.List<ContractRule>()
    public let signer = RealmSwift.List<ContractSigner>()
    public let subType = RealmSwift.List<CodeableConcept>()
    public let subject = RealmSwift.List<Reference>()
    public let term = RealmSwift.List<ContractTerm>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    public let valuedItem = RealmSwift.List<ContractValuedItem>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case actionReason = "actionReason"
        case actor = "actor"
        case applies = "applies"
        case authority = "authority"
        case bindingAttachment = "bindingAttachment"
        case bindingReference = "bindingReference"
        case domain = "domain"
        case friendly = "friendly"
        case identifier = "identifier"
        case issued = "issued"
        case legal = "legal"
        case rule = "rule"
        case signer = "signer"
        case subType = "subType"
        case subject = "subject"
        case term = "term"
        case type = "type"
        case valuedItem = "valuedItem"
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

        self.action.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .action) ?? [])
        self.actionReason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .actionReason) ?? [])
        self.actor.append(objectsIn: try container.decodeIfPresent([ContractActor].self, forKey: .actor) ?? [])
        self.applies = try container.decodeIfPresent(Period.self, forKey: .applies)
        self.authority.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .authority) ?? [])
        self.bindingAttachment = try container.decodeIfPresent(Attachment.self, forKey: .bindingAttachment)
        self.bindingReference = try container.decodeIfPresent(Reference.self, forKey: .bindingReference)
        self.domain.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .domain) ?? [])
        self.friendly.append(objectsIn: try container.decodeIfPresent([ContractFriendly].self, forKey: .friendly) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.issued = try container.decodeIfPresent(DateTime.self, forKey: .issued)
        self.legal.append(objectsIn: try container.decodeIfPresent([ContractLegal].self, forKey: .legal) ?? [])
        self.rule.append(objectsIn: try container.decodeIfPresent([ContractRule].self, forKey: .rule) ?? [])
        self.signer.append(objectsIn: try container.decodeIfPresent([ContractSigner].self, forKey: .signer) ?? [])
        self.subType.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .subType) ?? [])
        self.subject.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .subject) ?? [])
        self.term.append(objectsIn: try container.decodeIfPresent([ContractTerm].self, forKey: .term) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.valuedItem.append(objectsIn: try container.decodeIfPresent([ContractValuedItem].self, forKey: .valuedItem) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.action), forKey: .action)
        try container.encode(Array(self.actionReason), forKey: .actionReason)
        try container.encode(Array(self.actor), forKey: .actor)
        try container.encodeIfPresent(self.applies, forKey: .applies)
        try container.encode(Array(self.authority), forKey: .authority)
        try container.encodeIfPresent(self.bindingAttachment, forKey: .bindingAttachment)
        try container.encodeIfPresent(self.bindingReference, forKey: .bindingReference)
        try container.encode(Array(self.domain), forKey: .domain)
        try container.encode(Array(self.friendly), forKey: .friendly)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.issued, forKey: .issued)
        try container.encode(Array(self.legal), forKey: .legal)
        try container.encode(Array(self.rule), forKey: .rule)
        try container.encode(Array(self.signer), forKey: .signer)
        try container.encode(Array(self.subType), forKey: .subType)
        try container.encode(Array(self.subject), forKey: .subject)
        try container.encode(Array(self.term), forKey: .term)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(Array(self.valuedItem), forKey: .valuedItem)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.action) }
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["actionReason"] {
				presentKeys.insert("actionReason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.actionReason) }
						self.actionReason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "actionReason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["actor"] {
				presentKeys.insert("actor")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractActor.instantiate(fromArray: val, owner: self) as? [ContractActor] {
						if let realm = self.realm { realm.delete(self.actor) }
						self.actor.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "actor", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["applies"] {
				presentKeys.insert("applies")
				if let val = exist as? FHIRJSON {
					upsert(applies: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "applies", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["authority"] {
				presentKeys.insert("authority")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.authority) }
						self.authority.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "authority", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["bindingAttachment"] {
				presentKeys.insert("bindingAttachment")
				if let val = exist as? FHIRJSON {
					upsert(bindingAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bindingAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["bindingReference"] {
				presentKeys.insert("bindingReference")
				if let val = exist as? FHIRJSON {
					upsert(bindingReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bindingReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["domain"] {
				presentKeys.insert("domain")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.domain) }
						self.domain.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "domain", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["friendly"] {
				presentKeys.insert("friendly")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractFriendly.instantiate(fromArray: val, owner: self) as? [ContractFriendly] {
						if let realm = self.realm { realm.delete(self.friendly) }
						self.friendly.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "friendly", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["issued"] {
				presentKeys.insert("issued")
				if let val = exist as? String {
					self.issued = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "issued", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["legal"] {
				presentKeys.insert("legal")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractLegal.instantiate(fromArray: val, owner: self) as? [ContractLegal] {
						if let realm = self.realm { realm.delete(self.legal) }
						self.legal.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "legal", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["rule"] {
				presentKeys.insert("rule")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractRule.instantiate(fromArray: val, owner: self) as? [ContractRule] {
						if let realm = self.realm { realm.delete(self.rule) }
						self.rule.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "rule", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["signer"] {
				presentKeys.insert("signer")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractSigner.instantiate(fromArray: val, owner: self) as? [ContractSigner] {
						if let realm = self.realm { realm.delete(self.signer) }
						self.signer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "signer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subType"] {
				presentKeys.insert("subType")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.subType) }
						self.subType.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subType", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.subject) }
						self.subject.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["term"] {
				presentKeys.insert("term")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractTerm.instantiate(fromArray: val, owner: self) as? [ContractTerm] {
						if let realm = self.realm { realm.delete(self.term) }
						self.term.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "term", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["valuedItem"] {
				presentKeys.insert("valuedItem")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractValuedItem.instantiate(fromArray: val, owner: self) as? [ContractValuedItem] {
						if let realm = self.realm { realm.delete(self.valuedItem) }
						self.valuedItem.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "valuedItem", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		if actionReason.count > 0 {
			json["actionReason"] = Array(actionReason.map() { $0.asJSON() })
		}
		if actor.count > 0 {
			json["actor"] = Array(actor.map() { $0.asJSON() })
		}
		if let applies = self.applies {
			json["applies"] = applies.asJSON()
		}
		if authority.count > 0 {
			json["authority"] = Array(authority.map() { $0.asJSON() })
		}
		if let bindingAttachment = self.bindingAttachment {
			json["bindingAttachment"] = bindingAttachment.asJSON()
		}
		if let bindingReference = self.bindingReference {
			json["bindingReference"] = bindingReference.asJSON()
		}
		if domain.count > 0 {
			json["domain"] = Array(domain.map() { $0.asJSON() })
		}
		if friendly.count > 0 {
			json["friendly"] = Array(friendly.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let issued = self.issued {
			json["issued"] = issued.asJSON()
		}
		if legal.count > 0 {
			json["legal"] = Array(legal.map() { $0.asJSON() })
		}
		if rule.count > 0 {
			json["rule"] = Array(rule.map() { $0.asJSON() })
		}
		if signer.count > 0 {
			json["signer"] = Array(signer.map() { $0.asJSON() })
		}
		if subType.count > 0 {
			json["subType"] = Array(subType.map() { $0.asJSON() })
		}
		if subject.count > 0 {
			json["subject"] = Array(subject.map() { $0.asJSON() })
		}
		if term.count > 0 {
			json["term"] = Array(term.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if valuedItem.count > 0 {
			json["valuedItem"] = Array(valuedItem.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Contract.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Contract. Will return empty instance: \(error))")
		}
		return Contract.init()
	}
}


/**
 *  Contract Actor.
 *
 *  List of Contract actors.
 */
open class ContractActor: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractActor" }
	}

    @objc public dynamic var entity: Reference?
    public func upsert(entity: Reference?) {
        upsert(prop: &self.entity, val: entity)
    }
    public let role = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(entity: Reference) {
        self.init()
        self.entity = entity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case entity = "entity"
        case role = "role"
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

        self.entity = try container.decodeIfPresent(Reference.self, forKey: .entity)
        self.role.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .role) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.entity, forKey: .entity)
        try container.encode(Array(self.role), forKey: .role)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["entity"] {
				presentKeys.insert("entity")
				if let val = exist as? FHIRJSON {
					upsert(entity: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "entity"))
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.role) }
						self.role.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let entity = self.entity {
			json["entity"] = entity.asJSON()
		}
		if role.count > 0 {
			json["role"] = Array(role.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractActor.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractActor. Will return empty instance: \(error))")
		}
		return ContractActor.init()
	}
}


/**
 *  Contract Friendly Language.
 *
 *  The "patient friendly language" versionof the Contract in whole or in parts. "Patient friendly language" means the
 *  representation of the Contract and Contract Provisions in a manner that is readily accessible and understandable by
 *  a layperson in accordance with best practices for communication styles that ensure that those agreeing to or signing
 *  the Contract understand the roles, actions, obligations, responsibilities, and implication of the agreement.
 */
open class ContractFriendly: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractFriendly" }
	}

    @objc public dynamic var contentAttachment: Attachment?
    public func upsert(contentAttachment: Attachment?) {
        upsert(prop: &self.contentAttachment, val: contentAttachment)
    }
    @objc public dynamic var contentReference: Reference?
    public func upsert(contentReference: Reference?) {
        upsert(prop: &self.contentReference, val: contentReference)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(contentAttachment: Attachment, contentReference: Reference) {
        self.init()
        self.contentAttachment = contentAttachment
        self.contentReference = contentReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contentAttachment = "contentAttachment"
        case contentReference = "contentReference"
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

        self.contentAttachment = try container.decodeIfPresent(Attachment.self, forKey: .contentAttachment)
        self.contentReference = try container.decodeIfPresent(Reference.self, forKey: .contentReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.contentAttachment, forKey: .contentAttachment)
        try container.encodeIfPresent(self.contentReference, forKey: .contentReference)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contentAttachment"] {
				presentKeys.insert("contentAttachment")
				if let val = exist as? FHIRJSON {
					upsert(contentAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentReference"] {
				presentKeys.insert("contentReference")
				if let val = exist as? FHIRJSON {
					upsert(contentReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.contentAttachment && nil == self.contentReference {
				errors.append(FHIRJSONError(key: "content*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contentAttachment = self.contentAttachment {
			json["contentAttachment"] = contentAttachment.asJSON()
		}
		if let contentReference = self.contentReference {
			json["contentReference"] = contentReference.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractFriendly.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractFriendly. Will return empty instance: \(error))")
		}
		return ContractFriendly.init()
	}
}


/**
 *  Contract Legal Language.
 *
 *  List of Legal expressions or representations of this Contract.
 */
open class ContractLegal: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractLegal" }
	}

    @objc public dynamic var contentAttachment: Attachment?
    public func upsert(contentAttachment: Attachment?) {
        upsert(prop: &self.contentAttachment, val: contentAttachment)
    }
    @objc public dynamic var contentReference: Reference?
    public func upsert(contentReference: Reference?) {
        upsert(prop: &self.contentReference, val: contentReference)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(contentAttachment: Attachment, contentReference: Reference) {
        self.init()
        self.contentAttachment = contentAttachment
        self.contentReference = contentReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contentAttachment = "contentAttachment"
        case contentReference = "contentReference"
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

        self.contentAttachment = try container.decodeIfPresent(Attachment.self, forKey: .contentAttachment)
        self.contentReference = try container.decodeIfPresent(Reference.self, forKey: .contentReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.contentAttachment, forKey: .contentAttachment)
        try container.encodeIfPresent(self.contentReference, forKey: .contentReference)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contentAttachment"] {
				presentKeys.insert("contentAttachment")
				if let val = exist as? FHIRJSON {
					upsert(contentAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentReference"] {
				presentKeys.insert("contentReference")
				if let val = exist as? FHIRJSON {
					upsert(contentReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.contentAttachment && nil == self.contentReference {
				errors.append(FHIRJSONError(key: "content*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contentAttachment = self.contentAttachment {
			json["contentAttachment"] = contentAttachment.asJSON()
		}
		if let contentReference = self.contentReference {
			json["contentReference"] = contentReference.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractLegal.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractLegal. Will return empty instance: \(error))")
		}
		return ContractLegal.init()
	}
}


/**
 *  Computable Contract Language.
 *
 *  List of Computable Policy Rule Language Representations of this Contract.
 */
open class ContractRule: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractRule" }
	}

    @objc public dynamic var contentAttachment: Attachment?
    public func upsert(contentAttachment: Attachment?) {
        upsert(prop: &self.contentAttachment, val: contentAttachment)
    }
    @objc public dynamic var contentReference: Reference?
    public func upsert(contentReference: Reference?) {
        upsert(prop: &self.contentReference, val: contentReference)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(contentAttachment: Attachment, contentReference: Reference) {
        self.init()
        self.contentAttachment = contentAttachment
        self.contentReference = contentReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contentAttachment = "contentAttachment"
        case contentReference = "contentReference"
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

        self.contentAttachment = try container.decodeIfPresent(Attachment.self, forKey: .contentAttachment)
        self.contentReference = try container.decodeIfPresent(Reference.self, forKey: .contentReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.contentAttachment, forKey: .contentAttachment)
        try container.encodeIfPresent(self.contentReference, forKey: .contentReference)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contentAttachment"] {
				presentKeys.insert("contentAttachment")
				if let val = exist as? FHIRJSON {
					upsert(contentAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentReference"] {
				presentKeys.insert("contentReference")
				if let val = exist as? FHIRJSON {
					upsert(contentReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.contentAttachment && nil == self.contentReference {
				errors.append(FHIRJSONError(key: "content*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contentAttachment = self.contentAttachment {
			json["contentAttachment"] = contentAttachment.asJSON()
		}
		if let contentReference = self.contentReference {
			json["contentReference"] = contentReference.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractRule.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractRule. Will return empty instance: \(error))")
		}
		return ContractRule.init()
	}
}


/**
 *  Contract Signer.
 *
 *  Party signing this Contract.
 */
open class ContractSigner: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractSigner" }
	}

    @objc public dynamic var party: Reference?
    public func upsert(party: Reference?) {
        upsert(prop: &self.party, val: party)
    }
    @objc public dynamic var signature: String?
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(party: Reference, signature: String, type: Coding) {
        self.init()
        self.party = party
        self.signature = signature
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case party = "party"
        case signature = "signature"
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

        self.party = try container.decodeIfPresent(Reference.self, forKey: .party)
        self.signature = try container.decodeIfPresent(String.self, forKey: .signature)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.party, forKey: .party)
        try container.encodeIfPresent(self.signature, forKey: .signature)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["party"] {
				presentKeys.insert("party")
				if let val = exist as? FHIRJSON {
					upsert(party: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "party", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "party"))
			}
			if let exist = js["signature"] {
				presentKeys.insert("signature")
				if let val = exist as? String {
					self.signature = val
				}
				else {
					errors.append(FHIRJSONError(key: "signature", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "signature"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let party = self.party {
			json["party"] = party.asJSON()
		}
		if let signature = self.signature {
			json["signature"] = signature.asJSON()
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
			let clone = try JSONDecoder().decode(ContractSigner.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractSigner. Will return empty instance: \(error))")
		}
		return ContractSigner.init()
	}
}


/**
 *  Contract Term List.
 *
 *  One or more Contract Provisions, which may be related and conveyed as a group, and may contain nested groups.
 */
open class ContractTerm: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractTerm" }
	}

    public let action = RealmSwift.List<CodeableConcept>()
    public let actionReason = RealmSwift.List<CodeableConcept>()
    public let actor = RealmSwift.List<ContractTermActor>()
    @objc public dynamic var applies: Period?
    public func upsert(applies: Period?) {
        upsert(prop: &self.applies, val: applies)
    }
    public let group = RealmSwift.List<ContractTerm>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var issued: DateTime?
    @objc public dynamic var subType: CodeableConcept?
    public func upsert(subType: CodeableConcept?) {
        upsert(prop: &self.subType, val: subType)
    }
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var text: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    public let valuedItem = RealmSwift.List<ContractTermValuedItem>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case actionReason = "actionReason"
        case actor = "actor"
        case applies = "applies"
        case group = "group"
        case identifier = "identifier"
        case issued = "issued"
        case subType = "subType"
        case subject = "subject"
        case text = "text"
        case type = "type"
        case valuedItem = "valuedItem"
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

        self.action.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .action) ?? [])
        self.actionReason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .actionReason) ?? [])
        self.actor.append(objectsIn: try container.decodeIfPresent([ContractTermActor].self, forKey: .actor) ?? [])
        self.applies = try container.decodeIfPresent(Period.self, forKey: .applies)
        self.group.append(objectsIn: try container.decodeIfPresent([ContractTerm].self, forKey: .group) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.issued = try container.decodeIfPresent(DateTime.self, forKey: .issued)
        self.subType = try container.decodeIfPresent(CodeableConcept.self, forKey: .subType)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.valuedItem.append(objectsIn: try container.decodeIfPresent([ContractTermValuedItem].self, forKey: .valuedItem) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.action), forKey: .action)
        try container.encode(Array(self.actionReason), forKey: .actionReason)
        try container.encode(Array(self.actor), forKey: .actor)
        try container.encodeIfPresent(self.applies, forKey: .applies)
        try container.encode(Array(self.group), forKey: .group)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.issued, forKey: .issued)
        try container.encodeIfPresent(self.subType, forKey: .subType)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encode(Array(self.valuedItem), forKey: .valuedItem)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.action) }
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["actionReason"] {
				presentKeys.insert("actionReason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.actionReason) }
						self.actionReason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "actionReason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["actor"] {
				presentKeys.insert("actor")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractTermActor.instantiate(fromArray: val, owner: self) as? [ContractTermActor] {
						if let realm = self.realm { realm.delete(self.actor) }
						self.actor.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "actor", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["applies"] {
				presentKeys.insert("applies")
				if let val = exist as? FHIRJSON {
					upsert(applies: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "applies", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractTerm.instantiate(fromArray: val, owner: self) as? [ContractTerm] {
						if let realm = self.realm { realm.delete(self.group) }
						self.group.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["issued"] {
				presentKeys.insert("issued")
				if let val = exist as? String {
					self.issued = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "issued", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["subType"] {
				presentKeys.insert("subType")
				if let val = exist as? FHIRJSON {
					upsert(subType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subType", wants: FHIRJSON.self, has: type(of: exist)))
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
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valuedItem"] {
				presentKeys.insert("valuedItem")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContractTermValuedItem.instantiate(fromArray: val, owner: self) as? [ContractTermValuedItem] {
						if let realm = self.realm { realm.delete(self.valuedItem) }
						self.valuedItem.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "valuedItem", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		if actionReason.count > 0 {
			json["actionReason"] = Array(actionReason.map() { $0.asJSON() })
		}
		if actor.count > 0 {
			json["actor"] = Array(actor.map() { $0.asJSON() })
		}
		if let applies = self.applies {
			json["applies"] = applies.asJSON()
		}
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let issued = self.issued {
			json["issued"] = issued.asJSON()
		}
		if let subType = self.subType {
			json["subType"] = subType.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if valuedItem.count > 0 {
			json["valuedItem"] = Array(valuedItem.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractTerm.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractTerm. Will return empty instance: \(error))")
		}
		return ContractTerm.init()
	}
}


/**
 *  Contract Term Actor List.
 *
 *  List of actors participating in this Contract Provision.
 */
open class ContractTermActor: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractTermActor" }
	}

    @objc public dynamic var entity: Reference?
    public func upsert(entity: Reference?) {
        upsert(prop: &self.entity, val: entity)
    }
    public let role = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(entity: Reference) {
        self.init()
        self.entity = entity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case entity = "entity"
        case role = "role"
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

        self.entity = try container.decodeIfPresent(Reference.self, forKey: .entity)
        self.role.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .role) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.entity, forKey: .entity)
        try container.encode(Array(self.role), forKey: .role)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["entity"] {
				presentKeys.insert("entity")
				if let val = exist as? FHIRJSON {
					upsert(entity: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "entity"))
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.role) }
						self.role.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let entity = self.entity {
			json["entity"] = entity.asJSON()
		}
		if role.count > 0 {
			json["role"] = Array(role.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractTermActor.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractTermActor. Will return empty instance: \(error))")
		}
		return ContractTermActor.init()
	}
}


/**
 *  Contract Term Valued Item.
 *
 *  Contract Provision Valued Item List.
 */
open class ContractTermValuedItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractTermValuedItem" }
	}

    @objc public dynamic var effectiveTime: DateTime?
    @objc public dynamic var entityCodeableConcept: CodeableConcept?
    public func upsert(entityCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.entityCodeableConcept, val: entityCodeableConcept)
    }
    @objc public dynamic var entityReference: Reference?
    public func upsert(entityReference: Reference?) {
        upsert(prop: &self.entityReference, val: entityReference)
    }
    @objc public dynamic var factor: RealmDecimal?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var net: Quantity?
    public func upsert(net: Quantity?) {
        upsert(prop: &self.net, val: net)
    }
    @objc public dynamic var points: RealmDecimal?
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    @objc public dynamic var unitPrice: Quantity?
    public func upsert(unitPrice: Quantity?) {
        upsert(prop: &self.unitPrice, val: unitPrice)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case effectiveTime = "effectiveTime"
        case entityCodeableConcept = "entityCodeableConcept"
        case entityReference = "entityReference"
        case factor = "factor"
        case identifier = "identifier"
        case net = "net"
        case points = "points"
        case quantity = "quantity"
        case unitPrice = "unitPrice"
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

        self.effectiveTime = try container.decodeIfPresent(DateTime.self, forKey: .effectiveTime)
        self.entityCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .entityCodeableConcept)
        self.entityReference = try container.decodeIfPresent(Reference.self, forKey: .entityReference)
        self.factor = try container.decodeIfPresent(RealmDecimal.self, forKey: .factor)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.net = try container.decodeIfPresent(Quantity.self, forKey: .net)
        self.points = try container.decodeIfPresent(RealmDecimal.self, forKey: .points)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.unitPrice = try container.decodeIfPresent(Quantity.self, forKey: .unitPrice)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.effectiveTime, forKey: .effectiveTime)
        try container.encodeIfPresent(self.entityCodeableConcept, forKey: .entityCodeableConcept)
        try container.encodeIfPresent(self.entityReference, forKey: .entityReference)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.net, forKey: .net)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["effectiveTime"] {
				presentKeys.insert("effectiveTime")
				if let val = exist as? String {
					self.effectiveTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "effectiveTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["entityCodeableConcept"] {
				presentKeys.insert("entityCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(entityCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entityCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["entityReference"] {
				presentKeys.insert("entityReference")
				if let val = exist as? FHIRJSON {
					upsert(entityReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entityReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["factor"] {
				presentKeys.insert("factor")
				if let val = exist as? NSNumber {
					self.factor = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "factor", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["net"] {
				presentKeys.insert("net")
				if let val = exist as? FHIRJSON {
					upsert(net: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "net", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["points"] {
				presentKeys.insert("points")
				if let val = exist as? NSNumber {
					self.points = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "points", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["unitPrice"] {
				presentKeys.insert("unitPrice")
				if let val = exist as? FHIRJSON {
					upsert(unitPrice: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unitPrice", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let effectiveTime = self.effectiveTime {
			json["effectiveTime"] = effectiveTime.asJSON()
		}
		if let entityCodeableConcept = self.entityCodeableConcept {
			json["entityCodeableConcept"] = entityCodeableConcept.asJSON()
		}
		if let entityReference = self.entityReference {
			json["entityReference"] = entityReference.asJSON()
		}
		if let factor = self.factor {
			json["factor"] = factor.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let net = self.net {
			json["net"] = net.asJSON()
		}
		if let points = self.points {
			json["points"] = points.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let unitPrice = self.unitPrice {
			json["unitPrice"] = unitPrice.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractTermValuedItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractTermValuedItem. Will return empty instance: \(error))")
		}
		return ContractTermValuedItem.init()
	}
}


/**
 *  Contract Valued Item.
 *
 *  Contract Valued Item List.
 */
open class ContractValuedItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ContractValuedItem" }
	}

    @objc public dynamic var effectiveTime: DateTime?
    @objc public dynamic var entityCodeableConcept: CodeableConcept?
    public func upsert(entityCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.entityCodeableConcept, val: entityCodeableConcept)
    }
    @objc public dynamic var entityReference: Reference?
    public func upsert(entityReference: Reference?) {
        upsert(prop: &self.entityReference, val: entityReference)
    }
    @objc public dynamic var factor: RealmDecimal?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var net: Quantity?
    public func upsert(net: Quantity?) {
        upsert(prop: &self.net, val: net)
    }
    @objc public dynamic var points: RealmDecimal?
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    @objc public dynamic var unitPrice: Quantity?
    public func upsert(unitPrice: Quantity?) {
        upsert(prop: &self.unitPrice, val: unitPrice)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case effectiveTime = "effectiveTime"
        case entityCodeableConcept = "entityCodeableConcept"
        case entityReference = "entityReference"
        case factor = "factor"
        case identifier = "identifier"
        case net = "net"
        case points = "points"
        case quantity = "quantity"
        case unitPrice = "unitPrice"
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

        self.effectiveTime = try container.decodeIfPresent(DateTime.self, forKey: .effectiveTime)
        self.entityCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .entityCodeableConcept)
        self.entityReference = try container.decodeIfPresent(Reference.self, forKey: .entityReference)
        self.factor = try container.decodeIfPresent(RealmDecimal.self, forKey: .factor)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.net = try container.decodeIfPresent(Quantity.self, forKey: .net)
        self.points = try container.decodeIfPresent(RealmDecimal.self, forKey: .points)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.unitPrice = try container.decodeIfPresent(Quantity.self, forKey: .unitPrice)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.effectiveTime, forKey: .effectiveTime)
        try container.encodeIfPresent(self.entityCodeableConcept, forKey: .entityCodeableConcept)
        try container.encodeIfPresent(self.entityReference, forKey: .entityReference)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.net, forKey: .net)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["effectiveTime"] {
				presentKeys.insert("effectiveTime")
				if let val = exist as? String {
					self.effectiveTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "effectiveTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["entityCodeableConcept"] {
				presentKeys.insert("entityCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(entityCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entityCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["entityReference"] {
				presentKeys.insert("entityReference")
				if let val = exist as? FHIRJSON {
					upsert(entityReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entityReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["factor"] {
				presentKeys.insert("factor")
				if let val = exist as? NSNumber {
					self.factor = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "factor", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["net"] {
				presentKeys.insert("net")
				if let val = exist as? FHIRJSON {
					upsert(net: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "net", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["points"] {
				presentKeys.insert("points")
				if let val = exist as? NSNumber {
					self.points = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "points", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["unitPrice"] {
				presentKeys.insert("unitPrice")
				if let val = exist as? FHIRJSON {
					upsert(unitPrice: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unitPrice", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let effectiveTime = self.effectiveTime {
			json["effectiveTime"] = effectiveTime.asJSON()
		}
		if let entityCodeableConcept = self.entityCodeableConcept {
			json["entityCodeableConcept"] = entityCodeableConcept.asJSON()
		}
		if let entityReference = self.entityReference {
			json["entityReference"] = entityReference.asJSON()
		}
		if let factor = self.factor {
			json["factor"] = factor.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let net = self.net {
			json["net"] = net.asJSON()
		}
		if let points = self.points {
			json["points"] = points.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let unitPrice = self.unitPrice {
			json["unitPrice"] = unitPrice.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContractValuedItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContractValuedItem. Will return empty instance: \(error))")
		}
		return ContractValuedItem.init()
	}
}

