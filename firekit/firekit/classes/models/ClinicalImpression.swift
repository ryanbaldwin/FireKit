//
//  ClinicalImpression.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ClinicalImpression) on 2017-09-11.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.action) }
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["assessor"] {
				presentKeys.insert("assessor")
				if let val = exist as? FHIRJSON {
					upsert(assessor: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "assessor", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["finding"] {
				presentKeys.insert("finding")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClinicalImpressionFinding.instantiate(fromArray: val, owner: self) as? [ClinicalImpressionFinding] {
						if let realm = self.realm { realm.delete(self.finding) }
						self.finding.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "finding", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["investigations"] {
				presentKeys.insert("investigations")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClinicalImpressionInvestigations.instantiate(fromArray: val, owner: self) as? [ClinicalImpressionInvestigations] {
						if let realm = self.realm { realm.delete(self.investigations) }
						self.investigations.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "investigations", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["plan"] {
				presentKeys.insert("plan")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.plan) }
						self.plan.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "plan", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["previous"] {
				presentKeys.insert("previous")
				if let val = exist as? FHIRJSON {
					upsert(previous: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "previous", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["problem"] {
				presentKeys.insert("problem")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.problem) }
						self.problem.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "problem", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["prognosis"] {
				presentKeys.insert("prognosis")
				if let val = exist as? String {
					self.prognosis = val
				}
				else {
					errors.append(FHIRJSONError(key: "prognosis", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["protocol"] {
				presentKeys.insert("protocol")
				if let val = exist as? String {
					self.protocol_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "protocol", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["resolved"] {
				presentKeys.insert("resolved")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.resolved) }
						self.resolved.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "resolved", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["ruledOut"] {
				presentKeys.insert("ruledOut")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClinicalImpressionRuledOut.instantiate(fromArray: val, owner: self) as? [ClinicalImpressionRuledOut] {
						if let realm = self.realm { realm.delete(self.ruledOut) }
						self.ruledOut.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "ruledOut", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["summary"] {
				presentKeys.insert("summary")
				if let val = exist as? String {
					self.summary = val
				}
				else {
					errors.append(FHIRJSONError(key: "summary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["triggerCodeableConcept"] {
				presentKeys.insert("triggerCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(triggerCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "triggerCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["triggerReference"] {
				presentKeys.insert("triggerReference")
				if let val = exist as? FHIRJSON {
					upsert(triggerReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "triggerReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		if let assessor = self.assessor {
			json["assessor"] = assessor.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if finding.count > 0 {
			json["finding"] = Array(finding.map() { $0.asJSON() })
		}
		if investigations.count > 0 {
			json["investigations"] = Array(investigations.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if plan.count > 0 {
			json["plan"] = Array(plan.map() { $0.asJSON() })
		}
		if let previous = self.previous {
			json["previous"] = previous.asJSON()
		}
		if problem.count > 0 {
			json["problem"] = Array(problem.map() { $0.asJSON() })
		}
		if let prognosis = self.prognosis {
			json["prognosis"] = prognosis.asJSON()
		}
		if let protocol_fhir = self.protocol_fhir {
			json["protocol"] = protocol_fhir.asJSON()
		}
		if resolved.count > 0 {
			json["resolved"] = Array(resolved.map() { $0.asJSON() })
		}
		if ruledOut.count > 0 {
			json["ruledOut"] = Array(ruledOut.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let summary = self.summary {
			json["summary"] = summary.asJSON()
		}
		if let triggerCodeableConcept = self.triggerCodeableConcept {
			json["triggerCodeableConcept"] = triggerCodeableConcept.asJSON()
		}
		if let triggerReference = self.triggerReference {
			json["triggerReference"] = triggerReference.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["cause"] {
				presentKeys.insert("cause")
				if let val = exist as? String {
					self.cause = val
				}
				else {
					errors.append(FHIRJSONError(key: "cause", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					upsert(item: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let cause = self.cause {
			json["cause"] = cause.asJSON()
		}
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		
		return json
	}
*/
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
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.item) }
						self.item.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if item.count > 0 {
			json["item"] = Array(item.map() { $0.asJSON() })
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					upsert(item: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? String {
					self.reason = val
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		
		return json
	}
*/
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
}

