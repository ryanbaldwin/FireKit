//
//  Condition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Condition) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Detailed information about conditions, problems or diagnoses.
 *
 *  Use to record detailed information about conditions, problems or diagnoses recognized by a clinician. There are many
 *  uses including: recording a diagnosis during an encounter; populating a problem list or a summary statement, such as
 *  a discharge summary.
 */
open class Condition: DomainResource {
	override open class var resourceType: String {
		get { return "Condition" }
	}

    public let abatementBoolean = RealmOptional<Bool>()
    @objc public dynamic var abatementDateTime: DateTime?
    @objc public dynamic var abatementPeriod: Period?
    public func upsert(abatementPeriod: Period?) {
        upsert(prop: &self.abatementPeriod, val: abatementPeriod)
    }
    @objc public dynamic var abatementQuantity: Quantity?
    public func upsert(abatementQuantity: Quantity?) {
        upsert(prop: &self.abatementQuantity, val: abatementQuantity)
    }
    @objc public dynamic var abatementRange: Range?
    public func upsert(abatementRange: Range?) {
        upsert(prop: &self.abatementRange, val: abatementRange)
    }
    @objc public dynamic var abatementString: String?
    @objc public dynamic var asserter: Reference?
    public func upsert(asserter: Reference?) {
        upsert(prop: &self.asserter, val: asserter)
    }
    public let bodySite = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var clinicalStatus: String?
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var dateRecorded: FHIRDate?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let evidence = RealmSwift.List<ConditionEvidence>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var notes: String?
    @objc public dynamic var onsetDateTime: DateTime?
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
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var severity: CodeableConcept?
    public func upsert(severity: CodeableConcept?) {
        upsert(prop: &self.severity, val: severity)
    }
    @objc public dynamic var stage: ConditionStage?
    public func upsert(stage: ConditionStage?) {
        upsert(prop: &self.stage, val: stage)
    }
    @objc public dynamic var verificationStatus: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, patient: Reference, verificationStatus: String) {
        self.init()
        self.code = code
        self.patient = patient
        self.verificationStatus = verificationStatus
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case abatementBoolean = "abatementBoolean"
        case abatementDateTime = "abatementDateTime"
        case abatementPeriod = "abatementPeriod"
        case abatementQuantity = "abatementQuantity"
        case abatementRange = "abatementRange"
        case abatementString = "abatementString"
        case asserter = "asserter"
        case bodySite = "bodySite"
        case category = "category"
        case clinicalStatus = "clinicalStatus"
        case code = "code"
        case dateRecorded = "dateRecorded"
        case encounter = "encounter"
        case evidence = "evidence"
        case identifier = "identifier"
        case notes = "notes"
        case onsetDateTime = "onsetDateTime"
        case onsetPeriod = "onsetPeriod"
        case onsetQuantity = "onsetQuantity"
        case onsetRange = "onsetRange"
        case onsetString = "onsetString"
        case patient = "patient"
        case severity = "severity"
        case stage = "stage"
        case verificationStatus = "verificationStatus"
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

        self.abatementBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .abatementBoolean)
        self.abatementDateTime = try container.decodeIfPresent(DateTime.self, forKey: .abatementDateTime)
        self.abatementPeriod = try container.decodeIfPresent(Period.self, forKey: .abatementPeriod)
        self.abatementQuantity = try container.decodeIfPresent(Quantity.self, forKey: .abatementQuantity)
        self.abatementRange = try container.decodeIfPresent(Range.self, forKey: .abatementRange)
        self.abatementString = try container.decodeIfPresent(String.self, forKey: .abatementString)
        self.asserter = try container.decodeIfPresent(Reference.self, forKey: .asserter)
        self.bodySite.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .bodySite) ?? [])
        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.clinicalStatus = try container.decodeIfPresent(String.self, forKey: .clinicalStatus)
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.dateRecorded = try container.decodeIfPresent(FHIRDate.self, forKey: .dateRecorded)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.evidence.append(objectsIn: try container.decodeIfPresent([ConditionEvidence].self, forKey: .evidence) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
        self.onsetDateTime = try container.decodeIfPresent(DateTime.self, forKey: .onsetDateTime)
        self.onsetPeriod = try container.decodeIfPresent(Period.self, forKey: .onsetPeriod)
        self.onsetQuantity = try container.decodeIfPresent(Quantity.self, forKey: .onsetQuantity)
        self.onsetRange = try container.decodeIfPresent(Range.self, forKey: .onsetRange)
        self.onsetString = try container.decodeIfPresent(String.self, forKey: .onsetString)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.severity = try container.decodeIfPresent(CodeableConcept.self, forKey: .severity)
        self.stage = try container.decodeIfPresent(ConditionStage.self, forKey: .stage)
        self.verificationStatus = try container.decodeIfPresent(String.self, forKey: .verificationStatus)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abatementBoolean.value, forKey: .abatementBoolean)
        try container.encodeIfPresent(self.abatementDateTime, forKey: .abatementDateTime)
        try container.encodeIfPresent(self.abatementPeriod, forKey: .abatementPeriod)
        try container.encodeIfPresent(self.abatementQuantity, forKey: .abatementQuantity)
        try container.encodeIfPresent(self.abatementRange, forKey: .abatementRange)
        try container.encodeIfPresent(self.abatementString, forKey: .abatementString)
        try container.encodeIfPresent(self.asserter, forKey: .asserter)
        try container.encode(Array(self.bodySite), forKey: .bodySite)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.clinicalStatus, forKey: .clinicalStatus)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.dateRecorded, forKey: .dateRecorded)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.evidence), forKey: .evidence)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encodeIfPresent(self.onsetDateTime, forKey: .onsetDateTime)
        try container.encodeIfPresent(self.onsetPeriod, forKey: .onsetPeriod)
        try container.encodeIfPresent(self.onsetQuantity, forKey: .onsetQuantity)
        try container.encodeIfPresent(self.onsetRange, forKey: .onsetRange)
        try container.encodeIfPresent(self.onsetString, forKey: .onsetString)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.severity, forKey: .severity)
        try container.encodeIfPresent(self.stage, forKey: .stage)
        try container.encodeIfPresent(self.verificationStatus, forKey: .verificationStatus)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Condition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Condition. Will return empty instance: \(error))")
		}
		return Condition.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Condition else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        abatementBoolean.value = o.abatementBoolean.value
        FireKit.populate(&self.abatementDateTime, from: o.abatementDateTime)
        FireKit.populate(&self.abatementPeriod, from: o.abatementPeriod)
        FireKit.populate(&self.abatementQuantity, from: o.abatementQuantity)
        FireKit.populate(&self.abatementRange, from: o.abatementRange)
        abatementString = o.abatementString
        FireKit.populate(&self.asserter, from: o.asserter)

        for (index, t) in o.bodySite.enumerated() {
            guard index < self.bodySite.count else {
                self.bodySite.append(t)
                continue
            }
            self.bodySite[index].populate(from: t)
        }
    
        while self.bodySite.count > o.bodySite.count {
            let objectToRemove = self.bodySite.last!
            self.bodySite.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.category, from: o.category)
        clinicalStatus = o.clinicalStatus
        FireKit.populate(&self.code, from: o.code)
        FireKit.populate(&self.dateRecorded, from: o.dateRecorded)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.evidence.enumerated() {
            guard index < self.evidence.count else {
                self.evidence.append(t)
                continue
            }
            self.evidence[index].populate(from: t)
        }
    
        while self.evidence.count > o.evidence.count {
            let objectToRemove = self.evidence.last!
            self.evidence.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        notes = o.notes
        FireKit.populate(&self.onsetDateTime, from: o.onsetDateTime)
        FireKit.populate(&self.onsetPeriod, from: o.onsetPeriod)
        FireKit.populate(&self.onsetQuantity, from: o.onsetQuantity)
        FireKit.populate(&self.onsetRange, from: o.onsetRange)
        onsetString = o.onsetString
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.severity, from: o.severity)
        FireKit.populate(&self.stage, from: o.stage)
        verificationStatus = o.verificationStatus
    }
}


/**
 *  Supporting evidence.
 *
 *  Supporting Evidence / manifestations that are the basis on which this condition is suspected or confirmed.
 */
open class ConditionEvidence: BackboneElement {
	override open class var resourceType: String {
		get { return "ConditionEvidence" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let detail = RealmSwift.List<Reference>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case detail = "detail"
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
        self.detail.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .detail) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.detail), forKey: .detail)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConditionEvidence.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConditionEvidence. Will return empty instance: \(error))")
		}
		return ConditionEvidence.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConditionEvidence else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)

        for (index, t) in o.detail.enumerated() {
            guard index < self.detail.count else {
                self.detail.append(t)
                continue
            }
            self.detail[index].populate(from: t)
        }
    
        while self.detail.count > o.detail.count {
            let objectToRemove = self.detail.last!
            self.detail.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}


/**
 *  Stage/grade, usually assessed formally.
 *
 *  Clinical stage or grade of a condition. May include formal severity assessments.
 */
open class ConditionStage: BackboneElement {
	override open class var resourceType: String {
		get { return "ConditionStage" }
	}

    public let assessment = RealmSwift.List<Reference>()
    @objc public dynamic var summary: CodeableConcept?
    public func upsert(summary: CodeableConcept?) {
        upsert(prop: &self.summary, val: summary)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case assessment = "assessment"
        case summary = "summary"
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

        self.assessment.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .assessment) ?? [])
        self.summary = try container.decodeIfPresent(CodeableConcept.self, forKey: .summary)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.assessment), forKey: .assessment)
        try container.encodeIfPresent(self.summary, forKey: .summary)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConditionStage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConditionStage. Will return empty instance: \(error))")
		}
		return ConditionStage.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConditionStage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.assessment.enumerated() {
            guard index < self.assessment.count else {
                self.assessment.append(t)
                continue
            }
            self.assessment[index].populate(from: t)
        }
    
        while self.assessment.count > o.assessment.count {
            let objectToRemove = self.assessment.last!
            self.assessment.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.summary, from: o.summary)
    }
}

