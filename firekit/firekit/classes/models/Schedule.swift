//
//  Schedule.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Schedule) on 2017-09-09.
//  2017, SMART Health IT.
//

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


        // Reference: FHIRJSON
        if let actorVal = try container.decodeIfPresent(Reference.self, forKey: .actor) {
          self.actor = actorVal
        }
        // String: String
        if let commentVal = try container.decodeIfPresent(String.self, forKey: .comment) {
          self.comment = commentVal
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        // Period: FHIRJSON
        if let planningHorizonVal = try container.decodeIfPresent(Period.self, forKey: .planningHorizon) {
          self.planningHorizon = planningHorizonVal
        }
        if let typeVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .type) {
          // CodeableConcept: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.planningHorizon, forKey: .planningHorizon)
        try container.encode(self.type.flatMap { $0 }, forKey: .type)
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
			else {
				errors.append(FHIRJSONError(key: "actor"))
			}
			if let exist = js["comment"] {
				presentKeys.insert("comment")
				if let val = exist as? String {
					self.comment = val
				}
				else {
					errors.append(FHIRJSONError(key: "comment", wants: String.self, has: type(of: exist)))
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
			if let exist = js["planningHorizon"] {
				presentKeys.insert("planningHorizon")
				if let val = exist as? FHIRJSON {
					upsert(planningHorizon: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "planningHorizon", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if let comment = self.comment {
			json["comment"] = comment.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let planningHorizon = self.planningHorizon {
			json["planningHorizon"] = planningHorizon.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}

