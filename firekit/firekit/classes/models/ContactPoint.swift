//
//  ContactPoint.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ContactPoint) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Details of a Technology mediated contact point (phone, fax, email, etc.).
 *
 *  Details for all kinds of technology mediated contact points for a person or organization, including telephone,
 *  email, etc.
 */
open class ContactPoint: Element {
	override open class var resourceType: String {
		get { return "ContactPoint" }
	}

    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let rank = RealmOptional<Int>()
    @objc public dynamic var system: String?
    @objc public dynamic var use: String?
    @objc public dynamic var value: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case period = "period"
        case rank = "rank"
        case system = "system"
        case use = "use"
        case value = "value"
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

        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.rank.value = try container.decodeIfPresent(Int.self, forKey: .rank)
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.rank.value, forKey: .rank)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.use, forKey: .use)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ContactPoint.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ContactPoint. Will return empty instance: \(error))")
		}
		return ContactPoint.init()
	}
}

