//
//  RiskAssessment.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/RiskAssessment) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Potential outcomes for a subject with likelihood.
 *
 *  An assessment of the likely outcome(s) for a patient or other subject as well as the likelihood of each outcome.
 */
open class RiskAssessment: DomainResource {
	override open class var resourceType: String {
		get { return "RiskAssessment" }
	}

	public let basis = RealmSwift.List<Reference>()
	
	public dynamic var condition: Reference?						
		
		
			public func upsert(condition: Reference?) {
				upsert(prop: &self.condition, val: condition)
			}
	
	public dynamic var date: DateTime?						
		
		
	
	public dynamic var encounter: Reference?						
		
		
			public func upsert(encounter: Reference?) {
				upsert(prop: &self.encounter, val: encounter)
			}
	
	public dynamic var identifier: Identifier?						
		
		
			public func upsert(identifier: Identifier?) {
				upsert(prop: &self.identifier, val: identifier)
			}
	
	public dynamic var method: CodeableConcept?						
		
		
			public func upsert(method: CodeableConcept?) {
				upsert(prop: &self.method, val: method)
			}
	
	public dynamic var mitigation: String?						
		
		
	
	public dynamic var performer: Reference?						
		
		
			public func upsert(performer: Reference?) {
				upsert(prop: &self.performer, val: performer)
			}
	
	public let prediction = RealmSwift.List<RiskAssessmentPrediction>()
	
	public dynamic var subject: Reference?						
		
		
			public func upsert(subject: Reference?) {
				upsert(prop: &self.subject, val: subject)
			}
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["basis"] {
				presentKeys.insert("basis")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.basis) }
						self.basis.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "basis", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["condition"] {
				presentKeys.insert("condition")
				if let val = exist as? FHIRJSON {
					upsert(condition: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "condition", wants: FHIRJSON.self, has: type(of: exist)))
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
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["mitigation"] {
				presentKeys.insert("mitigation")
				if let val = exist as? String {
					self.mitigation = val
				}
				else {
					errors.append(FHIRJSONError(key: "mitigation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? FHIRJSON {
					upsert(performer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prediction"] {
				presentKeys.insert("prediction")
				if let val = exist as? [FHIRJSON] {
					if let vals = RiskAssessmentPrediction.instantiate(fromArray: val, owner: self) as? [RiskAssessmentPrediction] {
						if let realm = self.realm { realm.delete(self.prediction) }
						self.prediction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "prediction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if basis.count > 0 {
			json["basis"] = Array(basis.map() { $0.asJSON() })
		}
		if let condition = self.condition {
			json["condition"] = condition.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let mitigation = self.mitigation {
			json["mitigation"] = mitigation.asJSON()
		}
		if let performer = self.performer {
			json["performer"] = performer.asJSON()
		}
		if prediction.count > 0 {
			json["prediction"] = Array(prediction.map() { $0.asJSON() })
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
}


/**
 *  Outcome predicted.
 *
 *  Describes the expected outcome for the subject.
 */
open class RiskAssessmentPrediction: BackboneElement {
	override open class var resourceType: String {
		get { return "RiskAssessmentPrediction" }
	}

	public dynamic var outcome: CodeableConcept?						
		
		
			public func upsert(outcome: CodeableConcept?) {
				upsert(prop: &self.outcome, val: outcome)
			}
	
	public dynamic var probabilityCodeableConcept: CodeableConcept?						
		
		
			public func upsert(probabilityCodeableConcept: CodeableConcept?) {
				upsert(prop: &self.probabilityCodeableConcept, val: probabilityCodeableConcept)
			}
	
	public dynamic var probabilityDecimal: RealmDecimal?						
		
		
	
	public dynamic var probabilityRange: Range?						
		
		
			public func upsert(probabilityRange: Range?) {
				upsert(prop: &self.probabilityRange, val: probabilityRange)
			}
	
	public dynamic var rationale: String?						
		
		
	
	public dynamic var relativeRisk: RealmDecimal?						
		
		
	
	public dynamic var whenPeriod: Period?						
		
		
			public func upsert(whenPeriod: Period?) {
				upsert(prop: &self.whenPeriod, val: whenPeriod)
			}
	
	public dynamic var whenRange: Range?						
		
		
			public func upsert(whenRange: Range?) {
				upsert(prop: &self.whenRange, val: whenRange)
			}
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(outcome: CodeableConcept) {
		self.init(json: nil)
		self.outcome = outcome
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? FHIRJSON {
					upsert(outcome: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "outcome"))
			}
			if let exist = js["probabilityCodeableConcept"] {
				presentKeys.insert("probabilityCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(probabilityCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "probabilityCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["probabilityDecimal"] {
				presentKeys.insert("probabilityDecimal")
				if let val = exist as? NSNumber {
					self.probabilityDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "probabilityDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["probabilityRange"] {
				presentKeys.insert("probabilityRange")
				if let val = exist as? FHIRJSON {
					upsert(probabilityRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "probabilityRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rationale"] {
				presentKeys.insert("rationale")
				if let val = exist as? String {
					self.rationale = val
				}
				else {
					errors.append(FHIRJSONError(key: "rationale", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["relativeRisk"] {
				presentKeys.insert("relativeRisk")
				if let val = exist as? NSNumber {
					self.relativeRisk = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "relativeRisk", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["whenPeriod"] {
				presentKeys.insert("whenPeriod")
				if let val = exist as? FHIRJSON {
					upsert(whenPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whenPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["whenRange"] {
				presentKeys.insert("whenRange")
				if let val = exist as? FHIRJSON {
					upsert(whenRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whenRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let probabilityCodeableConcept = self.probabilityCodeableConcept {
			json["probabilityCodeableConcept"] = probabilityCodeableConcept.asJSON()
		}
		if let probabilityDecimal = self.probabilityDecimal {
			json["probabilityDecimal"] = probabilityDecimal.asJSON()
		}
		if let probabilityRange = self.probabilityRange {
			json["probabilityRange"] = probabilityRange.asJSON()
		}
		if let rationale = self.rationale {
			json["rationale"] = rationale.asJSON()
		}
		if let relativeRisk = self.relativeRisk {
			json["relativeRisk"] = relativeRisk.asJSON()
		}
		if let whenPeriod = self.whenPeriod {
			json["whenPeriod"] = whenPeriod.asJSON()
		}
		if let whenRange = self.whenRange {
			json["whenRange"] = whenRange.asJSON()
		}
		
		return json
	}
}

