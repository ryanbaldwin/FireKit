//
//  MedicationDispense.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationDispense) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
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
	
	public dynamic var daysSupply: Quantity?
	
	public dynamic var destination: Reference?
	
	public dynamic var dispenser: Reference?
	
	public let dosageInstruction = RealmSwift.List<MedicationDispenseDosageInstruction>()
	
	public dynamic var identifier: Identifier?
	
	public dynamic var medicationCodeableConcept: CodeableConcept?
	
	public dynamic var medicationReference: Reference?
	
	public dynamic var note: String?
	
	public dynamic var patient: Reference?
	
	public dynamic var quantity: Quantity?
	
	public let receiver = RealmSwift.List<Reference>()
	
	public dynamic var status: String?
	
	public dynamic var substitution: MedicationDispenseSubstitution?
	
	public dynamic var type: CodeableConcept?
	
	public dynamic var whenHandedOver: DateTime?
	
	public dynamic var whenPrepared: DateTime?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(medicationCodeableConcept: CodeableConcept, medicationReference: Reference) {
		self.init(json: nil)
		self.medicationCodeableConcept = medicationCodeableConcept
		self.medicationReference = medicationReference
	}
	
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
					if let daysSupply = self.daysSupply {
                        errors.append(contentsOf: daysSupply.populate(from: val) ?? [])
                    } else {
                        self.daysSupply = Quantity(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "daysSupply", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? FHIRJSON {
					if let destination = self.destination {
                        errors.append(contentsOf: destination.populate(from: val) ?? [])
                    } else {
                        self.destination = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dispenser"] {
				presentKeys.insert("dispenser")
				if let val = exist as? FHIRJSON {
					if let dispenser = self.dispenser {
                        errors.append(contentsOf: dispenser.populate(from: val) ?? [])
                    } else {
                        self.dispenser = Reference(json: val, owner: self)
                    }
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
					if let identifier = self.identifier {
                        errors.append(contentsOf: identifier.populate(from: val) ?? [])
                    } else {
                        self.identifier = Identifier(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["medicationCodeableConcept"] {
				presentKeys.insert("medicationCodeableConcept")
				if let val = exist as? FHIRJSON {
					if let medicationCodeableConcept = self.medicationCodeableConcept {
                        errors.append(contentsOf: medicationCodeableConcept.populate(from: val) ?? [])
                    } else {
                        self.medicationCodeableConcept = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "medicationCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["medicationReference"] {
				presentKeys.insert("medicationReference")
				if let val = exist as? FHIRJSON {
					if let medicationReference = self.medicationReference {
                        errors.append(contentsOf: medicationReference.populate(from: val) ?? [])
                    } else {
                        self.medicationReference = Reference(json: val, owner: self)
                    }
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
					if let patient = self.patient {
                        errors.append(contentsOf: patient.populate(from: val) ?? [])
                    } else {
                        self.patient = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					if let quantity = self.quantity {
                        errors.append(contentsOf: quantity.populate(from: val) ?? [])
                    } else {
                        self.quantity = Quantity(json: val, owner: self)
                    }
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
					if let substitution = self.substitution {
                        errors.append(contentsOf: substitution.populate(from: val) ?? [])
                    } else {
                        self.substitution = MedicationDispenseSubstitution(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "substitution", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					if let type = self.type {
                        errors.append(contentsOf: type.populate(from: val) ?? [])
                    } else {
                        self.type = CodeableConcept(json: val, owner: self)
                    }
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

	public dynamic var additionalInstructions: CodeableConcept?
	
	public let asNeededBoolean = RealmOptional<Bool>()
	
	public dynamic var asNeededCodeableConcept: CodeableConcept?
	
	public dynamic var doseQuantity: Quantity?
	
	public dynamic var doseRange: Range?
	
	public dynamic var maxDosePerPeriod: Ratio?
	
	public dynamic var method: CodeableConcept?
	
	public dynamic var rateRange: Range?
	
	public dynamic var rateRatio: Ratio?
	
	public dynamic var route: CodeableConcept?
	
	public dynamic var siteCodeableConcept: CodeableConcept?
	
	public dynamic var siteReference: Reference?
	
	public dynamic var text: String?
	
	public dynamic var timing: Timing?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["additionalInstructions"] {
				presentKeys.insert("additionalInstructions")
				if let val = exist as? FHIRJSON {
					if let additionalInstructions = self.additionalInstructions {
                        errors.append(contentsOf: additionalInstructions.populate(from: val) ?? [])
                    } else {
                        self.additionalInstructions = CodeableConcept(json: val, owner: self)
                    }
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
					if let asNeededCodeableConcept = self.asNeededCodeableConcept {
                        errors.append(contentsOf: asNeededCodeableConcept.populate(from: val) ?? [])
                    } else {
                        self.asNeededCodeableConcept = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "asNeededCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["doseQuantity"] {
				presentKeys.insert("doseQuantity")
				if let val = exist as? FHIRJSON {
					if let doseQuantity = self.doseQuantity {
                        errors.append(contentsOf: doseQuantity.populate(from: val) ?? [])
                    } else {
                        self.doseQuantity = Quantity(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "doseQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["doseRange"] {
				presentKeys.insert("doseRange")
				if let val = exist as? FHIRJSON {
					if let doseRange = self.doseRange {
                        errors.append(contentsOf: doseRange.populate(from: val) ?? [])
                    } else {
                        self.doseRange = Range(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "doseRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxDosePerPeriod"] {
				presentKeys.insert("maxDosePerPeriod")
				if let val = exist as? FHIRJSON {
					if let maxDosePerPeriod = self.maxDosePerPeriod {
                        errors.append(contentsOf: maxDosePerPeriod.populate(from: val) ?? [])
                    } else {
                        self.maxDosePerPeriod = Ratio(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "maxDosePerPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? FHIRJSON {
					if let method = self.method {
                        errors.append(contentsOf: method.populate(from: val) ?? [])
                    } else {
                        self.method = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rateRange"] {
				presentKeys.insert("rateRange")
				if let val = exist as? FHIRJSON {
					if let rateRange = self.rateRange {
                        errors.append(contentsOf: rateRange.populate(from: val) ?? [])
                    } else {
                        self.rateRange = Range(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "rateRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rateRatio"] {
				presentKeys.insert("rateRatio")
				if let val = exist as? FHIRJSON {
					if let rateRatio = self.rateRatio {
                        errors.append(contentsOf: rateRatio.populate(from: val) ?? [])
                    } else {
                        self.rateRatio = Ratio(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "rateRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["route"] {
				presentKeys.insert("route")
				if let val = exist as? FHIRJSON {
					if let route = self.route {
                        errors.append(contentsOf: route.populate(from: val) ?? [])
                    } else {
                        self.route = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "route", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["siteCodeableConcept"] {
				presentKeys.insert("siteCodeableConcept")
				if let val = exist as? FHIRJSON {
					if let siteCodeableConcept = self.siteCodeableConcept {
                        errors.append(contentsOf: siteCodeableConcept.populate(from: val) ?? [])
                    } else {
                        self.siteCodeableConcept = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "siteCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["siteReference"] {
				presentKeys.insert("siteReference")
				if let val = exist as? FHIRJSON {
					if let siteReference = self.siteReference {
                        errors.append(contentsOf: siteReference.populate(from: val) ?? [])
                    } else {
                        self.siteReference = Reference(json: val, owner: self)
                    }
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
					if let timing = self.timing {
                        errors.append(contentsOf: timing.populate(from: val) ?? [])
                    } else {
                        self.timing = Timing(json: val, owner: self)
                    }
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
	
	public dynamic var type: CodeableConcept?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(type: CodeableConcept) {
		self.init(json: nil)
		self.type = type
	}
	
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
					if let type = self.type {
                        errors.append(contentsOf: type.populate(from: val) ?? [])
                    } else {
                        self.type = CodeableConcept(json: val, owner: self)
                    }
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
}

