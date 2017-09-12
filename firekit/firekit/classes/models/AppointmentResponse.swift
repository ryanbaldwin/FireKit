//
//  AppointmentResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AppointmentResponse) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A reply to an appointment request for a patient and/or practitioner(s), such as a confirmation or rejection.
 */
open class AppointmentResponse: DomainResource {
	override open class var resourceType: String {
		get { return "AppointmentResponse" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    @objc public dynamic var appointment: Reference?
    public func upsert(appointment: Reference?) {
        upsert(prop: &self.appointment, val: appointment)
    }
    @objc public dynamic var comment: String?
    @objc public dynamic var end: Instant?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var participantStatus: String?
    public let participantType = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var start: Instant?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(appointment: Reference, participantStatus: String) {
        self.init()
        self.appointment = appointment
        self.participantStatus = participantStatus
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case appointment = "appointment"
        case comment = "comment"
        case end = "end"
        case identifier = "identifier"
        case participantStatus = "participantStatus"
        case participantType = "participantType"
        case start = "start"
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
        self.appointment = try container.decodeIfPresent(Reference.self, forKey: .appointment)
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.end = try container.decodeIfPresent(Instant.self, forKey: .end)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.participantStatus = try container.decodeIfPresent(String.self, forKey: .participantStatus)
        self.participantType.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .participantType) ?? [])
        self.start = try container.decodeIfPresent(Instant.self, forKey: .start)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encodeIfPresent(self.appointment, forKey: .appointment)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.participantStatus, forKey: .participantStatus)
        try container.encode(Array(self.participantType), forKey: .participantType)
        try container.encodeIfPresent(self.start, forKey: .start)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AppointmentResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AppointmentResponse. Will return empty instance: \(error))")
		}
		return AppointmentResponse.init()
	}
}

