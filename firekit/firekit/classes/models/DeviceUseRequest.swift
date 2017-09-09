//
//  DeviceUseRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceUseRequest) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A request for a patient to use or be given a medical device.
 *
 *  Represents a request for a patient to employ a medical device. The device may be an implantable device, or an
 *  external assistive device, such as a walker.
 */
open class DeviceUseRequest: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceUseRequest" }
	}

    @objc public dynamic var bodySiteCodeableConcept: CodeableConcept?
    public func upsert(bodySiteCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.bodySiteCodeableConcept, val: bodySiteCodeableConcept)
    }
    @objc public dynamic var bodySiteReference: Reference?
    public func upsert(bodySiteReference: Reference?) {
        upsert(prop: &self.bodySiteReference, val: bodySiteReference)
    }
    @objc public dynamic var device: Reference?
    public func upsert(device: Reference?) {
        upsert(prop: &self.device, val: device)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let indication = RealmSwift.List<CodeableConcept>()
    public let notes = RealmSwift.List<RealmString>()
    @objc public dynamic var orderedOn: DateTime?
    @objc public dynamic var priority: String?
    public let prnReason = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var recordedOn: DateTime?
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var timingDateTime: DateTime?
    @objc public dynamic var timingPeriod: Period?
    public func upsert(timingPeriod: Period?) {
        upsert(prop: &self.timingPeriod, val: timingPeriod)
    }
    @objc public dynamic var timingTiming: Timing?
    public func upsert(timingTiming: Timing?) {
        upsert(prop: &self.timingTiming, val: timingTiming)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(device: Reference, subject: Reference) {
        self.init()
        self.device = device
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySiteCodeableConcept = "bodySiteCodeableConcept"
        case bodySiteReference = "bodySiteReference"
        case device = "device"
        case encounter = "encounter"
        case identifier = "identifier"
        case indication = "indication"
        case notes = "notes"
        case orderedOn = "orderedOn"
        case priority = "priority"
        case prnReason = "prnReason"
        case recordedOn = "recordedOn"
        case status = "status"
        case subject = "subject"
        case timingDateTime = "timingDateTime"
        case timingPeriod = "timingPeriod"
        case timingTiming = "timingTiming"
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
        self.priority = try container.decodeIfPresent(String.self, forKey: .priority)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySiteCodeableConcept, forKey: .bodySiteCodeableConcept)
        try container.encodeIfPresent(self.bodySiteReference, forKey: .bodySiteReference)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encode(self.indication.flatMap { $0 }, forKey: .indication)
        try container.encode(self.notes.flatMap { $0.value }, forKey: .notes)
        try container.encodeIfPresent(self.orderedOn, forKey: .orderedOn)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encode(self.prnReason.flatMap { $0 }, forKey: .prnReason)
        try container.encodeIfPresent(self.recordedOn, forKey: .recordedOn)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.timingDateTime, forKey: .timingDateTime)
        try container.encodeIfPresent(self.timingPeriod, forKey: .timingPeriod)
        try container.encodeIfPresent(self.timingTiming, forKey: .timingTiming)
    }
/*
	
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
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
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
			if let exist = js["orderedOn"] {
				presentKeys.insert("orderedOn")
				if let val = exist as? String {
					self.orderedOn = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "orderedOn", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? String {
					self.priority = val
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["prnReason"] {
				presentKeys.insert("prnReason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.prnReason) }
						self.prnReason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "prnReason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
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
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
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
		if let orderedOn = self.orderedOn {
			json["orderedOn"] = orderedOn.asJSON()
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if prnReason.count > 0 {
			json["prnReason"] = Array(prnReason.map() { $0.asJSON() })
		}
		if let recordedOn = self.recordedOn {
			json["recordedOn"] = recordedOn.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
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
		
		return json
	}
*/
}

