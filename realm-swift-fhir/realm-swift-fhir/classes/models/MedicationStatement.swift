//
//  MedicationStatement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MedicationStatement) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
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

	public dynamic var dateAsserted: DateTime?
	
	public let dosage = RealmSwift.List<MedicationStatementDosage>()
	
	public dynamic var effectiveDateTime: DateTime?
	
	public dynamic var effectivePeriod: Period?
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var informationSource: Reference?
	
	public dynamic var medicationCodeableConcept: CodeableConcept?
	
	public dynamic var medicationReference: Reference?
	
	public dynamic var note: String?
	
	public dynamic var patient: Reference?
	
	public dynamic var reasonForUseCodeableConcept: CodeableConcept?
	
	public dynamic var reasonForUseReference: Reference?
	
	public let reasonNotTaken = RealmSwift.List<CodeableConcept>()
	
	public dynamic var status: String?
	
	public let supportingInformation = RealmSwift.List<Reference>()
	
	public let wasNotTaken = RealmOptional<Bool>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(medicationCodeableConcept: CodeableConcept, medicationReference: Reference, patient: Reference, status: String) {
		self.init(json: nil)
		self.medicationCodeableConcept = medicationCodeableConcept
		self.medicationReference = medicationReference
		self.patient = patient
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["dateAsserted"] {
				presentKeys.insert("dateAsserted")
				if let val = exist as? String {
					self.dateAsserted = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateAsserted", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dosage"] {
				presentKeys.insert("dosage")
				if let val = exist as? [FHIRJSON] {
					if let vals = MedicationStatementDosage.instantiate(fromArray: val, owner: self) as? [MedicationStatementDosage] {
						if let realm = self.realm { realm.delete(self.dosage) }
						self.dosage.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dosage", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["effectiveDateTime"] {
				presentKeys.insert("effectiveDateTime")
				if let val = exist as? String {
					self.effectiveDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "effectiveDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["effectivePeriod"] {
				presentKeys.insert("effectivePeriod")
				if let val = exist as? FHIRJSON {
					if let effectivePeriod = self.effectivePeriod {
                        errors.append(contentsOf: effectivePeriod.populate(from: val) ?? [])
                    } else {
                        self.effectivePeriod = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "effectivePeriod", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["informationSource"] {
				presentKeys.insert("informationSource")
				if let val = exist as? FHIRJSON {
					if let informationSource = self.informationSource {
                        errors.append(contentsOf: informationSource.populate(from: val) ?? [])
                    } else {
                        self.informationSource = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "informationSource", wants: FHIRJSON.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "patient"))
			}
			if let exist = js["reasonForUseCodeableConcept"] {
				presentKeys.insert("reasonForUseCodeableConcept")
				if let val = exist as? FHIRJSON {
					if let reasonForUseCodeableConcept = self.reasonForUseCodeableConcept {
                        errors.append(contentsOf: reasonForUseCodeableConcept.populate(from: val) ?? [])
                    } else {
                        self.reasonForUseCodeableConcept = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "reasonForUseCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonForUseReference"] {
				presentKeys.insert("reasonForUseReference")
				if let val = exist as? FHIRJSON {
					if let reasonForUseReference = self.reasonForUseReference {
                        errors.append(contentsOf: reasonForUseReference.populate(from: val) ?? [])
                    } else {
                        self.reasonForUseReference = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "reasonForUseReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonNotTaken"] {
				presentKeys.insert("reasonNotTaken")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonNotTaken) }
						self.reasonNotTaken.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonNotTaken", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["supportingInformation"] {
				presentKeys.insert("supportingInformation")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.supportingInformation) }
						self.supportingInformation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "supportingInformation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["wasNotTaken"] {
				presentKeys.insert("wasNotTaken")
				if let val = exist as? Bool {
					self.wasNotTaken.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "wasNotTaken", wants: Bool.self, has: type(of: exist)))
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
		
		if let dateAsserted = self.dateAsserted {
			json["dateAsserted"] = dateAsserted.asJSON()
		}
		if dosage.count > 0 {
			json["dosage"] = Array(dosage.map() { $0.asJSON() })
		}
		if let effectiveDateTime = self.effectiveDateTime {
			json["effectiveDateTime"] = effectiveDateTime.asJSON()
		}
		if let effectivePeriod = self.effectivePeriod {
			json["effectivePeriod"] = effectivePeriod.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let informationSource = self.informationSource {
			json["informationSource"] = informationSource.asJSON()
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
		if let reasonForUseCodeableConcept = self.reasonForUseCodeableConcept {
			json["reasonForUseCodeableConcept"] = reasonForUseCodeableConcept.asJSON()
		}
		if let reasonForUseReference = self.reasonForUseReference {
			json["reasonForUseReference"] = reasonForUseReference.asJSON()
		}
		if reasonNotTaken.count > 0 {
			json["reasonNotTaken"] = Array(reasonNotTaken.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if supportingInformation.count > 0 {
			json["supportingInformation"] = Array(supportingInformation.map() { $0.asJSON() })
		}
		if let wasNotTaken = self.wasNotTaken.value {
			json["wasNotTaken"] = wasNotTaken.asJSON()
		}
		
		return json
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
	
	public dynamic var asNeededCodeableConcept: CodeableConcept?
	
	public dynamic var maxDosePerPeriod: Ratio?
	
	public dynamic var method: CodeableConcept?
	
	public dynamic var quantityQuantity: Quantity?
	
	public dynamic var quantityRange: Range?
	
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
			if let exist = js["quantityQuantity"] {
				presentKeys.insert("quantityQuantity")
				if let val = exist as? FHIRJSON {
					if let quantityQuantity = self.quantityQuantity {
                        errors.append(contentsOf: quantityQuantity.populate(from: val) ?? [])
                    } else {
                        self.quantityQuantity = Quantity(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "quantityQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantityRange"] {
				presentKeys.insert("quantityRange")
				if let val = exist as? FHIRJSON {
					if let quantityRange = self.quantityRange {
                        errors.append(contentsOf: quantityRange.populate(from: val) ?? [])
                    } else {
                        self.quantityRange = Range(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "quantityRange", wants: FHIRJSON.self, has: type(of: exist)))
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
		
		if let asNeededBoolean = self.asNeededBoolean.value {
			json["asNeededBoolean"] = asNeededBoolean.asJSON()
		}
		if let asNeededCodeableConcept = self.asNeededCodeableConcept {
			json["asNeededCodeableConcept"] = asNeededCodeableConcept.asJSON()
		}
		if let maxDosePerPeriod = self.maxDosePerPeriod {
			json["maxDosePerPeriod"] = maxDosePerPeriod.asJSON()
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let quantityQuantity = self.quantityQuantity {
			json["quantityQuantity"] = quantityQuantity.asJSON()
		}
		if let quantityRange = self.quantityRange {
			json["quantityRange"] = quantityRange.asJSON()
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

