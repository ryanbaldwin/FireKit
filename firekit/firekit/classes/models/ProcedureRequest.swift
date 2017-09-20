//
//  ProcedureRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ProcedureRequest) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A request for a procedure to be performed.
 *
 *  A request for a procedure to be performed. May be a proposal or an order.
 */
open class ProcedureRequest: DomainResource {
	override open class var resourceType: String {
		get { return "ProcedureRequest" }
	}

    public let asNeededBoolean = RealmOptional<Bool>()
    @objc public dynamic var asNeededCodeableConcept: CodeableConcept?
    public func upsert(asNeededCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.asNeededCodeableConcept, val: asNeededCodeableConcept)
    }
    public let bodySite = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let notes = RealmSwift.List<Annotation>()
    @objc public dynamic var orderedOn: DateTime?
    @objc public dynamic var orderer: Reference?
    public func upsert(orderer: Reference?) {
        upsert(prop: &self.orderer, val: orderer)
    }
    @objc public dynamic var performer: Reference?
    public func upsert(performer: Reference?) {
        upsert(prop: &self.performer, val: performer)
    }
    @objc public dynamic var priority: String?
    @objc public dynamic var reasonCodeableConcept: CodeableConcept?
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }
    @objc public dynamic var reasonReference: Reference?
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }
    @objc public dynamic var scheduledDateTime: DateTime?
    @objc public dynamic var scheduledPeriod: Period?
    public func upsert(scheduledPeriod: Period?) {
        upsert(prop: &self.scheduledPeriod, val: scheduledPeriod)
    }
    @objc public dynamic var scheduledTiming: Timing?
    public func upsert(scheduledTiming: Timing?) {
        upsert(prop: &self.scheduledTiming, val: scheduledTiming)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, subject: Reference) {
        self.init()
        self.code = code
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case asNeededBoolean = "asNeededBoolean"
        case asNeededCodeableConcept = "asNeededCodeableConcept"
        case bodySite = "bodySite"
        case code = "code"
        case encounter = "encounter"
        case identifier = "identifier"
        case notes = "notes"
        case orderedOn = "orderedOn"
        case orderer = "orderer"
        case performer = "performer"
        case priority = "priority"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonReference = "reasonReference"
        case scheduledDateTime = "scheduledDateTime"
        case scheduledPeriod = "scheduledPeriod"
        case scheduledTiming = "scheduledTiming"
        case status = "status"
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

        self.asNeededBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .asNeededBoolean)
        self.asNeededCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .asNeededCodeableConcept)
        self.bodySite.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .bodySite) ?? [])
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.notes.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .notes) ?? [])
        self.orderedOn = try container.decodeIfPresent(DateTime.self, forKey: .orderedOn)
        self.orderer = try container.decodeIfPresent(Reference.self, forKey: .orderer)
        self.performer = try container.decodeIfPresent(Reference.self, forKey: .performer)
        self.priority = try container.decodeIfPresent(String.self, forKey: .priority)
        self.reasonCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept)
        self.reasonReference = try container.decodeIfPresent(Reference.self, forKey: .reasonReference)
        self.scheduledDateTime = try container.decodeIfPresent(DateTime.self, forKey: .scheduledDateTime)
        self.scheduledPeriod = try container.decodeIfPresent(Period.self, forKey: .scheduledPeriod)
        self.scheduledTiming = try container.decodeIfPresent(Timing.self, forKey: .scheduledTiming)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.asNeededBoolean.value, forKey: .asNeededBoolean)
        try container.encodeIfPresent(self.asNeededCodeableConcept, forKey: .asNeededCodeableConcept)
        try container.encode(Array(self.bodySite), forKey: .bodySite)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.notes), forKey: .notes)
        try container.encodeIfPresent(self.orderedOn, forKey: .orderedOn)
        try container.encodeIfPresent(self.orderer, forKey: .orderer)
        try container.encodeIfPresent(self.performer, forKey: .performer)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
        try container.encodeIfPresent(self.scheduledDateTime, forKey: .scheduledDateTime)
        try container.encodeIfPresent(self.scheduledPeriod, forKey: .scheduledPeriod)
        try container.encodeIfPresent(self.scheduledTiming, forKey: .scheduledTiming)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProcedureRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcedureRequest. Will return empty instance: \(error))")
		}
		return ProcedureRequest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ProcedureRequest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        asNeededBoolean.value = o.asNeededBoolean.value
        FireKit.populate(&self.asNeededCodeableConcept, from: o.asNeededCodeableConcept)

        for (index, t) in o.bodySite.enumerated() {
            guard index < self.bodySite.count else {
                self.bodySite.append(t)
                continue
            }
            self.bodySite[index].populate(from: t)
        }
    
        if self.bodySite.count > o.bodySite.count {
            for i in self.bodySite.count...o.bodySite.count {
                let objectToRemove = self.bodySite[i]
                self.bodySite.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.code, from: o.code)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                let objectToRemove = self.identifier[i]
                self.identifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.notes.enumerated() {
            guard index < self.notes.count else {
                self.notes.append(t)
                continue
            }
            self.notes[index].populate(from: t)
        }
    
        if self.notes.count > o.notes.count {
            for i in self.notes.count...o.notes.count {
                let objectToRemove = self.notes[i]
                self.notes.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.orderedOn, from: o.orderedOn)
        FireKit.populate(&self.orderer, from: o.orderer)
        FireKit.populate(&self.performer, from: o.performer)
        priority = o.priority
        FireKit.populate(&self.reasonCodeableConcept, from: o.reasonCodeableConcept)
        FireKit.populate(&self.reasonReference, from: o.reasonReference)
        FireKit.populate(&self.scheduledDateTime, from: o.scheduledDateTime)
        FireKit.populate(&self.scheduledPeriod, from: o.scheduledPeriod)
        FireKit.populate(&self.scheduledTiming, from: o.scheduledTiming)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
    }
}

