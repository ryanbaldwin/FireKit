//
//  Encounter.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Encounter) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  An interaction during which services are provided to the patient.
 *
 *  An interaction between a patient and healthcare provider(s) for the purpose of providing healthcare service(s) or
 *  assessing the health status of a patient.
 */
open class Encounter: DomainResource {
	override open class var resourceType: String {
		get { return "Encounter" }
	}

    @objc public dynamic var appointment: Reference?
    public func upsert(appointment: Reference?) {
        upsert(prop: &self.appointment, val: appointment)
    }
    @objc public dynamic var class_fhir: String?
    public let episodeOfCare = RealmSwift.List<Reference>()
    @objc public dynamic var hospitalization: EncounterHospitalization?
    public func upsert(hospitalization: EncounterHospitalization?) {
        upsert(prop: &self.hospitalization, val: hospitalization)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let incomingReferral = RealmSwift.List<Reference>()
    public let indication = RealmSwift.List<Reference>()
    @objc public dynamic var length: Quantity?
    public func upsert(length: Quantity?) {
        upsert(prop: &self.length, val: length)
    }
    public let location = RealmSwift.List<EncounterLocation>()
    @objc public dynamic var partOf: Reference?
    public func upsert(partOf: Reference?) {
        upsert(prop: &self.partOf, val: partOf)
    }
    public let participant = RealmSwift.List<EncounterParticipant>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var priority: CodeableConcept?
    public func upsert(priority: CodeableConcept?) {
        upsert(prop: &self.priority, val: priority)
    }
    public let reason = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var serviceProvider: Reference?
    public func upsert(serviceProvider: Reference?) {
        upsert(prop: &self.serviceProvider, val: serviceProvider)
    }
    @objc public dynamic var status: String?
    public let statusHistory = RealmSwift.List<EncounterStatusHistory>()
    public let type = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case appointment = "appointment"
        case class_fhir = "class"
        case episodeOfCare = "episodeOfCare"
        case hospitalization = "hospitalization"
        case identifier = "identifier"
        case incomingReferral = "incomingReferral"
        case indication = "indication"
        case length = "length"
        case location = "location"
        case partOf = "partOf"
        case participant = "participant"
        case patient = "patient"
        case period = "period"
        case priority = "priority"
        case reason = "reason"
        case serviceProvider = "serviceProvider"
        case status = "status"
        case statusHistory = "statusHistory"
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

        self.appointment = try container.decodeIfPresent(Reference.self, forKey: .appointment)
        self.class_fhir = try container.decodeIfPresent(String.self, forKey: .class_fhir)
        self.episodeOfCare.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .episodeOfCare) ?? [])
        self.hospitalization = try container.decodeIfPresent(EncounterHospitalization.self, forKey: .hospitalization)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.incomingReferral.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .incomingReferral) ?? [])
        self.indication.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .indication) ?? [])
        self.length = try container.decodeIfPresent(Quantity.self, forKey: .length)
        self.location.append(objectsIn: try container.decodeIfPresent([EncounterLocation].self, forKey: .location) ?? [])
        self.partOf = try container.decodeIfPresent(Reference.self, forKey: .partOf)
        self.participant.append(objectsIn: try container.decodeIfPresent([EncounterParticipant].self, forKey: .participant) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.priority = try container.decodeIfPresent(CodeableConcept.self, forKey: .priority)
        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.serviceProvider = try container.decodeIfPresent(Reference.self, forKey: .serviceProvider)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.statusHistory.append(objectsIn: try container.decodeIfPresent([EncounterStatusHistory].self, forKey: .statusHistory) ?? [])
        self.type.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.appointment, forKey: .appointment)
        try container.encodeIfPresent(self.class_fhir, forKey: .class_fhir)
        try container.encode(Array(self.episodeOfCare), forKey: .episodeOfCare)
        try container.encodeIfPresent(self.hospitalization, forKey: .hospitalization)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.incomingReferral), forKey: .incomingReferral)
        try container.encode(Array(self.indication), forKey: .indication)
        try container.encodeIfPresent(self.length, forKey: .length)
        try container.encode(Array(self.location), forKey: .location)
        try container.encodeIfPresent(self.partOf, forKey: .partOf)
        try container.encode(Array(self.participant), forKey: .participant)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encodeIfPresent(self.serviceProvider, forKey: .serviceProvider)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.statusHistory), forKey: .statusHistory)
        try container.encode(Array(self.type), forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["appointment"] {
				presentKeys.insert("appointment")
				if let val = exist as? FHIRJSON {
					upsert(appointment: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "appointment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["class"] {
				presentKeys.insert("class")
				if let val = exist as? String {
					self.class_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "class", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["episodeOfCare"] {
				presentKeys.insert("episodeOfCare")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.episodeOfCare) }
						self.episodeOfCare.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "episodeOfCare", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["hospitalization"] {
				presentKeys.insert("hospitalization")
				if let val = exist as? FHIRJSON {
					upsert(hospitalization: EncounterHospitalization(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "hospitalization", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["incomingReferral"] {
				presentKeys.insert("incomingReferral")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.incomingReferral) }
						self.incomingReferral.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "incomingReferral", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["indication"] {
				presentKeys.insert("indication")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.indication) }
						self.indication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "indication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["length"] {
				presentKeys.insert("length")
				if let val = exist as? FHIRJSON {
					upsert(length: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "length", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? [FHIRJSON] {
					if let vals = EncounterLocation.instantiate(fromArray: val, owner: self) as? [EncounterLocation] {
						if let realm = self.realm { realm.delete(self.location) }
						self.location.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["partOf"] {
				presentKeys.insert("partOf")
				if let val = exist as? FHIRJSON {
					upsert(partOf: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "partOf", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["participant"] {
				presentKeys.insert("participant")
				if let val = exist as? [FHIRJSON] {
					if let vals = EncounterParticipant.instantiate(fromArray: val, owner: self) as? [EncounterParticipant] {
						if let realm = self.realm { realm.delete(self.participant) }
						self.participant.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "participant", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
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
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reason) }
						self.reason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["serviceProvider"] {
				presentKeys.insert("serviceProvider")
				if let val = exist as? FHIRJSON {
					upsert(serviceProvider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "serviceProvider", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["statusHistory"] {
				presentKeys.insert("statusHistory")
				if let val = exist as? [FHIRJSON] {
					if let vals = EncounterStatusHistory.instantiate(fromArray: val, owner: self) as? [EncounterStatusHistory] {
						if let realm = self.realm { realm.delete(self.statusHistory) }
						self.statusHistory.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "statusHistory", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let appointment = self.appointment {
			json["appointment"] = appointment.asJSON()
		}
		if let class_fhir = self.class_fhir {
			json["class"] = class_fhir.asJSON()
		}
		if episodeOfCare.count > 0 {
			json["episodeOfCare"] = Array(episodeOfCare.map() { $0.asJSON() })
		}
		if let hospitalization = self.hospitalization {
			json["hospitalization"] = hospitalization.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if incomingReferral.count > 0 {
			json["incomingReferral"] = Array(incomingReferral.map() { $0.asJSON() })
		}
		if indication.count > 0 {
			json["indication"] = Array(indication.map() { $0.asJSON() })
		}
		if let length = self.length {
			json["length"] = length.asJSON()
		}
		if location.count > 0 {
			json["location"] = Array(location.map() { $0.asJSON() })
		}
		if let partOf = self.partOf {
			json["partOf"] = partOf.asJSON()
		}
		if participant.count > 0 {
			json["participant"] = Array(participant.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if reason.count > 0 {
			json["reason"] = Array(reason.map() { $0.asJSON() })
		}
		if let serviceProvider = self.serviceProvider {
			json["serviceProvider"] = serviceProvider.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if statusHistory.count > 0 {
			json["statusHistory"] = Array(statusHistory.map() { $0.asJSON() })
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Encounter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Encounter. Will return empty instance: \(error))")
		}
		return Encounter.init()
	}
}


/**
 *  Details about the admission to a healthcare service.
 */
open class EncounterHospitalization: BackboneElement {
	override open class var resourceType: String {
		get { return "EncounterHospitalization" }
	}

    @objc public dynamic var admitSource: CodeableConcept?
    public func upsert(admitSource: CodeableConcept?) {
        upsert(prop: &self.admitSource, val: admitSource)
    }
    public let admittingDiagnosis = RealmSwift.List<Reference>()
    @objc public dynamic var destination: Reference?
    public func upsert(destination: Reference?) {
        upsert(prop: &self.destination, val: destination)
    }
    public let dietPreference = RealmSwift.List<CodeableConcept>()
    public let dischargeDiagnosis = RealmSwift.List<Reference>()
    @objc public dynamic var dischargeDisposition: CodeableConcept?
    public func upsert(dischargeDisposition: CodeableConcept?) {
        upsert(prop: &self.dischargeDisposition, val: dischargeDisposition)
    }
    @objc public dynamic var origin: Reference?
    public func upsert(origin: Reference?) {
        upsert(prop: &self.origin, val: origin)
    }
    @objc public dynamic var preAdmissionIdentifier: Identifier?
    public func upsert(preAdmissionIdentifier: Identifier?) {
        upsert(prop: &self.preAdmissionIdentifier, val: preAdmissionIdentifier)
    }
    @objc public dynamic var reAdmission: CodeableConcept?
    public func upsert(reAdmission: CodeableConcept?) {
        upsert(prop: &self.reAdmission, val: reAdmission)
    }
    public let specialArrangement = RealmSwift.List<CodeableConcept>()
    public let specialCourtesy = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case admitSource = "admitSource"
        case admittingDiagnosis = "admittingDiagnosis"
        case destination = "destination"
        case dietPreference = "dietPreference"
        case dischargeDiagnosis = "dischargeDiagnosis"
        case dischargeDisposition = "dischargeDisposition"
        case origin = "origin"
        case preAdmissionIdentifier = "preAdmissionIdentifier"
        case reAdmission = "reAdmission"
        case specialArrangement = "specialArrangement"
        case specialCourtesy = "specialCourtesy"
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

        self.admitSource = try container.decodeIfPresent(CodeableConcept.self, forKey: .admitSource)
        self.admittingDiagnosis.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .admittingDiagnosis) ?? [])
        self.destination = try container.decodeIfPresent(Reference.self, forKey: .destination)
        self.dietPreference.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .dietPreference) ?? [])
        self.dischargeDiagnosis.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .dischargeDiagnosis) ?? [])
        self.dischargeDisposition = try container.decodeIfPresent(CodeableConcept.self, forKey: .dischargeDisposition)
        self.origin = try container.decodeIfPresent(Reference.self, forKey: .origin)
        self.preAdmissionIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .preAdmissionIdentifier)
        self.reAdmission = try container.decodeIfPresent(CodeableConcept.self, forKey: .reAdmission)
        self.specialArrangement.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .specialArrangement) ?? [])
        self.specialCourtesy.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .specialCourtesy) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.admitSource, forKey: .admitSource)
        try container.encode(Array(self.admittingDiagnosis), forKey: .admittingDiagnosis)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encode(Array(self.dietPreference), forKey: .dietPreference)
        try container.encode(Array(self.dischargeDiagnosis), forKey: .dischargeDiagnosis)
        try container.encodeIfPresent(self.dischargeDisposition, forKey: .dischargeDisposition)
        try container.encodeIfPresent(self.origin, forKey: .origin)
        try container.encodeIfPresent(self.preAdmissionIdentifier, forKey: .preAdmissionIdentifier)
        try container.encodeIfPresent(self.reAdmission, forKey: .reAdmission)
        try container.encode(Array(self.specialArrangement), forKey: .specialArrangement)
        try container.encode(Array(self.specialCourtesy), forKey: .specialCourtesy)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["admitSource"] {
				presentKeys.insert("admitSource")
				if let val = exist as? FHIRJSON {
					upsert(admitSource: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "admitSource", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["admittingDiagnosis"] {
				presentKeys.insert("admittingDiagnosis")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.admittingDiagnosis) }
						self.admittingDiagnosis.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "admittingDiagnosis", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? FHIRJSON {
					upsert(destination: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dietPreference"] {
				presentKeys.insert("dietPreference")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.dietPreference) }
						self.dietPreference.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dietPreference", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["dischargeDiagnosis"] {
				presentKeys.insert("dischargeDiagnosis")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.dischargeDiagnosis) }
						self.dischargeDiagnosis.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dischargeDiagnosis", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["dischargeDisposition"] {
				presentKeys.insert("dischargeDisposition")
				if let val = exist as? FHIRJSON {
					upsert(dischargeDisposition: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dischargeDisposition", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["origin"] {
				presentKeys.insert("origin")
				if let val = exist as? FHIRJSON {
					upsert(origin: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "origin", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["preAdmissionIdentifier"] {
				presentKeys.insert("preAdmissionIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(preAdmissionIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "preAdmissionIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reAdmission"] {
				presentKeys.insert("reAdmission")
				if let val = exist as? FHIRJSON {
					upsert(reAdmission: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reAdmission", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["specialArrangement"] {
				presentKeys.insert("specialArrangement")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.specialArrangement) }
						self.specialArrangement.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "specialArrangement", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["specialCourtesy"] {
				presentKeys.insert("specialCourtesy")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.specialCourtesy) }
						self.specialCourtesy.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "specialCourtesy", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let admitSource = self.admitSource {
			json["admitSource"] = admitSource.asJSON()
		}
		if admittingDiagnosis.count > 0 {
			json["admittingDiagnosis"] = Array(admittingDiagnosis.map() { $0.asJSON() })
		}
		if let destination = self.destination {
			json["destination"] = destination.asJSON()
		}
		if dietPreference.count > 0 {
			json["dietPreference"] = Array(dietPreference.map() { $0.asJSON() })
		}
		if dischargeDiagnosis.count > 0 {
			json["dischargeDiagnosis"] = Array(dischargeDiagnosis.map() { $0.asJSON() })
		}
		if let dischargeDisposition = self.dischargeDisposition {
			json["dischargeDisposition"] = dischargeDisposition.asJSON()
		}
		if let origin = self.origin {
			json["origin"] = origin.asJSON()
		}
		if let preAdmissionIdentifier = self.preAdmissionIdentifier {
			json["preAdmissionIdentifier"] = preAdmissionIdentifier.asJSON()
		}
		if let reAdmission = self.reAdmission {
			json["reAdmission"] = reAdmission.asJSON()
		}
		if specialArrangement.count > 0 {
			json["specialArrangement"] = Array(specialArrangement.map() { $0.asJSON() })
		}
		if specialCourtesy.count > 0 {
			json["specialCourtesy"] = Array(specialCourtesy.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EncounterHospitalization.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EncounterHospitalization. Will return empty instance: \(error))")
		}
		return EncounterHospitalization.init()
	}
}


/**
 *  List of locations where the patient has been.
 *
 *  List of locations where  the patient has been during this encounter.
 */
open class EncounterLocation: BackboneElement {
	override open class var resourceType: String {
		get { return "EncounterLocation" }
	}

    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(location: Reference) {
        self.init()
        self.location = location
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case location = "location"
        case period = "period"
        case status = "status"
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

        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.status, forKey: .status)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					upsert(location: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "location"))
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EncounterLocation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EncounterLocation. Will return empty instance: \(error))")
		}
		return EncounterLocation.init()
	}
}


/**
 *  List of participants involved in the encounter.
 *
 *  The list of people responsible for providing the service.
 */
open class EncounterParticipant: BackboneElement {
	override open class var resourceType: String {
		get { return "EncounterParticipant" }
	}

    @objc public dynamic var individual: Reference?
    public func upsert(individual: Reference?) {
        upsert(prop: &self.individual, val: individual)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let type = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case individual = "individual"
        case period = "period"
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

        self.individual = try container.decodeIfPresent(Reference.self, forKey: .individual)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.type.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.individual, forKey: .individual)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.type), forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["individual"] {
				presentKeys.insert("individual")
				if let val = exist as? FHIRJSON {
					upsert(individual: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "individual", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let individual = self.individual {
			json["individual"] = individual.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EncounterParticipant.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EncounterParticipant. Will return empty instance: \(error))")
		}
		return EncounterParticipant.init()
	}
}


/**
 *  List of past encounter statuses.
 *
 *  The status history permits the encounter resource to contain the status history without needing to read through the
 *  historical versions of the resource, or even have the server store them.
 */
open class EncounterStatusHistory: BackboneElement {
	override open class var resourceType: String {
		get { return "EncounterStatusHistory" }
	}

    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(period: Period, status: String) {
        self.init()
        self.period = period
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case period = "period"
        case status = "status"
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

        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.status, forKey: .status)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "period"))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EncounterStatusHistory.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EncounterStatusHistory. Will return empty instance: \(error))")
		}
		return EncounterStatusHistory.init()
	}
}

