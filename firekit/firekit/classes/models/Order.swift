//
//  Order.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Order) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A request to perform an action.
 */
open class Order: DomainResource {
	override open class var resourceType: String {
		get { return "Order" }
	}

    @objc public dynamic var date: DateTime?
    public let detail = RealmSwift.List<Reference>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var reasonCodeableConcept: CodeableConcept?
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }
    @objc public dynamic var reasonReference: Reference?
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }
    @objc public dynamic var when: OrderWhen?
    public func upsert(when: OrderWhen?) {
        upsert(prop: &self.when, val: when)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(detail: [Reference]) {
        self.init()
        self.detail.append(objectsIn: detail)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case detail = "detail"
        case identifier = "identifier"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonReference = "reasonReference"
        case source = "source"
        case subject = "subject"
        case target = "target"
        case when = "when"
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
        self.detail.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .detail) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.reasonCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept)
        self.reasonReference = try container.decodeIfPresent(Reference.self, forKey: .reasonReference)
        self.source = try container.decodeIfPresent(Reference.self, forKey: .source)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
        self.when = try container.decodeIfPresent(OrderWhen.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.when, forKey: .when)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Order.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Order. Will return empty instance: \(error))")
		}
		return Order.init()
	}
}


/**
 *  When order should be fulfilled.
 */
open class OrderWhen: BackboneElement {
	override open class var resourceType: String {
		get { return "OrderWhen" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var schedule: Timing?
    public func upsert(schedule: Timing?) {
        upsert(prop: &self.schedule, val: schedule)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case schedule = "schedule"
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

        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.schedule = try container.decodeIfPresent(Timing.self, forKey: .schedule)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.schedule, forKey: .schedule)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OrderWhen.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OrderWhen. Will return empty instance: \(error))")
		}
		return OrderWhen.init()
	}
}

