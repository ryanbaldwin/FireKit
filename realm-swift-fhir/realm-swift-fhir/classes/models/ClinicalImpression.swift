//
//  ClinicalImpression.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ClinicalImpression) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A clinical assessment performed when planning treatments and management strategies for a patient.
 *
 *  A record of a clinical assessment performed to determine what problem(s) may affect the patient and before planning
 *  the treatments or management strategies that are best to manage a patient's condition. Assessments are often 1:1
 *  with a clinical consultation / encounter,  but this varies greatly depending on the clinical workflow. This resource
 *  is called "ClinicalImpression" rather than "ClinicalAssessment" to avoid confusion with the recording of assessment
 *  tools such as Apgar score.
 */
open class ClinicalImpression: DomainResource {
	override open class var resourceType: String {
		get { return "ClinicalImpression" }
	}

	public let action = RealmSwift.List<Reference>()
	
	public dynamic var assessor: Reference?
	
	public dynamic var date: DateTime?
	
	public dynamic var description_fhir: String?
	
	public let finding = RealmSwift.List<ClinicalImpressionFinding>()
	
	public let investigations = RealmSwift.List<ClinicalImpressionInvestigations>()
	
	public dynamic var patient: Reference?
	
	public let plan = RealmSwift.List<Reference>()
	
	public dynamic var previous: Reference?
	
	public let problem = RealmSwift.List<Reference>()
	
	public dynamic var prognosis: String?
	
	public dynamic var protocol_fhir: String?
	
	public let resolved = RealmSwift.List<CodeableConcept>()
	
	public let ruledOut = RealmSwift.List<ClinicalImpressionRuledOut>()
	
	public dynamic var status: String?
	
	public dynamic var summary: String?
	
	public dynamic var triggerCodeableConcept: CodeableConcept?
	
	public dynamic var triggerReference: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(patient: Reference, status: String) {
		self.init(json: nil)
		self.patient = patient
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["assessor"] {
				presentKeys.insert("assessor")
				if let val = exist as? FHIRJSON {
					self.assessor = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "assessor", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["finding"] {
				presentKeys.insert("finding")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClinicalImpressionFinding.instantiate(fromArray: val, owner: self) as? [ClinicalImpressionFinding] {
						self.finding.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "finding", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["investigations"] {
				presentKeys.insert("investigations")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClinicalImpressionInvestigations.instantiate(fromArray: val, owner: self) as? [ClinicalImpressionInvestigations] {
						self.investigations.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "investigations", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					self.patient = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "patient"))
			}
			if let exist = js["plan"] {
				presentKeys.insert("plan")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						self.plan.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "plan", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["previous"] {
				presentKeys.insert("previous")
				if let val = exist as? FHIRJSON {
					self.previous = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "previous", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["problem"] {
				presentKeys.insert("problem")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						self.problem.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "problem", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["prognosis"] {
				presentKeys.insert("prognosis")
				if let val = exist as? String {
					self.prognosis = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "prognosis", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["protocol"] {
				presentKeys.insert("protocol")
				if let val = exist as? String {
					self.protocol_fhir = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "protocol", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["resolved"] {
				presentKeys.insert("resolved")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						self.resolved.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "resolved", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["ruledOut"] {
				presentKeys.insert("ruledOut")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClinicalImpressionRuledOut.instantiate(fromArray: val, owner: self) as? [ClinicalImpressionRuledOut] {
						self.ruledOut.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "ruledOut", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["summary"] {
				presentKeys.insert("summary")
				if let val = exist as? String {
					self.summary = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "summary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["triggerCodeableConcept"] {
				presentKeys.insert("triggerCodeableConcept")
				if let val = exist as? FHIRJSON {
					self.triggerCodeableConcept = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "triggerCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["triggerReference"] {
				presentKeys.insert("triggerReference")
				if let val = exist as? FHIRJSON {
					self.triggerReference = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "triggerReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		if let assessor = self.assessor {
			json["assessor"] = assessor.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if finding.count > 0 {
			json["finding"] = Array(finding.map() { $0.asJSON() })
		}
		if investigations.count > 0 {
			json["investigations"] = Array(investigations.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if plan.count > 0 {
			json["plan"] = Array(plan.map() { $0.asJSON() })
		}
		if let previous = self.previous {
			json["previous"] = previous.asJSON()
		}
		if problem.count > 0 {
			json["problem"] = Array(problem.map() { $0.asJSON() })
		}
		if let prognosis = self.prognosis {
			json["prognosis"] = prognosis.asJSON()
		}
		if let protocol_fhir = self.protocol_fhir {
			json["protocol"] = protocol_fhir.asJSON()
		}
		if resolved.count > 0 {
			json["resolved"] = Array(resolved.map() { $0.asJSON() })
		}
		if ruledOut.count > 0 {
			json["ruledOut"] = Array(ruledOut.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let summary = self.summary {
			json["summary"] = summary.asJSON()
		}
		if let triggerCodeableConcept = self.triggerCodeableConcept {
			json["triggerCodeableConcept"] = triggerCodeableConcept.asJSON()
		}
		if let triggerReference = self.triggerReference {
			json["triggerReference"] = triggerReference.asJSON()
		}
		
		return json
	}
}


/**
 *  Possible or likely findings and diagnoses.
 *
 *  Specific findings or diagnoses that was considered likely or relevant to ongoing treatment.
 */
open class ClinicalImpressionFinding: BackboneElement {
	override open class var resourceType: String {
		get { return "ClinicalImpressionFinding" }
	}

	public dynamic var cause: String?
	
	public dynamic var item: CodeableConcept?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(item: CodeableConcept) {
		self.init(json: nil)
		self.item = item
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["cause"] {
				presentKeys.insert("cause")
				if let val = exist as? String {
					self.cause = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "cause", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					self.item = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let cause = self.cause {
			json["cause"] = cause.asJSON()
		}
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		
		return json
	}
}


/**
 *  One or more sets of investigations (signs, symptions, etc.).
 *
 *  One or more sets of investigations (signs, symptions, etc.). The actual grouping of investigations vary greatly
 *  depending on the type and context of the assessment. These investigations may include data generated during the
 *  assessment process, or data previously generated and recorded that is pertinent to the outcomes.
 */
open class ClinicalImpressionInvestigations: BackboneElement {
	override open class var resourceType: String {
		get { return "ClinicalImpressionInvestigations" }
	}

	public dynamic var code: CodeableConcept?
	
	public let item = RealmSwift.List<Reference>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: CodeableConcept) {
		self.init(json: nil)
		self.code = code
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					self.code = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						self.item.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if item.count > 0 {
			json["item"] = Array(item.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Diagnosis considered not possible.
 */
open class ClinicalImpressionRuledOut: BackboneElement {
	override open class var resourceType: String {
		get { return "ClinicalImpressionRuledOut" }
	}

	public dynamic var item: CodeableConcept?
	
	public dynamic var reason: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(item: CodeableConcept) {
		self.init(json: nil)
		self.item = item
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					self.item = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? String {
					self.reason = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		
		return json
	}
}

