//
//  SampledData.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SampledData) on 2017-09-11.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["data"] {
				presentKeys.insert("data")
				if let val = exist as? String {
					self.data = val
				}
				else {
					errors.append(FHIRJSONError(key: "data", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "data"))
			}
			if let exist = js["dimensions"] {
				presentKeys.insert("dimensions")
				if let val = exist as? Int {
					self.dimensions.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "dimensions", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "dimensions"))
			}
			if let exist = js["factor"] {
				presentKeys.insert("factor")
				if let val = exist as? NSNumber {
					self.factor = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "factor", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["lowerLimit"] {
				presentKeys.insert("lowerLimit")
				if let val = exist as? NSNumber {
					self.lowerLimit = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "lowerLimit", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["origin"] {
				presentKeys.insert("origin")
				if let val = exist as? FHIRJSON {
					upsert(origin: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "origin", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "origin"))
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? NSNumber {
					self.period = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "period"))
			}
			if let exist = js["upperLimit"] {
				presentKeys.insert("upperLimit")
				if let val = exist as? NSNumber {
					self.upperLimit = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "upperLimit", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let data = self.data {
			json["data"] = data.asJSON()
		}
		if let dimensions = self.dimensions.value {
			json["dimensions"] = dimensions.asJSON()
		}
		if let factor = self.factor {
			json["factor"] = factor.asJSON()
		}
		if let lowerLimit = self.lowerLimit {
			json["lowerLimit"] = lowerLimit.asJSON()
		}
		if let origin = self.origin {
			json["origin"] = origin.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let upperLimit = self.upperLimit {
			json["upperLimit"] = upperLimit.asJSON()
		}
		
		return json
	}
*/
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

