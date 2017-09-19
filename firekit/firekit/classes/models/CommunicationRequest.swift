//
//  CommunicationRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/CommunicationRequest) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A request for information to be sent to a receiver.
 *
 *  A request to convey information; e.g. the CDS system proposes that an alert be sent to a responsible provider, the
 *  CDS system proposes that the public health agency be notified about a reportable condition.
 */
open class CommunicationRequest: DomainResource {
	override open class var resourceType: String {
		get { return "CommunicationRequest" }
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
    public let payload = RealmSwift.List<CommunicationRequestPayload>()
    @objc public dynamic var priority: CodeableConcept?
    public func upsert(priority: CodeableConcept?) {
        upsert(prop: &self.priority, val: priority)
    }
    public let reason = RealmSwift.List<CodeableConcept>()
    public let recipient = RealmSwift.List<Reference>()
    @objc public dynamic var requestedOn: DateTime?
    @objc public dynamic var requester: Reference?
    public func upsert(requester: Reference?) {
        upsert(prop: &self.requester, val: requester)
    }
    @objc public dynamic var scheduledDateTime: DateTime?
    @objc public dynamic var scheduledPeriod: Period?
    public func upsert(scheduledPeriod: Period?) {
        upsert(prop: &self.scheduledPeriod, val: scheduledPeriod)
    }
    @objc public dynamic var sender: Reference?
    public func upsert(sender: Reference?) {
        upsert(prop: &self.sender, val: sender)
    }
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
        case priority = "priority"
        case reason = "reason"
        case recipient = "recipient"
        case requestedOn = "requestedOn"
        case requester = "requester"
        case scheduledDateTime = "scheduledDateTime"
        case scheduledPeriod = "scheduledPeriod"
        case sender = "sender"
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
        self.payload.append(objectsIn: try container.decodeIfPresent([CommunicationRequestPayload].self, forKey: .payload) ?? [])
        self.priority = try container.decodeIfPresent(CodeableConcept.self, forKey: .priority)
        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.recipient.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .recipient) ?? [])
        self.requestedOn = try container.decodeIfPresent(DateTime.self, forKey: .requestedOn)
        self.requester = try container.decodeIfPresent(Reference.self, forKey: .requester)
        self.scheduledDateTime = try container.decodeIfPresent(DateTime.self, forKey: .scheduledDateTime)
        self.scheduledPeriod = try container.decodeIfPresent(Period.self, forKey: .scheduledPeriod)
        self.sender = try container.decodeIfPresent(Reference.self, forKey: .sender)
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
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encode(Array(self.recipient), forKey: .recipient)
        try container.encodeIfPresent(self.requestedOn, forKey: .requestedOn)
        try container.encodeIfPresent(self.requester, forKey: .requester)
        try container.encodeIfPresent(self.scheduledDateTime, forKey: .scheduledDateTime)
        try container.encodeIfPresent(self.scheduledPeriod, forKey: .scheduledPeriod)
        try container.encodeIfPresent(self.sender, forKey: .sender)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CommunicationRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CommunicationRequest. Will return empty instance: \(error))")
		}
		return CommunicationRequest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? CommunicationRequest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.encounter, from: o.encounter)
        // TODO: identifier array
        // TODO: medium array
        // TODO: payload array
        FireKit.populate(&self.priority, from: o.priority)
        // TODO: reason array
        // TODO: recipient array
        requestedOn = o.requestedOn
        FireKit.populate(&self.requester, from: o.requester)
        scheduledDateTime = o.scheduledDateTime
        FireKit.populate(&self.scheduledPeriod, from: o.scheduledPeriod)
        FireKit.populate(&self.sender, from: o.sender)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
    }
}


/**
 *  Message payload.
 *
 *  Text, attachment(s), or resource(s) to be communicated to the recipient.
 */
open class CommunicationRequestPayload: BackboneElement {
	override open class var resourceType: String {
		get { return "CommunicationRequestPayload" }
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
			let clone = try JSONDecoder().decode(CommunicationRequestPayload.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CommunicationRequestPayload. Will return empty instance: \(error))")
		}
		return CommunicationRequestPayload.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? CommunicationRequestPayload else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.contentAttachment, from: o.contentAttachment)
        FireKit.populate(&self.contentReference, from: o.contentReference)
        contentString = o.contentString
    }
}

