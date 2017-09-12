//
//  Goal.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Goal) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
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
    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    public let category = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let note = RealmSwift.List<Annotation>()
    public let outcome = RealmSwift.List<GoalOutcome>()
    @objc public dynamic var priority: CodeableConcept?
    public func upsert(priority: CodeableConcept?) {
        upsert(prop: &self.priority, val: priority)
    }
    @objc public dynamic var startCodeableConcept: CodeableConcept?
    public func upsert(startCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.startCodeableConcept, val: startCodeableConcept)
    }
    @objc public dynamic var startDate: FHIRDate?
    @objc public dynamic var status: String?
    @objc public dynamic var statusDate: FHIRDate?
    @objc public dynamic var statusReason: CodeableConcept?
    public func upsert(statusReason: CodeableConcept?) {
        upsert(prop: &self.statusReason, val: statusReason)
    }
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var targetDate: FHIRDate?
    @objc public dynamic var targetQuantity: Quantity?
    public func upsert(targetQuantity: Quantity?) {
        upsert(prop: &self.targetQuantity, val: targetQuantity)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(description_fhir: String, status: String) {
        self.init()
        self.description_fhir = description_fhir
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case addresses = "addresses"
        case author = "author"
        case category = "category"
        case description_fhir = "description"
        case identifier = "identifier"
        case note = "note"
        case outcome = "outcome"
        case priority = "priority"
        case startCodeableConcept = "startCodeableConcept"
        case startDate = "startDate"
        case status = "status"
        case statusDate = "statusDate"
        case statusReason = "statusReason"
        case subject = "subject"
        case targetDate = "targetDate"
        case targetQuantity = "targetQuantity"
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

        self.addresses.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .addresses) ?? [])
        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.category.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .category) ?? [])
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.note.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .note) ?? [])
        self.outcome.append(objectsIn: try container.decodeIfPresent([GoalOutcome].self, forKey: .outcome) ?? [])
        self.priority = try container.decodeIfPresent(CodeableConcept.self, forKey: .priority)
        self.startCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .startCodeableConcept)
        self.startDate = try container.decodeIfPresent(FHIRDate.self, forKey: .startDate)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.statusDate = try container.decodeIfPresent(FHIRDate.self, forKey: .statusDate)
        self.statusReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .statusReason)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.targetDate = try container.decodeIfPresent(FHIRDate.self, forKey: .targetDate)
        self.targetQuantity = try container.decodeIfPresent(Quantity.self, forKey: .targetQuantity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.addresses), forKey: .addresses)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encode(Array(self.category), forKey: .category)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.note), forKey: .note)
        try container.encode(Array(self.outcome), forKey: .outcome)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encodeIfPresent(self.startCodeableConcept, forKey: .startCodeableConcept)
        try container.encodeIfPresent(self.startDate, forKey: .startDate)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.statusDate, forKey: .statusDate)
        try container.encodeIfPresent(self.statusReason, forKey: .statusReason)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.targetDate, forKey: .targetDate)
        try container.encodeIfPresent(self.targetQuantity, forKey: .targetQuantity)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["addresses"] {
				presentKeys.insert("addresses")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.addresses) }
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
					upsert(author: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.category) }
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
						if let realm = self.realm { realm.delete(self.identifier) }
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
						if let realm = self.realm { realm.delete(self.note) }
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
						if let realm = self.realm { realm.delete(self.outcome) }
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
					upsert(priority: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["startCodeableConcept"] {
				presentKeys.insert("startCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(startCodeableConcept: CodeableConcept(json: val, owner: self))
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
					upsert(statusReason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "statusReason", wants: FHIRJSON.self, has: type(of: exist)))
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
					upsert(targetQuantity: Quantity(json: val, owner: self))
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
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Goal.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Goal. Will return empty instance: \(error))")
		}
		return Goal.init()
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

    @objc public dynamic var resultCodeableConcept: CodeableConcept?
    public func upsert(resultCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.resultCodeableConcept, val: resultCodeableConcept)
    }
    @objc public dynamic var resultReference: Reference?
    public func upsert(resultReference: Reference?) {
        upsert(prop: &self.resultReference, val: resultReference)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case resultCodeableConcept = "resultCodeableConcept"
        case resultReference = "resultReference"
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

        self.resultCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .resultCodeableConcept)
        self.resultReference = try container.decodeIfPresent(Reference.self, forKey: .resultReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.resultCodeableConcept, forKey: .resultCodeableConcept)
        try container.encodeIfPresent(self.resultReference, forKey: .resultReference)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["resultCodeableConcept"] {
				presentKeys.insert("resultCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(resultCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "resultCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["resultReference"] {
				presentKeys.insert("resultReference")
				if let val = exist as? FHIRJSON {
					upsert(resultReference: Reference(json: val, owner: self))
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
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(GoalOutcome.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy GoalOutcome. Will return empty instance: \(error))")
		}
		return GoalOutcome.init()
	}
}

