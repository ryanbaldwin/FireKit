//
//  MedicationDispense.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationDispense) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Dispensing a medication to a named patient.
 *
 *  Indicates that a medication product is to be or has been dispensed for a named person/patient.  This includes a
 *  description of the medication product (supply) provided and the instructions for administering the medication.  The
 *  medication dispense is the result of a pharmacy system responding to a medication order.
 */
open class MedicationDispense: DomainResource {
	override open class var resourceType: String {
		get { return "MedicationDispense" }
	}

    public let authorizingPrescription = RealmSwift.List<Reference>()
    @objc public dynamic var daysSupply: Quantity?
    public func upsert(daysSupply: Quantity?) {
        upsert(prop: &self.daysSupply, val: daysSupply)
    }
    @objc public dynamic var destination: Reference?
    public func upsert(destination: Reference?) {
        upsert(prop: &self.destination, val: destination)
    }
    @objc public dynamic var dispenser: Reference?
    public func upsert(dispenser: Reference?) {
        upsert(prop: &self.dispenser, val: dispenser)
    }
    public let dosageInstruction = RealmSwift.List<MedicationDispenseDosageInstruction>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
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
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let receiver = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?
    @objc public dynamic var substitution: MedicationDispenseSubstitution?
    public func upsert(substitution: MedicationDispenseSubstitution?) {
        upsert(prop: &self.substitution, val: substitution)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var whenHandedOver: DateTime?
    @objc public dynamic var whenPrepared: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(medicationCodeableConcept: CodeableConcept, medicationReference: Reference) {
        self.init()
        self.medicationCodeableConcept = medicationCodeableConcept
        self.medicationReference = medicationReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authorizingPrescription = "authorizingPrescription"
        case daysSupply = "daysSupply"
        case destination = "destination"
        case dispenser = "dispenser"
        case dosageInstruction = "dosageInstruction"
        case identifier = "identifier"
        case medicationCodeableConcept = "medicationCodeableConcept"
        case medicationReference = "medicationReference"
        case note = "note"
        case patient = "patient"
        case quantity = "quantity"
        case receiver = "receiver"
        case status = "status"
        case substitution = "substitution"
        case type = "type"
        case whenHandedOver = "whenHandedOver"
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

        self.authorizingPrescription.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .authorizingPrescription) ?? [])
        self.daysSupply = try container.decodeIfPresent(Quantity.self, forKey: .daysSupply)
        self.destination = try container.decodeIfPresent(Reference.self, forKey: .destination)
        self.dispenser = try container.decodeIfPresent(Reference.self, forKey: .dispenser)
        self.dosageInstruction.append(objectsIn: try container.decodeIfPresent([MedicationDispenseDosageInstruction].self, forKey: .dosageInstruction) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.medicationCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .medicationCodeableConcept)
        self.medicationReference = try container.decodeIfPresent(Reference.self, forKey: .medicationReference)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.receiver.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .receiver) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.substitution = try container.decodeIfPresent(MedicationDispenseSubstitution.self, forKey: .substitution)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.whenHandedOver = try container.decodeIfPresent(DateTime.self, forKey: .whenHandedOver)
        self.whenPrepared = try container.decodeIfPresent(DateTime.self, forKey: .whenPrepared)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.authorizingPrescription), forKey: .authorizingPrescription)
        try container.encodeIfPresent(self.daysSupply, forKey: .daysSupply)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.dispenser, forKey: .dispenser)
        try container.encode(Array(self.dosageInstruction), forKey: .dosageInstruction)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.medicationCodeableConcept, forKey: .medicationCodeableConcept)
        try container.encodeIfPresent(self.medicationReference, forKey: .medicationReference)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encode(Array(self.receiver), forKey: .receiver)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.substitution, forKey: .substitution)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.whenHandedOver, forKey: .whenHandedOver)
        try container.encodeIfPresent(self.whenPrepared, forKey: .whenPrepared)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationDispense.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationDispense. Will return empty instance: \(error))")
		}
		return MedicationDispense.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationDispense else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.authorizingPrescription, from: o.authorizingPrescription)
        FireKit.populate(&self.daysSupply, from: o.daysSupply)
        FireKit.populate(&self.destination, from: o.destination)
        FireKit.populate(&self.dispenser, from: o.dispenser)
        FireKit.populateList(&self.dosageInstruction, from: o.dosageInstruction)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.medicationCodeableConcept, from: o.medicationCodeableConcept)
        FireKit.populate(&self.medicationReference, from: o.medicationReference)
        note = o.note
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.quantity, from: o.quantity)
        FireKit.populateList(&self.receiver, from: o.receiver)
        status = o.status
        FireKit.populate(&self.substitution, from: o.substitution)
        FireKit.populate(&self.type, from: o.type)
        whenHandedOver = o.whenHandedOver
        whenPrepared = o.whenPrepared
    }
}


/**
 *  Medicine administration instructions to the patient/caregiver.
 *
 *  Indicates how the medication is to be used by the patient.
 */
open class MedicationDispenseDosageInstruction: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationDispenseDosageInstruction" }
	}

    @objc public dynamic var additionalInstructions: CodeableConcept?
    public func upsert(additionalInstructions: CodeableConcept?) {
        upsert(prop: &self.additionalInstructions, val: additionalInstructions)
    }
    public let asNeededBoolean = RealmOptional<Bool>()
    @objc public dynamic var asNeededCodeableConcept: CodeableConcept?
    public func upsert(asNeededCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.asNeededCodeableConcept, val: asNeededCodeableConcept)
    }
    @objc public dynamic var doseQuantity: Quantity?
    public func upsert(doseQuantity: Quantity?) {
        upsert(prop: &self.doseQuantity, val: doseQuantity)
    }
    @objc public dynamic var doseRange: Range?
    public func upsert(doseRange: Range?) {
        upsert(prop: &self.doseRange, val: doseRange)
    }
    @objc public dynamic var maxDosePerPeriod: Ratio?
    public func upsert(maxDosePerPeriod: Ratio?) {
        upsert(prop: &self.maxDosePerPeriod, val: maxDosePerPeriod)
    }
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
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
    @objc public dynamic var timing: Timing?
    public func upsert(timing: Timing?) {
        upsert(prop: &self.timing, val: timing)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case additionalInstructions = "additionalInstructions"
        case asNeededBoolean = "asNeededBoolean"
        case asNeededCodeableConcept = "asNeededCodeableConcept"
        case doseQuantity = "doseQuantity"
        case doseRange = "doseRange"
        case maxDosePerPeriod = "maxDosePerPeriod"
        case method = "method"
        case rateRange = "rateRange"
        case rateRatio = "rateRatio"
        case route = "route"
        case siteCodeableConcept = "siteCodeableConcept"
        case siteReference = "siteReference"
        case text = "text"
        case timing = "timing"
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

        self.additionalInstructions = try container.decodeIfPresent(CodeableConcept.self, forKey: .additionalInstructions)
        self.asNeededBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .asNeededBoolean)
        self.asNeededCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .asNeededCodeableConcept)
        self.doseQuantity = try container.decodeIfPresent(Quantity.self, forKey: .doseQuantity)
        self.doseRange = try container.decodeIfPresent(Range.self, forKey: .doseRange)
        self.maxDosePerPeriod = try container.decodeIfPresent(Ratio.self, forKey: .maxDosePerPeriod)
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.rateRange = try container.decodeIfPresent(Range.self, forKey: .rateRange)
        self.rateRatio = try container.decodeIfPresent(Ratio.self, forKey: .rateRatio)
        self.route = try container.decodeIfPresent(CodeableConcept.self, forKey: .route)
        self.siteCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .siteCodeableConcept)
        self.siteReference = try container.decodeIfPresent(Reference.self, forKey: .siteReference)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.timing = try container.decodeIfPresent(Timing.self, forKey: .timing)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.additionalInstructions, forKey: .additionalInstructions)
        try container.encodeIfPresent(self.asNeededBoolean.value, forKey: .asNeededBoolean)
        try container.encodeIfPresent(self.asNeededCodeableConcept, forKey: .asNeededCodeableConcept)
        try container.encodeIfPresent(self.doseQuantity, forKey: .doseQuantity)
        try container.encodeIfPresent(self.doseRange, forKey: .doseRange)
        try container.encodeIfPresent(self.maxDosePerPeriod, forKey: .maxDosePerPeriod)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.rateRange, forKey: .rateRange)
        try container.encodeIfPresent(self.rateRatio, forKey: .rateRatio)
        try container.encodeIfPresent(self.route, forKey: .route)
        try container.encodeIfPresent(self.siteCodeableConcept, forKey: .siteCodeableConcept)
        try container.encodeIfPresent(self.siteReference, forKey: .siteReference)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.timing, forKey: .timing)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationDispenseDosageInstruction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationDispenseDosageInstruction. Will return empty instance: \(error))")
		}
		return MedicationDispenseDosageInstruction.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationDispenseDosageInstruction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.additionalInstructions, from: o.additionalInstructions)
        asNeededBoolean.value = o.asNeededBoolean.value
        FireKit.populate(&self.asNeededCodeableConcept, from: o.asNeededCodeableConcept)
        FireKit.populate(&self.doseQuantity, from: o.doseQuantity)
        FireKit.populate(&self.doseRange, from: o.doseRange)
        FireKit.populate(&self.maxDosePerPeriod, from: o.maxDosePerPeriod)
        FireKit.populate(&self.method, from: o.method)
        FireKit.populate(&self.rateRange, from: o.rateRange)
        FireKit.populate(&self.rateRatio, from: o.rateRatio)
        FireKit.populate(&self.route, from: o.route)
        FireKit.populate(&self.siteCodeableConcept, from: o.siteCodeableConcept)
        FireKit.populate(&self.siteReference, from: o.siteReference)
        text = o.text
        FireKit.populate(&self.timing, from: o.timing)
    }
}


/**
 *  Deals with substitution of one medicine for another.
 *
 *  Indicates whether or not substitution was made as part of the dispense.  In some cases substitution will be expected
 *  but does not happen, in other cases substitution is not expected but does happen.  This block explains what
 *  substitution did or did not happen and why.
 */
open class MedicationDispenseSubstitution: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationDispenseSubstitution" }
	}

    public let reason = RealmSwift.List<CodeableConcept>()
    public let responsibleParty = RealmSwift.List<Reference>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: CodeableConcept) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case reason = "reason"
        case responsibleParty = "responsibleParty"
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

        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.responsibleParty.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .responsibleParty) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encode(Array(self.responsibleParty), forKey: .responsibleParty)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationDispenseSubstitution.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationDispenseSubstitution. Will return empty instance: \(error))")
		}
		return MedicationDispenseSubstitution.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationDispenseSubstitution else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.reason, from: o.reason)
        FireKit.populateList(&self.responsibleParty, from: o.responsibleParty)
        FireKit.populate(&self.type, from: o.type)
    }
}

