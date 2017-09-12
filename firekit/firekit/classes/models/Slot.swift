//
//  Slot.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Slot) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A slot of time on a schedule that may be available for booking appointments.
 */
open class Slot: DomainResource {
	override open class var resourceType: String {
		get { return "Slot" }
	}

    @objc public dynamic var comment: String?
    @objc public dynamic var end: Instant?
    @objc public dynamic var freeBusyType: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let overbooked = RealmOptional<Bool>()
    @objc public dynamic var schedule: Reference?
    public func upsert(schedule: Reference?) {
        upsert(prop: &self.schedule, val: schedule)
    }
    @objc public dynamic var start: Instant?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(end: Instant, freeBusyType: String, schedule: Reference, start: Instant) {
        self.init()
        self.end = end
        self.freeBusyType = freeBusyType
        self.schedule = schedule
        self.start = start
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case comment = "comment"
        case end = "end"
        case freeBusyType = "freeBusyType"
        case identifier = "identifier"
        case overbooked = "overbooked"
        case schedule = "schedule"
        case start = "start"
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

        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.end = try container.decodeIfPresent(Instant.self, forKey: .end)
        self.freeBusyType = try container.decodeIfPresent(String.self, forKey: .freeBusyType)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.overbooked.value = try container.decodeIfPresent(Bool.self, forKey: .overbooked)
        self.schedule = try container.decodeIfPresent(Reference.self, forKey: .schedule)
        self.start = try container.decodeIfPresent(Instant.self, forKey: .start)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.freeBusyType, forKey: .freeBusyType)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.overbooked.value, forKey: .overbooked)
        try container.encodeIfPresent(self.schedule, forKey: .schedule)
        try container.encodeIfPresent(self.start, forKey: .start)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["comment"] {
				presentKeys.insert("comment")
				if let val = exist as? String {
					self.comment = val
				}
				else {
					errors.append(FHIRJSONError(key: "comment", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["end"] {
				presentKeys.insert("end")
				if let val = exist as? String {
					self.end = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "end", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "end"))
			}
			if let exist = js["freeBusyType"] {
				presentKeys.insert("freeBusyType")
				if let val = exist as? String {
					self.freeBusyType = val
				}
				else {
					errors.append(FHIRJSONError(key: "freeBusyType", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "freeBusyType"))
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
			if let exist = js["overbooked"] {
				presentKeys.insert("overbooked")
				if let val = exist as? Bool {
					self.overbooked.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "overbooked", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["schedule"] {
				presentKeys.insert("schedule")
				if let val = exist as? FHIRJSON {
					upsert(schedule: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "schedule", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "schedule"))
			}
			if let exist = js["start"] {
				presentKeys.insert("start")
				if let val = exist as? String {
					self.start = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "start", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "start"))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let comment = self.comment {
			json["comment"] = comment.asJSON()
		}
		if let end = self.end {
			json["end"] = end.asJSON()
		}
		if let freeBusyType = self.freeBusyType {
			json["freeBusyType"] = freeBusyType.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let overbooked = self.overbooked.value {
			json["overbooked"] = overbooked.asJSON()
		}
		if let schedule = self.schedule {
			json["schedule"] = schedule.asJSON()
		}
		if let start = self.start {
			json["start"] = start.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Slot.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Slot. Will return empty instance: \(error))")
		}
		return Slot.init()
	}
}

