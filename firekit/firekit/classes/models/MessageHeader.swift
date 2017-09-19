//
//  MessageHeader.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MessageHeader) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A resource that describes a message that is exchanged between systems.
 *
 *  The header for a message exchange that is either requesting or responding to an action.  The reference(s) that are
 *  the subject of the action as well as other information related to the action are typically transmitted in a bundle
 *  in which the MessageHeader resource instance is the first resource in the bundle.
 */
open class MessageHeader: DomainResource {
	override open class var resourceType: String {
		get { return "MessageHeader" }
	}

    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    public let data = RealmSwift.List<Reference>()
    public let destination = RealmSwift.List<MessageHeaderDestination>()
    @objc public dynamic var enterer: Reference?
    public func upsert(enterer: Reference?) {
        upsert(prop: &self.enterer, val: enterer)
    }
    @objc public dynamic var event: Coding?
    public func upsert(event: Coding?) {
        upsert(prop: &self.event, val: event)
    }
    @objc public dynamic var reason: CodeableConcept?
    public func upsert(reason: CodeableConcept?) {
        upsert(prop: &self.reason, val: reason)
    }
    @objc public dynamic var receiver: Reference?
    public func upsert(receiver: Reference?) {
        upsert(prop: &self.receiver, val: receiver)
    }
    @objc public dynamic var response: MessageHeaderResponse?
    public func upsert(response: MessageHeaderResponse?) {
        upsert(prop: &self.response, val: response)
    }
    @objc public dynamic var responsible: Reference?
    public func upsert(responsible: Reference?) {
        upsert(prop: &self.responsible, val: responsible)
    }
    @objc public dynamic var source: MessageHeaderSource?
    public func upsert(source: MessageHeaderSource?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var timestamp: Instant?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(event: Coding, source: MessageHeaderSource, timestamp: Instant) {
        self.init()
        self.event = event
        self.source = source
        self.timestamp = timestamp
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case data = "data"
        case destination = "destination"
        case enterer = "enterer"
        case event = "event"
        case reason = "reason"
        case receiver = "receiver"
        case response = "response"
        case responsible = "responsible"
        case source = "source"
        case timestamp = "timestamp"
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

        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.data.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .data) ?? [])
        self.destination.append(objectsIn: try container.decodeIfPresent([MessageHeaderDestination].self, forKey: .destination) ?? [])
        self.enterer = try container.decodeIfPresent(Reference.self, forKey: .enterer)
        self.event = try container.decodeIfPresent(Coding.self, forKey: .event)
        self.reason = try container.decodeIfPresent(CodeableConcept.self, forKey: .reason)
        self.receiver = try container.decodeIfPresent(Reference.self, forKey: .receiver)
        self.response = try container.decodeIfPresent(MessageHeaderResponse.self, forKey: .response)
        self.responsible = try container.decodeIfPresent(Reference.self, forKey: .responsible)
        self.source = try container.decodeIfPresent(MessageHeaderSource.self, forKey: .source)
        self.timestamp = try container.decodeIfPresent(Instant.self, forKey: .timestamp)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encode(Array(self.data), forKey: .data)
        try container.encode(Array(self.destination), forKey: .destination)
        try container.encodeIfPresent(self.enterer, forKey: .enterer)
        try container.encodeIfPresent(self.event, forKey: .event)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.receiver, forKey: .receiver)
        try container.encodeIfPresent(self.response, forKey: .response)
        try container.encodeIfPresent(self.responsible, forKey: .responsible)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MessageHeader.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MessageHeader. Will return empty instance: \(error))")
		}
		return MessageHeader.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MessageHeader else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.author, from: o.author)
        // TODO: data array
        // TODO: destination array
        FireKit.populate(&self.enterer, from: o.enterer)
        FireKit.populate(&self.event, from: o.event)
        FireKit.populate(&self.reason, from: o.reason)
        FireKit.populate(&self.receiver, from: o.receiver)
        FireKit.populate(&self.response, from: o.response)
        FireKit.populate(&self.responsible, from: o.responsible)
        FireKit.populate(&self.source, from: o.source)
        timestamp = o.timestamp
    }
}


/**
 *  Message Destination Application(s).
 *
 *  The destination application which the message is intended for.
 */
open class MessageHeaderDestination: BackboneElement {
	override open class var resourceType: String {
		get { return "MessageHeaderDestination" }
	}

    @objc public dynamic var endpoint: String?
    @objc public dynamic var name: String?
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(endpoint: String) {
        self.init()
        self.endpoint = endpoint
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case endpoint = "endpoint"
        case name = "name"
        case target = "target"
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

        self.endpoint = try container.decodeIfPresent(String.self, forKey: .endpoint)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.endpoint, forKey: .endpoint)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.target, forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MessageHeaderDestination.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MessageHeaderDestination. Will return empty instance: \(error))")
		}
		return MessageHeaderDestination.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MessageHeaderDestination else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        endpoint = o.endpoint
        name = o.name
        FireKit.populate(&self.target, from: o.target)
    }
}


/**
 *  If this is a reply to prior message.
 *
 *  Information about the message that this message is a response to.  Only present if this message is a response.
 */
open class MessageHeaderResponse: BackboneElement {
	override open class var resourceType: String {
		get { return "MessageHeaderResponse" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var details: Reference?
    public func upsert(details: Reference?) {
        upsert(prop: &self.details, val: details)
    }
    @objc public dynamic var identifier: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, identifier: String) {
        self.init()
        self.code = code
        self.identifier = identifier
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case details = "details"
        case identifier = "identifier"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.details = try container.decodeIfPresent(Reference.self, forKey: .details)
        self.identifier = try container.decodeIfPresent(String.self, forKey: .identifier)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.details, forKey: .details)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MessageHeaderResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MessageHeaderResponse. Will return empty instance: \(error))")
		}
		return MessageHeaderResponse.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MessageHeaderResponse else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        code = o.code
        FireKit.populate(&self.details, from: o.details)
        identifier = o.identifier
    }
}


/**
 *  Message Source Application.
 *
 *  The source application from which this message originated.
 */
open class MessageHeaderSource: BackboneElement {
	override open class var resourceType: String {
		get { return "MessageHeaderSource" }
	}

    @objc public dynamic var contact: ContactPoint?
    public func upsert(contact: ContactPoint?) {
        upsert(prop: &self.contact, val: contact)
    }
    @objc public dynamic var endpoint: String?
    @objc public dynamic var name: String?
    @objc public dynamic var software: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(endpoint: String) {
        self.init()
        self.endpoint = endpoint
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case endpoint = "endpoint"
        case name = "name"
        case software = "software"
        case version = "version"
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

        self.contact = try container.decodeIfPresent(ContactPoint.self, forKey: .contact)
        self.endpoint = try container.decodeIfPresent(String.self, forKey: .endpoint)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.software = try container.decodeIfPresent(String.self, forKey: .software)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.contact, forKey: .contact)
        try container.encodeIfPresent(self.endpoint, forKey: .endpoint)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.software, forKey: .software)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MessageHeaderSource.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MessageHeaderSource. Will return empty instance: \(error))")
		}
		return MessageHeaderSource.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MessageHeaderSource else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.contact, from: o.contact)
        endpoint = o.endpoint
        name = o.name
        software = o.software
        version = o.version
    }
}

