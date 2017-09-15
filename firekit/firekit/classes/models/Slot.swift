//
//  Slot.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Slot) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A slot of time on a schedule that may be available for booking appointments.
 */
open class Slot: DomainResource {
	override open class var resourceType: String {
		get { return "Slot" }
	}

    @objc public dynamic var comment: String?
    @objc public dynamic var end: Instant?
    @objc public dynamic var freeBusyType: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let overbooked = RealmOptional<Bool>()
    @objc public dynamic var schedule: Reference?
    public func upsert(schedule: Reference?) {
        upsert(prop: &self.schedule, val: schedule)
    }
    @objc public dynamic var start: Instant?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(end: Instant, freeBusyType: String, schedule: Reference, start: Instant) {
        self.init()
        self.end = end
        self.freeBusyType = freeBusyType
        self.schedule = schedule
        self.start = start
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case comment = "comment"
        case end = "end"
        case freeBusyType = "freeBusyType"
        case identifier = "identifier"
        case overbooked = "overbooked"
        case schedule = "schedule"
        case start = "start"
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
        self.end = try container.decodeIfPresent(Instant.self, forKey: .end)
        self.freeBusyType = try container.decodeIfPresent(String.self, forKey: .freeBusyType)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.overbooked.value = try container.decodeIfPresent(Bool.self, forKey: .overbooked)
        self.schedule = try container.decodeIfPresent(Reference.self, forKey: .schedule)
        self.start = try container.decodeIfPresent(Instant.self, forKey: .start)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.freeBusyType, forKey: .freeBusyType)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.overbooked.value, forKey: .overbooked)
        try container.encodeIfPresent(self.schedule, forKey: .schedule)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Slot.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Slot. Will return empty instance: \(error))")
		}
		return Slot.init()
	}
}

