//
//  Goal.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Goal) on 2017-01-27.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Describes the intended objective(s) for a patient, group or organization.
 *
 *  Describes the intended objective(s) for a patient, group or organization care, for example, weight loss, restoring
 *  an activity of daily living, obtaining herd immunity via immunization, meeting a process improvement objective, etc.
 */
open class Goal: DomainResource {
	override open class var resourceType: String {
		get { return "Goal" }
	}

	public let addresses = RealmSwift.List<Reference>()
	public dynamic var author: Reference?
	public let category = RealmSwift.List<CodeableConcept>()
	public dynamic var description_fhir: String?
	public let identifier = RealmSwift.List<Identifier>()
	public let note = RealmSwift.List<Annotation>()
	public let outcome = RealmSwift.List<GoalOutcome>()
	public dynamic var priority: CodeableConcept?
	public dynamic var startCodeableConcept: CodeableConcept?
	public dynamic var startDate: FHIRDate?
	public dynamic var status: String?
	public dynamic var statusDate: FHIRDate?
	public dynamic var statusReason: CodeableConcept?
	public dynamic var subject: Reference?
	public dynamic var targetDate: FHIRDate?
	public dynamic var targetQuantity: Quantity?

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(description_fhir: String, status: String) {
		self.init(json: nil)
		self.description_fhir = description_fhir
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["addresses"] {
				presentKeys.insert("addresses")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						self.addresses.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "addresses", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					self.author = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						self.category.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "description"))
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
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? [FHIRJSON] {
					if let vals = Annotation.instantiate(fromArray: val, owner: self) as? [Annotation] {
						self.note.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? [FHIRJSON] {
					if let vals = GoalOutcome.instantiate(fromArray: val, owner: self) as? [GoalOutcome] {
						self.outcome.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? FHIRJSON {
					self.priority = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["startCodeableConcept"] {
				presentKeys.insert("startCodeableConcept")
				if let val = exist as? FHIRJSON {
					self.startCodeableConcept = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "startCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["startDate"] {
				presentKeys.insert("startDate")
				if let val = exist as? String {
					self.startDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "startDate", wants: String.self, has: type(of: exist)))
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
			if let exist = js["statusDate"] {
				presentKeys.insert("statusDate")
				if let val = exist as? String {
					self.statusDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "statusDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["statusReason"] {
				presentKeys.insert("statusReason")
				if let val = exist as? FHIRJSON {
					self.statusReason = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "statusReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					self.subject = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["targetDate"] {
				presentKeys.insert("targetDate")
				if let val = exist as? String {
					self.targetDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "targetDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["targetQuantity"] {
				presentKeys.insert("targetQuantity")
				if let val = exist as? FHIRJSON {
					self.targetQuantity = Quantity(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "targetQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if addresses.count > 0 {
			json["addresses"] = Array(addresses.map() { $0.asJSON() })
		}
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if category.count > 0 {
			json["category"] = Array(category.map() { $0.asJSON() })
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if note.count > 0 {
			json["note"] = Array(note.map() { $0.asJSON() })
		}
		if outcome.count > 0 {
			json["outcome"] = Array(outcome.map() { $0.asJSON() })
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if let startCodeableConcept = self.startCodeableConcept {
			json["startCodeableConcept"] = startCodeableConcept.asJSON()
		}
		if let startDate = self.startDate {
			json["startDate"] = startDate.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let statusDate = self.statusDate {
			json["statusDate"] = statusDate.asJSON()
		}
		if let statusReason = self.statusReason {
			json["statusReason"] = statusReason.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let targetDate = self.targetDate {
			json["targetDate"] = targetDate.asJSON()
		}
		if let targetQuantity = self.targetQuantity {
			json["targetQuantity"] = targetQuantity.asJSON()
		}
		
		return json
	}
}


/**
 *  What was end result of goal?.
 *
 *  Identifies the change (or lack of change) at the point where the goal was deepmed to be cancelled or achieved.
 */
open class GoalOutcome: BackboneElement {
	override open class var resourceType: String {
		get { return "GoalOutcome" }
	}

	public dynamic var resultCodeableConcept: CodeableConcept?
	public dynamic var resultReference: Reference?

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["resultCodeableConcept"] {
				presentKeys.insert("resultCodeableConcept")
				if let val = exist as? FHIRJSON {
					self.resultCodeableConcept = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "resultCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["resultReference"] {
				presentKeys.insert("resultReference")
				if let val = exist as? FHIRJSON {
					self.resultReference = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "resultReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let resultCodeableConcept = self.resultCodeableConcept {
			json["resultCodeableConcept"] = resultCodeableConcept.asJSON()
		}
		if let resultReference = self.resultReference {
			json["resultReference"] = resultReference.asJSON()
		}
		
		return json
	}
}

