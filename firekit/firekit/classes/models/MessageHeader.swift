//
//  MessageHeader.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MessageHeader) on 2017-09-11.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					upsert(author: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["data"] {
				presentKeys.insert("data")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.data) }
						self.data.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "data", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? [FHIRJSON] {
					if let vals = MessageHeaderDestination.instantiate(fromArray: val, owner: self) as? [MessageHeaderDestination] {
						if let realm = self.realm { realm.delete(self.destination) }
						self.destination.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["enterer"] {
				presentKeys.insert("enterer")
				if let val = exist as? FHIRJSON {
					upsert(enterer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "enterer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? FHIRJSON {
					upsert(event: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "event"))
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? FHIRJSON {
					upsert(reason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["receiver"] {
				presentKeys.insert("receiver")
				if let val = exist as? FHIRJSON {
					upsert(receiver: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "receiver", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? FHIRJSON {
					upsert(response: MessageHeaderResponse(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["responsible"] {
				presentKeys.insert("responsible")
				if let val = exist as? FHIRJSON {
					upsert(responsible: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "responsible", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: MessageHeaderSource(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "source"))
			}
			if let exist = js["timestamp"] {
				presentKeys.insert("timestamp")
				if let val = exist as? String {
					self.timestamp = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "timestamp", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "timestamp"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if data.count > 0 {
			json["data"] = Array(data.map() { $0.asJSON() })
		}
		if destination.count > 0 {
			json["destination"] = Array(destination.map() { $0.asJSON() })
		}
		if let enterer = self.enterer {
			json["enterer"] = enterer.asJSON()
		}
		if let event = self.event {
			json["event"] = event.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if let receiver = self.receiver {
			json["receiver"] = receiver.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		if let responsible = self.responsible {
			json["responsible"] = responsible.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let timestamp = self.timestamp {
			json["timestamp"] = timestamp.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["endpoint"] {
				presentKeys.insert("endpoint")
				if let val = exist as? String {
					self.endpoint = val
				}
				else {
					errors.append(FHIRJSONError(key: "endpoint", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "endpoint"))
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
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					upsert(target: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let endpoint = self.endpoint {
			json["endpoint"] = endpoint.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? String {
					self.code = val
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["details"] {
				presentKeys.insert("details")
				if let val = exist as? FHIRJSON {
					upsert(details: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "details", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? String {
					self.identifier = val
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identifier"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let details = self.details {
			json["details"] = details.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? FHIRJSON {
					upsert(contact: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["endpoint"] {
				presentKeys.insert("endpoint")
				if let val = exist as? String {
					self.endpoint = val
				}
				else {
					errors.append(FHIRJSONError(key: "endpoint", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "endpoint"))
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
			if let exist = js["software"] {
				presentKeys.insert("software")
				if let val = exist as? String {
					self.software = val
				}
				else {
					errors.append(FHIRJSONError(key: "software", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["version"] {
				presentKeys.insert("version")
				if let val = exist as? String {
					self.version = val
				}
				else {
					errors.append(FHIRJSONError(key: "version", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contact = self.contact {
			json["contact"] = contact.asJSON()
		}
		if let endpoint = self.endpoint {
			json["endpoint"] = endpoint.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let software = self.software {
			json["software"] = software.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
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
}

