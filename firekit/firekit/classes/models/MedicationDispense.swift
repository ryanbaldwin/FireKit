//
//  MedicationDispense.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationDispense) on 2017-09-09.
//  2017, SMART Health IT.
//

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
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.authorizingPrescription.flatMap { $0 }, forKey: .authorizingPrescription)
        try container.encodeIfPresent(self.daysSupply, forKey: .daysSupply)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.dispenser, forKey: .dispenser)
        try container.encode(self.dosageInstruction.flatMap { $0 }, forKey: .dosageInstruction)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.medicationCodeableConcept, forKey: .medicationCodeableConcept)
        try container.encodeIfPresent(self.medicationReference, forKey: .medicationReference)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encode(self.receiver.flatMap { $0 }, forKey: .receiver)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.substitution, forKey: .substitution)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.whenHandedOver, forKey: .whenHandedOver)
        try container.encodeIfPresent(self.whenPrepared, forKey: .whenPrepared)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["authorizingPrescription"] {
				presentKeys.insert("authorizingPrescription")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.authorizingPrescription) }
						self.authorizingPrescription.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "authorizingPrescription", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["daysSupply"] {
				presentKeys.insert("daysSupply")
				if let val = exist as? FHIRJSON {
					upsert(daysSupply: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "daysSupply", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? FHIRJSON {
					upsert(destination: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dispenser"] {
				presentKeys.insert("dispenser")
				if let val = exist as? FHIRJSON {
					upsert(dispenser: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dispenser", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dosageInstruction"] {
				presentKeys.insert("dosageInstruction")
				if let val = exist as? [FHIRJSON] {
					if let vals = MedicationDispenseDosageInstruction.instantiate(fromArray: val, owner: self) as? [MedicationDispenseDosageInstruction] {
						if let realm = self.realm { realm.delete(self.dosageInstruction) }
						self.dosageInstruction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dosageInstruction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["receiver"] {
				presentKeys.insert("receiver")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.receiver) }
						self.receiver.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "receiver", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
					upsert(substitution: MedicationDispenseSubstitution(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "substitution", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["whenHandedOver"] {
				presentKeys.insert("whenHandedOver")
				if let val = exist as? String {
					self.whenHandedOver = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "whenHandedOver", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["whenPrepared"] {
				presentKeys.insert("whenPrepared")
				if let val = exist as? String {
					self.whenPrepared = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "whenPrepared", wants: String.self, has: type(of: exist)))
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
		
		if authorizingPrescription.count > 0 {
			json["authorizingPrescription"] = Array(authorizingPrescription.map() { $0.asJSON() })
		}
		if let daysSupply = self.daysSupply {
			json["daysSupply"] = daysSupply.asJSON()
		}
		if let destination = self.destination {
			json["destination"] = destination.asJSON()
		}
		if let dispenser = self.dispenser {
			json["dispenser"] = dispenser.asJSON()
		}
		if dosageInstruction.count > 0 {
			json["dosageInstruction"] = Array(dosageInstruction.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
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
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if receiver.count > 0 {
			json["receiver"] = Array(receiver.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let substitution = self.substitution {
			json["substitution"] = substitution.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let whenHandedOver = self.whenHandedOver {
			json["whenHandedOver"] = whenHandedOver.asJSON()
		}
		if let whenPrepared = self.whenPrepared {
			json["whenPrepared"] = whenPrepared.asJSON()
		}
		
		return json
	}
*/
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.reason.flatMap { $0 }, forKey: .reason)
        try container.encode(self.responsibleParty.flatMap { $0 }, forKey: .responsibleParty)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reason) }
						self.reason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["responsibleParty"] {
				presentKeys.insert("responsibleParty")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.responsibleParty) }
						self.responsibleParty.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "responsibleParty", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if reason.count > 0 {
			json["reason"] = Array(reason.map() { $0.asJSON() })
		}
		if responsibleParty.count > 0 {
			json["responsibleParty"] = Array(responsibleParty.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}

