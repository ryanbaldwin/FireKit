//
//  Subscription.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Subscription) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.criteria, forKey: .criteria)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.tag), forKey: .tag)
    }

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

    public override func populate(from other: Any) {
        guard let o = other as? Subscription else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.channel, from: o.channel)

        for (index, t) in o.contact.enumerated() {
            guard index < self.contact.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ContactPoint()
                val.populate(from: t)
                self.contact.append(val)
                continue
            }
            self.contact[index].populate(from: t)
        }
    
        while self.contact.count > o.contact.count {
            let objectToRemove = self.contact.last!
            self.contact.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        criteria = o.criteria
        FireKit.populate(&self.end, from: o.end)
        error = o.error
        reason = o.reason
        status = o.status

        for (index, t) in o.tag.enumerated() {
            guard index < self.tag.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Coding()
                val.populate(from: t)
                self.tag.append(val)
                continue
            }
            self.tag[index].populate(from: t)
        }
    
        while self.tag.count > o.tag.count {
            let objectToRemove = self.tag.last!
            self.tag.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? SubscriptionChannel else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        endpoint = o.endpoint
        header = o.header
        payload = o.payload
        type = o.type
    }
}

