//
//  Contract.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Contract) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Contract else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.action.enumerated() {
            guard index < self.action.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.action.append(val)
                continue
            }
            self.action[index].populate(from: t)
        }
    
        while self.action.count > o.action.count {
            let objectToRemove = self.action.last!
            self.action.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.actionReason.enumerated() {
            guard index < self.actionReason.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.actionReason.append(val)
                continue
            }
            self.actionReason[index].populate(from: t)
        }
    
        while self.actionReason.count > o.actionReason.count {
            let objectToRemove = self.actionReason.last!
            self.actionReason.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.actor.enumerated() {
            guard index < self.actor.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractActor()
                val.populate(from: t)
                self.actor.append(val)
                continue
            }
            self.actor[index].populate(from: t)
        }
    
        while self.actor.count > o.actor.count {
            let objectToRemove = self.actor.last!
            self.actor.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.applies, from: o.applies)

        for (index, t) in o.authority.enumerated() {
            guard index < self.authority.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.authority.append(val)
                continue
            }
            self.authority[index].populate(from: t)
        }
    
        while self.authority.count > o.authority.count {
            let objectToRemove = self.authority.last!
            self.authority.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.bindingAttachment, from: o.bindingAttachment)
        FireKit.populate(&self.bindingReference, from: o.bindingReference)

        for (index, t) in o.domain.enumerated() {
            guard index < self.domain.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.domain.append(val)
                continue
            }
            self.domain[index].populate(from: t)
        }
    
        while self.domain.count > o.domain.count {
            let objectToRemove = self.domain.last!
            self.domain.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.friendly.enumerated() {
            guard index < self.friendly.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractFriendly()
                val.populate(from: t)
                self.friendly.append(val)
                continue
            }
            self.friendly[index].populate(from: t)
        }
    
        while self.friendly.count > o.friendly.count {
            let objectToRemove = self.friendly.last!
            self.friendly.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.issued, from: o.issued)

        for (index, t) in o.legal.enumerated() {
            guard index < self.legal.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractLegal()
                val.populate(from: t)
                self.legal.append(val)
                continue
            }
            self.legal[index].populate(from: t)
        }
    
        while self.legal.count > o.legal.count {
            let objectToRemove = self.legal.last!
            self.legal.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.rule.enumerated() {
            guard index < self.rule.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractRule()
                val.populate(from: t)
                self.rule.append(val)
                continue
            }
            self.rule[index].populate(from: t)
        }
    
        while self.rule.count > o.rule.count {
            let objectToRemove = self.rule.last!
            self.rule.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.signer.enumerated() {
            guard index < self.signer.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractSigner()
                val.populate(from: t)
                self.signer.append(val)
                continue
            }
            self.signer[index].populate(from: t)
        }
    
        while self.signer.count > o.signer.count {
            let objectToRemove = self.signer.last!
            self.signer.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.subType.enumerated() {
            guard index < self.subType.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.subType.append(val)
                continue
            }
            self.subType[index].populate(from: t)
        }
    
        while self.subType.count > o.subType.count {
            let objectToRemove = self.subType.last!
            self.subType.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.subject.enumerated() {
            guard index < self.subject.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.subject.append(val)
                continue
            }
            self.subject[index].populate(from: t)
        }
    
        while self.subject.count > o.subject.count {
            let objectToRemove = self.subject.last!
            self.subject.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.term.enumerated() {
            guard index < self.term.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractTerm()
                val.populate(from: t)
                self.term.append(val)
                continue
            }
            self.term[index].populate(from: t)
        }
    
        while self.term.count > o.term.count {
            let objectToRemove = self.term.last!
            self.term.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.type, from: o.type)

        for (index, t) in o.valuedItem.enumerated() {
            guard index < self.valuedItem.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractValuedItem()
                val.populate(from: t)
                self.valuedItem.append(val)
                continue
            }
            self.valuedItem[index].populate(from: t)
        }
    
        while self.valuedItem.count > o.valuedItem.count {
            let objectToRemove = self.valuedItem.last!
            self.valuedItem.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractActor else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.entity, from: o.entity)

        for (index, t) in o.role.enumerated() {
            guard index < self.role.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.role.append(val)
                continue
            }
            self.role[index].populate(from: t)
        }
    
        while self.role.count > o.role.count {
            let objectToRemove = self.role.last!
            self.role.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractFriendly else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.contentAttachment, from: o.contentAttachment)
        FireKit.populate(&self.contentReference, from: o.contentReference)
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractLegal else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.contentAttachment, from: o.contentAttachment)
        FireKit.populate(&self.contentReference, from: o.contentReference)
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractRule else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.contentAttachment, from: o.contentAttachment)
        FireKit.populate(&self.contentReference, from: o.contentReference)
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractSigner else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.party, from: o.party)
        signature = o.signature
        FireKit.populate(&self.type, from: o.type)
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractTerm else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.action.enumerated() {
            guard index < self.action.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.action.append(val)
                continue
            }
            self.action[index].populate(from: t)
        }
    
        while self.action.count > o.action.count {
            let objectToRemove = self.action.last!
            self.action.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.actionReason.enumerated() {
            guard index < self.actionReason.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.actionReason.append(val)
                continue
            }
            self.actionReason[index].populate(from: t)
        }
    
        while self.actionReason.count > o.actionReason.count {
            let objectToRemove = self.actionReason.last!
            self.actionReason.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.actor.enumerated() {
            guard index < self.actor.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractTermActor()
                val.populate(from: t)
                self.actor.append(val)
                continue
            }
            self.actor[index].populate(from: t)
        }
    
        while self.actor.count > o.actor.count {
            let objectToRemove = self.actor.last!
            self.actor.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.applies, from: o.applies)

        for (index, t) in o.group.enumerated() {
            guard index < self.group.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractTerm()
                val.populate(from: t)
                self.group.append(val)
                continue
            }
            self.group[index].populate(from: t)
        }
    
        while self.group.count > o.group.count {
            let objectToRemove = self.group.last!
            self.group.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.issued, from: o.issued)
        FireKit.populate(&self.subType, from: o.subType)
        FireKit.populate(&self.subject, from: o.subject)
        text = o.text
        FireKit.populate(&self.type, from: o.type)

        for (index, t) in o.valuedItem.enumerated() {
            guard index < self.valuedItem.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContractTermValuedItem()
                val.populate(from: t)
                self.valuedItem.append(val)
                continue
            }
            self.valuedItem[index].populate(from: t)
        }
    
        while self.valuedItem.count > o.valuedItem.count {
            let objectToRemove = self.valuedItem.last!
            self.valuedItem.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractTermActor else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.entity, from: o.entity)

        for (index, t) in o.role.enumerated() {
            guard index < self.role.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.role.append(val)
                continue
            }
            self.role[index].populate(from: t)
        }
    
        while self.role.count > o.role.count {
            let objectToRemove = self.role.last!
            self.role.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractTermValuedItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.effectiveTime, from: o.effectiveTime)
        FireKit.populate(&self.entityCodeableConcept, from: o.entityCodeableConcept)
        FireKit.populate(&self.entityReference, from: o.entityReference)
        factor = o.factor
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.net, from: o.net)
        points = o.points
        FireKit.populate(&self.quantity, from: o.quantity)
        FireKit.populate(&self.unitPrice, from: o.unitPrice)
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

    public override func populate(from other: Any) {
        guard let o = other as? ContractValuedItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.effectiveTime, from: o.effectiveTime)
        FireKit.populate(&self.entityCodeableConcept, from: o.entityCodeableConcept)
        FireKit.populate(&self.entityReference, from: o.entityReference)
        factor = o.factor
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.net, from: o.net)
        points = o.points
        FireKit.populate(&self.quantity, from: o.quantity)
        FireKit.populate(&self.unitPrice, from: o.unitPrice)
    }
}

