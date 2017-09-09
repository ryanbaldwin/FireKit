//
//  MedicationOrder.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationOrder) on 2017-09-09.
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
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.dateEnded, forKey: .dateEnded)
        try container.encodeIfPresent(self.dateWritten, forKey: .dateWritten)
        try container.encodeIfPresent(self.dispenseRequest, forKey: .dispenseRequest)
        try container.encode(self.dosageInstruction.flatMap { $0 }, forKey: .dosageInstruction)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["dateEnded"] {
				presentKeys.insert("dateEnded")
				if let val = exist as? String {
					self.dateEnded = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateEnded", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dateWritten"] {
				presentKeys.insert("dateWritten")
				if let val = exist as? String {
					self.dateWritten = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateWritten", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dispenseRequest"] {
				presentKeys.insert("dispenseRequest")
				if let val = exist as? FHIRJSON {
					upsert(dispenseRequest: MedicationOrderDispenseRequest(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dispenseRequest", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dosageInstruction"] {
				presentKeys.insert("dosageInstruction")
				if let val = exist as? [FHIRJSON] {
					if let vals = MedicationOrderDosageInstruction.instantiate(fromArray: val, owner: self) as? [MedicationOrderDosageInstruction] {
						if let realm = self.realm { realm.delete(self.dosageInstruction) }
						self.dosageInstruction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dosageInstruction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["medicationCodeableConcept"] {
				presentKeys.insert("medicationCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(medicationCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "medicationCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["medicationReference"] {
				presentKeys.insert("medicationReference")
				if let val = exist as? FHIRJSON {
					upsert(medicationReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "medicationReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? String {
					self.note = val
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					upsert(patient: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prescriber"] {
				presentKeys.insert("prescriber")
				if let val = exist as? FHIRJSON {
					upsert(prescriber: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "prescriber", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["priorPrescription"] {
				presentKeys.insert("priorPrescription")
				if let val = exist as? FHIRJSON {
					upsert(priorPrescription: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "priorPrescription", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonCodeableConcept"] {
				presentKeys.insert("reasonCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(reasonCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonEnded"] {
				presentKeys.insert("reasonEnded")
				if let val = exist as? FHIRJSON {
					upsert(reasonEnded: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonEnded", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonReference"] {
				presentKeys.insert("reasonReference")
				if let val = exist as? FHIRJSON {
					upsert(reasonReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["substitution"] {
				presentKeys.insert("substitution")
				if let val = exist as? FHIRJSON {
					upsert(substitution: MedicationOrderSubstitution(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "substitution", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.medicationCodeableConcept && nil == self.medicationReference {
				errors.append(FHIRJSONError(key: "medication*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let dateEnded = self.dateEnded {
			json["dateEnded"] = dateEnded.asJSON()
		}
		if let dateWritten = self.dateWritten {
			json["dateWritten"] = dateWritten.asJSON()
		}
		if let dispenseRequest = self.dispenseRequest {
			json["dispenseRequest"] = dispenseRequest.asJSON()
		}
		if dosageInstruction.count > 0 {
			json["dosageInstruction"] = Array(dosageInstruction.map() { $0.asJSON() })
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let medicationCodeableConcept = self.medicationCodeableConcept {
			json["medicationCodeableConcept"] = medicationCodeableConcept.asJSON()
		}
		if let medicationReference = self.medicationReference {
			json["medicationReference"] = medicationReference.asJSON()
		}
		if let note = self.note {
			json["note"] = note.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let prescriber = self.prescriber {
			json["prescriber"] = prescriber.asJSON()
		}
		if let priorPrescription = self.priorPrescription {
			json["priorPrescription"] = priorPrescription.asJSON()
		}
		if let reasonCodeableConcept = self.reasonCodeableConcept {
			json["reasonCodeableConcept"] = reasonCodeableConcept.asJSON()
		}
		if let reasonEnded = self.reasonEnded {
			json["reasonEnded"] = reasonEnded.asJSON()
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let substitution = self.substitution {
			json["substitution"] = substitution.asJSON()
		}
		
		return json
	}
*/
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
        self.numberOfRepeatsAllowed.value = try container.decodeIfPresent(Int.self, forKey: .numberOfRepeatsAllowed)
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["expectedSupplyDuration"] {
				presentKeys.insert("expectedSupplyDuration")
				if let val = exist as? FHIRJSON {
					upsert(expectedSupplyDuration: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "expectedSupplyDuration", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["medicationCodeableConcept"] {
				presentKeys.insert("medicationCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(medicationCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "medicationCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["medicationReference"] {
				presentKeys.insert("medicationReference")
				if let val = exist as? FHIRJSON {
					upsert(medicationReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "medicationReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["numberOfRepeatsAllowed"] {
				presentKeys.insert("numberOfRepeatsAllowed")
				if let val = exist as? Int {
					self.numberOfRepeatsAllowed.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "numberOfRepeatsAllowed", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["validityPeriod"] {
				presentKeys.insert("validityPeriod")
				if let val = exist as? FHIRJSON {
					upsert(validityPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "validityPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let expectedSupplyDuration = self.expectedSupplyDuration {
			json["expectedSupplyDuration"] = expectedSupplyDuration.asJSON()
		}
		if let medicationCodeableConcept = self.medicationCodeableConcept {
			json["medicationCodeableConcept"] = medicationCodeableConcept.asJSON()
		}
		if let medicationReference = self.medicationReference {
			json["medicationReference"] = medicationReference.asJSON()
		}
		if let numberOfRepeatsAllowed = self.numberOfRepeatsAllowed.value {
			json["numberOfRepeatsAllowed"] = numberOfRepeatsAllowed.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let validityPeriod = self.validityPeriod {
			json["validityPeriod"] = validityPeriod.asJSON()
		}
		
		return json
	}
*/
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
        self.asNeededBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .asNeededBoolean)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["additionalInstructions"] {
				presentKeys.insert("additionalInstructions")
				if let val = exist as? FHIRJSON {
					upsert(additionalInstructions: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "additionalInstructions", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["asNeededBoolean"] {
				presentKeys.insert("asNeededBoolean")
				if let val = exist as? Bool {
					self.asNeededBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "asNeededBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["asNeededCodeableConcept"] {
				presentKeys.insert("asNeededCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(asNeededCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "asNeededCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["doseQuantity"] {
				presentKeys.insert("doseQuantity")
				if let val = exist as? FHIRJSON {
					upsert(doseQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "doseQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["doseRange"] {
				presentKeys.insert("doseRange")
				if let val = exist as? FHIRJSON {
					upsert(doseRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "doseRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxDosePerPeriod"] {
				presentKeys.insert("maxDosePerPeriod")
				if let val = exist as? FHIRJSON {
					upsert(maxDosePerPeriod: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxDosePerPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? FHIRJSON {
					upsert(method: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rateRange"] {
				presentKeys.insert("rateRange")
				if let val = exist as? FHIRJSON {
					upsert(rateRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "rateRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rateRatio"] {
				presentKeys.insert("rateRatio")
				if let val = exist as? FHIRJSON {
					upsert(rateRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "rateRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["route"] {
				presentKeys.insert("route")
				if let val = exist as? FHIRJSON {
					upsert(route: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "route", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["siteCodeableConcept"] {
				presentKeys.insert("siteCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(siteCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "siteCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["siteReference"] {
				presentKeys.insert("siteReference")
				if let val = exist as? FHIRJSON {
					upsert(siteReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "siteReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["timing"] {
				presentKeys.insert("timing")
				if let val = exist as? FHIRJSON {
					upsert(timing: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "timing", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let additionalInstructions = self.additionalInstructions {
			json["additionalInstructions"] = additionalInstructions.asJSON()
		}
		if let asNeededBoolean = self.asNeededBoolean.value {
			json["asNeededBoolean"] = asNeededBoolean.asJSON()
		}
		if let asNeededCodeableConcept = self.asNeededCodeableConcept {
			json["asNeededCodeableConcept"] = asNeededCodeableConcept.asJSON()
		}
		if let doseQuantity = self.doseQuantity {
			json["doseQuantity"] = doseQuantity.asJSON()
		}
		if let doseRange = self.doseRange {
			json["doseRange"] = doseRange.asJSON()
		}
		if let maxDosePerPeriod = self.maxDosePerPeriod {
			json["maxDosePerPeriod"] = maxDosePerPeriod.asJSON()
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let rateRange = self.rateRange {
			json["rateRange"] = rateRange.asJSON()
		}
		if let rateRatio = self.rateRatio {
			json["rateRatio"] = rateRatio.asJSON()
		}
		if let route = self.route {
			json["route"] = route.asJSON()
		}
		if let siteCodeableConcept = self.siteCodeableConcept {
			json["siteCodeableConcept"] = siteCodeableConcept.asJSON()
		}
		if let siteReference = self.siteReference {
			json["siteReference"] = siteReference.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let timing = self.timing {
			json["timing"] = timing.asJSON()
		}
		
		return json
	}
*/
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? FHIRJSON {
					upsert(reason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}

