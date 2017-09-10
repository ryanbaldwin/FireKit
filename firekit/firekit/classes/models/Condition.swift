//
//  Condition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Condition) on 2017-09-10.
//  2017, SMART Health IT.
//

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
        try container.encode(self.bodySite.flatMap { $0 }, forKey: .bodySite)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.clinicalStatus, forKey: .clinicalStatus)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.dateRecorded, forKey: .dateRecorded)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(self.evidence.flatMap { $0 }, forKey: .evidence)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["abatementBoolean"] {
				presentKeys.insert("abatementBoolean")
				if let val = exist as? Bool {
					self.abatementBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "abatementBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementDateTime"] {
				presentKeys.insert("abatementDateTime")
				if let val = exist as? String {
					self.abatementDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "abatementDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementPeriod"] {
				presentKeys.insert("abatementPeriod")
				if let val = exist as? FHIRJSON {
					upsert(abatementPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "abatementPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementQuantity"] {
				presentKeys.insert("abatementQuantity")
				if let val = exist as? FHIRJSON {
					upsert(abatementQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "abatementQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementRange"] {
				presentKeys.insert("abatementRange")
				if let val = exist as? FHIRJSON {
					upsert(abatementRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "abatementRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["abatementString"] {
				presentKeys.insert("abatementString")
				if let val = exist as? String {
					self.abatementString = val
				}
				else {
					errors.append(FHIRJSONError(key: "abatementString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["asserter"] {
				presentKeys.insert("asserter")
				if let val = exist as? FHIRJSON {
					upsert(asserter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "asserter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.bodySite) }
						self.bodySite.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					upsert(category: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["clinicalStatus"] {
				presentKeys.insert("clinicalStatus")
				if let val = exist as? String {
					self.clinicalStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "clinicalStatus", wants: String.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["dateRecorded"] {
				presentKeys.insert("dateRecorded")
				if let val = exist as? String {
					self.dateRecorded = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateRecorded", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["evidence"] {
				presentKeys.insert("evidence")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConditionEvidence.instantiate(fromArray: val, owner: self) as? [ConditionEvidence] {
						if let realm = self.realm { realm.delete(self.evidence) }
						self.evidence.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "evidence", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? String {
					self.notes = val
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["onsetDateTime"] {
				presentKeys.insert("onsetDateTime")
				if let val = exist as? String {
					self.onsetDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "onsetDateTime", wants: String.self, has: type(of: exist)))
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
			if let exist = js["severity"] {
				presentKeys.insert("severity")
				if let val = exist as? FHIRJSON {
					upsert(severity: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "severity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["stage"] {
				presentKeys.insert("stage")
				if let val = exist as? FHIRJSON {
					upsert(stage: ConditionStage(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "stage", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["verificationStatus"] {
				presentKeys.insert("verificationStatus")
				if let val = exist as? String {
					self.verificationStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "verificationStatus", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "verificationStatus"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let abatementBoolean = self.abatementBoolean.value {
			json["abatementBoolean"] = abatementBoolean.asJSON()
		}
		if let abatementDateTime = self.abatementDateTime {
			json["abatementDateTime"] = abatementDateTime.asJSON()
		}
		if let abatementPeriod = self.abatementPeriod {
			json["abatementPeriod"] = abatementPeriod.asJSON()
		}
		if let abatementQuantity = self.abatementQuantity {
			json["abatementQuantity"] = abatementQuantity.asJSON()
		}
		if let abatementRange = self.abatementRange {
			json["abatementRange"] = abatementRange.asJSON()
		}
		if let abatementString = self.abatementString {
			json["abatementString"] = abatementString.asJSON()
		}
		if let asserter = self.asserter {
			json["asserter"] = asserter.asJSON()
		}
		if bodySite.count > 0 {
			json["bodySite"] = Array(bodySite.map() { $0.asJSON() })
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let clinicalStatus = self.clinicalStatus {
			json["clinicalStatus"] = clinicalStatus.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let dateRecorded = self.dateRecorded {
			json["dateRecorded"] = dateRecorded.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if evidence.count > 0 {
			json["evidence"] = Array(evidence.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let notes = self.notes {
			json["notes"] = notes.asJSON()
		}
		if let onsetDateTime = self.onsetDateTime {
			json["onsetDateTime"] = onsetDateTime.asJSON()
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
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let severity = self.severity {
			json["severity"] = severity.asJSON()
		}
		if let stage = self.stage {
			json["stage"] = stage.asJSON()
		}
		if let verificationStatus = self.verificationStatus {
			json["verificationStatus"] = verificationStatus.asJSON()
		}
		
		return json
	}
*/
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
        try container.encode(self.detail.flatMap { $0 }, forKey: .detail)
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
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		
		return json
	}
*/
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
        try container.encode(self.assessment.flatMap { $0 }, forKey: .assessment)
        try container.encodeIfPresent(self.summary, forKey: .summary)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["assessment"] {
				presentKeys.insert("assessment")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.assessment) }
						self.assessment.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "assessment", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["summary"] {
				presentKeys.insert("summary")
				if let val = exist as? FHIRJSON {
					upsert(summary: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "summary", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if assessment.count > 0 {
			json["assessment"] = Array(assessment.map() { $0.asJSON() })
		}
		if let summary = self.summary {
			json["summary"] = summary.asJSON()
		}
		
		return json
	}
*/
}

