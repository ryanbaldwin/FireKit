//
//  SupplyRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SupplyRequest) on 2017-11-07.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-07
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Request for a medication, substance or device.
 *
 *  A record of a request for a medication, substance or device used in the healthcare setting.
 */
open class SupplyRequest: DomainResource {
	override open class var resourceType: String {
		get { return "SupplyRequest" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var kind: CodeableConcept?
    public func upsert(kind: CodeableConcept?) {
        upsert(prop: &self.kind, val: kind)
    }
    @objc public dynamic var orderedItem: Reference?
    public func upsert(orderedItem: Reference?) {
        upsert(prop: &self.orderedItem, val: orderedItem)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
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
    @objc public dynamic var status: String?
    public let supplier = RealmSwift.List<Reference>()
    @objc public dynamic var when: SupplyRequestWhen?
    public func upsert(when: SupplyRequestWhen?) {
        upsert(prop: &self.when, val: when)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case identifier = "identifier"
        case kind = "kind"
        case orderedItem = "orderedItem"
        case patient = "patient"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonReference = "reasonReference"
        case source = "source"
        case status = "status"
        case supplier = "supplier"
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
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.kind = try container.decodeIfPresent(CodeableConcept.self, forKey: .kind)
        self.orderedItem = try container.decodeIfPresent(Reference.self, forKey: .orderedItem)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.reasonCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept)
        self.reasonReference = try container.decodeIfPresent(Reference.self, forKey: .reasonReference)
        self.source = try container.decodeIfPresent(Reference.self, forKey: .source)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.supplier.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supplier) ?? [])
        self.when = try container.decodeIfPresent(SupplyRequestWhen.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.orderedItem, forKey: .orderedItem)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.supplier), forKey: .supplier)
        try container.encodeIfPresent(self.when, forKey: .when)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SupplyRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SupplyRequest. Will return empty instance: \(error))")
		}
		return SupplyRequest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SupplyRequest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.date, from: o.date)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.kind, from: o.kind)
        FireKit.populate(&self.orderedItem, from: o.orderedItem)
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.reasonCodeableConcept, from: o.reasonCodeableConcept)
        FireKit.populate(&self.reasonReference, from: o.reasonReference)
        FireKit.populate(&self.source, from: o.source)
        status = o.status

        for (index, t) in o.supplier.enumerated() {
            guard index < self.supplier.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.supplier.append(val)
                continue
            }
            self.supplier[index].populate(from: t)
        }
    
        while self.supplier.count > o.supplier.count {
            let objectToRemove = self.supplier.last!
            self.supplier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.when, from: o.when)
    }
}


/**
 *  When the request should be fulfilled.
 */
open class SupplyRequestWhen: BackboneElement {
	override open class var resourceType: String {
		get { return "SupplyRequestWhen" }
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
			let clone = try JSONDecoder().decode(SupplyRequestWhen.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SupplyRequestWhen. Will return empty instance: \(error))")
		}
		return SupplyRequestWhen.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SupplyRequestWhen else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        FireKit.populate(&self.schedule, from: o.schedule)
    }
}

