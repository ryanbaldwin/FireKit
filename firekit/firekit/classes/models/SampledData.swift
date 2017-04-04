//
//  SampledData.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SampledData) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
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
    
    public dynamic var data: String?        
        
    public let dimensions = RealmOptional<Int>()    
    public dynamic var factor: RealmDecimal?        
        
    public dynamic var lowerLimit: RealmDecimal?        
        
    public dynamic var origin: Quantity?        
    public func upsert(origin: Quantity?) {
        upsert(prop: &self.origin, val: origin)
    }    
    public dynamic var period: RealmDecimal?        
        
    public dynamic var upperLimit: RealmDecimal?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(data: String, dimensions: Int, origin: Quantity, period: RealmDecimal) {
        self.init(json: nil)
        self.data = data
        self.dimensions.value = dimensions
        self.origin = origin
        self.period = period
    }

	
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
}

