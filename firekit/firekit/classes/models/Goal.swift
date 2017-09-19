//
//  Goal.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Goal) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Goal else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: addresses array
        FireKit.populate(&self.author, from: o.author)
        // TODO: category array
        description_fhir = o.description_fhir
        // TODO: identifier array
        // TODO: note array
        // TODO: outcome array
        FireKit.populate(&self.priority, from: o.priority)
        FireKit.populate(&self.startCodeableConcept, from: o.startCodeableConcept)
        startDate = o.startDate
        status = o.status
        statusDate = o.statusDate
        FireKit.populate(&self.statusReason, from: o.statusReason)
        FireKit.populate(&self.subject, from: o.subject)
        targetDate = o.targetDate
        FireKit.populate(&self.targetQuantity, from: o.targetQuantity)
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

    public override func populate(from other: Any) {
        guard let o = other as? GoalOutcome else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.resultCodeableConcept, from: o.resultCodeableConcept)
        FireKit.populate(&self.resultReference, from: o.resultReference)
    }
}

