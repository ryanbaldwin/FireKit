//
//  OrderResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/OrderResponse) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A response to an order.
 */
open class OrderResponse: DomainResource {
	override open class var resourceType: String {
		get { return "OrderResponse" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let fulfillment = RealmSwift.List<Reference>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var orderStatus: String?
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var who: Reference?
    public func upsert(who: Reference?) {
        upsert(prop: &self.who, val: who)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(orderStatus: String, request: Reference) {
        self.init()
        self.orderStatus = orderStatus
        self.request = request
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case description_fhir = "description"
        case fulfillment = "fulfillment"
        case identifier = "identifier"
        case orderStatus = "orderStatus"
        case request = "request"
        case who = "who"
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

        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.fulfillment.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .fulfillment) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.orderStatus = try container.decodeIfPresent(String.self, forKey: .orderStatus)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.who = try container.decodeIfPresent(Reference.self, forKey: .who)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.fulfillment), forKey: .fulfillment)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.orderStatus, forKey: .orderStatus)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.who, forKey: .who)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OrderResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OrderResponse. Will return empty instance: \(error))")
		}
		return OrderResponse.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OrderResponse else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.date, from: o.date)
        description_fhir = o.description_fhir

        for (index, t) in o.fulfillment.enumerated() {
            guard index < self.fulfillment.count else {
                self.fulfillment.append(t)
                continue
            }
            self.fulfillment[index].populate(from: t)
        }
    
        while self.fulfillment.count > o.fulfillment.count {
            let objectToRemove = self.fulfillment.last!
            self.fulfillment.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        orderStatus = o.orderStatus
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.who, from: o.who)
    }
}

