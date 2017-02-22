//
//  DeviceMetric.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceMetric) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Measurement, calculation or setting capability of a medical device.
 *
 *  Describes a measurement, calculation or setting capability of a medical device.
 */
open class DeviceMetric: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceMetric" }
	}
    
    public let calibration = RealmSwift.List<DeviceMetricCalibration>()    
    public dynamic var category: String?        
        
    public dynamic var color: String?        
        
    public dynamic var identifier: Identifier?        
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }    
    public dynamic var measurementPeriod: Timing?        
    public func upsert(measurementPeriod: Timing?) {
        upsert(prop: &self.measurementPeriod, val: measurementPeriod)
    }    
    public dynamic var operationalStatus: String?        
        
    public dynamic var parent: Reference?        
    public func upsert(parent: Reference?) {
        upsert(prop: &self.parent, val: parent)
    }    
    public dynamic var source: Reference?        
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }    
    public dynamic var type: CodeableConcept?        
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }    
    public dynamic var unit: CodeableConcept?        
    public func upsert(unit: CodeableConcept?) {
        upsert(prop: &self.unit, val: unit)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(category: String, identifier: Identifier, type: CodeableConcept) {
        self.init(json: nil)
        self.category = category
        self.identifier = identifier
        self.type = type
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["calibration"] {
				presentKeys.insert("calibration")
				if let val = exist as? [FHIRJSON] {
					if let vals = DeviceMetricCalibration.instantiate(fromArray: val, owner: self) as? [DeviceMetricCalibration] {
						if let realm = self.realm { realm.delete(self.calibration) }
						self.calibration.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "calibration", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? String {
					self.category = val
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "category"))
			}
			if let exist = js["color"] {
				presentKeys.insert("color")
				if let val = exist as? String {
					self.color = val
				}
				else {
					errors.append(FHIRJSONError(key: "color", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identifier"))
			}
			if let exist = js["measurementPeriod"] {
				presentKeys.insert("measurementPeriod")
				if let val = exist as? FHIRJSON {
					upsert(measurementPeriod: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "measurementPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["operationalStatus"] {
				presentKeys.insert("operationalStatus")
				if let val = exist as? String {
					self.operationalStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "operationalStatus", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["parent"] {
				presentKeys.insert("parent")
				if let val = exist as? FHIRJSON {
					upsert(parent: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "parent", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
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
			if let exist = js["unit"] {
				presentKeys.insert("unit")
				if let val = exist as? FHIRJSON {
					upsert(unit: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unit", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if calibration.count > 0 {
			json["calibration"] = Array(calibration.map() { $0.asJSON() })
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let color = self.color {
			json["color"] = color.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let measurementPeriod = self.measurementPeriod {
			json["measurementPeriod"] = measurementPeriod.asJSON()
		}
		if let operationalStatus = self.operationalStatus {
			json["operationalStatus"] = operationalStatus.asJSON()
		}
		if let parent = self.parent {
			json["parent"] = parent.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let unit = self.unit {
			json["unit"] = unit.asJSON()
		}
		
		return json
	}
}


/**
 *  Describes the calibrations that have been performed or that are required to be performed.
 */
open class DeviceMetricCalibration: BackboneElement {
	override open class var resourceType: String {
		get { return "DeviceMetricCalibration" }
	}
    
    public dynamic var state: String?        
        
    public dynamic var time: Instant?        
        
    public dynamic var type: String?        
    

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["state"] {
				presentKeys.insert("state")
				if let val = exist as? String {
					self.state = val
				}
				else {
					errors.append(FHIRJSONError(key: "state", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["time"] {
				presentKeys.insert("time")
				if let val = exist as? String {
					self.time = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "time", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let state = self.state {
			json["state"] = state.asJSON()
		}
		if let time = self.time {
			json["time"] = time.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

