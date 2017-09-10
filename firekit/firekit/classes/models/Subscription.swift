//
//  Subscription.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Subscription) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A server push subscription criteria.
 *
 *  The subscription resource is used to define a push based subscription from a server to another system. Once a
 *  subscription is registered with the server, the server checks every resource that is created or updated, and if the
 *  resource matches the given criteria, it sends a message on the defined "channel" so that another system is able to
 *  take an appropriate action.
 */
open class Subscription: DomainResource {
	override open class var resourceType: String {
		get { return "Subscription" }
	}

    @objc public dynamic var channel: SubscriptionChannel?
    public func upsert(channel: SubscriptionChannel?) {
        upsert(prop: &self.channel, val: channel)
    }
    public let contact = RealmSwift.List<ContactPoint>()
    @objc public dynamic var criteria: String?
    @objc public dynamic var end: Instant?
    @objc public dynamic var error: String?
    @objc public dynamic var reason: String?
    @objc public dynamic var status: String?
    public let tag = RealmSwift.List<Coding>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(channel: SubscriptionChannel, criteria: String, reason: String, status: String) {
        self.init()
        self.channel = channel
        self.criteria = criteria
        self.reason = reason
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case channel = "channel"
        case contact = "contact"
        case criteria = "criteria"
        case end = "end"
        case error = "error"
        case reason = "reason"
        case status = "status"
        case tag = "tag"
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

        self.channel = try container.decodeIfPresent(SubscriptionChannel.self, forKey: .channel)
        self.contact.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .contact) ?? [])
        self.criteria = try container.decodeIfPresent(String.self, forKey: .criteria)
        self.end = try container.decodeIfPresent(Instant.self, forKey: .end)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.tag.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .tag) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.channel, forKey: .channel)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encodeIfPresent(self.criteria, forKey: .criteria)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(self.tag.flatMap { $0 }, forKey: .tag)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["channel"] {
				presentKeys.insert("channel")
				if let val = exist as? FHIRJSON {
					upsert(channel: SubscriptionChannel(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "channel", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "channel"))
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["criteria"] {
				presentKeys.insert("criteria")
				if let val = exist as? String {
					self.criteria = val
				}
				else {
					errors.append(FHIRJSONError(key: "criteria", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "criteria"))
			}
			if let exist = js["end"] {
				presentKeys.insert("end")
				if let val = exist as? String {
					self.end = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "end", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["error"] {
				presentKeys.insert("error")
				if let val = exist as? String {
					self.error = val
				}
				else {
					errors.append(FHIRJSONError(key: "error", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? String {
					self.reason = val
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "reason"))
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
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["tag"] {
				presentKeys.insert("tag")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.tag) }
						self.tag.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "tag", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let channel = self.channel {
			json["channel"] = channel.asJSON()
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let criteria = self.criteria {
			json["criteria"] = criteria.asJSON()
		}
		if let end = self.end {
			json["end"] = end.asJSON()
		}
		if let error = self.error {
			json["error"] = error.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if tag.count > 0 {
			json["tag"] = Array(tag.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Subscription.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Subscription. Will return empty instance: \(error))")
		}
		return Subscription.init()
	}
}


/**
 *  The channel on which to report matches to the criteria.
 *
 *  Details where to send notifications when resources are received that meet the criteria.
 */
open class SubscriptionChannel: BackboneElement {
	override open class var resourceType: String {
		get { return "SubscriptionChannel" }
	}

    @objc public dynamic var endpoint: String?
    @objc public dynamic var header: String?
    @objc public dynamic var payload: String?
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(payload: String, type: String) {
        self.init()
        self.payload = payload
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case endpoint = "endpoint"
        case header = "header"
        case payload = "payload"
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

        self.endpoint = try container.decodeIfPresent(String.self, forKey: .endpoint)
        self.header = try container.decodeIfPresent(String.self, forKey: .header)
        self.payload = try container.decodeIfPresent(String.self, forKey: .payload)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.endpoint, forKey: .endpoint)
        try container.encodeIfPresent(self.header, forKey: .header)
        try container.encodeIfPresent(self.payload, forKey: .payload)
        try container.encodeIfPresent(self.type, forKey: .type)
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
			if let exist = js["header"] {
				presentKeys.insert("header")
				if let val = exist as? String {
					self.header = val
				}
				else {
					errors.append(FHIRJSONError(key: "header", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["payload"] {
				presentKeys.insert("payload")
				if let val = exist as? String {
					self.payload = val
				}
				else {
					errors.append(FHIRJSONError(key: "payload", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "payload"))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let endpoint = self.endpoint {
			json["endpoint"] = endpoint.asJSON()
		}
		if let header = self.header {
			json["header"] = header.asJSON()
		}
		if let payload = self.payload {
			json["payload"] = payload.asJSON()
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
			let clone = try JSONDecoder().decode(SubscriptionChannel.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SubscriptionChannel. Will return empty instance: \(error))")
		}
		return SubscriptionChannel.init()
	}
}

