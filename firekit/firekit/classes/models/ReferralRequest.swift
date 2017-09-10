//
//  ReferralRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ReferralRequest) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A request for referral or transfer of care.
 *
 *  Used to record and send details about a request for referral service or transfer of a patient to the care of another
 *  provider or provider organization.
 */
open class ReferralRequest: DomainResource {
	override open class var resourceType: String {
		get { return "ReferralRequest" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var dateSent: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var fulfillmentTime: Period?
    public func upsert(fulfillmentTime: Period?) {
        upsert(prop: &self.fulfillmentTime, val: fulfillmentTime)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var priority: CodeableConcept?
    public func upsert(priority: CodeableConcept?) {
        upsert(prop: &self.priority, val: priority)
    }
    @objc public dynamic var reason: CodeableConcept?
    public func upsert(reason: CodeableConcept?) {
        upsert(prop: &self.reason, val: reason)
    }
    public let recipient = RealmSwift.List<Reference>()
    @objc public dynamic var requester: Reference?
    public func upsert(requester: Reference?) {
        upsert(prop: &self.requester, val: requester)
    }
    public let serviceRequested = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var specialty: CodeableConcept?
    public func upsert(specialty: CodeableConcept?) {
        upsert(prop: &self.specialty, val: specialty)
    }
    @objc public dynamic var status: String?
    public let supportingInformation = RealmSwift.List<Reference>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case dateSent = "dateSent"
        case description_fhir = "description"
        case encounter = "encounter"
        case fulfillmentTime = "fulfillmentTime"
        case identifier = "identifier"
        case patient = "patient"
        case priority = "priority"
        case reason = "reason"
        case recipient = "recipient"
        case requester = "requester"
        case serviceRequested = "serviceRequested"
        case specialty = "specialty"
        case status = "status"
        case supportingInformation = "supportingInformation"
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

        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.dateSent = try container.decodeIfPresent(DateTime.self, forKey: .dateSent)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.fulfillmentTime = try container.decodeIfPresent(Period.self, forKey: .fulfillmentTime)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.priority = try container.decodeIfPresent(CodeableConcept.self, forKey: .priority)
        self.reason = try container.decodeIfPresent(CodeableConcept.self, forKey: .reason)
        self.recipient.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .recipient) ?? [])
        self.requester = try container.decodeIfPresent(Reference.self, forKey: .requester)
        self.serviceRequested.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .serviceRequested) ?? [])
        self.specialty = try container.decodeIfPresent(CodeableConcept.self, forKey: .specialty)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.supportingInformation.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supportingInformation) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.dateSent, forKey: .dateSent)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.fulfillmentTime, forKey: .fulfillmentTime)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encode(self.recipient.flatMap { $0 }, forKey: .recipient)
        try container.encodeIfPresent(self.requester, forKey: .requester)
        try container.encode(self.serviceRequested.flatMap { $0 }, forKey: .serviceRequested)
        try container.encodeIfPresent(self.specialty, forKey: .specialty)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(self.supportingInformation.flatMap { $0 }, forKey: .supportingInformation)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dateSent"] {
				presentKeys.insert("dateSent")
				if let val = exist as? String {
					self.dateSent = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateSent", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
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
			if let exist = js["fulfillmentTime"] {
				presentKeys.insert("fulfillmentTime")
				if let val = exist as? FHIRJSON {
					upsert(fulfillmentTime: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fulfillmentTime", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					upsert(patient: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? FHIRJSON {
					upsert(priority: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? FHIRJSON {
					upsert(reason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["recipient"] {
				presentKeys.insert("recipient")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.recipient) }
						self.recipient.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "recipient", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["requester"] {
				presentKeys.insert("requester")
				if let val = exist as? FHIRJSON {
					upsert(requester: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "requester", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["serviceRequested"] {
				presentKeys.insert("serviceRequested")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.serviceRequested) }
						self.serviceRequested.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "serviceRequested", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["specialty"] {
				presentKeys.insert("specialty")
				if let val = exist as? FHIRJSON {
					upsert(specialty: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "specialty", wants: FHIRJSON.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["supportingInformation"] {
				presentKeys.insert("supportingInformation")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.supportingInformation) }
						self.supportingInformation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "supportingInformation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let dateSent = self.dateSent {
			json["dateSent"] = dateSent.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let fulfillmentTime = self.fulfillmentTime {
			json["fulfillmentTime"] = fulfillmentTime.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if recipient.count > 0 {
			json["recipient"] = Array(recipient.map() { $0.asJSON() })
		}
		if let requester = self.requester {
			json["requester"] = requester.asJSON()
		}
		if serviceRequested.count > 0 {
			json["serviceRequested"] = Array(serviceRequested.map() { $0.asJSON() })
		}
		if let specialty = self.specialty {
			json["specialty"] = specialty.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if supportingInformation.count > 0 {
			json["supportingInformation"] = Array(supportingInformation.map() { $0.asJSON() })
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
			let clone = try JSONDecoder().decode(ReferralRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ReferralRequest. Will return empty instance: \(error))")
		}
		return ReferralRequest.init()
	}
}

