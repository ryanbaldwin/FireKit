//
//  CarePlan.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/CarePlan) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Healthcare plan for patient or group.
 *
 *  Describes the intention of how one or more practitioners intend to deliver care for a particular patient, group or
 *  community for a period of time, possibly limited to care for a specific condition or set of conditions.
 */
open class CarePlan: DomainResource {
	override open class var resourceType: String {
		get { return "CarePlan" }
	}

    public let activity = RealmSwift.List<CarePlanActivity>()
    public let addresses = RealmSwift.List<Reference>()
    public let author = RealmSwift.List<Reference>()
    public let category = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var context: Reference?
    public func upsert(context: Reference?) {
        upsert(prop: &self.context, val: context)
    }
    @objc public dynamic var description_fhir: String?
    public let goal = RealmSwift.List<Reference>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var modified: DateTime?
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    public let participant = RealmSwift.List<CarePlanParticipant>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let relatedPlan = RealmSwift.List<CarePlanRelatedPlan>()
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    public let support = RealmSwift.List<Reference>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case addresses = "addresses"
        case author = "author"
        case category = "category"
        case context = "context"
        case description_fhir = "description"
        case goal = "goal"
        case identifier = "identifier"
        case modified = "modified"
        case note = "note"
        case participant = "participant"
        case period = "period"
        case relatedPlan = "relatedPlan"
        case status = "status"
        case subject = "subject"
        case support = "support"
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

        self.activity.append(objectsIn: try container.decodeIfPresent([CarePlanActivity].self, forKey: .activity) ?? [])
        self.addresses.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .addresses) ?? [])
        self.author.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .author) ?? [])
        self.category.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .category) ?? [])
        self.context = try container.decodeIfPresent(Reference.self, forKey: .context)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.goal.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .goal) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.modified = try container.decodeIfPresent(DateTime.self, forKey: .modified)
        self.note = try container.decodeIfPresent(Annotation.self, forKey: .note)
        self.participant.append(objectsIn: try container.decodeIfPresent([CarePlanParticipant].self, forKey: .participant) ?? [])
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.relatedPlan.append(objectsIn: try container.decodeIfPresent([CarePlanRelatedPlan].self, forKey: .relatedPlan) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.support.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .support) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.activity), forKey: .activity)
        try container.encode(Array(self.addresses), forKey: .addresses)
        try container.encode(Array(self.author), forKey: .author)
        try container.encode(Array(self.category), forKey: .category)
        try container.encodeIfPresent(self.context, forKey: .context)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.goal), forKey: .goal)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.modified, forKey: .modified)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encode(Array(self.participant), forKey: .participant)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.relatedPlan), forKey: .relatedPlan)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encode(Array(self.support), forKey: .support)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["activity"] {
				presentKeys.insert("activity")
				if let val = exist as? [FHIRJSON] {
					if let vals = CarePlanActivity.instantiate(fromArray: val, owner: self) as? [CarePlanActivity] {
						if let realm = self.realm { realm.delete(self.activity) }
						self.activity.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "activity", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
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
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.author) }
						self.author.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["context"] {
				presentKeys.insert("context")
				if let val = exist as? FHIRJSON {
					upsert(context: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "context", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["goal"] {
				presentKeys.insert("goal")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.goal) }
						self.goal.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "goal", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["modified"] {
				presentKeys.insert("modified")
				if let val = exist as? String {
					self.modified = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "modified", wants: String.self, has: type(of: exist)))
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
			if let exist = js["participant"] {
				presentKeys.insert("participant")
				if let val = exist as? [FHIRJSON] {
					if let vals = CarePlanParticipant.instantiate(fromArray: val, owner: self) as? [CarePlanParticipant] {
						if let realm = self.realm { realm.delete(self.participant) }
						self.participant.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "participant", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["relatedPlan"] {
				presentKeys.insert("relatedPlan")
				if let val = exist as? [FHIRJSON] {
					if let vals = CarePlanRelatedPlan.instantiate(fromArray: val, owner: self) as? [CarePlanRelatedPlan] {
						if let realm = self.realm { realm.delete(self.relatedPlan) }
						self.relatedPlan.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "relatedPlan", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["support"] {
				presentKeys.insert("support")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.support) }
						self.support.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "support", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if activity.count > 0 {
			json["activity"] = Array(activity.map() { $0.asJSON() })
		}
		if addresses.count > 0 {
			json["addresses"] = Array(addresses.map() { $0.asJSON() })
		}
		if author.count > 0 {
			json["author"] = Array(author.map() { $0.asJSON() })
		}
		if category.count > 0 {
			json["category"] = Array(category.map() { $0.asJSON() })
		}
		if let context = self.context {
			json["context"] = context.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if goal.count > 0 {
			json["goal"] = Array(goal.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let modified = self.modified {
			json["modified"] = modified.asJSON()
		}
		if let note = self.note {
			json["note"] = note.asJSON()
		}
		if participant.count > 0 {
			json["participant"] = Array(participant.map() { $0.asJSON() })
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if relatedPlan.count > 0 {
			json["relatedPlan"] = Array(relatedPlan.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if support.count > 0 {
			json["support"] = Array(support.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CarePlan.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CarePlan. Will return empty instance: \(error))")
		}
		return CarePlan.init()
	}
}


/**
 *  Action to occur as part of plan.
 *
 *  Identifies a planned action to occur as part of the plan.  For example, a medication to be used, lab tests to
 *  perform, self-monitoring, education, etc.
 */
open class CarePlanActivity: BackboneElement {
	override open class var resourceType: String {
		get { return "CarePlanActivity" }
	}

    public let actionResulting = RealmSwift.List<Reference>()
    @objc public dynamic var detail: CarePlanActivityDetail?
    public func upsert(detail: CarePlanActivityDetail?) {
        upsert(prop: &self.detail, val: detail)
    }
    public let progress = RealmSwift.List<Annotation>()
    @objc public dynamic var reference: Reference?
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actionResulting = "actionResulting"
        case detail = "detail"
        case progress = "progress"
        case reference = "reference"
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

        self.actionResulting.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .actionResulting) ?? [])
        self.detail = try container.decodeIfPresent(CarePlanActivityDetail.self, forKey: .detail)
        self.progress.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .progress) ?? [])
        self.reference = try container.decodeIfPresent(Reference.self, forKey: .reference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.actionResulting), forKey: .actionResulting)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encode(Array(self.progress), forKey: .progress)
        try container.encodeIfPresent(self.reference, forKey: .reference)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["actionResulting"] {
				presentKeys.insert("actionResulting")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.actionResulting) }
						self.actionResulting.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "actionResulting", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? FHIRJSON {
					upsert(detail: CarePlanActivityDetail(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["progress"] {
				presentKeys.insert("progress")
				if let val = exist as? [FHIRJSON] {
					if let vals = Annotation.instantiate(fromArray: val, owner: self) as? [Annotation] {
						if let realm = self.realm { realm.delete(self.progress) }
						self.progress.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "progress", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? FHIRJSON {
					upsert(reference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if actionResulting.count > 0 {
			json["actionResulting"] = Array(actionResulting.map() { $0.asJSON() })
		}
		if let detail = self.detail {
			json["detail"] = detail.asJSON()
		}
		if progress.count > 0 {
			json["progress"] = Array(progress.map() { $0.asJSON() })
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CarePlanActivity.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CarePlanActivity. Will return empty instance: \(error))")
		}
		return CarePlanActivity.init()
	}
}


/**
 *  In-line definition of activity.
 *
 *  A simple summary of a planned activity suitable for a general care plan system (e.g. form driven) that doesn't know
 *  about specific resources such as procedure etc.
 */
open class CarePlanActivityDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "CarePlanActivityDetail" }
	}

    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var dailyAmount: Quantity?
    public func upsert(dailyAmount: Quantity?) {
        upsert(prop: &self.dailyAmount, val: dailyAmount)
    }
    @objc public dynamic var description_fhir: String?
    public let goal = RealmSwift.List<Reference>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    public let performer = RealmSwift.List<Reference>()
    @objc public dynamic var productCodeableConcept: CodeableConcept?
    public func upsert(productCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.productCodeableConcept, val: productCodeableConcept)
    }
    @objc public dynamic var productReference: Reference?
    public func upsert(productReference: Reference?) {
        upsert(prop: &self.productReference, val: productReference)
    }
    public let prohibited = RealmOptional<Bool>()
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let reasonCode = RealmSwift.List<CodeableConcept>()
    public let reasonReference = RealmSwift.List<Reference>()
    @objc public dynamic var scheduledPeriod: Period?
    public func upsert(scheduledPeriod: Period?) {
        upsert(prop: &self.scheduledPeriod, val: scheduledPeriod)
    }
    @objc public dynamic var scheduledString: String?
    @objc public dynamic var scheduledTiming: Timing?
    public func upsert(scheduledTiming: Timing?) {
        upsert(prop: &self.scheduledTiming, val: scheduledTiming)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var statusReason: CodeableConcept?
    public func upsert(statusReason: CodeableConcept?) {
        upsert(prop: &self.statusReason, val: statusReason)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(prohibited: Bool) {
        self.init()
        self.prohibited.value = prohibited
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case code = "code"
        case dailyAmount = "dailyAmount"
        case description_fhir = "description"
        case goal = "goal"
        case location = "location"
        case performer = "performer"
        case productCodeableConcept = "productCodeableConcept"
        case productReference = "productReference"
        case prohibited = "prohibited"
        case quantity = "quantity"
        case reasonCode = "reasonCode"
        case reasonReference = "reasonReference"
        case scheduledPeriod = "scheduledPeriod"
        case scheduledString = "scheduledString"
        case scheduledTiming = "scheduledTiming"
        case status = "status"
        case statusReason = "statusReason"
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

        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.dailyAmount = try container.decodeIfPresent(Quantity.self, forKey: .dailyAmount)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.goal.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .goal) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.performer.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .performer) ?? [])
        self.productCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .productCodeableConcept)
        self.productReference = try container.decodeIfPresent(Reference.self, forKey: .productReference)
        self.prohibited.value = try container.decodeIfPresent(Bool.self, forKey: .prohibited)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.reasonCode.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reasonCode) ?? [])
        self.reasonReference.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .reasonReference) ?? [])
        self.scheduledPeriod = try container.decodeIfPresent(Period.self, forKey: .scheduledPeriod)
        self.scheduledString = try container.decodeIfPresent(String.self, forKey: .scheduledString)
        self.scheduledTiming = try container.decodeIfPresent(Timing.self, forKey: .scheduledTiming)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.statusReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .statusReason)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.dailyAmount, forKey: .dailyAmount)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.goal), forKey: .goal)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encode(Array(self.performer), forKey: .performer)
        try container.encodeIfPresent(self.productCodeableConcept, forKey: .productCodeableConcept)
        try container.encodeIfPresent(self.productReference, forKey: .productReference)
        try container.encodeIfPresent(self.prohibited.value, forKey: .prohibited)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encode(Array(self.reasonCode), forKey: .reasonCode)
        try container.encode(Array(self.reasonReference), forKey: .reasonReference)
        try container.encodeIfPresent(self.scheduledPeriod, forKey: .scheduledPeriod)
        try container.encodeIfPresent(self.scheduledString, forKey: .scheduledString)
        try container.encodeIfPresent(self.scheduledTiming, forKey: .scheduledTiming)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.statusReason, forKey: .statusReason)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					upsert(category: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dailyAmount"] {
				presentKeys.insert("dailyAmount")
				if let val = exist as? FHIRJSON {
					upsert(dailyAmount: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dailyAmount", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["goal"] {
				presentKeys.insert("goal")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.goal) }
						self.goal.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "goal", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					upsert(location: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.performer) }
						self.performer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["productCodeableConcept"] {
				presentKeys.insert("productCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(productCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "productCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["productReference"] {
				presentKeys.insert("productReference")
				if let val = exist as? FHIRJSON {
					upsert(productReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "productReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prohibited"] {
				presentKeys.insert("prohibited")
				if let val = exist as? Bool {
					self.prohibited.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "prohibited", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "prohibited"))
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonCode"] {
				presentKeys.insert("reasonCode")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonCode) }
						self.reasonCode.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonCode", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonReference"] {
				presentKeys.insert("reasonReference")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.reasonReference) }
						self.reasonReference.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonReference", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["scheduledPeriod"] {
				presentKeys.insert("scheduledPeriod")
				if let val = exist as? FHIRJSON {
					upsert(scheduledPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "scheduledPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["scheduledString"] {
				presentKeys.insert("scheduledString")
				if let val = exist as? String {
					self.scheduledString = val
				}
				else {
					errors.append(FHIRJSONError(key: "scheduledString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["scheduledTiming"] {
				presentKeys.insert("scheduledTiming")
				if let val = exist as? FHIRJSON {
					upsert(scheduledTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "scheduledTiming", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["statusReason"] {
				presentKeys.insert("statusReason")
				if let val = exist as? FHIRJSON {
					upsert(statusReason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "statusReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let dailyAmount = self.dailyAmount {
			json["dailyAmount"] = dailyAmount.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if goal.count > 0 {
			json["goal"] = Array(goal.map() { $0.asJSON() })
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if performer.count > 0 {
			json["performer"] = Array(performer.map() { $0.asJSON() })
		}
		if let productCodeableConcept = self.productCodeableConcept {
			json["productCodeableConcept"] = productCodeableConcept.asJSON()
		}
		if let productReference = self.productReference {
			json["productReference"] = productReference.asJSON()
		}
		if let prohibited = self.prohibited.value {
			json["prohibited"] = prohibited.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if reasonCode.count > 0 {
			json["reasonCode"] = Array(reasonCode.map() { $0.asJSON() })
		}
		if reasonReference.count > 0 {
			json["reasonReference"] = Array(reasonReference.map() { $0.asJSON() })
		}
		if let scheduledPeriod = self.scheduledPeriod {
			json["scheduledPeriod"] = scheduledPeriod.asJSON()
		}
		if let scheduledString = self.scheduledString {
			json["scheduledString"] = scheduledString.asJSON()
		}
		if let scheduledTiming = self.scheduledTiming {
			json["scheduledTiming"] = scheduledTiming.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let statusReason = self.statusReason {
			json["statusReason"] = statusReason.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CarePlanActivityDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CarePlanActivityDetail. Will return empty instance: \(error))")
		}
		return CarePlanActivityDetail.init()
	}
}


/**
 *  Who's involved in plan?.
 *
 *  Identifies all people and organizations who are expected to be involved in the care envisioned by this plan.
 */
open class CarePlanParticipant: BackboneElement {
	override open class var resourceType: String {
		get { return "CarePlanParticipant" }
	}

    @objc public dynamic var member: Reference?
    public func upsert(member: Reference?) {
        upsert(prop: &self.member, val: member)
    }
    @objc public dynamic var role: CodeableConcept?
    public func upsert(role: CodeableConcept?) {
        upsert(prop: &self.role, val: role)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case member = "member"
        case role = "role"
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

        self.member = try container.decodeIfPresent(Reference.self, forKey: .member)
        self.role = try container.decodeIfPresent(CodeableConcept.self, forKey: .role)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.member, forKey: .member)
        try container.encodeIfPresent(self.role, forKey: .role)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["member"] {
				presentKeys.insert("member")
				if let val = exist as? FHIRJSON {
					upsert(member: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "member", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? FHIRJSON {
					upsert(role: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let member = self.member {
			json["member"] = member.asJSON()
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CarePlanParticipant.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CarePlanParticipant. Will return empty instance: \(error))")
		}
		return CarePlanParticipant.init()
	}
}


/**
 *  Plans related to this one.
 *
 *  Identifies CarePlans with some sort of formal relationship to the current plan.
 */
open class CarePlanRelatedPlan: BackboneElement {
	override open class var resourceType: String {
		get { return "CarePlanRelatedPlan" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var plan: Reference?
    public func upsert(plan: Reference?) {
        upsert(prop: &self.plan, val: plan)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(plan: Reference) {
        self.init()
        self.plan = plan
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case plan = "plan"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.plan = try container.decodeIfPresent(Reference.self, forKey: .plan)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.plan, forKey: .plan)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? String {
					self.code = val
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["plan"] {
				presentKeys.insert("plan")
				if let val = exist as? FHIRJSON {
					upsert(plan: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "plan", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "plan"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let plan = self.plan {
			json["plan"] = plan.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CarePlanRelatedPlan.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CarePlanRelatedPlan. Will return empty instance: \(error))")
		}
		return CarePlanRelatedPlan.init()
	}
}

