//
//  DeviceUseStatement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceUseStatement) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  None.
 *
 *  A record of a device being used by a patient where the record is the result of a report from the patient or another
 *  clinician.
 */
open class DeviceUseStatement: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceUseStatement" }
	}

    @objc public dynamic var bodySiteCodeableConcept: CodeableConcept?
    public func upsert(bodySiteCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.bodySiteCodeableConcept, val: bodySiteCodeableConcept)
    }
    @objc public dynamic var bodySiteReference: Reference?
    public func upsert(bodySiteReference: Reference?) {
        upsert(prop: &self.bodySiteReference, val: bodySiteReference)
    }
    @objc public dynamic var device: Reference?
    public func upsert(device: Reference?) {
        upsert(prop: &self.device, val: device)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let indication = RealmSwift.List<CodeableConcept>()
    public let notes = RealmSwift.List<RealmString>()
    @objc public dynamic var recordedOn: DateTime?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var timingDateTime: DateTime?
    @objc public dynamic var timingPeriod: Period?
    public func upsert(timingPeriod: Period?) {
        upsert(prop: &self.timingPeriod, val: timingPeriod)
    }
    @objc public dynamic var timingTiming: Timing?
    public func upsert(timingTiming: Timing?) {
        upsert(prop: &self.timingTiming, val: timingTiming)
    }
    @objc public dynamic var whenUsed: Period?
    public func upsert(whenUsed: Period?) {
        upsert(prop: &self.whenUsed, val: whenUsed)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(device: Reference, subject: Reference) {
        self.init()
        self.device = device
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySiteCodeableConcept = "bodySiteCodeableConcept"
        case bodySiteReference = "bodySiteReference"
        case device = "device"
        case identifier = "identifier"
        case indication = "indication"
        case notes = "notes"
        case recordedOn = "recordedOn"
        case subject = "subject"
        case timingDateTime = "timingDateTime"
        case timingPeriod = "timingPeriod"
        case timingTiming = "timingTiming"
        case whenUsed = "whenUsed"
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

        self.bodySiteCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .bodySiteCodeableConcept)
        self.bodySiteReference = try container.decodeIfPresent(Reference.self, forKey: .bodySiteReference)
        self.device = try container.decodeIfPresent(Reference.self, forKey: .device)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.indication.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .indication) ?? [])
        self.notes.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .notes) ?? [])
        self.recordedOn = try container.decodeIfPresent(DateTime.self, forKey: .recordedOn)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.timingDateTime = try container.decodeIfPresent(DateTime.self, forKey: .timingDateTime)
        self.timingPeriod = try container.decodeIfPresent(Period.self, forKey: .timingPeriod)
        self.timingTiming = try container.decodeIfPresent(Timing.self, forKey: .timingTiming)
        self.whenUsed = try container.decodeIfPresent(Period.self, forKey: .whenUsed)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySiteCodeableConcept, forKey: .bodySiteCodeableConcept)
        try container.encodeIfPresent(self.bodySiteReference, forKey: .bodySiteReference)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.indication), forKey: .indication)
        try container.encode(Array(self.notes), forKey: .notes)
        try container.encodeIfPresent(self.recordedOn, forKey: .recordedOn)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.timingDateTime, forKey: .timingDateTime)
        try container.encodeIfPresent(self.timingPeriod, forKey: .timingPeriod)
        try container.encodeIfPresent(self.timingTiming, forKey: .timingTiming)
        try container.encodeIfPresent(self.whenUsed, forKey: .whenUsed)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DeviceUseStatement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DeviceUseStatement. Will return empty instance: \(error))")
		}
		return DeviceUseStatement.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DeviceUseStatement else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.bodySiteCodeableConcept, from: o.bodySiteCodeableConcept)
        FireKit.populate(&self.bodySiteReference, from: o.bodySiteReference)
        FireKit.populate(&self.device, from: o.device)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Identifier()
                val.populate(from: t)
                self.identifier.append(val)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.indication.enumerated() {
            guard index < self.indication.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = CodeableConcept()
                val.populate(from: t)
                self.indication.append(val)
                continue
            }
            self.indication[index].populate(from: t)
        }
    
        while self.indication.count > o.indication.count {
            let objectToRemove = self.indication.last!
            self.indication.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.notes.enumerated() {
            guard index < self.notes.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = RealmString()
                val.populate(from: t)
                self.notes.append(val)
                continue
            }
            self.notes[index].populate(from: t)
        }
    
        while self.notes.count > o.notes.count {
            let objectToRemove = self.notes.last!
            self.notes.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.recordedOn, from: o.recordedOn)
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populate(&self.timingDateTime, from: o.timingDateTime)
        FireKit.populate(&self.timingPeriod, from: o.timingPeriod)
        FireKit.populate(&self.timingTiming, from: o.timingTiming)
        FireKit.populate(&self.whenUsed, from: o.whenUsed)
    }
}

