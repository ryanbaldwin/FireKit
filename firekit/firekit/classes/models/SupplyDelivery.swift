//
//  SupplyDelivery.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SupplyDelivery) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Delivery of Supply.
 *
 *  Record of delivery of what is supplied.
 */
open class SupplyDelivery: DomainResource {
	override open class var resourceType: String {
		get { return "SupplyDelivery" }
	}

    @objc public dynamic var destination: Reference?
    public func upsert(destination: Reference?) {
        upsert(prop: &self.destination, val: destination)
    }
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let receiver = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?
    @objc public dynamic var suppliedItem: Reference?
    public func upsert(suppliedItem: Reference?) {
        upsert(prop: &self.suppliedItem, val: suppliedItem)
    }
    @objc public dynamic var supplier: Reference?
    public func upsert(supplier: Reference?) {
        upsert(prop: &self.supplier, val: supplier)
    }
    @objc public dynamic var time: DateTime?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var whenPrepared: Period?
    public func upsert(whenPrepared: Period?) {
        upsert(prop: &self.whenPrepared, val: whenPrepared)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case destination = "destination"
        case identifier = "identifier"
        case patient = "patient"
        case quantity = "quantity"
        case receiver = "receiver"
        case status = "status"
        case suppliedItem = "suppliedItem"
        case supplier = "supplier"
        case time = "time"
        case type = "type"
        case whenPrepared = "whenPrepared"
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

        self.destination = try container.decodeIfPresent(Reference.self, forKey: .destination)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.receiver.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .receiver) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.suppliedItem = try container.decodeIfPresent(Reference.self, forKey: .suppliedItem)
        self.supplier = try container.decodeIfPresent(Reference.self, forKey: .supplier)
        self.time = try container.decodeIfPresent(DateTime.self, forKey: .time)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.whenPrepared = try container.decodeIfPresent(Period.self, forKey: .whenPrepared)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encode(Array(self.receiver), forKey: .receiver)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.suppliedItem, forKey: .suppliedItem)
        try container.encodeIfPresent(self.supplier, forKey: .supplier)
        try container.encodeIfPresent(self.time, forKey: .time)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.whenPrepared, forKey: .whenPrepared)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SupplyDelivery.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SupplyDelivery. Will return empty instance: \(error))")
		}
		return SupplyDelivery.init()
	}
}

