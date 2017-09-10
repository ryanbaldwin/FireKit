//
//  AuditEvent.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AuditEvent) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Event record kept for security purposes.
 *
 *  A record of an event made for purposes of maintaining a security log. Typical uses include detection of intrusion
 *  attempts and monitoring for inappropriate usage.
 */
open class AuditEvent: DomainResource {
	override open class var resourceType: String {
		get { return "AuditEvent" }
	}

    @objc public dynamic var event: AuditEventEvent?
    public func upsert(event: AuditEventEvent?) {
        upsert(prop: &self.event, val: event)
    }
    public let object = RealmSwift.List<AuditEventObject>()
    public let participant = RealmSwift.List<AuditEventParticipant>()
    @objc public dynamic var source: AuditEventSource?
    public func upsert(source: AuditEventSource?) {
        upsert(prop: &self.source, val: source)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(event: AuditEventEvent, participant: [AuditEventParticipant], source: AuditEventSource) {
        self.init()
        self.event = event
        self.participant.append(objectsIn: participant)
        self.source = source
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case event = "event"
        case object = "object"
        case participant = "participant"
        case source = "source"
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

        self.event = try container.decodeIfPresent(AuditEventEvent.self, forKey: .event)
        self.object.append(objectsIn: try container.decodeIfPresent([AuditEventObject].self, forKey: .object) ?? [])
        self.participant.append(objectsIn: try container.decodeIfPresent([AuditEventParticipant].self, forKey: .participant) ?? [])
        self.source = try container.decodeIfPresent(AuditEventSource.self, forKey: .source)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.event, forKey: .event)
        try container.encode(self.object.flatMap { $0 }, forKey: .object)
        try container.encode(self.participant.flatMap { $0 }, forKey: .participant)
        try container.encodeIfPresent(self.source, forKey: .source)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? FHIRJSON {
					upsert(event: AuditEventEvent(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "event"))
			}
			if let exist = js["object"] {
				presentKeys.insert("object")
				if let val = exist as? [FHIRJSON] {
					if let vals = AuditEventObject.instantiate(fromArray: val, owner: self) as? [AuditEventObject] {
						if let realm = self.realm { realm.delete(self.object) }
						self.object.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "object", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["participant"] {
				presentKeys.insert("participant")
				if let val = exist as? [FHIRJSON] {
					if let vals = AuditEventParticipant.instantiate(fromArray: val, owner: self) as? [AuditEventParticipant] {
						if let realm = self.realm { realm.delete(self.participant) }
						self.participant.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "participant", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "participant"))
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: AuditEventSource(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "source"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let event = self.event {
			json["event"] = event.asJSON()
		}
		if object.count > 0 {
			json["object"] = Array(object.map() { $0.asJSON() })
		}
		if participant.count > 0 {
			json["participant"] = Array(participant.map() { $0.asJSON() })
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  What was done.
 *
 *  Identifies the name, action type, time, and disposition of the audited event.
 */
open class AuditEventEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventEvent" }
	}

    @objc public dynamic var action: String?
    @objc public dynamic var dateTime: Instant?
    @objc public dynamic var outcome: String?
    @objc public dynamic var outcomeDesc: String?
    public let purposeOfEvent = RealmSwift.List<Coding>()
    public let subtype = RealmSwift.List<Coding>()
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(dateTime: Instant, type: Coding) {
        self.init()
        self.dateTime = dateTime
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case dateTime = "dateTime"
        case outcome = "outcome"
        case outcomeDesc = "outcomeDesc"
        case purposeOfEvent = "purposeOfEvent"
        case subtype = "subtype"
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

        self.action = try container.decodeIfPresent(String.self, forKey: .action)
        self.dateTime = try container.decodeIfPresent(Instant.self, forKey: .dateTime)
        self.outcome = try container.decodeIfPresent(String.self, forKey: .outcome)
        self.outcomeDesc = try container.decodeIfPresent(String.self, forKey: .outcomeDesc)
        self.purposeOfEvent.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .purposeOfEvent) ?? [])
        self.subtype.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .subtype) ?? [])
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encodeIfPresent(self.dateTime, forKey: .dateTime)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.outcomeDesc, forKey: .outcomeDesc)
        try container.encode(self.purposeOfEvent.flatMap { $0 }, forKey: .purposeOfEvent)
        try container.encode(self.subtype.flatMap { $0 }, forKey: .subtype)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? String {
					self.action = val
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dateTime"] {
				presentKeys.insert("dateTime")
				if let val = exist as? String {
					self.dateTime = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateTime", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "dateTime"))
			}
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? String {
					self.outcome = val
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["outcomeDesc"] {
				presentKeys.insert("outcomeDesc")
				if let val = exist as? String {
					self.outcomeDesc = val
				}
				else {
					errors.append(FHIRJSONError(key: "outcomeDesc", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["purposeOfEvent"] {
				presentKeys.insert("purposeOfEvent")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.purposeOfEvent) }
						self.purposeOfEvent.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "purposeOfEvent", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subtype"] {
				presentKeys.insert("subtype")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.subtype) }
						self.subtype.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subtype", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
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
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let dateTime = self.dateTime {
			json["dateTime"] = dateTime.asJSON()
		}
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let outcomeDesc = self.outcomeDesc {
			json["outcomeDesc"] = outcomeDesc.asJSON()
		}
		if purposeOfEvent.count > 0 {
			json["purposeOfEvent"] = Array(purposeOfEvent.map() { $0.asJSON() })
		}
		if subtype.count > 0 {
			json["subtype"] = Array(subtype.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Specific instances of data or objects that have been accessed.
 */
open class AuditEventObject: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventObject" }
	}

    @objc public dynamic var description_fhir: String?
    public let detail = RealmSwift.List<AuditEventObjectDetail>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var lifecycle: Coding?
    public func upsert(lifecycle: Coding?) {
        upsert(prop: &self.lifecycle, val: lifecycle)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var query: Base64Binary?
    @objc public dynamic var reference: Reference?
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }
    @objc public dynamic var role: Coding?
    public func upsert(role: Coding?) {
        upsert(prop: &self.role, val: role)
    }
    public let securityLabel = RealmSwift.List<Coding>()
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case detail = "detail"
        case identifier = "identifier"
        case lifecycle = "lifecycle"
        case name = "name"
        case query = "query"
        case reference = "reference"
        case role = "role"
        case securityLabel = "securityLabel"
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

        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.detail.append(objectsIn: try container.decodeIfPresent([AuditEventObjectDetail].self, forKey: .detail) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.lifecycle = try container.decodeIfPresent(Coding.self, forKey: .lifecycle)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.query = try container.decodeIfPresent(Base64Binary.self, forKey: .query)
        self.reference = try container.decodeIfPresent(Reference.self, forKey: .reference)
        self.role = try container.decodeIfPresent(Coding.self, forKey: .role)
        self.securityLabel.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .securityLabel) ?? [])
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(self.detail.flatMap { $0 }, forKey: .detail)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.lifecycle, forKey: .lifecycle)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.query, forKey: .query)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encode(self.securityLabel.flatMap { $0 }, forKey: .securityLabel)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = AuditEventObjectDetail.instantiate(fromArray: val, owner: self) as? [AuditEventObjectDetail] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["lifecycle"] {
				presentKeys.insert("lifecycle")
				if let val = exist as? FHIRJSON {
					upsert(lifecycle: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "lifecycle", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["query"] {
				presentKeys.insert("query")
				if let val = exist as? String {
					self.query = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "query", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? FHIRJSON {
					upsert(reference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? FHIRJSON {
					upsert(role: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["securityLabel"] {
				presentKeys.insert("securityLabel")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.securityLabel) }
						self.securityLabel.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "securityLabel", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let lifecycle = self.lifecycle {
			json["lifecycle"] = lifecycle.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let query = self.query {
			json["query"] = query.asJSON()
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		if securityLabel.count > 0 {
			json["securityLabel"] = Array(securityLabel.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Additional Information about the Object.
 */
open class AuditEventObjectDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventObjectDetail" }
	}

    @objc public dynamic var type: String?
    @objc public dynamic var value: Base64Binary?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String, val: Base64Binary) {
        self.init()
        self.type = type
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
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

        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.value = try container.decodeIfPresent(Base64Binary.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.value, forKey: .value)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "value"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  A person, a hardware device or software process.
 */
open class AuditEventParticipant: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventParticipant" }
	}

    @objc public dynamic var altId: String?
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var media: Coding?
    public func upsert(media: Coding?) {
        upsert(prop: &self.media, val: media)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var network: AuditEventParticipantNetwork?
    public func upsert(network: AuditEventParticipantNetwork?) {
        upsert(prop: &self.network, val: network)
    }
    public let policy = RealmSwift.List<RealmString>()
    public let purposeOfUse = RealmSwift.List<Coding>()
    @objc public dynamic var reference: Reference?
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }
    public let requestor = RealmOptional<Bool>()
    public let role = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var userId: Identifier?
    public func upsert(userId: Identifier?) {
        upsert(prop: &self.userId, val: userId)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(requestor: Bool) {
        self.init()
        self.requestor.value = requestor
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case altId = "altId"
        case location = "location"
        case media = "media"
        case name = "name"
        case network = "network"
        case policy = "policy"
        case purposeOfUse = "purposeOfUse"
        case reference = "reference"
        case requestor = "requestor"
        case role = "role"
        case userId = "userId"
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

        self.altId = try container.decodeIfPresent(String.self, forKey: .altId)
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.media = try container.decodeIfPresent(Coding.self, forKey: .media)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.network = try container.decodeIfPresent(AuditEventParticipantNetwork.self, forKey: .network)
        self.policy.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .policy) ?? [])
        self.purposeOfUse.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .purposeOfUse) ?? [])
        self.reference = try container.decodeIfPresent(Reference.self, forKey: .reference)
        self.requestor.value = try container.decodeIfPresent(Bool.self, forKey: .requestor)
        self.role.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .role) ?? [])
        self.userId = try container.decodeIfPresent(Identifier.self, forKey: .userId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.altId, forKey: .altId)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.media, forKey: .media)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.network, forKey: .network)
        try container.encode(self.policy.flatMap { $0.value }, forKey: .policy)
        try container.encode(self.purposeOfUse.flatMap { $0 }, forKey: .purposeOfUse)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.requestor.value, forKey: .requestor)
        try container.encode(self.role.flatMap { $0 }, forKey: .role)
        try container.encodeIfPresent(self.userId, forKey: .userId)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["altId"] {
				presentKeys.insert("altId")
				if let val = exist as? String {
					self.altId = val
				}
				else {
					errors.append(FHIRJSONError(key: "altId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					upsert(location: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["media"] {
				presentKeys.insert("media")
				if let val = exist as? FHIRJSON {
					upsert(media: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "media", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["network"] {
				presentKeys.insert("network")
				if let val = exist as? FHIRJSON {
					upsert(network: AuditEventParticipantNetwork(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "network", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["policy"] {
				presentKeys.insert("policy")
				if let val = exist as? [String] {
					self.policy.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "policy", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["purposeOfUse"] {
				presentKeys.insert("purposeOfUse")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.purposeOfUse) }
						self.purposeOfUse.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "purposeOfUse", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? FHIRJSON {
					upsert(reference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestor"] {
				presentKeys.insert("requestor")
				if let val = exist as? Bool {
					self.requestor.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "requestor", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "requestor"))
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
			if let exist = js["userId"] {
				presentKeys.insert("userId")
				if let val = exist as? FHIRJSON {
					upsert(userId: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "userId", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let altId = self.altId {
			json["altId"] = altId.asJSON()
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let media = self.media {
			json["media"] = media.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let network = self.network {
			json["network"] = network.asJSON()
		}
		if policy.count > 0 {
			json["policy"] = Array(policy.map() { $0.value })
		}
		if purposeOfUse.count > 0 {
			json["purposeOfUse"] = Array(purposeOfUse.map() { $0.asJSON() })
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let requestor = self.requestor.value {
			json["requestor"] = requestor.asJSON()
		}
		if role.count > 0 {
			json["role"] = Array(role.map() { $0.asJSON() })
		}
		if let userId = self.userId {
			json["userId"] = userId.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Logical network location for application activity.
 *
 *  Logical network location for application activity, if the activity has a network location.
 */
open class AuditEventParticipantNetwork: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventParticipantNetwork" }
	}

    @objc public dynamic var address: String?
    @objc public dynamic var type: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
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

        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? String {
					self.address = val
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Application systems and processes.
 */
open class AuditEventSource: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventSource" }
	}

    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var site: String?
    public let type = RealmSwift.List<Coding>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: Identifier) {
        self.init()
        self.identifier = identifier
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "identifier"
        case site = "site"
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

        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.site = try container.decodeIfPresent(String.self, forKey: .site)
        self.type.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.site, forKey: .site)
        try container.encode(self.type.flatMap { $0 }, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identifier"))
			}
			if let exist = js["site"] {
				presentKeys.insert("site")
				if let val = exist as? String {
					self.site = val
				}
				else {
					errors.append(FHIRJSONError(key: "site", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let site = self.site {
			json["site"] = site.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}

