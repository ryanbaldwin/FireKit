//
//  Appointment.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Appointment) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A booking of a healthcare event among patient(s), practitioner(s), related person(s) and/or device(s) for a specific
 *  date/time. This may result in one or more Encounter(s).
 */
open class Appointment: DomainResource {
	override open class var resourceType: String {
		get { return "Appointment" }
	}

    @objc public dynamic var comment: String?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var end: Instant?
    public let identifier = RealmSwift.List<Identifier>()
    public let minutesDuration = RealmOptional<Int>()
    public let participant = RealmSwift.List<AppointmentParticipant>()
    public let priority = RealmOptional<Int>()
    @objc public dynamic var reason: CodeableConcept?
    public func upsert(reason: CodeableConcept?) {
        upsert(prop: &self.reason, val: reason)
    }
    public let slot = RealmSwift.List<Reference>()
    @objc public dynamic var start: Instant?
    @objc public dynamic var status: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(participant: [AppointmentParticipant], status: String) {
        self.init()
        self.participant.append(objectsIn: participant)
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case comment = "comment"
        case description_fhir = "description"
        case end = "end"
        case identifier = "identifier"
        case minutesDuration = "minutesDuration"
        case participant = "participant"
        case priority = "priority"
        case reason = "reason"
        case slot = "slot"
        case start = "start"
        case status = "status"
        case type = "type"
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

        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.end = try container.decodeIfPresent(Instant.self, forKey: .end)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.minutesDuration.value = try container.decodeIfPresent(Int.self, forKey: .minutesDuration)
        self.participant.append(objectsIn: try container.decodeIfPresent([AppointmentParticipant].self, forKey: .participant) ?? [])
        self.priority.value = try container.decodeIfPresent(Int.self, forKey: .priority)
        self.reason = try container.decodeIfPresent(CodeableConcept.self, forKey: .reason)
        self.slot.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .slot) ?? [])
        self.start = try container.decodeIfPresent(Instant.self, forKey: .start)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.minutesDuration.value, forKey: .minutesDuration)
        try container.encode(Array(self.participant), forKey: .participant)
        try container.encodeIfPresent(self.priority.value, forKey: .priority)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encode(Array(self.slot), forKey: .slot)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Appointment.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Appointment. Will return empty instance: \(error))")
		}
		return Appointment.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Appointment else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        comment = o.comment
        description_fhir = o.description_fhir
        FireKit.populate(&self.end, from: o.end)

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
        minutesDuration.value = o.minutesDuration.value

        for (index, t) in o.participant.enumerated() {
            guard index < self.participant.count else {
                self.participant.append(t)
                continue
            }
            self.participant[index].populate(from: t)
        }
    
        while self.participant.count > o.participant.count {
            let objectToRemove = self.participant.last!
            self.participant.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        priority.value = o.priority.value
        FireKit.populate(&self.reason, from: o.reason)

        for (index, t) in o.slot.enumerated() {
            guard index < self.slot.count else {
                self.slot.append(t)
                continue
            }
            self.slot[index].populate(from: t)
        }
    
        while self.slot.count > o.slot.count {
            let objectToRemove = self.slot.last!
            self.slot.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.start, from: o.start)
        status = o.status
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Participants involved in appointment.
 *
 *  List of participants involved in the appointment.
 */
open class AppointmentParticipant: BackboneElement {
	override open class var resourceType: String {
		get { return "AppointmentParticipant" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    @objc public dynamic var required: String?
    @objc public dynamic var status: String?
    public let type = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case required = "required"
        case status = "status"
        case type = "type"
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
        self.required = try container.decodeIfPresent(String.self, forKey: .required)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.type.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encodeIfPresent(self.required, forKey: .required)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.type), forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AppointmentParticipant.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AppointmentParticipant. Will return empty instance: \(error))")
		}
		return AppointmentParticipant.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AppointmentParticipant else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.actor, from: o.actor)
        required = o.required
        status = o.status

        for (index, t) in o.type.enumerated() {
            guard index < self.type.count else {
                self.type.append(t)
                continue
            }
            self.type[index].populate(from: t)
        }
    
        while self.type.count > o.type.count {
            let objectToRemove = self.type.last!
            self.type.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}

