//
//  Communication.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Communication) on 2017-11-07.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-07
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A record of information transmitted from a sender to a receiver.
 *
 *  An occurrence of information being transmitted; e.g. an alert that was sent to a responsible provider, a public
 *  health agency was notified about a reportable condition.
 */
open class Communication: DomainResource {
	override open class var resourceType: String {
		get { return "Communication" }
	}

    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let medium = RealmSwift.List<CodeableConcept>()
    public let payload = RealmSwift.List<CommunicationPayload>()
    public let reason = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var received: DateTime?
    public let recipient = RealmSwift.List<Reference>()
    @objc public dynamic var requestDetail: Reference?
    public func upsert(requestDetail: Reference?) {
        upsert(prop: &self.requestDetail, val: requestDetail)
    }
    @objc public dynamic var sender: Reference?
    public func upsert(sender: Reference?) {
        upsert(prop: &self.sender, val: sender)
    }
    @objc public dynamic var sent: DateTime?
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case encounter = "encounter"
        case identifier = "identifier"
        case medium = "medium"
        case payload = "payload"
        case reason = "reason"
        case received = "received"
        case recipient = "recipient"
        case requestDetail = "requestDetail"
        case sender = "sender"
        case sent = "sent"
        case status = "status"
        case subject = "subject"
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

        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.medium.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .medium) ?? [])
        self.payload.append(objectsIn: try container.decodeIfPresent([CommunicationPayload].self, forKey: .payload) ?? [])
        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.received = try container.decodeIfPresent(DateTime.self, forKey: .received)
        self.recipient.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .recipient) ?? [])
        self.requestDetail = try container.decodeIfPresent(Reference.self, forKey: .requestDetail)
        self.sender = try container.decodeIfPresent(Reference.self, forKey: .sender)
        self.sent = try container.decodeIfPresent(DateTime.self, forKey: .sent)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.medium), forKey: .medium)
        try container.encode(Array(self.payload), forKey: .payload)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encodeIfPresent(self.received, forKey: .received)
        try container.encode(Array(self.recipient), forKey: .recipient)
        try container.encodeIfPresent(self.requestDetail, forKey: .requestDetail)
        try container.encodeIfPresent(self.sender, forKey: .sender)
        try container.encodeIfPresent(self.sent, forKey: .sent)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Communication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Communication. Will return empty instance: \(error))")
		}
		return Communication.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Communication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Identifier()
                val.populate(from: t)
                self.identifier.append(val)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.medium.enumerated() {
            guard index < self.medium.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.medium.append(val)
                continue
            }
            self.medium[index].populate(from: t)
        }
    
        while self.medium.count > o.medium.count {
            let objectToRemove = self.medium.last!
            self.medium.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.payload.enumerated() {
            guard index < self.payload.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CommunicationPayload()
                val.populate(from: t)
                self.payload.append(val)
                continue
            }
            self.payload[index].populate(from: t)
        }
    
        while self.payload.count > o.payload.count {
            let objectToRemove = self.payload.last!
            self.payload.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.reason.enumerated() {
            guard index < self.reason.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.reason.append(val)
                continue
            }
            self.reason[index].populate(from: t)
        }
    
        while self.reason.count > o.reason.count {
            let objectToRemove = self.reason.last!
            self.reason.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.received, from: o.received)

        for (index, t) in o.recipient.enumerated() {
            guard index < self.recipient.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.recipient.append(val)
                continue
            }
            self.recipient[index].populate(from: t)
        }
    
        while self.recipient.count > o.recipient.count {
            let objectToRemove = self.recipient.last!
            self.recipient.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.requestDetail, from: o.requestDetail)
        FireKit.populate(&self.sender, from: o.sender)
        FireKit.populate(&self.sent, from: o.sent)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
    }
}


/**
 *  Message payload.
 *
 *  Text, attachment(s), or resource(s) that was communicated to the recipient.
 */
open class CommunicationPayload: BackboneElement {
	override open class var resourceType: String {
		get { return "CommunicationPayload" }
	}

    @objc public dynamic var contentAttachment: Attachment?
    public func upsert(contentAttachment: Attachment?) {
        upsert(prop: &self.contentAttachment, val: contentAttachment)
    }
    @objc public dynamic var contentReference: Reference?
    public func upsert(contentReference: Reference?) {
        upsert(prop: &self.contentReference, val: contentReference)
    }
    @objc public dynamic var contentString: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(contentAttachment: Attachment, contentReference: Reference, contentString: String) {
        self.init()
        self.contentAttachment = contentAttachment
        self.contentReference = contentReference
        self.contentString = contentString
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contentAttachment = "contentAttachment"
        case contentReference = "contentReference"
        case contentString = "contentString"
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
        self.contentString = try container.decodeIfPresent(String.self, forKey: .contentString)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.contentAttachment, forKey: .contentAttachment)
        try container.encodeIfPresent(self.contentReference, forKey: .contentReference)
        try container.encodeIfPresent(self.contentString, forKey: .contentString)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CommunicationPayload.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CommunicationPayload. Will return empty instance: \(error))")
		}
		return CommunicationPayload.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? CommunicationPayload else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.contentAttachment, from: o.contentAttachment)
        FireKit.populate(&self.contentReference, from: o.contentReference)
        contentString = o.contentString
    }
}

