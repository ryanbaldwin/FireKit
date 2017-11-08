//
//  MedicationStatement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationStatement) on 2017-11-07.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-07
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Record of medication being taken by a patient.
 *
 *  A record of a medication that is being consumed by a patient.   A MedicationStatement may indicate that the patient
 *  may be taking the medication now, or has taken the medication in the past or will be taking the medication in the
 *  future.  The source of this information can be the patient, significant other (such as a family member or spouse),
 *  or a clinician.  A common scenario where this information is captured is during the history taking process during a
 *  patient visit or stay.   The medication information may come from e.g. the patient's memory, from a prescription
 *  bottle,  or from a list of medications the patient, clinician or other party maintains The primary difference
 *  between a medication statement and a medication administration is that the medication administration has complete
 *  administration information and is based on actual administration information from the person who administered the
 *  medication.  A medication statement is often, if not always, less specific.  There is no required date/time when the
 *  medication was administered, in fact we only know that a source has reported the patient is taking this medication,
 *  where details such as time, quantity, or rate or even medication product may be incomplete or missing or less
 *  precise.  As stated earlier, the medication statement information may come from the patient's memory, from a
 *  prescription bottle or from a list of medications the patient, clinician or other party maintains.  Medication
 *  administration is more formal and is not missing detailed information.
 */
open class MedicationStatement: DomainResource {
	override open class var resourceType: String {
		get { return "MedicationStatement" }
	}

    @objc public dynamic var dateAsserted: DateTime?
    public let dosage = RealmSwift.List<MedicationStatementDosage>()
    @objc public dynamic var effectiveDateTime: DateTime?
    @objc public dynamic var effectivePeriod: Period?
    public func upsert(effectivePeriod: Period?) {
        upsert(prop: &self.effectivePeriod, val: effectivePeriod)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var informationSource: Reference?
    public func upsert(informationSource: Reference?) {
        upsert(prop: &self.informationSource, val: informationSource)
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
    @objc public dynamic var reasonForUseCodeableConcept: CodeableConcept?
    public func upsert(reasonForUseCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonForUseCodeableConcept, val: reasonForUseCodeableConcept)
    }
    @objc public dynamic var reasonForUseReference: Reference?
    public func upsert(reasonForUseReference: Reference?) {
        upsert(prop: &self.reasonForUseReference, val: reasonForUseReference)
    }
    public let reasonNotTaken = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var status: String?
    public let supportingInformation = RealmSwift.List<Reference>()
    public let wasNotTaken = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(medicationCodeableConcept: CodeableConcept, medicationReference: Reference, patient: Reference, status: String) {
        self.init()
        self.medicationCodeableConcept = medicationCodeableConcept
        self.medicationReference = medicationReference
        self.patient = patient
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case dateAsserted = "dateAsserted"
        case dosage = "dosage"
        case effectiveDateTime = "effectiveDateTime"
        case effectivePeriod = "effectivePeriod"
        case identifier = "identifier"
        case informationSource = "informationSource"
        case medicationCodeableConcept = "medicationCodeableConcept"
        case medicationReference = "medicationReference"
        case note = "note"
        case patient = "patient"
        case reasonForUseCodeableConcept = "reasonForUseCodeableConcept"
        case reasonForUseReference = "reasonForUseReference"
        case reasonNotTaken = "reasonNotTaken"
        case status = "status"
        case supportingInformation = "supportingInformation"
        case wasNotTaken = "wasNotTaken"
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

        self.dateAsserted = try container.decodeIfPresent(DateTime.self, forKey: .dateAsserted)
        self.dosage.append(objectsIn: try container.decodeIfPresent([MedicationStatementDosage].self, forKey: .dosage) ?? [])
        self.effectiveDateTime = try container.decodeIfPresent(DateTime.self, forKey: .effectiveDateTime)
        self.effectivePeriod = try container.decodeIfPresent(Period.self, forKey: .effectivePeriod)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.informationSource = try container.decodeIfPresent(Reference.self, forKey: .informationSource)
        self.medicationCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .medicationCodeableConcept)
        self.medicationReference = try container.decodeIfPresent(Reference.self, forKey: .medicationReference)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.reasonForUseCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonForUseCodeableConcept)
        self.reasonForUseReference = try container.decodeIfPresent(Reference.self, forKey: .reasonForUseReference)
        self.reasonNotTaken.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reasonNotTaken) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.supportingInformation.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supportingInformation) ?? [])
        self.wasNotTaken.value = try container.decodeIfPresent(Bool.self, forKey: .wasNotTaken)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.dateAsserted, forKey: .dateAsserted)
        try container.encode(Array(self.dosage), forKey: .dosage)
        try container.encodeIfPresent(self.effectiveDateTime, forKey: .effectiveDateTime)
        try container.encodeIfPresent(self.effectivePeriod, forKey: .effectivePeriod)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.informationSource, forKey: .informationSource)
        try container.encodeIfPresent(self.medicationCodeableConcept, forKey: .medicationCodeableConcept)
        try container.encodeIfPresent(self.medicationReference, forKey: .medicationReference)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.reasonForUseCodeableConcept, forKey: .reasonForUseCodeableConcept)
        try container.encodeIfPresent(self.reasonForUseReference, forKey: .reasonForUseReference)
        try container.encode(Array(self.reasonNotTaken), forKey: .reasonNotTaken)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.supportingInformation), forKey: .supportingInformation)
        try container.encodeIfPresent(self.wasNotTaken.value, forKey: .wasNotTaken)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationStatement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationStatement. Will return empty instance: \(error))")
		}
		return MedicationStatement.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationStatement else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.dateAsserted, from: o.dateAsserted)

        for (index, t) in o.dosage.enumerated() {
            guard index < self.dosage.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = MedicationStatementDosage()
                val.populate(from: t)
                self.dosage.append(val)
                continue
            }
            self.dosage[index].populate(from: t)
        }
    
        while self.dosage.count > o.dosage.count {
            let objectToRemove = self.dosage.last!
            self.dosage.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.effectiveDateTime, from: o.effectiveDateTime)
        FireKit.populate(&self.effectivePeriod, from: o.effectivePeriod)

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
        FireKit.populate(&self.informationSource, from: o.informationSource)
        FireKit.populate(&self.medicationCodeableConcept, from: o.medicationCodeableConcept)
        FireKit.populate(&self.medicationReference, from: o.medicationReference)
        note = o.note
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.reasonForUseCodeableConcept, from: o.reasonForUseCodeableConcept)
        FireKit.populate(&self.reasonForUseReference, from: o.reasonForUseReference)

        for (index, t) in o.reasonNotTaken.enumerated() {
            guard index < self.reasonNotTaken.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.reasonNotTaken.append(val)
                continue
            }
            self.reasonNotTaken[index].populate(from: t)
        }
    
        while self.reasonNotTaken.count > o.reasonNotTaken.count {
            let objectToRemove = self.reasonNotTaken.last!
            self.reasonNotTaken.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        status = o.status

        for (index, t) in o.supportingInformation.enumerated() {
            guard index < self.supportingInformation.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Reference()
                val.populate(from: t)
                self.supportingInformation.append(val)
                continue
            }
            self.supportingInformation[index].populate(from: t)
        }
    
        while self.supportingInformation.count > o.supportingInformation.count {
            let objectToRemove = self.supportingInformation.last!
            self.supportingInformation.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        wasNotTaken.value = o.wasNotTaken.value
    }
}


/**
 *  Details of how medication was taken.
 *
 *  Indicates how the medication is/was used by the patient.
 */
open class MedicationStatementDosage: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationStatementDosage" }
	}

    public let asNeededBoolean = RealmOptional<Bool>()
    @objc public dynamic var asNeededCodeableConcept: CodeableConcept?
    public func upsert(asNeededCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.asNeededCodeableConcept, val: asNeededCodeableConcept)
    }
    @objc public dynamic var maxDosePerPeriod: Ratio?
    public func upsert(maxDosePerPeriod: Ratio?) {
        upsert(prop: &self.maxDosePerPeriod, val: maxDosePerPeriod)
    }
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    @objc public dynamic var quantityQuantity: Quantity?
    public func upsert(quantityQuantity: Quantity?) {
        upsert(prop: &self.quantityQuantity, val: quantityQuantity)
    }
    @objc public dynamic var quantityRange: Range?
    public func upsert(quantityRange: Range?) {
        upsert(prop: &self.quantityRange, val: quantityRange)
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
        case asNeededBoolean = "asNeededBoolean"
        case asNeededCodeableConcept = "asNeededCodeableConcept"
        case maxDosePerPeriod = "maxDosePerPeriod"
        case method = "method"
        case quantityQuantity = "quantityQuantity"
        case quantityRange = "quantityRange"
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

        self.asNeededBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .asNeededBoolean)
        self.asNeededCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .asNeededCodeableConcept)
        self.maxDosePerPeriod = try container.decodeIfPresent(Ratio.self, forKey: .maxDosePerPeriod)
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.quantityQuantity = try container.decodeIfPresent(Quantity.self, forKey: .quantityQuantity)
        self.quantityRange = try container.decodeIfPresent(Range.self, forKey: .quantityRange)
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
        try container.encodeIfPresent(self.asNeededBoolean.value, forKey: .asNeededBoolean)
        try container.encodeIfPresent(self.asNeededCodeableConcept, forKey: .asNeededCodeableConcept)
        try container.encodeIfPresent(self.maxDosePerPeriod, forKey: .maxDosePerPeriod)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.quantityQuantity, forKey: .quantityQuantity)
        try container.encodeIfPresent(self.quantityRange, forKey: .quantityRange)
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
			let clone = try JSONDecoder().decode(MedicationStatementDosage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationStatementDosage. Will return empty instance: \(error))")
		}
		return MedicationStatementDosage.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? MedicationStatementDosage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        asNeededBoolean.value = o.asNeededBoolean.value
        FireKit.populate(&self.asNeededCodeableConcept, from: o.asNeededCodeableConcept)
        FireKit.populate(&self.maxDosePerPeriod, from: o.maxDosePerPeriod)
        FireKit.populate(&self.method, from: o.method)
        FireKit.populate(&self.quantityQuantity, from: o.quantityQuantity)
        FireKit.populate(&self.quantityRange, from: o.quantityRange)
        FireKit.populate(&self.rateRange, from: o.rateRange)
        FireKit.populate(&self.rateRatio, from: o.rateRatio)
        FireKit.populate(&self.route, from: o.route)
        FireKit.populate(&self.siteCodeableConcept, from: o.siteCodeableConcept)
        FireKit.populate(&self.siteReference, from: o.siteReference)
        text = o.text
        FireKit.populate(&self.timing, from: o.timing)
    }
}

