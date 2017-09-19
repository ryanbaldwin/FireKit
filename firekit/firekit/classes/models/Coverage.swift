//
//  Coverage.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Coverage) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Insurance or medical plan.
 *
 *  Financial instrument which may be used to pay for or reimburse health care products and services.
 */
open class Coverage: DomainResource {
	override open class var resourceType: String {
		get { return "Coverage" }
	}

    @objc public dynamic var bin: Identifier?
    public func upsert(bin: Identifier?) {
        upsert(prop: &self.bin, val: bin)
    }
    public let contract = RealmSwift.List<Reference>()
    public let dependent = RealmOptional<Int>()
    @objc public dynamic var group: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var issuer: Reference?
    public func upsert(issuer: Reference?) {
        upsert(prop: &self.issuer, val: issuer)
    }
    @objc public dynamic var network: Identifier?
    public func upsert(network: Identifier?) {
        upsert(prop: &self.network, val: network)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var plan: String?
    public let sequence = RealmOptional<Int>()
    @objc public dynamic var subPlan: String?
    @objc public dynamic var subscriber: Reference?
    public func upsert(subscriber: Reference?) {
        upsert(prop: &self.subscriber, val: subscriber)
    }
    @objc public dynamic var subscriberId: Identifier?
    public func upsert(subscriberId: Identifier?) {
        upsert(prop: &self.subscriberId, val: subscriberId)
    }
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bin = "bin"
        case contract = "contract"
        case dependent = "dependent"
        case group = "group"
        case identifier = "identifier"
        case issuer = "issuer"
        case network = "network"
        case period = "period"
        case plan = "plan"
        case sequence = "sequence"
        case subPlan = "subPlan"
        case subscriber = "subscriber"
        case subscriberId = "subscriberId"
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

        self.bin = try container.decodeIfPresent(Identifier.self, forKey: .bin)
        self.contract.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .contract) ?? [])
        self.dependent.value = try container.decodeIfPresent(Int.self, forKey: .dependent)
        self.group = try container.decodeIfPresent(String.self, forKey: .group)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.issuer = try container.decodeIfPresent(Reference.self, forKey: .issuer)
        self.network = try container.decodeIfPresent(Identifier.self, forKey: .network)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.plan = try container.decodeIfPresent(String.self, forKey: .plan)
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
        self.subPlan = try container.decodeIfPresent(String.self, forKey: .subPlan)
        self.subscriber = try container.decodeIfPresent(Reference.self, forKey: .subscriber)
        self.subscriberId = try container.decodeIfPresent(Identifier.self, forKey: .subscriberId)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bin, forKey: .bin)
        try container.encode(Array(self.contract), forKey: .contract)
        try container.encodeIfPresent(self.dependent.value, forKey: .dependent)
        try container.encodeIfPresent(self.group, forKey: .group)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.issuer, forKey: .issuer)
        try container.encodeIfPresent(self.network, forKey: .network)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.plan, forKey: .plan)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
        try container.encodeIfPresent(self.subPlan, forKey: .subPlan)
        try container.encodeIfPresent(self.subscriber, forKey: .subscriber)
        try container.encodeIfPresent(self.subscriberId, forKey: .subscriberId)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Coverage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Coverage. Will return empty instance: \(error))")
		}
		return Coverage.init()
	}
}



