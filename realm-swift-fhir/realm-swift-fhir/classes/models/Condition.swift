//
//  Condition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Condition) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Detailed information about conditions, problems or diagnoses.
 *
 *  Use to record detailed information about conditions, problems or diagnoses recognized by a clinician. There are many
 *  uses including: recording a diagnosis during an encounter; populating a problem list or a summary statement, such as
 *  a discharge summary.
 */
open class Condition: DomainResource {
	override open class var resourceType: String {
		get { return "Condition" }
	}

	public let abatementBoolean = RealmOptional<Bool>()
	
	public dynamic var abatementDateTime: DateTime?
	
	public dynamic var abatementPeriod: Period?
	
	public dynamic var abatementQuantity: Quantity?
	
	public dynamic var abatementRange: Range?
	
	public dynamic var abatementString: String?
	
	public dynamic var asserter: Reference?
	
	public let bodySite = RealmSwift.List<CodeableConcept>()
	
	public dynamic var category: CodeableConcept?
	
	public dynamic var clinicalStatus: String?
	
	public dynamic var code: CodeableConcept?
	
	public dynamic var dateRecorded: FHIRDate?
	
	public dynamic var encounter: Reference?
	
	public let evidence = RealmSwift.List<ConditionEvidence>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var notes: String?
	
	public dynamic var onsetDateTime: DateTime?
	
	public dynamic var onsetPeriod: Period?
	
	public dynamic var onsetQuantity: Quantity?
	
	public dynamic var onsetRange: Range?
	
	public dynamic var onsetString: String?
	
	public dynamic var patient: Reference?
	
	public dynamic var severity: CodeableConcept?
	
	public dynamic var stage: ConditionStage?
	
	public dynamic var verificationStatus: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: CodeableConcept, patient: Reference, verificationStatus: String) {
		self.init(json: nil)
		self.code = code
		self.patient = patient
		self.verificationStatus = verificationStatus
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["abatementBoolean"] {
				presentKeys.insert("abatementBoolean")
				if let val = exist as? Bool {
					self.abatementBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "abatementBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementDateTime"] {
				presentKeys.insert("abatementDateTime")
				if let val = exist as? String {
					self.abatementDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "abatementDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementPeriod"] {
				presentKeys.insert("abatementPeriod")
				if let val = exist as? FHIRJSON {
					if let abatementPeriod = self.abatementPeriod {
                        errors.append(contentsOf: abatementPeriod.populate(from: val) ?? [])
                    } else {
                        self.abatementPeriod = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "abatementPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementQuantity"] {
				presentKeys.insert("abatementQuantity")
				if let val = exist as? FHIRJSON {
					if let abatementQuantity = self.abatementQuantity {
                        errors.append(contentsOf: abatementQuantity.populate(from: val) ?? [])
                    } else {
                        self.abatementQuantity = Quantity(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "abatementQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementRange"] {
				presentKeys.insert("abatementRange")
				if let val = exist as? FHIRJSON {
					if let abatementRange = self.abatementRange {
                        errors.append(contentsOf: abatementRange.populate(from: val) ?? [])
                    } else {
                        self.abatementRange = Range(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "abatementRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementString"] {
				presentKeys.insert("abatementString")
				if let val = exist as? String {
					self.abatementString = val
				}
				else {
					errors.append(FHIRJSONError(key: "abatementString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["asserter"] {
				presentKeys.insert("asserter")
				if let val = exist as? FHIRJSON {
					if let asserter = self.asserter {
                        errors.append(contentsOf: asserter.populate(from: val) ?? [])
                    } else {
                        self.asserter = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "asserter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.bodySite) }
						self.bodySite.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					if let category = self.category {
                        errors.append(contentsOf: category.populate(from: val) ?? [])
                    } else {
                        self.category = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["clinicalStatus"] {
				presentKeys.insert("clinicalStatus")
				if let val = exist as? String {
					self.clinicalStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "clinicalStatus", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					if let code = self.code {
                        errors.append(contentsOf: code.populate(from: val) ?? [])
                    } else {
                        self.code = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["dateRecorded"] {
				presentKeys.insert("dateRecorded")
				if let val = exist as? String {
					self.dateRecorded = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateRecorded", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					if let encounter = self.encounter {
                        errors.append(contentsOf: encounter.populate(from: val) ?? [])
                    } else {
                        self.encounter = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["evidence"] {
				presentKeys.insert("evidence")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConditionEvidence.instantiate(fromArray: val, owner: self) as? [ConditionEvidence] {
						if let realm = self.realm { realm.delete(self.evidence) }
						self.evidence.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "evidence", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? String {
					self.notes = val
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetDateTime"] {
				presentKeys.insert("onsetDateTime")
				if let val = exist as? String {
					self.onsetDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "onsetDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetPeriod"] {
				presentKeys.insert("onsetPeriod")
				if let val = exist as? FHIRJSON {
					if let onsetPeriod = self.onsetPeriod {
                        errors.append(contentsOf: onsetPeriod.populate(from: val) ?? [])
                    } else {
                        self.onsetPeriod = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "onsetPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetQuantity"] {
				presentKeys.insert("onsetQuantity")
				if let val = exist as? FHIRJSON {
					if let onsetQuantity = self.onsetQuantity {
                        errors.append(contentsOf: onsetQuantity.populate(from: val) ?? [])
                    } else {
                        self.onsetQuantity = Quantity(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "onsetQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetRange"] {
				presentKeys.insert("onsetRange")
				if let val = exist as? FHIRJSON {
					if let onsetRange = self.onsetRange {
                        errors.append(contentsOf: onsetRange.populate(from: val) ?? [])
                    } else {
                        self.onsetRange = Range(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "onsetRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetString"] {
				presentKeys.insert("onsetString")
				if let val = exist as? String {
					self.onsetString = val
				}
				else {
					errors.append(FHIRJSONError(key: "onsetString", wants: String.self, has: type(of: exist)))
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
			if let exist = js["severity"] {
				presentKeys.insert("severity")
				if let val = exist as? FHIRJSON {
					if let severity = self.severity {
                        errors.append(contentsOf: severity.populate(from: val) ?? [])
                    } else {
                        self.severity = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "severity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["stage"] {
				presentKeys.insert("stage")
				if let val = exist as? FHIRJSON {
					if let stage = self.stage {
                        errors.append(contentsOf: stage.populate(from: val) ?? [])
                    } else {
                        self.stage = ConditionStage(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "stage", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["verificationStatus"] {
				presentKeys.insert("verificationStatus")
				if let val = exist as? String {
					self.verificationStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "verificationStatus", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "verificationStatus"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let abatementBoolean = self.abatementBoolean.value {
			json["abatementBoolean"] = abatementBoolean.asJSON()
		}
		if let abatementDateTime = self.abatementDateTime {
			json["abatementDateTime"] = abatementDateTime.asJSON()
		}
		if let abatementPeriod = self.abatementPeriod {
			json["abatementPeriod"] = abatementPeriod.asJSON()
		}
		if let abatementQuantity = self.abatementQuantity {
			json["abatementQuantity"] = abatementQuantity.asJSON()
		}
		if let abatementRange = self.abatementRange {
			json["abatementRange"] = abatementRange.asJSON()
		}
		if let abatementString = self.abatementString {
			json["abatementString"] = abatementString.asJSON()
		}
		if let asserter = self.asserter {
			json["asserter"] = asserter.asJSON()
		}
		if bodySite.count > 0 {
			json["bodySite"] = Array(bodySite.map() { $0.asJSON() })
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let clinicalStatus = self.clinicalStatus {
			json["clinicalStatus"] = clinicalStatus.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let dateRecorded = self.dateRecorded {
			json["dateRecorded"] = dateRecorded.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if evidence.count > 0 {
			json["evidence"] = Array(evidence.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let notes = self.notes {
			json["notes"] = notes.asJSON()
		}
		if let onsetDateTime = self.onsetDateTime {
			json["onsetDateTime"] = onsetDateTime.asJSON()
		}
		if let onsetPeriod = self.onsetPeriod {
			json["onsetPeriod"] = onsetPeriod.asJSON()
		}
		if let onsetQuantity = self.onsetQuantity {
			json["onsetQuantity"] = onsetQuantity.asJSON()
		}
		if let onsetRange = self.onsetRange {
			json["onsetRange"] = onsetRange.asJSON()
		}
		if let onsetString = self.onsetString {
			json["onsetString"] = onsetString.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let severity = self.severity {
			json["severity"] = severity.asJSON()
		}
		if let stage = self.stage {
			json["stage"] = stage.asJSON()
		}
		if let verificationStatus = self.verificationStatus {
			json["verificationStatus"] = verificationStatus.asJSON()
		}
		
		return json
	}
}


/**
 *  Supporting evidence.
 *
 *  Supporting Evidence / manifestations that are the basis on which this condition is suspected or confirmed.
 */
open class ConditionEvidence: BackboneElement {
	override open class var resourceType: String {
		get { return "ConditionEvidence" }
	}

	public dynamic var code: CodeableConcept?
	
	public let detail = RealmSwift.List<Reference>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					if let code = self.code {
                        errors.append(contentsOf: code.populate(from: val) ?? [])
                    } else {
                        self.code = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Stage/grade, usually assessed formally.
 *
 *  Clinical stage or grade of a condition. May include formal severity assessments.
 */
open class ConditionStage: BackboneElement {
	override open class var resourceType: String {
		get { return "ConditionStage" }
	}

	public let assessment = RealmSwift.List<Reference>()
	
	public dynamic var summary: CodeableConcept?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["assessment"] {
				presentKeys.insert("assessment")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.assessment) }
						self.assessment.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "assessment", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["summary"] {
				presentKeys.insert("summary")
				if let val = exist as? FHIRJSON {
					if let summary = self.summary {
                        errors.append(contentsOf: summary.populate(from: val) ?? [])
                    } else {
                        self.summary = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "summary", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if assessment.count > 0 {
			json["assessment"] = Array(assessment.map() { $0.asJSON() })
		}
		if let summary = self.summary {
			json["summary"] = summary.asJSON()
		}
		
		return json
	}
}

