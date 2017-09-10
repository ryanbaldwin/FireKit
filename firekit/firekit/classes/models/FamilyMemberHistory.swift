//
//  FamilyMemberHistory.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
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

    @objc public dynamic var ageQuantity: Quantity?
    public func upsert(ageQuantity: Quantity?) {
        upsert(prop: &self.ageQuantity, val: ageQuantity)
    }
    @objc public dynamic var ageRange: Range?
    public func upsert(ageRange: Range?) {
        upsert(prop: &self.ageRange, val: ageRange)
    }
    @objc public dynamic var ageString: String?
    @objc public dynamic var bornDate: FHIRDate?
    @objc public dynamic var bornPeriod: Period?
    public func upsert(bornPeriod: Period?) {
        upsert(prop: &self.bornPeriod, val: bornPeriod)
    }
    @objc public dynamic var bornString: String?
    public let condition = RealmSwift.List<FamilyMemberHistoryCondition>()
    @objc public dynamic var date: DateTime?
    public let deceasedBoolean = RealmOptional<Bool>()
    @objc public dynamic var deceasedDate: FHIRDate?
    @objc public dynamic var deceasedQuantity: Quantity?
    public func upsert(deceasedQuantity: Quantity?) {
        upsert(prop: &self.deceasedQuantity, val: deceasedQuantity)
    }
    @objc public dynamic var deceasedRange: Range?
    public func upsert(deceasedRange: Range?) {
        upsert(prop: &self.deceasedRange, val: deceasedRange)
    }
    @objc public dynamic var deceasedString: String?
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: String?
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var relationship: CodeableConcept?
    public func upsert(relationship: CodeableConcept?) {
        upsert(prop: &self.relationship, val: relationship)
    }
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, relationship: CodeableConcept, status: String) {
        self.init()
        self.patient = patient
        self.relationship = relationship
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case ageQuantity = "ageQuantity"
        case ageRange = "ageRange"
        case ageString = "ageString"
        case bornDate = "bornDate"
        case bornPeriod = "bornPeriod"
        case bornString = "bornString"
        case condition = "condition"
        case date = "date"
        case deceasedBoolean = "deceasedBoolean"
        case deceasedDate = "deceasedDate"
        case deceasedQuantity = "deceasedQuantity"
        case deceasedRange = "deceasedRange"
        case deceasedString = "deceasedString"
        case gender = "gender"
        case identifier = "identifier"
        case name = "name"
        case note = "note"
        case patient = "patient"
        case relationship = "relationship"
        case status = "status"
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

        self.ageQuantity = try container.decodeIfPresent(Quantity.self, forKey: .ageQuantity)
        self.ageRange = try container.decodeIfPresent(Range.self, forKey: .ageRange)
        self.ageString = try container.decodeIfPresent(String.self, forKey: .ageString)
        self.bornDate = try container.decodeIfPresent(FHIRDate.self, forKey: .bornDate)
        self.bornPeriod = try container.decodeIfPresent(Period.self, forKey: .bornPeriod)
        self.bornString = try container.decodeIfPresent(String.self, forKey: .bornString)
        self.condition.append(objectsIn: try container.decodeIfPresent([FamilyMemberHistoryCondition].self, forKey: .condition) ?? [])
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.deceasedBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .deceasedBoolean)
        self.deceasedDate = try container.decodeIfPresent(FHIRDate.self, forKey: .deceasedDate)
        self.deceasedQuantity = try container.decodeIfPresent(Quantity.self, forKey: .deceasedQuantity)
        self.deceasedRange = try container.decodeIfPresent(Range.self, forKey: .deceasedRange)
        self.deceasedString = try container.decodeIfPresent(String.self, forKey: .deceasedString)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.note = try container.decodeIfPresent(Annotation.self, forKey: .note)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.relationship = try container.decodeIfPresent(CodeableConcept.self, forKey: .relationship)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.ageQuantity, forKey: .ageQuantity)
        try container.encodeIfPresent(self.ageRange, forKey: .ageRange)
        try container.encodeIfPresent(self.ageString, forKey: .ageString)
        try container.encodeIfPresent(self.bornDate, forKey: .bornDate)
        try container.encodeIfPresent(self.bornPeriod, forKey: .bornPeriod)
        try container.encodeIfPresent(self.bornString, forKey: .bornString)
        try container.encode(self.condition.flatMap { $0 }, forKey: .condition)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.deceasedBoolean.value, forKey: .deceasedBoolean)
        try container.encodeIfPresent(self.deceasedDate, forKey: .deceasedDate)
        try container.encodeIfPresent(self.deceasedQuantity, forKey: .deceasedQuantity)
        try container.encodeIfPresent(self.deceasedRange, forKey: .deceasedRange)
        try container.encodeIfPresent(self.deceasedString, forKey: .deceasedString)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encodeIfPresent(self.status, forKey: .status)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["ageQuantity"] {
				presentKeys.insert("ageQuantity")
				if let val = exist as? FHIRJSON {
					upsert(ageQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "ageQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ageRange"] {
				presentKeys.insert("ageRange")
				if let val = exist as? FHIRJSON {
					upsert(ageRange: Range(json: val, owner: self))
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
					upsert(bornPeriod: Period(json: val, owner: self))
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
						if let realm = self.realm { realm.delete(self.condition) }
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
					upsert(deceasedQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedRange"] {
				presentKeys.insert("deceasedRange")
				if let val = exist as? FHIRJSON {
					upsert(deceasedRange: Range(json: val, owner: self))
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
						if let realm = self.realm { realm.delete(self.identifier) }
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
					upsert(note: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["relationship"] {
				presentKeys.insert("relationship")
				if let val = exist as? FHIRJSON {
					upsert(relationship: CodeableConcept(json: val, owner: self))
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
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(FamilyMemberHistory.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy FamilyMemberHistory. Will return empty instance: \(error))")
		}
		return FamilyMemberHistory.init()
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

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    @objc public dynamic var onsetPeriod: Period?
    public func upsert(onsetPeriod: Period?) {
        upsert(prop: &self.onsetPeriod, val: onsetPeriod)
    }
    @objc public dynamic var onsetQuantity: Quantity?
    public func upsert(onsetQuantity: Quantity?) {
        upsert(prop: &self.onsetQuantity, val: onsetQuantity)
    }
    @objc public dynamic var onsetRange: Range?
    public func upsert(onsetRange: Range?) {
        upsert(prop: &self.onsetRange, val: onsetRange)
    }
    @objc public dynamic var onsetString: String?
    @objc public dynamic var outcome: CodeableConcept?
    public func upsert(outcome: CodeableConcept?) {
        upsert(prop: &self.outcome, val: outcome)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case note = "note"
        case onsetPeriod = "onsetPeriod"
        case onsetQuantity = "onsetQuantity"
        case onsetRange = "onsetRange"
        case onsetString = "onsetString"
        case outcome = "outcome"
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

        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.note = try container.decodeIfPresent(Annotation.self, forKey: .note)
        self.onsetPeriod = try container.decodeIfPresent(Period.self, forKey: .onsetPeriod)
        self.onsetQuantity = try container.decodeIfPresent(Quantity.self, forKey: .onsetQuantity)
        self.onsetRange = try container.decodeIfPresent(Range.self, forKey: .onsetRange)
        self.onsetString = try container.decodeIfPresent(String.self, forKey: .onsetString)
        self.outcome = try container.decodeIfPresent(CodeableConcept.self, forKey: .outcome)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.onsetPeriod, forKey: .onsetPeriod)
        try container.encodeIfPresent(self.onsetQuantity, forKey: .onsetQuantity)
        try container.encodeIfPresent(self.onsetRange, forKey: .onsetRange)
        try container.encodeIfPresent(self.onsetString, forKey: .onsetString)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
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
					upsert(note: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetPeriod"] {
				presentKeys.insert("onsetPeriod")
				if let val = exist as? FHIRJSON {
					upsert(onsetPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "onsetPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetQuantity"] {
				presentKeys.insert("onsetQuantity")
				if let val = exist as? FHIRJSON {
					upsert(onsetQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "onsetQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetRange"] {
				presentKeys.insert("onsetRange")
				if let val = exist as? FHIRJSON {
					upsert(onsetRange: Range(json: val, owner: self))
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
					upsert(outcome: CodeableConcept(json: val, owner: self))
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
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(FamilyMemberHistoryCondition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy FamilyMemberHistoryCondition. Will return empty instance: \(error))")
		}
		return FamilyMemberHistoryCondition.init()
	}
}

