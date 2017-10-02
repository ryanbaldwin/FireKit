//
//  VisionPrescription.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/VisionPrescription) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Prescription for vision correction products for a patient.
 *
 *  An authorization for the supply of glasses and/or contact lenses to a patient.
 */
open class VisionPrescription: DomainResource {
	override open class var resourceType: String {
		get { return "VisionPrescription" }
	}

    @objc public dynamic var dateWritten: DateTime?
    public let dispense = RealmSwift.List<VisionPrescriptionDispense>()
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var prescriber: Reference?
    public func upsert(prescriber: Reference?) {
        upsert(prop: &self.prescriber, val: prescriber)
    }
    @objc public dynamic var reasonCodeableConcept: CodeableConcept?
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }
    @objc public dynamic var reasonReference: Reference?
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case dateWritten = "dateWritten"
        case dispense = "dispense"
        case encounter = "encounter"
        case identifier = "identifier"
        case patient = "patient"
        case prescriber = "prescriber"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonReference = "reasonReference"
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

        self.dateWritten = try container.decodeIfPresent(DateTime.self, forKey: .dateWritten)
        self.dispense.append(objectsIn: try container.decodeIfPresent([VisionPrescriptionDispense].self, forKey: .dispense) ?? [])
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.prescriber = try container.decodeIfPresent(Reference.self, forKey: .prescriber)
        self.reasonCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept)
        self.reasonReference = try container.decodeIfPresent(Reference.self, forKey: .reasonReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.dateWritten, forKey: .dateWritten)
        try container.encode(Array(self.dispense), forKey: .dispense)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.prescriber, forKey: .prescriber)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(VisionPrescription.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy VisionPrescription. Will return empty instance: \(error))")
		}
		return VisionPrescription.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? VisionPrescription else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.dateWritten, from: o.dateWritten)

        for (index, t) in o.dispense.enumerated() {
            guard index < self.dispense.count else {
                self.dispense.append(t)
                continue
            }
            self.dispense[index].populate(from: t)
        }
    
        if self.dispense.count > o.dispense.count {
            for i in self.dispense.count...o.dispense.count {
                let objectToRemove = self.dispense[i]
                self.dispense.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                let objectToRemove = self.identifier[i]
                self.identifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.prescriber, from: o.prescriber)
        FireKit.populate(&self.reasonCodeableConcept, from: o.reasonCodeableConcept)
        FireKit.populate(&self.reasonReference, from: o.reasonReference)
    }
}


/**
 *  Vision supply authorization.
 *
 *  Deals with details of the dispense part of the supply specification.
 */
open class VisionPrescriptionDispense: BackboneElement {
	override open class var resourceType: String {
		get { return "VisionPrescriptionDispense" }
	}

    @objc public dynamic var add: RealmDecimal?
    public let axis = RealmOptional<Int>()
    @objc public dynamic var backCurve: RealmDecimal?
    @objc public dynamic var base: String?
    @objc public dynamic var brand: String?
    @objc public dynamic var color: String?
    @objc public dynamic var cylinder: RealmDecimal?
    @objc public dynamic var diameter: RealmDecimal?
    @objc public dynamic var duration: Quantity?
    public func upsert(duration: Quantity?) {
        upsert(prop: &self.duration, val: duration)
    }
    @objc public dynamic var eye: String?
    @objc public dynamic var notes: String?
    @objc public dynamic var power: RealmDecimal?
    @objc public dynamic var prism: RealmDecimal?
    @objc public dynamic var product: Coding?
    public func upsert(product: Coding?) {
        upsert(prop: &self.product, val: product)
    }
    @objc public dynamic var sphere: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(product: Coding) {
        self.init()
        self.product = product
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case add = "add"
        case axis = "axis"
        case backCurve = "backCurve"
        case base = "base"
        case brand = "brand"
        case color = "color"
        case cylinder = "cylinder"
        case diameter = "diameter"
        case duration = "duration"
        case eye = "eye"
        case notes = "notes"
        case power = "power"
        case prism = "prism"
        case product = "product"
        case sphere = "sphere"
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

        self.add = try container.decodeIfPresent(RealmDecimal.self, forKey: .add)
        self.axis.value = try container.decodeIfPresent(Int.self, forKey: .axis)
        self.backCurve = try container.decodeIfPresent(RealmDecimal.self, forKey: .backCurve)
        self.base = try container.decodeIfPresent(String.self, forKey: .base)
        self.brand = try container.decodeIfPresent(String.self, forKey: .brand)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.cylinder = try container.decodeIfPresent(RealmDecimal.self, forKey: .cylinder)
        self.diameter = try container.decodeIfPresent(RealmDecimal.self, forKey: .diameter)
        self.duration = try container.decodeIfPresent(Quantity.self, forKey: .duration)
        self.eye = try container.decodeIfPresent(String.self, forKey: .eye)
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
        self.power = try container.decodeIfPresent(RealmDecimal.self, forKey: .power)
        self.prism = try container.decodeIfPresent(RealmDecimal.self, forKey: .prism)
        self.product = try container.decodeIfPresent(Coding.self, forKey: .product)
        self.sphere = try container.decodeIfPresent(RealmDecimal.self, forKey: .sphere)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.add, forKey: .add)
        try container.encodeIfPresent(self.axis.value, forKey: .axis)
        try container.encodeIfPresent(self.backCurve, forKey: .backCurve)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encodeIfPresent(self.brand, forKey: .brand)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encodeIfPresent(self.cylinder, forKey: .cylinder)
        try container.encodeIfPresent(self.diameter, forKey: .diameter)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.eye, forKey: .eye)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.power, forKey: .power)
        try container.encodeIfPresent(self.prism, forKey: .prism)
        try container.encodeIfPresent(self.product, forKey: .product)
        try container.encodeIfPresent(self.sphere, forKey: .sphere)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(VisionPrescriptionDispense.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy VisionPrescriptionDispense. Will return empty instance: \(error))")
		}
		return VisionPrescriptionDispense.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? VisionPrescriptionDispense else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        add = o.add
        axis.value = o.axis.value
        backCurve = o.backCurve
        base = o.base
        brand = o.brand
        color = o.color
        cylinder = o.cylinder
        diameter = o.diameter
        FireKit.populate(&self.duration, from: o.duration)
        eye = o.eye
        notes = o.notes
        power = o.power
        prism = o.prism
        FireKit.populate(&self.product, from: o.product)
        sphere = o.sphere
    }
}

