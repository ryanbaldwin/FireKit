//
//  CarePlan.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/CarePlan) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? CarePlan else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.activity.enumerated() {
            guard index < self.activity.count else {
                self.activity.append(t)
                continue
            }
            self.activity[index].populate(from: t)
        }
    
        if self.activity.count > o.activity.count {
            for i in self.activity.count...o.activity.count {
                self.activity.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.addresses.enumerated() {
            guard index < self.addresses.count else {
                self.addresses.append(t)
                continue
            }
            self.addresses[index].populate(from: t)
        }
    
        if self.addresses.count > o.addresses.count {
            for i in self.addresses.count...o.addresses.count {
                self.addresses.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.author.enumerated() {
            guard index < self.author.count else {
                self.author.append(t)
                continue
            }
            self.author[index].populate(from: t)
        }
    
        if self.author.count > o.author.count {
            for i in self.author.count...o.author.count {
                self.author.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.category.enumerated() {
            guard index < self.category.count else {
                self.category.append(t)
                continue
            }
            self.category[index].populate(from: t)
        }
    
        if self.category.count > o.category.count {
            for i in self.category.count...o.category.count {
                self.category.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.context, from: o.context)
        description_fhir = o.description_fhir

        for (index, t) in o.goal.enumerated() {
            guard index < self.goal.count else {
                self.goal.append(t)
                continue
            }
            self.goal[index].populate(from: t)
        }
    
        if self.goal.count > o.goal.count {
            for i in self.goal.count...o.goal.count {
                self.goal.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                self.identifier.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.modified, from: o.modified)
        FireKit.populate(&self.note, from: o.note)

        for (index, t) in o.participant.enumerated() {
            guard index < self.participant.count else {
                self.participant.append(t)
                continue
            }
            self.participant[index].populate(from: t)
        }
    
        if self.participant.count > o.participant.count {
            for i in self.participant.count...o.participant.count {
                self.participant.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.period, from: o.period)

        for (index, t) in o.relatedPlan.enumerated() {
            guard index < self.relatedPlan.count else {
                self.relatedPlan.append(t)
                continue
            }
            self.relatedPlan[index].populate(from: t)
        }
    
        if self.relatedPlan.count > o.relatedPlan.count {
            for i in self.relatedPlan.count...o.relatedPlan.count {
                self.relatedPlan.remove(objectAtIndex: i)
            }
        }
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)

        for (index, t) in o.support.enumerated() {
            guard index < self.support.count else {
                self.support.append(t)
                continue
            }
            self.support[index].populate(from: t)
        }
    
        if self.support.count > o.support.count {
            for i in self.support.count...o.support.count {
                self.support.remove(objectAtIndex: i)
            }
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? CarePlanActivity else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.actionResulting.enumerated() {
            guard index < self.actionResulting.count else {
                self.actionResulting.append(t)
                continue
            }
            self.actionResulting[index].populate(from: t)
        }
    
        if self.actionResulting.count > o.actionResulting.count {
            for i in self.actionResulting.count...o.actionResulting.count {
                self.actionResulting.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.detail, from: o.detail)

        for (index, t) in o.progress.enumerated() {
            guard index < self.progress.count else {
                self.progress.append(t)
                continue
            }
            self.progress[index].populate(from: t)
        }
    
        if self.progress.count > o.progress.count {
            for i in self.progress.count...o.progress.count {
                self.progress.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.reference, from: o.reference)
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

    public override func populate(from other: Any) {
        guard let o = other as? CarePlanActivityDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.code, from: o.code)
        FireKit.populate(&self.dailyAmount, from: o.dailyAmount)
        description_fhir = o.description_fhir

        for (index, t) in o.goal.enumerated() {
            guard index < self.goal.count else {
                self.goal.append(t)
                continue
            }
            self.goal[index].populate(from: t)
        }
    
        if self.goal.count > o.goal.count {
            for i in self.goal.count...o.goal.count {
                self.goal.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.location, from: o.location)

        for (index, t) in o.performer.enumerated() {
            guard index < self.performer.count else {
                self.performer.append(t)
                continue
            }
            self.performer[index].populate(from: t)
        }
    
        if self.performer.count > o.performer.count {
            for i in self.performer.count...o.performer.count {
                self.performer.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.productCodeableConcept, from: o.productCodeableConcept)
        FireKit.populate(&self.productReference, from: o.productReference)
        prohibited.value = o.prohibited.value
        FireKit.populate(&self.quantity, from: o.quantity)

        for (index, t) in o.reasonCode.enumerated() {
            guard index < self.reasonCode.count else {
                self.reasonCode.append(t)
                continue
            }
            self.reasonCode[index].populate(from: t)
        }
    
        if self.reasonCode.count > o.reasonCode.count {
            for i in self.reasonCode.count...o.reasonCode.count {
                self.reasonCode.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.reasonReference.enumerated() {
            guard index < self.reasonReference.count else {
                self.reasonReference.append(t)
                continue
            }
            self.reasonReference[index].populate(from: t)
        }
    
        if self.reasonReference.count > o.reasonReference.count {
            for i in self.reasonReference.count...o.reasonReference.count {
                self.reasonReference.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.scheduledPeriod, from: o.scheduledPeriod)
        scheduledString = o.scheduledString
        FireKit.populate(&self.scheduledTiming, from: o.scheduledTiming)
        status = o.status
        FireKit.populate(&self.statusReason, from: o.statusReason)
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

    public override func populate(from other: Any) {
        guard let o = other as? CarePlanParticipant else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.member, from: o.member)
        FireKit.populate(&self.role, from: o.role)
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

    public override func populate(from other: Any) {
        guard let o = other as? CarePlanRelatedPlan else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code
        FireKit.populate(&self.plan, from: o.plan)
    }
}

