//
//  MedicationOrder.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationOrder) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Prescription of medication to for patient.
 *
 *  An order for both supply of the medication and the instructions for administration of the medication to a patient.
 *  The resource is called "MedicationOrder" rather than "MedicationPrescription" to generalize the use across inpatient
 *  and outpatient settings as well as for care plans, etc.
 */
open class MedicationOrder: DomainResource {
	override open class var resourceType: String {
		get { return "MedicationOrder" }
	}

    @objc public dynamic var dateEnded: DateTime?
    @objc public dynamic var dateWritten: DateTime?
    @objc public dynamic var dispenseRequest: MedicationOrderDispenseRequest?
    public func upsert(dispenseRequest: MedicationOrderDispenseRequest?) {
        upsert(prop: &self.dispenseRequest, val: dispenseRequest)
    }
    public let dosageInstruction = RealmSwift.List<MedicationOrderDosageInstruction>()
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
    @objc public dynamic var prescriber: Reference?
    public func upsert(prescriber: Reference?) {
        upsert(prop: &self.prescriber, val: prescriber)
    }
    @objc public dynamic var priorPrescription: Reference?
    public func upsert(priorPrescription: Reference?) {
        upsert(prop: &self.priorPrescription, val: priorPrescription)
    }
    @objc public dynamic var reasonCodeableConcept: CodeableConcept?
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }
    @objc public dynamic var reasonEnded: CodeableConcept?
    public func upsert(reasonEnded: CodeableConcept?) {
        upsert(prop: &self.reasonEnded, val: reasonEnded)
    }
    @objc public dynamic var reasonReference: Reference?
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var substitution: MedicationOrderSubstitution?
    public func upsert(substitution: MedicationOrderSubstitution?) {
        upsert(prop: &self.substitution, val: substitution)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(medicationCodeableConcept: CodeableConcept, medicationReference: Reference) {
        self.init()
        self.medicationCodeableConcept = medicationCodeableConcept
        self.medicationReference = medicationReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case dateEnded = "dateEnded"
        case dateWritten = "dateWritten"
        case dispenseRequest = "dispenseRequest"
        case dosageInstruction = "dosageInstruction"
        case encounter = "encounter"
        case identifier = "identifier"
        case medicationCodeableConcept = "medicationCodeableConcept"
        case medicationReference = "medicationReference"
        case note = "note"
        case patient = "patient"
        case prescriber = "prescriber"
        case priorPrescription = "priorPrescription"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonEnded = "reasonEnded"
        case reasonReference = "reasonReference"
        case status = "status"
        case substitution = "substitution"
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

        self.dateEnded = try container.decodeIfPresent(DateTime.self, forKey: .dateEnded)
        self.dateWritten = try container.decodeIfPresent(DateTime.self, forKey: .dateWritten)
        self.dispenseRequest = try container.decodeIfPresent(MedicationOrderDispenseRequest.self, forKey: .dispenseRequest)
        self.dosageInstruction.append(objectsIn: try container.decodeIfPresent([MedicationOrderDosageInstruction].self, forKey: .dosageInstruction) ?? [])
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.medicationCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .medicationCodeableConcept)
        self.medicationReference = try container.decodeIfPresent(Reference.self, forKey: .medicationReference)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.prescriber = try container.decodeIfPresent(Reference.self, forKey: .prescriber)
        self.priorPrescription = try container.decodeIfPresent(Reference.self, forKey: .priorPrescription)
        self.reasonCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept)
        self.reasonEnded = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonEnded)
        self.reasonReference = try container.decodeIfPresent(Reference.self, forKey: .reasonReference)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.substitution = try container.decodeIfPresent(MedicationOrderSubstitution.self, forKey: .substitution)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.dateEnded, forKey: .dateEnded)
        try container.encodeIfPresent(self.dateWritten, forKey: .dateWritten)
        try container.encodeIfPresent(self.dispenseRequest, forKey: .dispenseRequest)
        try container.encode(Array(self.dosageInstruction), forKey: .dosageInstruction)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.medicationCodeableConcept, forKey: .medicationCodeableConcept)
        try container.encodeIfPresent(self.medicationReference, forKey: .medicationReference)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.prescriber, forKey: .prescriber)
        try container.encodeIfPresent(self.priorPrescription, forKey: .priorPrescription)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encodeIfPresent(self.reasonEnded, forKey: .reasonEnded)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.substitution, forKey: .substitution)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationOrder.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationOrder. Will return empty instance: \(error))")
		}
		return MedicationOrder.init()
	}
}


/**
 *  Medication supply authorization.
 *
 *  Indicates the specific details for the dispense or medication supply part of a medication order (also known as a
 *  Medication Prescription).  Note that this information is NOT always sent with the order.  There may be in some
 *  settings (e.g. hospitals) institutional or system support for completing the dispense details in the pharmacy
 *  department.
 */
open class MedicationOrderDispenseRequest: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationOrderDispenseRequest" }
	}

    @objc public dynamic var expectedSupplyDuration: Quantity?
    public func upsert(expectedSupplyDuration: Quantity?) {
        upsert(prop: &self.expectedSupplyDuration, val: expectedSupplyDuration)
    }
    @objc public dynamic var medicationCodeableConcept: CodeableConcept?
    public func upsert(medicationCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.medicationCodeableConcept, val: medicationCodeableConcept)
    }
    @objc public dynamic var medicationReference: Reference?
    public func upsert(medicationReference: Reference?) {
        upsert(prop: &self.medicationReference, val: medicationReference)
    }
    public let numberOfRepeatsAllowed = RealmOptional<Int>()
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    @objc public dynamic var validityPeriod: Period?
    public func upsert(validityPeriod: Period?) {
        upsert(prop: &self.validityPeriod, val: validityPeriod)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case expectedSupplyDuration = "expectedSupplyDuration"
        case medicationCodeableConcept = "medicationCodeableConcept"
        case medicationReference = "medicationReference"
        case numberOfRepeatsAllowed = "numberOfRepeatsAllowed"
        case quantity = "quantity"
        case validityPeriod = "validityPeriod"
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

        self.expectedSupplyDuration = try container.decodeIfPresent(Quantity.self, forKey: .expectedSupplyDuration)
        self.medicationCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .medicationCodeableConcept)
        self.medicationReference = try container.decodeIfPresent(Reference.self, forKey: .medicationReference)
        self.numberOfRepeatsAllowed.value = try container.decodeIfPresent(Int.self, forKey: .numberOfRepeatsAllowed)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.validityPeriod = try container.decodeIfPresent(Period.self, forKey: .validityPeriod)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.expectedSupplyDuration, forKey: .expectedSupplyDuration)
        try container.encodeIfPresent(self.medicationCodeableConcept, forKey: .medicationCodeableConcept)
        try container.encodeIfPresent(self.medicationReference, forKey: .medicationReference)
        try container.encodeIfPresent(self.numberOfRepeatsAllowed.value, forKey: .numberOfRepeatsAllowed)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.validityPeriod, forKey: .validityPeriod)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationOrderDispenseRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationOrderDispenseRequest. Will return empty instance: \(error))")
		}
		return MedicationOrderDispenseRequest.init()
	}
}


/**
 *  How medication should be taken.
 *
 *  Indicates how the medication is to be used by the patient.
 */
open class MedicationOrderDosageInstruction: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationOrderDosageInstruction" }
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
			let clone = try JSONDecoder().decode(MedicationOrderDosageInstruction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationOrderDosageInstruction. Will return empty instance: \(error))")
		}
		return MedicationOrderDosageInstruction.init()
	}
}


/**
 *  Any restrictions on medication substitution.
 *
 *  Indicates whether or not substitution can or should be part of the dispense. In some cases substitution must happen,
 *  in other cases substitution must not happen, and in others it does not matter. This block explains the prescriber's
 *  intent. If nothing is specified substitution may be done.
 */
open class MedicationOrderSubstitution: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationOrderSubstitution" }
	}

    @objc public dynamic var reason: CodeableConcept?
    public func upsert(reason: CodeableConcept?) {
        upsert(prop: &self.reason, val: reason)
    }
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

        self.reason = try container.decodeIfPresent(CodeableConcept.self, forKey: .reason)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationOrderSubstitution.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationOrderSubstitution. Will return empty instance: \(error))")
		}
		return MedicationOrderSubstitution.init()
	}
}

