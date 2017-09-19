//
//  SampledData.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SampledData) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A series of measurements taken by a device.
 *
 *  A series of measurements taken by a device, with upper and lower limits. There may be more than one dimension in the
 *  data.
 */
open class SampledData: Element {
	override open class var resourceType: String {
		get { return "SampledData" }
	}

    @objc public dynamic var data: String?
    public let dimensions = RealmOptional<Int>()
    @objc public dynamic var factor: RealmDecimal?
    @objc public dynamic var lowerLimit: RealmDecimal?
    @objc public dynamic var origin: Quantity?
    public func upsert(origin: Quantity?) {
        upsert(prop: &self.origin, val: origin)
    }
    @objc public dynamic var period: RealmDecimal?
    @objc public dynamic var upperLimit: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(data: String, dimensions: Int, origin: Quantity, period: RealmDecimal) {
        self.init()
        self.data = data
        self.dimensions.value = dimensions
        self.origin = origin
        self.period = period
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case data = "data"
        case dimensions = "dimensions"
        case factor = "factor"
        case lowerLimit = "lowerLimit"
        case origin = "origin"
        case period = "period"
        case upperLimit = "upperLimit"
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

        self.data = try container.decodeIfPresent(String.self, forKey: .data)
        self.dimensions.value = try container.decodeIfPresent(Int.self, forKey: .dimensions)
        self.factor = try container.decodeIfPresent(RealmDecimal.self, forKey: .factor)
        self.lowerLimit = try container.decodeIfPresent(RealmDecimal.self, forKey: .lowerLimit)
        self.origin = try container.decodeIfPresent(Quantity.self, forKey: .origin)
        self.period = try container.decodeIfPresent(RealmDecimal.self, forKey: .period)
        self.upperLimit = try container.decodeIfPresent(RealmDecimal.self, forKey: .upperLimit)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.dimensions.value, forKey: .dimensions)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encodeIfPresent(self.lowerLimit, forKey: .lowerLimit)
        try container.encodeIfPresent(self.origin, forKey: .origin)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.upperLimit, forKey: .upperLimit)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SampledData.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SampledData. Will return empty instance: \(error))")
		}
		return SampledData.init()
	}
}



