//
//  RiskAssessment.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/RiskAssessment) on 2017-09-18.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-18
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
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
    @objc public dynamic var condition: Reference?
    public func upsert(condition: Reference?) {
        upsert(prop: &self.condition, val: condition)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    @objc public dynamic var mitigation: String?
    @objc public dynamic var performer: Reference?
    public func upsert(performer: Reference?) {
        upsert(prop: &self.performer, val: performer)
    }
    public let prediction = RealmSwift.List<RiskAssessmentPrediction>()
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case basis = "basis"
        case condition = "condition"
        case date = "date"
        case encounter = "encounter"
        case identifier = "identifier"
        case method = "method"
        case mitigation = "mitigation"
        case performer = "performer"
        case prediction = "prediction"
        case subject = "subject"
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

        self.basis.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .basis) ?? [])
        self.condition = try container.decodeIfPresent(Reference.self, forKey: .condition)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.mitigation = try container.decodeIfPresent(String.self, forKey: .mitigation)
        self.performer = try container.decodeIfPresent(Reference.self, forKey: .performer)
        self.prediction.append(objectsIn: try container.decodeIfPresent([RiskAssessmentPrediction].self, forKey: .prediction) ?? [])
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.basis), forKey: .basis)
        try container.encodeIfPresent(self.condition, forKey: .condition)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.mitigation, forKey: .mitigation)
        try container.encodeIfPresent(self.performer, forKey: .performer)
        try container.encode(Array(self.prediction), forKey: .prediction)
        try container.encodeIfPresent(self.subject, forKey: .subject)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(RiskAssessment.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy RiskAssessment. Will return empty instance: \(error))")
		}
		return RiskAssessment.init()
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

    @objc public dynamic var outcome: CodeableConcept?
    public func upsert(outcome: CodeableConcept?) {
        upsert(prop: &self.outcome, val: outcome)
    }
    @objc public dynamic var probabilityCodeableConcept: CodeableConcept?
    public func upsert(probabilityCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.probabilityCodeableConcept, val: probabilityCodeableConcept)
    }
    @objc public dynamic var probabilityDecimal: RealmDecimal?
    @objc public dynamic var probabilityRange: Range?
    public func upsert(probabilityRange: Range?) {
        upsert(prop: &self.probabilityRange, val: probabilityRange)
    }
    @objc public dynamic var rationale: String?
    @objc public dynamic var relativeRisk: RealmDecimal?
    @objc public dynamic var whenPeriod: Period?
    public func upsert(whenPeriod: Period?) {
        upsert(prop: &self.whenPeriod, val: whenPeriod)
    }
    @objc public dynamic var whenRange: Range?
    public func upsert(whenRange: Range?) {
        upsert(prop: &self.whenRange, val: whenRange)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(outcome: CodeableConcept) {
        self.init()
        self.outcome = outcome
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case outcome = "outcome"
        case probabilityCodeableConcept = "probabilityCodeableConcept"
        case probabilityDecimal = "probabilityDecimal"
        case probabilityRange = "probabilityRange"
        case rationale = "rationale"
        case relativeRisk = "relativeRisk"
        case whenPeriod = "whenPeriod"
        case whenRange = "whenRange"
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

        self.outcome = try container.decodeIfPresent(CodeableConcept.self, forKey: .outcome)
        self.probabilityCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .probabilityCodeableConcept)
        self.probabilityDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .probabilityDecimal)
        self.probabilityRange = try container.decodeIfPresent(Range.self, forKey: .probabilityRange)
        self.rationale = try container.decodeIfPresent(String.self, forKey: .rationale)
        self.relativeRisk = try container.decodeIfPresent(RealmDecimal.self, forKey: .relativeRisk)
        self.whenPeriod = try container.decodeIfPresent(Period.self, forKey: .whenPeriod)
        self.whenRange = try container.decodeIfPresent(Range.self, forKey: .whenRange)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.probabilityCodeableConcept, forKey: .probabilityCodeableConcept)
        try container.encodeIfPresent(self.probabilityDecimal, forKey: .probabilityDecimal)
        try container.encodeIfPresent(self.probabilityRange, forKey: .probabilityRange)
        try container.encodeIfPresent(self.rationale, forKey: .rationale)
        try container.encodeIfPresent(self.relativeRisk, forKey: .relativeRisk)
        try container.encodeIfPresent(self.whenPeriod, forKey: .whenPeriod)
        try container.encodeIfPresent(self.whenRange, forKey: .whenRange)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(RiskAssessmentPrediction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy RiskAssessmentPrediction. Will return empty instance: \(error))")
		}
		return RiskAssessmentPrediction.init()
	}
}

