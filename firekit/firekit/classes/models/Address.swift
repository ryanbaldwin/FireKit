//
//  Address.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Address) on 2017-11-07.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-07
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A postal address.
 *
 *  There is a variety of postal address formats defined around the world. This format defines a superset that is the
 *  basis for all addresses around the world.
 */
open class Address: Element {
	override open class var resourceType: String {
		get { return "Address" }
	}

    @objc public dynamic var city: String?
    @objc public dynamic var country: String?
    @objc public dynamic var district: String?
    public let line = RealmSwift.List<RealmString>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var postalCode: String?
    @objc public dynamic var state: String?
    @objc public dynamic var text: String?
    @objc public dynamic var type: String?
    @objc public dynamic var use: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "country"
        case district = "district"
        case line = "line"
        case period = "period"
        case postalCode = "postalCode"
        case state = "state"
        case text = "text"
        case type = "type"
        case use = "use"
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

        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.district = try container.decodeIfPresent(String.self, forKey: .district)
        self.line.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .line) ?? [])
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.district, forKey: .district)
        try container.encode(Array(self.line), forKey: .line)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.postalCode, forKey: .postalCode)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.use, forKey: .use)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Address.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Address. Will return empty instance: \(error))")
		}
		return Address.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Address else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        city = o.city
        country = o.country
        district = o.district

        for (index, t) in o.line.enumerated() {
            guard index < self.line.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = RealmString()
                val.populate(from: t)
                self.line.append(val)
                continue
            }
            self.line[index].populate(from: t)
        }
    
        while self.line.count > o.line.count {
            let objectToRemove = self.line.last!
            self.line.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.period, from: o.period)
        postalCode = o.postalCode
        state = o.state
        text = o.text
        type = o.type
        use = o.use
    }
}

