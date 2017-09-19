//
//  Procedure.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Procedure) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Procedure else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.bodySite, from: o.bodySite)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.code, from: o.code)
        FireKit.populateList(&self.complication, from: o.complication)
        FireKit.populate(&self.encounter, from: o.encounter)
        FireKit.populateList(&self.focalDevice, from: o.focalDevice)
        FireKit.populateList(&self.followUp, from: o.followUp)
        FireKit.populateList(&self.identifier, from: o.identifier)
        FireKit.populate(&self.location, from: o.location)
        notPerformed.value = o.notPerformed.value
        FireKit.populateList(&self.notes, from: o.notes)
        FireKit.populate(&self.outcome, from: o.outcome)
        performedDateTime = o.performedDateTime
        FireKit.populate(&self.performedPeriod, from: o.performedPeriod)
        FireKit.populateList(&self.performer, from: o.performer)
        FireKit.populate(&self.reasonCodeableConcept, from: o.reasonCodeableConcept)
        FireKit.populateList(&self.reasonNotPerformed, from: o.reasonNotPerformed)
        FireKit.populate(&self.reasonReference, from: o.reasonReference)
        FireKit.populateList(&self.report, from: o.report)
        FireKit.populate(&self.request, from: o.request)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populateList(&self.used, from: o.used)
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

    public override func populate(from other: Any) {
        guard let o = other as? ProcedureFocalDevice else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.action, from: o.action)
        FireKit.populate(&self.manipulated, from: o.manipulated)
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

    public override func populate(from other: Any) {
        guard let o = other as? ProcedurePerformer else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.actor, from: o.actor)
        FireKit.populate(&self.role, from: o.role)
    }
}

