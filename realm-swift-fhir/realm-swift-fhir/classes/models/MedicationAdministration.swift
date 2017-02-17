//
//  MedicationAdministration.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationAdministration) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
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
	
	public dynamic var dosage: MedicationAdministrationDosage?						
		
		
			public func upsert(dosage: MedicationAdministrationDosage?) {
				upsert(prop: &self.dosage, val: dosage)
			}
	
	public dynamic var effectiveTimeDateTime: DateTime?						
		
		
	
	public dynamic var effectiveTimePeriod: Period?						
		
		
			public func upsert(effectiveTimePeriod: Period?) {
				upsert(prop: &self.effectiveTimePeriod, val: effectiveTimePeriod)
			}
	
	public dynamic var encounter: Reference?						
		
		
			public func upsert(encounter: Reference?) {
				upsert(prop: &self.encounter, val: encounter)
			}
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var medicationCodeableConcept: CodeableConcept?						
		
		
			public func upsert(medicationCodeableConcept: CodeableConcept?) {
				upsert(prop: &self.medicationCodeableConcept, val: medicationCodeableConcept)
			}
	
	public dynamic var medicationReference: Reference?						
		
		
			public func upsert(medicationReference: Reference?) {
				upsert(prop: &self.medicationReference, val: medicationReference)
			}
	
	public dynamic var note: String?						
		
		
	
	public dynamic var patient: Reference?						
		
		
			public func upsert(patient: Reference?) {
				upsert(prop: &self.patient, val: patient)
			}
	
	public dynamic var practitioner: Reference?						
		
		
			public func upsert(practitioner: Reference?) {
				upsert(prop: &self.practitioner, val: practitioner)
			}
	
	public dynamic var prescription: Reference?						
		
		
			public func upsert(prescription: Reference?) {
				upsert(prop: &self.prescription, val: prescription)
			}
	
	public let reasonGiven = RealmSwift.List<CodeableConcept>()
	
	public let reasonNotGiven = RealmSwift.List<CodeableConcept>()
	
	public dynamic var status: String?						
		
		
	
	public let wasNotGiven = RealmOptional<Bool>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(effectiveTimeDateTime: DateTime, effectiveTimePeriod: Period, medicationCodeableConcept: CodeableConcept, medicationReference: Reference, patient: Reference, status: String) {
		self.init(json: nil)
		self.effectiveTimeDateTime = effectiveTimeDateTime
		self.effectiveTimePeriod = effectiveTimePeriod
		self.medicationCodeableConcept = medicationCodeableConcept
		self.medicationReference = medicationReference
		self.patient = patient
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["device"] {
				presentKeys.insert("device")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.device) }
						self.device.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "device", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["dosage"] {
				presentKeys.insert("dosage")
				if let val = exist as? FHIRJSON {
					upsert(dosage: MedicationAdministrationDosage(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dosage", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["effectiveTimeDateTime"] {
				presentKeys.insert("effectiveTimeDateTime")
				if let val = exist as? String {
					self.effectiveTimeDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "effectiveTimeDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["effectiveTimePeriod"] {
				presentKeys.insert("effectiveTimePeriod")
				if let val = exist as? FHIRJSON {
					upsert(effectiveTimePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "effectiveTimePeriod", wants: FHIRJSON.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "patient"))
			}
			if let exist = js["practitioner"] {
				presentKeys.insert("practitioner")
				if let val = exist as? FHIRJSON {
					upsert(practitioner: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "practitioner", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prescription"] {
				presentKeys.insert("prescription")
				if let val = exist as? FHIRJSON {
					upsert(prescription: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "prescription", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonGiven"] {
				presentKeys.insert("reasonGiven")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonGiven) }
						self.reasonGiven.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonGiven", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonNotGiven"] {
				presentKeys.insert("reasonNotGiven")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonNotGiven) }
						self.reasonNotGiven.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonNotGiven", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["wasNotGiven"] {
				presentKeys.insert("wasNotGiven")
				if let val = exist as? Bool {
					self.wasNotGiven.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "wasNotGiven", wants: Bool.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.effectiveTimeDateTime && nil == self.effectiveTimePeriod {
				errors.append(FHIRJSONError(key: "effectiveTime*"))
			}
			if nil == self.medicationCodeableConcept && nil == self.medicationReference {
				errors.append(FHIRJSONError(key: "medication*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if device.count > 0 {
			json["device"] = Array(device.map() { $0.asJSON() })
		}
		if let dosage = self.dosage {
			json["dosage"] = dosage.asJSON()
		}
		if let effectiveTimeDateTime = self.effectiveTimeDateTime {
			json["effectiveTimeDateTime"] = effectiveTimeDateTime.asJSON()
		}
		if let effectiveTimePeriod = self.effectiveTimePeriod {
			json["effectiveTimePeriod"] = effectiveTimePeriod.asJSON()
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
		if let practitioner = self.practitioner {
			json["practitioner"] = practitioner.asJSON()
		}
		if let prescription = self.prescription {
			json["prescription"] = prescription.asJSON()
		}
		if reasonGiven.count > 0 {
			json["reasonGiven"] = Array(reasonGiven.map() { $0.asJSON() })
		}
		if reasonNotGiven.count > 0 {
			json["reasonNotGiven"] = Array(reasonNotGiven.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let wasNotGiven = self.wasNotGiven.value {
			json["wasNotGiven"] = wasNotGiven.asJSON()
		}
		
		return json
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

	public dynamic var method: CodeableConcept?						
		
		
			public func upsert(method: CodeableConcept?) {
				upsert(prop: &self.method, val: method)
			}
	
	public dynamic var quantity: Quantity?						
		
		
			public func upsert(quantity: Quantity?) {
				upsert(prop: &self.quantity, val: quantity)
			}
	
	public dynamic var rateRange: Range?						
		
		
			public func upsert(rateRange: Range?) {
				upsert(prop: &self.rateRange, val: rateRange)
			}
	
	public dynamic var rateRatio: Ratio?						
		
		
			public func upsert(rateRatio: Ratio?) {
				upsert(prop: &self.rateRatio, val: rateRatio)
			}
	
	public dynamic var route: CodeableConcept?						
		
		
			public func upsert(route: CodeableConcept?) {
				upsert(prop: &self.route, val: route)
			}
	
	public dynamic var siteCodeableConcept: CodeableConcept?						
		
		
			public func upsert(siteCodeableConcept: CodeableConcept?) {
				upsert(prop: &self.siteCodeableConcept, val: siteCodeableConcept)
			}
	
	public dynamic var siteReference: Reference?						
		
		
			public func upsert(siteReference: Reference?) {
				upsert(prop: &self.siteReference, val: siteReference)
			}
	
	public dynamic var text: String?						
		
		
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? FHIRJSON {
					upsert(method: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
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
		
		return json
	}
}

