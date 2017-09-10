//
//  ProcessRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ProcessRequest) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Process request.
 *
 *  This resource provides the target, request and response, and action details for an action to be performed by the
 *  target on or about existing resources.
 */
open class ProcessRequest: DomainResource {
	override open class var resourceType: String {
		get { return "ProcessRequest" }
	}

    @objc public dynamic var action: String?
    @objc public dynamic var created: DateTime?
    public let exclude = RealmSwift.List<RealmString>()
    public let identifier = RealmSwift.List<Identifier>()
    public let include = RealmSwift.List<RealmString>()
    public let item = RealmSwift.List<ProcessRequestItem>()
    public let nullify = RealmOptional<Bool>()
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var provider: Reference?
    public func upsert(provider: Reference?) {
        upsert(prop: &self.provider, val: provider)
    }
    @objc public dynamic var reference: String?
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var response: Reference?
    public func upsert(response: Reference?) {
        upsert(prop: &self.response, val: response)
    }
    @objc public dynamic var ruleset: Coding?
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: String) {
        self.init()
        self.action = action
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case created = "created"
        case exclude = "exclude"
        case identifier = "identifier"
        case include = "include"
        case item = "item"
        case nullify = "nullify"
        case organization = "organization"
        case originalRuleset = "originalRuleset"
        case period = "period"
        case provider = "provider"
        case reference = "reference"
        case request = "request"
        case response = "response"
        case ruleset = "ruleset"
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

        self.action = try container.decodeIfPresent(String.self, forKey: .action)
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.exclude.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .exclude) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.include.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .include) ?? [])
        self.item.append(objectsIn: try container.decodeIfPresent([ProcessRequestItem].self, forKey: .item) ?? [])
        self.nullify.value = try container.decodeIfPresent(Bool.self, forKey: .nullify)
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.provider = try container.decodeIfPresent(Reference.self, forKey: .provider)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.response = try container.decodeIfPresent(Reference.self, forKey: .response)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encode(self.exclude.flatMap { $0.value }, forKey: .exclude)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encode(self.include.flatMap { $0.value }, forKey: .include)
        try container.encode(self.item.flatMap { $0 }, forKey: .item)
        try container.encodeIfPresent(self.nullify.value, forKey: .nullify)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.response, forKey: .response)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
        try container.encodeIfPresent(self.target, forKey: .target)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? String {
					self.action = val
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "action"))
			}
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exclude"] {
				presentKeys.insert("exclude")
				if let val = exist as? [String] {
					self.exclude.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "exclude", wants: Array<String>.self, has: type(of: exist)))
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
			if let exist = js["include"] {
				presentKeys.insert("include")
				if let val = exist as? [String] {
					self.include.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "include", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProcessRequestItem.instantiate(fromArray: val, owner: self) as? [ProcessRequestItem] {
						if let realm = self.realm { realm.delete(self.item) }
						self.item.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["nullify"] {
				presentKeys.insert("nullify")
				if let val = exist as? Bool {
					self.nullify.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "nullify", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["organization"] {
				presentKeys.insert("organization")
				if let val = exist as? FHIRJSON {
					upsert(organization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "organization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["originalRuleset"] {
				presentKeys.insert("originalRuleset")
				if let val = exist as? FHIRJSON {
					upsert(originalRuleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "originalRuleset", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["provider"] {
				presentKeys.insert("provider")
				if let val = exist as? FHIRJSON {
					upsert(provider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "provider", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					upsert(request: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? FHIRJSON {
					upsert(response: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ruleset"] {
				presentKeys.insert("ruleset")
				if let val = exist as? FHIRJSON {
					upsert(ruleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "ruleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					upsert(target: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if exclude.count > 0 {
			json["exclude"] = Array(exclude.map() { $0.value })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if include.count > 0 {
			json["include"] = Array(include.map() { $0.value })
		}
		if item.count > 0 {
			json["item"] = Array(item.map() { $0.asJSON() })
		}
		if let nullify = self.nullify.value {
			json["nullify"] = nullify.asJSON()
		}
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let originalRuleset = self.originalRuleset {
			json["originalRuleset"] = originalRuleset.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let provider = self.provider {
			json["provider"] = provider.asJSON()
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		if let ruleset = self.ruleset {
			json["ruleset"] = ruleset.asJSON()
		}
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProcessRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcessRequest. Will return empty instance: \(error))")
		}
		return ProcessRequest.init()
	}
}


/**
 *  Items to re-adjudicate.
 *
 *  List of top level items to be re-adjudicated, if none specified then the entire submission is re-adjudicated.
 */
open class ProcessRequestItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcessRequestItem" }
	}

    public let sequenceLinkId = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequenceLinkId: Int) {
        self.init()
        self.sequenceLinkId.value = sequenceLinkId
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case sequenceLinkId = "sequenceLinkId"
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

        self.sequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .sequenceLinkId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.sequenceLinkId.value, forKey: .sequenceLinkId)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? Int {
					self.sequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequenceLinkId"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let sequenceLinkId = self.sequenceLinkId.value {
			json["sequenceLinkId"] = sequenceLinkId.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProcessRequestItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcessRequestItem. Will return empty instance: \(error))")
		}
		return ProcessRequestItem.init()
	}
}

