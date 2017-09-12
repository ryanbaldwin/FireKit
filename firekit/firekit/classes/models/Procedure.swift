//
//  Procedure.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Procedure) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  An action that is being or was performed on a patient.
 *
 *  An action that is or was performed on a patient. This can be a physical intervention like an operation, or less
 *  invasive like counseling or hypnotherapy.
 */
open class Procedure: DomainResource {
	override open class var resourceType: String {
		get { return "Procedure" }
	}

    public let bodySite = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let complication = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let focalDevice = RealmSwift.List<ProcedureFocalDevice>()
    public let followUp = RealmSwift.List<CodeableConcept>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    public let notPerformed = RealmOptional<Bool>()
    public let notes = RealmSwift.List<Annotation>()
    @objc public dynamic var outcome: CodeableConcept?
    public func upsert(outcome: CodeableConcept?) {
        upsert(prop: &self.outcome, val: outcome)
    }
    @objc public dynamic var performedDateTime: DateTime?
    @objc public dynamic var performedPeriod: Period?
    public func upsert(performedPeriod: Period?) {
        upsert(prop: &self.performedPeriod, val: performedPeriod)
    }
    public let performer = RealmSwift.List<ProcedurePerformer>()
    @objc public dynamic var reasonCodeableConcept: CodeableConcept?
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }
    public let reasonNotPerformed = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var reasonReference: Reference?
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }
    public let report = RealmSwift.List<Reference>()
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    public let used = RealmSwift.List<Reference>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, status: String, subject: Reference) {
        self.init()
        self.code = code
        self.status = status
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySite = "bodySite"
        case category = "category"
        case code = "code"
        case complication = "complication"
        case encounter = "encounter"
        case focalDevice = "focalDevice"
        case followUp = "followUp"
        case identifier = "identifier"
        case location = "location"
        case notPerformed = "notPerformed"
        case notes = "notes"
        case outcome = "outcome"
        case performedDateTime = "performedDateTime"
        case performedPeriod = "performedPeriod"
        case performer = "performer"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonNotPerformed = "reasonNotPerformed"
        case reasonReference = "reasonReference"
        case report = "report"
        case request = "request"
        case status = "status"
        case subject = "subject"
        case used = "used"
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

        self.bodySite.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .bodySite) ?? [])
        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.complication.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .complication) ?? [])
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.focalDevice.append(objectsIn: try container.decodeIfPresent([ProcedureFocalDevice].self, forKey: .focalDevice) ?? [])
        self.followUp.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .followUp) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.notPerformed.value = try container.decodeIfPresent(Bool.self, forKey: .notPerformed)
        self.notes.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .notes) ?? [])
        self.outcome = try container.decodeIfPresent(CodeableConcept.self, forKey: .outcome)
        self.performedDateTime = try container.decodeIfPresent(DateTime.self, forKey: .performedDateTime)
        self.performedPeriod = try container.decodeIfPresent(Period.self, forKey: .performedPeriod)
        self.performer.append(objectsIn: try container.decodeIfPresent([ProcedurePerformer].self, forKey: .performer) ?? [])
        self.reasonCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept)
        self.reasonNotPerformed.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reasonNotPerformed) ?? [])
        self.reasonReference = try container.decodeIfPresent(Reference.self, forKey: .reasonReference)
        self.report.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .report) ?? [])
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.used.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .used) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.bodySite), forKey: .bodySite)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.complication), forKey: .complication)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.focalDevice), forKey: .focalDevice)
        try container.encode(Array(self.followUp), forKey: .followUp)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.notPerformed.value, forKey: .notPerformed)
        try container.encode(Array(self.notes), forKey: .notes)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.performedDateTime, forKey: .performedDateTime)
        try container.encodeIfPresent(self.performedPeriod, forKey: .performedPeriod)
        try container.encode(Array(self.performer), forKey: .performer)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encode(Array(self.reasonNotPerformed), forKey: .reasonNotPerformed)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
        try container.encode(Array(self.report), forKey: .report)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encode(Array(self.used), forKey: .used)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["complication"] {
				presentKeys.insert("complication")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.complication) }
						self.complication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "complication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["focalDevice"] {
				presentKeys.insert("focalDevice")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProcedureFocalDevice.instantiate(fromArray: val, owner: self) as? [ProcedureFocalDevice] {
						if let realm = self.realm { realm.delete(self.focalDevice) }
						self.focalDevice.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "focalDevice", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["followUp"] {
				presentKeys.insert("followUp")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.followUp) }
						self.followUp.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "followUp", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					upsert(location: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["notPerformed"] {
				presentKeys.insert("notPerformed")
				if let val = exist as? Bool {
					self.notPerformed.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "notPerformed", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? [FHIRJSON] {
					if let vals = Annotation.instantiate(fromArray: val, owner: self) as? [Annotation] {
						if let realm = self.realm { realm.delete(self.notes) }
						self.notes.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["performedDateTime"] {
				presentKeys.insert("performedDateTime")
				if let val = exist as? String {
					self.performedDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "performedDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["performedPeriod"] {
				presentKeys.insert("performedPeriod")
				if let val = exist as? FHIRJSON {
					upsert(performedPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "performedPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProcedurePerformer.instantiate(fromArray: val, owner: self) as? [ProcedurePerformer] {
						if let realm = self.realm { realm.delete(self.performer) }
						self.performer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonCodeableConcept"] {
				presentKeys.insert("reasonCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(reasonCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonNotPerformed"] {
				presentKeys.insert("reasonNotPerformed")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonNotPerformed) }
						self.reasonNotPerformed.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonNotPerformed", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonReference"] {
				presentKeys.insert("reasonReference")
				if let val = exist as? FHIRJSON {
					upsert(reasonReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["report"] {
				presentKeys.insert("report")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.report) }
						self.report.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "report", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					upsert(request: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "subject"))
			}
			if let exist = js["used"] {
				presentKeys.insert("used")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.used) }
						self.used.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "used", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if bodySite.count > 0 {
			json["bodySite"] = Array(bodySite.map() { $0.asJSON() })
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if complication.count > 0 {
			json["complication"] = Array(complication.map() { $0.asJSON() })
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if focalDevice.count > 0 {
			json["focalDevice"] = Array(focalDevice.map() { $0.asJSON() })
		}
		if followUp.count > 0 {
			json["followUp"] = Array(followUp.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let notPerformed = self.notPerformed.value {
			json["notPerformed"] = notPerformed.asJSON()
		}
		if notes.count > 0 {
			json["notes"] = Array(notes.map() { $0.asJSON() })
		}
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let performedDateTime = self.performedDateTime {
			json["performedDateTime"] = performedDateTime.asJSON()
		}
		if let performedPeriod = self.performedPeriod {
			json["performedPeriod"] = performedPeriod.asJSON()
		}
		if performer.count > 0 {
			json["performer"] = Array(performer.map() { $0.asJSON() })
		}
		if let reasonCodeableConcept = self.reasonCodeableConcept {
			json["reasonCodeableConcept"] = reasonCodeableConcept.asJSON()
		}
		if reasonNotPerformed.count > 0 {
			json["reasonNotPerformed"] = Array(reasonNotPerformed.map() { $0.asJSON() })
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.asJSON()
		}
		if report.count > 0 {
			json["report"] = Array(report.map() { $0.asJSON() })
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if used.count > 0 {
			json["used"] = Array(used.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Procedure.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Procedure. Will return empty instance: \(error))")
		}
		return Procedure.init()
	}
}


/**
 *  Device changed in procedure.
 *
 *  A device that is implanted, removed or otherwise manipulated (calibration, battery replacement, fitting a
 *  prosthesis, attaching a wound-vac, etc.) as a focal portion of the Procedure.
 */
open class ProcedureFocalDevice: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcedureFocalDevice" }
	}

    @objc public dynamic var action: CodeableConcept?
    public func upsert(action: CodeableConcept?) {
        upsert(prop: &self.action, val: action)
    }
    @objc public dynamic var manipulated: Reference?
    public func upsert(manipulated: Reference?) {
        upsert(prop: &self.manipulated, val: manipulated)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(manipulated: Reference) {
        self.init()
        self.manipulated = manipulated
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case manipulated = "manipulated"
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

        self.action = try container.decodeIfPresent(CodeableConcept.self, forKey: .action)
        self.manipulated = try container.decodeIfPresent(Reference.self, forKey: .manipulated)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encodeIfPresent(self.manipulated, forKey: .manipulated)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? FHIRJSON {
					upsert(action: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["manipulated"] {
				presentKeys.insert("manipulated")
				if let val = exist as? FHIRJSON {
					upsert(manipulated: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "manipulated", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "manipulated"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let manipulated = self.manipulated {
			json["manipulated"] = manipulated.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProcedureFocalDevice.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcedureFocalDevice. Will return empty instance: \(error))")
		}
		return ProcedureFocalDevice.init()
	}
}


/**
 *  The people who performed the procedure.
 *
 *  Limited to 'real' people rather than equipment.
 */
open class ProcedurePerformer: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcedurePerformer" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    @objc public dynamic var role: CodeableConcept?
    public func upsert(role: CodeableConcept?) {
        upsert(prop: &self.role, val: role)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
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

        self.actor = try container.decodeIfPresent(Reference.self, forKey: .actor)
        self.role = try container.decodeIfPresent(CodeableConcept.self, forKey: .role)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encodeIfPresent(self.role, forKey: .role)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["actor"] {
				presentKeys.insert("actor")
				if let val = exist as? FHIRJSON {
					upsert(actor: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "actor", wants: FHIRJSON.self, has: type(of: exist)))
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
		
		if let actor = self.actor {
			json["actor"] = actor.asJSON()
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
			let clone = try JSONDecoder().decode(ProcedurePerformer.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcedurePerformer. Will return empty instance: \(error))")
		}
		return ProcedurePerformer.init()
	}
}

