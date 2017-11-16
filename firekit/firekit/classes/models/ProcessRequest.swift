//
//  ProcessRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ProcessRequest) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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
        try container.encode(Array(self.exclude), forKey: .exclude)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.include), forKey: .include)
        try container.encode(Array(self.item), forKey: .item)
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

    public override func populate(from other: Any) {
        guard let o = other as? ProcessRequest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        action = o.action
        FireKit.populate(&self.created, from: o.created)

        for (index, t) in o.exclude.enumerated() {
            guard index < self.exclude.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = RealmString()
                val.populate(from: t)
                self.exclude.append(val)
                continue
            }
            self.exclude[index].populate(from: t)
        }
    
        while self.exclude.count > o.exclude.count {
            let objectToRemove = self.exclude.last!
            self.exclude.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

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

        for (index, t) in o.include.enumerated() {
            guard index < self.include.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = RealmString()
                val.populate(from: t)
                self.include.append(val)
                continue
            }
            self.include[index].populate(from: t)
        }
    
        while self.include.count > o.include.count {
            let objectToRemove = self.include.last!
            self.include.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.item.enumerated() {
            guard index < self.item.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = ProcessRequestItem()
                val.populate(from: t)
                self.item.append(val)
                continue
            }
            self.item[index].populate(from: t)
        }
    
        while self.item.count > o.item.count {
            let objectToRemove = self.item.last!
            self.item.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        nullify.value = o.nullify.value
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        FireKit.populate(&self.period, from: o.period)
        FireKit.populate(&self.provider, from: o.provider)
        reference = o.reference
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.response, from: o.response)
        FireKit.populate(&self.ruleset, from: o.ruleset)
        FireKit.populate(&self.target, from: o.target)
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

    public override func populate(from other: Any) {
        guard let o = other as? ProcessRequestItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        sequenceLinkId.value = o.sequenceLinkId.value
    }
}

