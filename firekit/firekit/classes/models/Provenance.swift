//
//  Provenance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Provenance) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Who, What, When for a set of resources.
 *
 *  Provenance of a resource is a record that describes entities and processes involved in producing and delivering or
 *  otherwise influencing that resource. Provenance provides a critical foundation for assessing authenticity, enabling
 *  trust, and allowing reproducibility. Provenance assertions are a form of contextual metadata and can themselves
 *  become important records with their own provenance. Provenance statement indicates clinical significance in terms of
 *  confidence in authenticity, reliability, and trustworthiness, integrity, and stage in lifecycle (e.g. Document
 *  Completion - has the artifact been legally authenticated), all of which may impact security, privacy, and trust
 *  policies.
 */
open class Provenance: DomainResource {
	override open class var resourceType: String {
		get { return "Provenance" }
	}

    @objc public dynamic var activity: CodeableConcept?
    public func upsert(activity: CodeableConcept?) {
        upsert(prop: &self.activity, val: activity)
    }
    public let agent = RealmSwift.List<ProvenanceAgent>()
    public let entity = RealmSwift.List<ProvenanceEntity>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let policy = RealmSwift.List<RealmString>()
    public let reason = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var recorded: Instant?
    public let signature = RealmSwift.List<Signature>()
    public let target = RealmSwift.List<Reference>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(recorded: Instant, target: [Reference]) {
        self.init()
        self.recorded = recorded
        self.target.append(objectsIn: target)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case agent = "agent"
        case entity = "entity"
        case location = "location"
        case period = "period"
        case policy = "policy"
        case reason = "reason"
        case recorded = "recorded"
        case signature = "signature"
        case target = "target"
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.activity, forKey: .activity)
        try container.encode(self.agent.flatMap { $0 }, forKey: .agent)
        try container.encode(self.entity.flatMap { $0 }, forKey: .entity)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(self.policy.flatMap { $0.value }, forKey: .policy)
        try container.encode(self.reason.flatMap { $0 }, forKey: .reason)
        try container.encodeIfPresent(self.recorded, forKey: .recorded)
        try container.encode(self.signature.flatMap { $0 }, forKey: .signature)
        try container.encode(self.target.flatMap { $0 }, forKey: .target)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["activity"] {
				presentKeys.insert("activity")
				if let val = exist as? FHIRJSON {
					upsert(activity: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "activity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["agent"] {
				presentKeys.insert("agent")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProvenanceAgent.instantiate(fromArray: val, owner: self) as? [ProvenanceAgent] {
						if let realm = self.realm { realm.delete(self.agent) }
						self.agent.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "agent", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["entity"] {
				presentKeys.insert("entity")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProvenanceEntity.instantiate(fromArray: val, owner: self) as? [ProvenanceEntity] {
						if let realm = self.realm { realm.delete(self.entity) }
						self.entity.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "entity", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["policy"] {
				presentKeys.insert("policy")
				if let val = exist as? [String] {
					self.policy.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "policy", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reason) }
						self.reason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["recorded"] {
				presentKeys.insert("recorded")
				if let val = exist as? String {
					self.recorded = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "recorded", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "recorded"))
			}
			if let exist = js["signature"] {
				presentKeys.insert("signature")
				if let val = exist as? [FHIRJSON] {
					if let vals = Signature.instantiate(fromArray: val, owner: self) as? [Signature] {
						if let realm = self.realm { realm.delete(self.signature) }
						self.signature.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "signature", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.target) }
						self.target.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "target"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let activity = self.activity {
			json["activity"] = activity.asJSON()
		}
		if agent.count > 0 {
			json["agent"] = Array(agent.map() { $0.asJSON() })
		}
		if entity.count > 0 {
			json["entity"] = Array(entity.map() { $0.asJSON() })
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if policy.count > 0 {
			json["policy"] = Array(policy.map() { $0.value })
		}
		if reason.count > 0 {
			json["reason"] = Array(reason.map() { $0.asJSON() })
		}
		if let recorded = self.recorded {
			json["recorded"] = recorded.asJSON()
		}
		if signature.count > 0 {
			json["signature"] = Array(signature.map() { $0.asJSON() })
		}
		if target.count > 0 {
			json["target"] = Array(target.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}


/**
 *  Agents involved in creating resource.
 *
 *  An agent takes a role in an activity such that the agent can be assigned some degree of responsibility for the
 *  activity taking place. An agent can be a person, an organization, software, or other entities that may be ascribed
 *  responsibility.
 */
open class ProvenanceAgent: BackboneElement {
	override open class var resourceType: String {
		get { return "ProvenanceAgent" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    public let relatedAgent = RealmSwift.List<ProvenanceAgentRelatedAgent>()
    @objc public dynamic var role: Coding?
    public func upsert(role: Coding?) {
        upsert(prop: &self.role, val: role)
    }
    @objc public dynamic var userId: Identifier?
    public func upsert(userId: Identifier?) {
        upsert(prop: &self.userId, val: userId)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(role: Coding) {
        self.init()
        self.role = role
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case relatedAgent = "relatedAgent"
        case role = "role"
        case userId = "userId"
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encode(self.relatedAgent.flatMap { $0 }, forKey: .relatedAgent)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.userId, forKey: .userId)
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
			if let exist = js["relatedAgent"] {
				presentKeys.insert("relatedAgent")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProvenanceAgentRelatedAgent.instantiate(fromArray: val, owner: self) as? [ProvenanceAgentRelatedAgent] {
						if let realm = self.realm { realm.delete(self.relatedAgent) }
						self.relatedAgent.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "relatedAgent", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? FHIRJSON {
					upsert(role: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "role"))
			}
			if let exist = js["userId"] {
				presentKeys.insert("userId")
				if let val = exist as? FHIRJSON {
					upsert(userId: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "userId", wants: FHIRJSON.self, has: type(of: exist)))
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
		if relatedAgent.count > 0 {
			json["relatedAgent"] = Array(relatedAgent.map() { $0.asJSON() })
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		if let userId = self.userId {
			json["userId"] = userId.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Track delegation between agents.
 *
 *  A relationship between two the agents referenced in this resource. This is defined to allow for explicit description
 *  of the delegation between agents.  For example, this human author used this device, or one person acted on another's
 *  behest.
 */
open class ProvenanceAgentRelatedAgent: BackboneElement {
	override open class var resourceType: String {
		get { return "ProvenanceAgentRelatedAgent" }
	}

    @objc public dynamic var target: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(target: String, type: CodeableConcept) {
        self.init()
        self.target = target
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case target = "target"
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
        self.target = try container.decodeIfPresent(String.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? String {
					self.target = val
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "target"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  An entity used in this activity.
 */
open class ProvenanceEntity: BackboneElement {
	override open class var resourceType: String {
		get { return "ProvenanceEntity" }
	}

    @objc public dynamic var agent: ProvenanceAgent?
    public func upsert(agent: ProvenanceAgent?) {
        upsert(prop: &self.agent, val: agent)
    }
    @objc public dynamic var display: String?
    @objc public dynamic var reference: String?
    @objc public dynamic var role: String?
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(reference: String, role: String, type: Coding) {
        self.init()
        self.reference = reference
        self.role = role
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case agent = "agent"
        case display = "display"
        case reference = "reference"
        case role = "role"
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
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.role = try container.decodeIfPresent(String.self, forKey: .role)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.agent, forKey: .agent)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["agent"] {
				presentKeys.insert("agent")
				if let val = exist as? FHIRJSON {
					upsert(agent: ProvenanceAgent(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "agent", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["display"] {
				presentKeys.insert("display")
				if let val = exist as? String {
					self.display = val
				}
				else {
					errors.append(FHIRJSONError(key: "display", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? String {
					self.reference = val
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "reference"))
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? String {
					self.role = val
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "role"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let agent = self.agent {
			json["agent"] = agent.asJSON()
		}
		if let display = self.display {
			json["display"] = display.asJSON()
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}

