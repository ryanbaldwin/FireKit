//
//  FamilyMemberHistory.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory) on 2017-01-27.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Information about patient's relatives, relevant for patient.
 *
 *  Significant health events and conditions for a person related to the patient relevant in the context of care for the
 *  patient.
 */
open class FamilyMemberHistory: DomainResource {
	override open class var resourceType: String {
		get { return "FamilyMemberHistory" }
	}

	public dynamic var ageQuantity: Quantity?
	public dynamic var ageRange: Range?
	public dynamic var ageString: String?
	public dynamic var bornDate: FHIRDate?
	public dynamic var bornPeriod: Period?
	public dynamic var bornString: String?
	public let condition = RealmSwift.List<FamilyMemberHistoryCondition>()
	public dynamic var date: DateTime?
	public let deceasedBoolean = RealmOptional<Bool>()
	public dynamic var deceasedDate: FHIRDate?
	public dynamic var deceasedQuantity: Quantity?
	public dynamic var deceasedRange: Range?
	public dynamic var deceasedString: String?
	public dynamic var gender: String?
	public let identifier = RealmSwift.List<Identifier>()
	public dynamic var name: String?
	public dynamic var note: Annotation?
	public dynamic var patient: Reference?
	public dynamic var relationship: CodeableConcept?
	public dynamic var status: String?

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(patient: Reference, relationship: CodeableConcept, status: String) {
		self.init(json: nil)
		self.patient = patient
		self.relationship = relationship
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["ageQuantity"] {
				presentKeys.insert("ageQuantity")
				if let val = exist as? FHIRJSON {
					self.ageQuantity = Quantity(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "ageQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ageRange"] {
				presentKeys.insert("ageRange")
				if let val = exist as? FHIRJSON {
					self.ageRange = Range(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "ageRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ageString"] {
				presentKeys.insert("ageString")
				if let val = exist as? String {
					self.ageString = val
				}
				else {
					errors.append(FHIRJSONError(key: "ageString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["bornDate"] {
				presentKeys.insert("bornDate")
				if let val = exist as? String {
					self.bornDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "bornDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["bornPeriod"] {
				presentKeys.insert("bornPeriod")
				if let val = exist as? FHIRJSON {
					self.bornPeriod = Period(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "bornPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["bornString"] {
				presentKeys.insert("bornString")
				if let val = exist as? String {
					self.bornString = val
				}
				else {
					errors.append(FHIRJSONError(key: "bornString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["condition"] {
				presentKeys.insert("condition")
				if let val = exist as? [FHIRJSON] {
					if let vals = FamilyMemberHistoryCondition.instantiate(fromArray: val, owner: self) as? [FamilyMemberHistoryCondition] {
						self.condition.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "condition", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["deceasedBoolean"] {
				presentKeys.insert("deceasedBoolean")
				if let val = exist as? Bool {
					self.deceasedBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedDate"] {
				presentKeys.insert("deceasedDate")
				if let val = exist as? String {
					self.deceasedDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedQuantity"] {
				presentKeys.insert("deceasedQuantity")
				if let val = exist as? FHIRJSON {
					self.deceasedQuantity = Quantity(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedRange"] {
				presentKeys.insert("deceasedRange")
				if let val = exist as? FHIRJSON {
					self.deceasedRange = Range(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedString"] {
				presentKeys.insert("deceasedString")
				if let val = exist as? String {
					self.deceasedString = val
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["gender"] {
				presentKeys.insert("gender")
				if let val = exist as? String {
					self.gender = val
				}
				else {
					errors.append(FHIRJSONError(key: "gender", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? FHIRJSON {
					self.note = Annotation(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["relationship"] {
				presentKeys.insert("relationship")
				if let val = exist as? FHIRJSON {
					self.relationship = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "relationship", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "relationship"))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let ageQuantity = self.ageQuantity {
			json["ageQuantity"] = ageQuantity.asJSON()
		}
		if let ageRange = self.ageRange {
			json["ageRange"] = ageRange.asJSON()
		}
		if let ageString = self.ageString {
			json["ageString"] = ageString.asJSON()
		}
		if let bornDate = self.bornDate {
			json["bornDate"] = bornDate.asJSON()
		}
		if let bornPeriod = self.bornPeriod {
			json["bornPeriod"] = bornPeriod.asJSON()
		}
		if let bornString = self.bornString {
			json["bornString"] = bornString.asJSON()
		}
		if condition.count > 0 {
			json["condition"] = Array(condition.map() { $0.asJSON() })
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let deceasedBoolean = self.deceasedBoolean.value {
			json["deceasedBoolean"] = deceasedBoolean.asJSON()
		}
		if let deceasedDate = self.deceasedDate {
			json["deceasedDate"] = deceasedDate.asJSON()
		}
		if let deceasedQuantity = self.deceasedQuantity {
			json["deceasedQuantity"] = deceasedQuantity.asJSON()
		}
		if let deceasedRange = self.deceasedRange {
			json["deceasedRange"] = deceasedRange.asJSON()
		}
		if let deceasedString = self.deceasedString {
			json["deceasedString"] = deceasedString.asJSON()
		}
		if let gender = self.gender {
			json["gender"] = gender.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let note = self.note {
			json["note"] = note.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let relationship = self.relationship {
			json["relationship"] = relationship.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		
		return json
	}
}


/**
 *  Condition that the related person had.
 *
 *  The significant Conditions (or condition) that the family member had. This is a repeating section to allow a system
 *  to represent more than one condition per resource, though there is nothing stopping multiple resources - one per
 *  condition.
 */
open class FamilyMemberHistoryCondition: BackboneElement {
	override open class var resourceType: String {
		get { return "FamilyMemberHistoryCondition" }
	}

	public dynamic var code: CodeableConcept?
	public dynamic var note: Annotation?
	public dynamic var onsetPeriod: Period?
	public dynamic var onsetQuantity: Quantity?
	public dynamic var onsetRange: Range?
	public dynamic var onsetString: String?
	public dynamic var outcome: CodeableConcept?

	
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
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? FHIRJSON {
					self.note = Annotation(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetPeriod"] {
				presentKeys.insert("onsetPeriod")
				if let val = exist as? FHIRJSON {
					self.onsetPeriod = Period(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "onsetPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetQuantity"] {
				presentKeys.insert("onsetQuantity")
				if let val = exist as? FHIRJSON {
					self.onsetQuantity = Quantity(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "onsetQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetRange"] {
				presentKeys.insert("onsetRange")
				if let val = exist as? FHIRJSON {
					self.onsetRange = Range(json: val, owner: self)
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
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? FHIRJSON {
					self.outcome = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: FHIRJSON.self, has: type(of: exist)))
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
		if let note = self.note {
			json["note"] = note.asJSON()
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
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		
		return json
	}
}

