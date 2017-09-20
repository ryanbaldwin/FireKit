//
//  Schedule.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Schedule) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A container for slot(s) of time that may be available for booking appointments.
 */
open class Schedule: DomainResource {
	override open class var resourceType: String {
		get { return "Schedule" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    @objc public dynamic var comment: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var planningHorizon: Period?
    public func upsert(planningHorizon: Period?) {
        upsert(prop: &self.planningHorizon, val: planningHorizon)
    }
    public let type = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(actor: Reference) {
        self.init()
        self.actor = actor
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case comment = "comment"
        case identifier = "identifier"
        case planningHorizon = "planningHorizon"
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
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.planningHorizon = try container.decodeIfPresent(Period.self, forKey: .planningHorizon)
        self.type.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.planningHorizon, forKey: .planningHorizon)
        try container.encode(Array(self.type), forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Schedule.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Schedule. Will return empty instance: \(error))")
		}
		return Schedule.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Schedule else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.actor, from: o.actor)
        comment = o.comment

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
        FireKit.populate(&self.planningHorizon, from: o.planningHorizon)

        for (index, t) in o.type.enumerated() {
            guard index < self.type.count else {
                self.type.append(t)
                continue
            }
            self.type[index].populate(from: t)
        }
    
        if self.type.count > o.type.count {
            for i in self.type.count...o.type.count {
                let objectToRemove = self.type[i]
                self.type.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
    }
}

