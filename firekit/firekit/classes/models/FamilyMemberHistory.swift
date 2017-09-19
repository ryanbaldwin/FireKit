//
//  FamilyMemberHistory.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/FamilyMemberHistory) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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
        try container.encode(Array(self.condition), forKey: .condition)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.deceasedBoolean.value, forKey: .deceasedBoolean)
        try container.encodeIfPresent(self.deceasedDate, forKey: .deceasedDate)
        try container.encodeIfPresent(self.deceasedQuantity, forKey: .deceasedQuantity)
        try container.encodeIfPresent(self.deceasedRange, forKey: .deceasedRange)
        try container.encodeIfPresent(self.deceasedString, forKey: .deceasedString)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

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



