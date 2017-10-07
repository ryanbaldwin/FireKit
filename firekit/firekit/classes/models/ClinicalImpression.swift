//
//  ClinicalImpression.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ClinicalImpression) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A clinical assessment performed when planning treatments and management strategies for a patient.
 *
 *  A record of a clinical assessment performed to determine what problem(s) may affect the patient and before planning
 *  the treatments or management strategies that are best to manage a patient's condition. Assessments are often 1:1
 *  with a clinical consultation / encounter,  but this varies greatly depending on the clinical workflow. This resource
 *  is called "ClinicalImpression" rather than "ClinicalAssessment" to avoid confusion with the recording of assessment
 *  tools such as Apgar score.
 */
open class ClinicalImpression: DomainResource {
	override open class var resourceType: String {
		get { return "ClinicalImpression" }
	}

    public let action = RealmSwift.List<Reference>()
    @objc public dynamic var assessor: Reference?
    public func upsert(assessor: Reference?) {
        upsert(prop: &self.assessor, val: assessor)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let finding = RealmSwift.List<ClinicalImpressionFinding>()
    public let investigations = RealmSwift.List<ClinicalImpressionInvestigations>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    public let plan = RealmSwift.List<Reference>()
    @objc public dynamic var previous: Reference?
    public func upsert(previous: Reference?) {
        upsert(prop: &self.previous, val: previous)
    }
    public let problem = RealmSwift.List<Reference>()
    @objc public dynamic var prognosis: String?
    @objc public dynamic var protocol_fhir: String?
    public let resolved = RealmSwift.List<CodeableConcept>()
    public let ruledOut = RealmSwift.List<ClinicalImpressionRuledOut>()
    @objc public dynamic var status: String?
    @objc public dynamic var summary: String?
    @objc public dynamic var triggerCodeableConcept: CodeableConcept?
    public func upsert(triggerCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.triggerCodeableConcept, val: triggerCodeableConcept)
    }
    @objc public dynamic var triggerReference: Reference?
    public func upsert(triggerReference: Reference?) {
        upsert(prop: &self.triggerReference, val: triggerReference)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, status: String) {
        self.init()
        self.patient = patient
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case assessor = "assessor"
        case date = "date"
        case description_fhir = "description"
        case finding = "finding"
        case investigations = "investigations"
        case patient = "patient"
        case plan = "plan"
        case previous = "previous"
        case problem = "problem"
        case prognosis = "prognosis"
        case protocol_fhir = "protocol"
        case resolved = "resolved"
        case ruledOut = "ruledOut"
        case status = "status"
        case summary = "summary"
        case triggerCodeableConcept = "triggerCodeableConcept"
        case triggerReference = "triggerReference"
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

        self.action.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .action) ?? [])
        self.assessor = try container.decodeIfPresent(Reference.self, forKey: .assessor)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.finding.append(objectsIn: try container.decodeIfPresent([ClinicalImpressionFinding].self, forKey: .finding) ?? [])
        self.investigations.append(objectsIn: try container.decodeIfPresent([ClinicalImpressionInvestigations].self, forKey: .investigations) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.plan.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .plan) ?? [])
        self.previous = try container.decodeIfPresent(Reference.self, forKey: .previous)
        self.problem.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .problem) ?? [])
        self.prognosis = try container.decodeIfPresent(String.self, forKey: .prognosis)
        self.protocol_fhir = try container.decodeIfPresent(String.self, forKey: .protocol_fhir)
        self.resolved.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .resolved) ?? [])
        self.ruledOut.append(objectsIn: try container.decodeIfPresent([ClinicalImpressionRuledOut].self, forKey: .ruledOut) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary)
        self.triggerCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .triggerCodeableConcept)
        self.triggerReference = try container.decodeIfPresent(Reference.self, forKey: .triggerReference)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.action), forKey: .action)
        try container.encodeIfPresent(self.assessor, forKey: .assessor)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.finding), forKey: .finding)
        try container.encode(Array(self.investigations), forKey: .investigations)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(Array(self.plan), forKey: .plan)
        try container.encodeIfPresent(self.previous, forKey: .previous)
        try container.encode(Array(self.problem), forKey: .problem)
        try container.encodeIfPresent(self.prognosis, forKey: .prognosis)
        try container.encodeIfPresent(self.protocol_fhir, forKey: .protocol_fhir)
        try container.encode(Array(self.resolved), forKey: .resolved)
        try container.encode(Array(self.ruledOut), forKey: .ruledOut)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.summary, forKey: .summary)
        try container.encodeIfPresent(self.triggerCodeableConcept, forKey: .triggerCodeableConcept)
        try container.encodeIfPresent(self.triggerReference, forKey: .triggerReference)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClinicalImpression.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClinicalImpression. Will return empty instance: \(error))")
		}
		return ClinicalImpression.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClinicalImpression else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.action.enumerated() {
            guard index < self.action.count else {
                self.action.append(t)
                continue
            }
            self.action[index].populate(from: t)
        }
    
        while self.action.count > o.action.count {
            let objectToRemove = self.action.last!
            self.action.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.assessor, from: o.assessor)
        FireKit.populate(&self.date, from: o.date)
        description_fhir = o.description_fhir

        for (index, t) in o.finding.enumerated() {
            guard index < self.finding.count else {
                self.finding.append(t)
                continue
            }
            self.finding[index].populate(from: t)
        }
    
        while self.finding.count > o.finding.count {
            let objectToRemove = self.finding.last!
            self.finding.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.investigations.enumerated() {
            guard index < self.investigations.count else {
                self.investigations.append(t)
                continue
            }
            self.investigations[index].populate(from: t)
        }
    
        while self.investigations.count > o.investigations.count {
            let objectToRemove = self.investigations.last!
            self.investigations.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.patient, from: o.patient)

        for (index, t) in o.plan.enumerated() {
            guard index < self.plan.count else {
                self.plan.append(t)
                continue
            }
            self.plan[index].populate(from: t)
        }
    
        while self.plan.count > o.plan.count {
            let objectToRemove = self.plan.last!
            self.plan.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.previous, from: o.previous)

        for (index, t) in o.problem.enumerated() {
            guard index < self.problem.count else {
                self.problem.append(t)
                continue
            }
            self.problem[index].populate(from: t)
        }
    
        while self.problem.count > o.problem.count {
            let objectToRemove = self.problem.last!
            self.problem.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        prognosis = o.prognosis
        protocol_fhir = o.protocol_fhir

        for (index, t) in o.resolved.enumerated() {
            guard index < self.resolved.count else {
                self.resolved.append(t)
                continue
            }
            self.resolved[index].populate(from: t)
        }
    
        while self.resolved.count > o.resolved.count {
            let objectToRemove = self.resolved.last!
            self.resolved.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.ruledOut.enumerated() {
            guard index < self.ruledOut.count else {
                self.ruledOut.append(t)
                continue
            }
            self.ruledOut[index].populate(from: t)
        }
    
        while self.ruledOut.count > o.ruledOut.count {
            let objectToRemove = self.ruledOut.last!
            self.ruledOut.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        status = o.status
        summary = o.summary
        FireKit.populate(&self.triggerCodeableConcept, from: o.triggerCodeableConcept)
        FireKit.populate(&self.triggerReference, from: o.triggerReference)
    }
}


/**
 *  Possible or likely findings and diagnoses.
 *
 *  Specific findings or diagnoses that was considered likely or relevant to ongoing treatment.
 */
open class ClinicalImpressionFinding: BackboneElement {
	override open class var resourceType: String {
		get { return "ClinicalImpressionFinding" }
	}

    @objc public dynamic var cause: String?
    @objc public dynamic var item: CodeableConcept?
    public func upsert(item: CodeableConcept?) {
        upsert(prop: &self.item, val: item)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(item: CodeableConcept) {
        self.init()
        self.item = item
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case cause = "cause"
        case item = "item"
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

        self.cause = try container.decodeIfPresent(String.self, forKey: .cause)
        self.item = try container.decodeIfPresent(CodeableConcept.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.cause, forKey: .cause)
        try container.encodeIfPresent(self.item, forKey: .item)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClinicalImpressionFinding.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClinicalImpressionFinding. Will return empty instance: \(error))")
		}
		return ClinicalImpressionFinding.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClinicalImpressionFinding else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        cause = o.cause
        FireKit.populate(&self.item, from: o.item)
    }
}


/**
 *  One or more sets of investigations (signs, symptions, etc.).
 *
 *  One or more sets of investigations (signs, symptions, etc.). The actual grouping of investigations vary greatly
 *  depending on the type and context of the assessment. These investigations may include data generated during the
 *  assessment process, or data previously generated and recorded that is pertinent to the outcomes.
 */
open class ClinicalImpressionInvestigations: BackboneElement {
	override open class var resourceType: String {
		get { return "ClinicalImpressionInvestigations" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let item = RealmSwift.List<Reference>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case item = "item"
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
        self.item.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .item) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.item), forKey: .item)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClinicalImpressionInvestigations.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClinicalImpressionInvestigations. Will return empty instance: \(error))")
		}
		return ClinicalImpressionInvestigations.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClinicalImpressionInvestigations else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)

        for (index, t) in o.item.enumerated() {
            guard index < self.item.count else {
                self.item.append(t)
                continue
            }
            self.item[index].populate(from: t)
        }
    
        while self.item.count > o.item.count {
            let objectToRemove = self.item.last!
            self.item.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}


/**
 *  Diagnosis considered not possible.
 */
open class ClinicalImpressionRuledOut: BackboneElement {
	override open class var resourceType: String {
		get { return "ClinicalImpressionRuledOut" }
	}

    @objc public dynamic var item: CodeableConcept?
    public func upsert(item: CodeableConcept?) {
        upsert(prop: &self.item, val: item)
    }
    @objc public dynamic var reason: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(item: CodeableConcept) {
        self.init()
        self.item = item
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case item = "item"
        case reason = "reason"
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

        self.item = try container.decodeIfPresent(CodeableConcept.self, forKey: .item)
        self.reason = try container.decodeIfPresent(String.self, forKey: .reason)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.item, forKey: .item)
        try container.encodeIfPresent(self.reason, forKey: .reason)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClinicalImpressionRuledOut.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClinicalImpressionRuledOut. Will return empty instance: \(error))")
		}
		return ClinicalImpressionRuledOut.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClinicalImpressionRuledOut else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.item, from: o.item)
        reason = o.reason
    }
}

