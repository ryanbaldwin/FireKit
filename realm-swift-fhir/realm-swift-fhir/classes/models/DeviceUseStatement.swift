//
//  DeviceUseStatement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceUseStatement) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  None.
 *
 *  A record of a device being used by a patient where the record is the result of a report from the patient or another
 *  clinician.
 */
open class DeviceUseStatement: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceUseStatement" }
	}
    
    public dynamic var bodySiteCodeableConcept: CodeableConcept?        
    public func upsert(bodySiteCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.bodySiteCodeableConcept, val: bodySiteCodeableConcept)
    }    
    public dynamic var bodySiteReference: Reference?        
    public func upsert(bodySiteReference: Reference?) {
        upsert(prop: &self.bodySiteReference, val: bodySiteReference)
    }    
    public dynamic var device: Reference?        
    public func upsert(device: Reference?) {
        upsert(prop: &self.device, val: device)
    }    
    public let identifier = RealmSwift.List<Identifier>()    
    public let indication = RealmSwift.List<CodeableConcept>()    
    public let notes = RealmSwift.List<RealmString>()    
    public dynamic var recordedOn: DateTime?        
        
    public dynamic var subject: Reference?        
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }    
    public dynamic var timingDateTime: DateTime?        
        
    public dynamic var timingPeriod: Period?        
    public func upsert(timingPeriod: Period?) {
        upsert(prop: &self.timingPeriod, val: timingPeriod)
    }    
    public dynamic var timingTiming: Timing?        
    public func upsert(timingTiming: Timing?) {
        upsert(prop: &self.timingTiming, val: timingTiming)
    }    
    public dynamic var whenUsed: Period?        
    public func upsert(whenUsed: Period?) {
        upsert(prop: &self.whenUsed, val: whenUsed)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(device: Reference, subject: Reference) {
        self.init(json: nil)
        self.device = device
        self.subject = subject
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["bodySiteCodeableConcept"] {
				presentKeys.insert("bodySiteCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(bodySiteCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bodySiteCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["bodySiteReference"] {
				presentKeys.insert("bodySiteReference")
				if let val = exist as? FHIRJSON {
					upsert(bodySiteReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bodySiteReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["device"] {
				presentKeys.insert("device")
				if let val = exist as? FHIRJSON {
					upsert(device: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "device", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "device"))
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
			if let exist = js["indication"] {
				presentKeys.insert("indication")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.indication) }
						self.indication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "indication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? [String] {
					self.notes.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["recordedOn"] {
				presentKeys.insert("recordedOn")
				if let val = exist as? String {
					self.recordedOn = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "recordedOn", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "subject"))
			}
			if let exist = js["timingDateTime"] {
				presentKeys.insert("timingDateTime")
				if let val = exist as? String {
					self.timingDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "timingDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["timingPeriod"] {
				presentKeys.insert("timingPeriod")
				if let val = exist as? FHIRJSON {
					upsert(timingPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "timingPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["timingTiming"] {
				presentKeys.insert("timingTiming")
				if let val = exist as? FHIRJSON {
					upsert(timingTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "timingTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["whenUsed"] {
				presentKeys.insert("whenUsed")
				if let val = exist as? FHIRJSON {
					upsert(whenUsed: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whenUsed", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let bodySiteCodeableConcept = self.bodySiteCodeableConcept {
			json["bodySiteCodeableConcept"] = bodySiteCodeableConcept.asJSON()
		}
		if let bodySiteReference = self.bodySiteReference {
			json["bodySiteReference"] = bodySiteReference.asJSON()
		}
		if let device = self.device {
			json["device"] = device.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if indication.count > 0 {
			json["indication"] = Array(indication.map() { $0.asJSON() })
		}
		if notes.count > 0 {
			json["notes"] = Array(notes.map() { $0.value })
		}
		if let recordedOn = self.recordedOn {
			json["recordedOn"] = recordedOn.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let timingDateTime = self.timingDateTime {
			json["timingDateTime"] = timingDateTime.asJSON()
		}
		if let timingPeriod = self.timingPeriod {
			json["timingPeriod"] = timingPeriod.asJSON()
		}
		if let timingTiming = self.timingTiming {
			json["timingTiming"] = timingTiming.asJSON()
		}
		if let whenUsed = self.whenUsed {
			json["whenUsed"] = whenUsed.asJSON()
		}
		
		return json
	}
}

