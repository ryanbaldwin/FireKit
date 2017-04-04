//
//  Timing.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Timing) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A timing schedule that specifies an event that may occur multiple times.
 *
 *  Specifies an event that may occur multiple times. Timing schedules are used to record when things are expected or
 *  requested to occur. The most common usage is in dosage instructions for medications. They are also used when
 *  planning care of various kinds.
 */
open class Timing: Element {
	override open class var resourceType: String {
		get { return "Timing" }
	}
    
    public dynamic var code: CodeableConcept?        
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }    
    public let event = RealmSwift.List<DateTime>()    
    public dynamic var repeat_fhir: TimingRepeat?        
    public func upsert(repeat_fhir: TimingRepeat?) {
        upsert(prop: &self.repeat_fhir, val: repeat_fhir)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? [String] {
					// is_native or 'FHIRElement'
					self.event.append(objectsIn: DateTime.instantiate(fromArray: val))
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["repeat"] {
				presentKeys.insert("repeat")
				if let val = exist as? FHIRJSON {
					upsert(repeat_fhir: TimingRepeat(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "repeat", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if event.count > 0 {
			json["event"] = Array(event.map() { $0.asJSON() })
		}
		if let repeat_fhir = self.repeat_fhir {
			json["repeat"] = repeat_fhir.asJSON()
		}
		
		return json
	}
}


/**
 *  When the event is to occur.
 *
 *  A set of rules that describe when the event should occur.
 */
open class TimingRepeat: Element {
	override open class var resourceType: String {
		get { return "TimingRepeat" }
	}
    
    public dynamic var boundsPeriod: Period?        
    public func upsert(boundsPeriod: Period?) {
        upsert(prop: &self.boundsPeriod, val: boundsPeriod)
    }    
    public dynamic var boundsQuantity: Quantity?        
    public func upsert(boundsQuantity: Quantity?) {
        upsert(prop: &self.boundsQuantity, val: boundsQuantity)
    }    
    public dynamic var boundsRange: Range?        
    public func upsert(boundsRange: Range?) {
        upsert(prop: &self.boundsRange, val: boundsRange)
    }    
    public let count = RealmOptional<Int>()    
    public dynamic var duration: RealmDecimal?        
        
    public dynamic var durationMax: RealmDecimal?        
        
    public dynamic var durationUnits: String?        
        
    public let frequency = RealmOptional<Int>()    
    public let frequencyMax = RealmOptional<Int>()    
    public dynamic var period: RealmDecimal?        
        
    public dynamic var periodMax: RealmDecimal?        
        
    public dynamic var periodUnits: String?        
        
    public dynamic var when: String?        
    

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["boundsPeriod"] {
				presentKeys.insert("boundsPeriod")
				if let val = exist as? FHIRJSON {
					upsert(boundsPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "boundsPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["boundsQuantity"] {
				presentKeys.insert("boundsQuantity")
				if let val = exist as? FHIRJSON {
					upsert(boundsQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "boundsQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["boundsRange"] {
				presentKeys.insert("boundsRange")
				if let val = exist as? FHIRJSON {
					upsert(boundsRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "boundsRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["count"] {
				presentKeys.insert("count")
				if let val = exist as? Int {
					self.count.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "count", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["duration"] {
				presentKeys.insert("duration")
				if let val = exist as? NSNumber {
					self.duration = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "duration", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["durationMax"] {
				presentKeys.insert("durationMax")
				if let val = exist as? NSNumber {
					self.durationMax = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "durationMax", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["durationUnits"] {
				presentKeys.insert("durationUnits")
				if let val = exist as? String {
					self.durationUnits = val
				}
				else {
					errors.append(FHIRJSONError(key: "durationUnits", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["frequency"] {
				presentKeys.insert("frequency")
				if let val = exist as? Int {
					self.frequency.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "frequency", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["frequencyMax"] {
				presentKeys.insert("frequencyMax")
				if let val = exist as? Int {
					self.frequencyMax.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "frequencyMax", wants: Int.self, has: type(of: exist)))
				}
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
			if let exist = js["periodMax"] {
				presentKeys.insert("periodMax")
				if let val = exist as? NSNumber {
					self.periodMax = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "periodMax", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["periodUnits"] {
				presentKeys.insert("periodUnits")
				if let val = exist as? String {
					self.periodUnits = val
				}
				else {
					errors.append(FHIRJSONError(key: "periodUnits", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["when"] {
				presentKeys.insert("when")
				if let val = exist as? String {
					self.when = val
				}
				else {
					errors.append(FHIRJSONError(key: "when", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let boundsPeriod = self.boundsPeriod {
			json["boundsPeriod"] = boundsPeriod.asJSON()
		}
		if let boundsQuantity = self.boundsQuantity {
			json["boundsQuantity"] = boundsQuantity.asJSON()
		}
		if let boundsRange = self.boundsRange {
			json["boundsRange"] = boundsRange.asJSON()
		}
		if let count = self.count.value {
			json["count"] = count.asJSON()
		}
		if let duration = self.duration {
			json["duration"] = duration.asJSON()
		}
		if let durationMax = self.durationMax {
			json["durationMax"] = durationMax.asJSON()
		}
		if let durationUnits = self.durationUnits {
			json["durationUnits"] = durationUnits.asJSON()
		}
		if let frequency = self.frequency.value {
			json["frequency"] = frequency.asJSON()
		}
		if let frequencyMax = self.frequencyMax.value {
			json["frequencyMax"] = frequencyMax.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let periodMax = self.periodMax {
			json["periodMax"] = periodMax.asJSON()
		}
		if let periodUnits = self.periodUnits {
			json["periodUnits"] = periodUnits.asJSON()
		}
		if let when = self.when {
			json["when"] = when.asJSON()
		}
		
		return json
	}
}

