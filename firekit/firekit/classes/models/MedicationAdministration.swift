//
//  MedicationAdministration.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationAdministration) on 2017-11-07.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-07
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Administration of medication to a patient.
 *
 *  Describes the event of a patient consuming or otherwise being administered a medication.  This may be as simple as
 *  swallowing a tablet or it may be a long running infusion.  Related resources tie this event to the authorizing
 *  prescription, and the specific encounter between patient and health care practitioner.
 */
open class MedicationAdministration: DomainResource {
	override open class var resourceType: String {
		get { return "MedicationAdministration" }
	}

    public let device = RealmSwift.List<Reference>()
    @objc public dynamic var dosage: MedicationAdministrationDosage?
    public func upsert(dosage: MedicationAdministrationDosage?) {
        upsert(prop: &self.dosage, val: dosage)
    }
    @objc public dynamic var effectiveTimeDateTime: DateTime?
    @objc public dynamic var effectiveTimePeriod: Period?
    public func upsert(effectiveTimePeriod: Period?) {
        upsert(prop: &self.effectiveTimePeriod, val: effectiveTimePeriod)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var medicationCodeableConcept: CodeableConcept?
    public func upsert(medicationCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.medicationCodeableConcept, val: medicationCodeableConcept)
    }
    @objc public dynamic var medicationReference: Reference?
    public func upsert(medicationReference: Reference?) {
        upsert(prop: &self.medicationReference, val: medicationReference)
    }
    @objc public dynamic var note: String?
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var practitioner: Reference?
    public func upsert(practitioner: Reference?) {
        upsert(prop: &self.practitioner, val: practitioner)
    }
    @objc public dynamic var prescription: Reference?
    public func upsert(prescription: Reference?) {
        upsert(prop: &self.prescription, val: prescription)
    }
    public let reasonGiven = RealmSwift.List<CodeableConcept>()
    public let reasonNotGiven = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var status: String?
    public let wasNotGiven = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(effectiveTimeDateTime: DateTime, effectiveTimePeriod: Period, medicationCodeableConcept: CodeableConcept, medicationReference: Reference, patient: Reference, status: String) {
        self.init()
        self.effectiveTimeDateTime = effectiveTimeDateTime
        self.effectiveTimePeriod = effectiveTimePeriod
        self.medicationCodeableConcept = medicationCodeableConcept
        self.medicationReference = medicationReference
        self.patient = patient
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case device = "device"
        case dosage = "dosage"
        case effectiveTimeDateTime = "effectiveTimeDateTime"
        case effectiveTimePeriod = "effectiveTimePeriod"
        case encounter = "encounter"
        case identifier = "identifier"
        case medicationCodeableConcept = "medicationCodeableConcept"
        case medicationReference = "medicationReference"
        case note = "note"
        case patient = "patient"
        case practitioner = "practitioner"
        case prescription = "prescription"
        case reasonGiven = "reasonGiven"
        case reasonNotGiven = "reasonNotGiven"
        case status = "status"
        case wasNotGiven = "wasNotGiven"
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

        self.device.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .device) ?? [])
        self.dosage = try container.decodeIfPresent(MedicationAdministrationDosage.self, forKey: .dosage)
        self.effectiveTimeDateTime = try container.decodeIfPresent(DateTime.self, forKey: .effectiveTimeDateTime)
        self.effectiveTimePeriod = try container.decodeIfPresent(Period.self, forKey: .effectiveTimePeriod)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.medicationCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .medicationCodeableConcept)
        self.medicationReference = try container.decodeIfPresent(Reference.self, forKey: .medicationReference)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.practitioner = try container.decodeIfPresent(Reference.self, forKey: .practitioner)
        self.prescription = try container.decodeIfPresent(Reference.self, forKey: .prescription)
        self.reasonGiven.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reasonGiven) ?? [])
        self.reasonNotGiven.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reasonNotGiven) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.wasNotGiven.value = try container.decodeIfPresent(Bool.self, forKey: .wasNotGiven)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.device), forKey: .device)
        try container.encodeIfPresent(self.dosage, forKey: .dosage)
        try container.encodeIfPresent(self.effectiveTimeDateTime, forKey: .effectiveTimeDateTime)
        try container.encodeIfPresent(self.effectiveTimePeriod, forKey: .effectiveTimePeriod)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.medicationCodeableConcept, forKey: .medicationCodeableConcept)
        try container.encodeIfPresent(self.medicationReference, forKey: .medicationReference)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.practitioner, forKey: .practitioner)
        try container.encodeIfPresent(self.prescription, forKey: .prescription)
        try container.encode(Array(self.reasonGiven), forKey: .reasonGiven)
        try container.encode(Array(self.reasonNotGiven), forKey: .reasonNotGiven)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.wasNotGiven.value, forKey: .wasNotGiven)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationAdministration.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationAdministration. Will return empty instance: \(error))")
		}
		return MedicationAdministration.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationAdministration else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.device.enumerated() {
            guard index < self.device.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.device.append(val)
                continue
            }
            self.device[index].populate(from: t)
        }
    
        while self.device.count > o.device.count {
            let objectToRemove = self.device.last!
            self.device.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.dosage, from: o.dosage)
        FireKit.populate(&self.effectiveTimeDateTime, from: o.effectiveTimeDateTime)
        FireKit.populate(&self.effectiveTimePeriod, from: o.effectiveTimePeriod)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Identifier()
                val.populate(from: t)
                self.identifier.append(val)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.medicationCodeableConcept, from: o.medicationCodeableConcept)
        FireKit.populate(&self.medicationReference, from: o.medicationReference)
        note = o.note
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.practitioner, from: o.practitioner)
        FireKit.populate(&self.prescription, from: o.prescription)

        for (index, t) in o.reasonGiven.enumerated() {
            guard index < self.reasonGiven.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.reasonGiven.append(val)
                continue
            }
            self.reasonGiven[index].populate(from: t)
        }
    
        while self.reasonGiven.count > o.reasonGiven.count {
            let objectToRemove = self.reasonGiven.last!
            self.reasonGiven.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.reasonNotGiven.enumerated() {
            guard index < self.reasonNotGiven.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.reasonNotGiven.append(val)
                continue
            }
            self.reasonNotGiven[index].populate(from: t)
        }
    
        while self.reasonNotGiven.count > o.reasonNotGiven.count {
            let objectToRemove = self.reasonNotGiven.last!
            self.reasonNotGiven.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        status = o.status
        wasNotGiven.value = o.wasNotGiven.value
    }
}


/**
 *  Details of how medication was taken.
 *
 *  Describes the medication dosage information details e.g. dose, rate, site, route, etc.
 */
open class MedicationAdministrationDosage: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationAdministrationDosage" }
	}

    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    @objc public dynamic var rateRange: Range?
    public func upsert(rateRange: Range?) {
        upsert(prop: &self.rateRange, val: rateRange)
    }
    @objc public dynamic var rateRatio: Ratio?
    public func upsert(rateRatio: Ratio?) {
        upsert(prop: &self.rateRatio, val: rateRatio)
    }
    @objc public dynamic var route: CodeableConcept?
    public func upsert(route: CodeableConcept?) {
        upsert(prop: &self.route, val: route)
    }
    @objc public dynamic var siteCodeableConcept: CodeableConcept?
    public func upsert(siteCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.siteCodeableConcept, val: siteCodeableConcept)
    }
    @objc public dynamic var siteReference: Reference?
    public func upsert(siteReference: Reference?) {
        upsert(prop: &self.siteReference, val: siteReference)
    }
    @objc public dynamic var text: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case method = "method"
        case quantity = "quantity"
        case rateRange = "rateRange"
        case rateRatio = "rateRatio"
        case route = "route"
        case siteCodeableConcept = "siteCodeableConcept"
        case siteReference = "siteReference"
        case text = "text"
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

        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.rateRange = try container.decodeIfPresent(Range.self, forKey: .rateRange)
        self.rateRatio = try container.decodeIfPresent(Ratio.self, forKey: .rateRatio)
        self.route = try container.decodeIfPresent(CodeableConcept.self, forKey: .route)
        self.siteCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .siteCodeableConcept)
        self.siteReference = try container.decodeIfPresent(Reference.self, forKey: .siteReference)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.rateRange, forKey: .rateRange)
        try container.encodeIfPresent(self.rateRatio, forKey: .rateRatio)
        try container.encodeIfPresent(self.route, forKey: .route)
        try container.encodeIfPresent(self.siteCodeableConcept, forKey: .siteCodeableConcept)
        try container.encodeIfPresent(self.siteReference, forKey: .siteReference)
        try container.encodeIfPresent(self.text, forKey: .text)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationAdministrationDosage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationAdministrationDosage. Will return empty instance: \(error))")
		}
		return MedicationAdministrationDosage.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationAdministrationDosage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.method, from: o.method)
        FireKit.populate(&self.quantity, from: o.quantity)
        FireKit.populate(&self.rateRange, from: o.rateRange)
        FireKit.populate(&self.rateRatio, from: o.rateRatio)
        FireKit.populate(&self.route, from: o.route)
        FireKit.populate(&self.siteCodeableConcept, from: o.siteCodeableConcept)
        FireKit.populate(&self.siteReference, from: o.siteReference)
        text = o.text
    }
}

