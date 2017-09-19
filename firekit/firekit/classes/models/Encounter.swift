//
//  Encounter.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Encounter) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Encounter else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.appointment, from: o.appointment)
        class_fhir = o.class_fhir
        // TODO: episodeOfCare array
        FireKit.populate(&self.hospitalization, from: o.hospitalization)
        // TODO: identifier array
        // TODO: incomingReferral array
        // TODO: indication array
        FireKit.populate(&self.length, from: o.length)
        // TODO: location array
        FireKit.populate(&self.partOf, from: o.partOf)
        // TODO: participant array
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.period, from: o.period)
        FireKit.populate(&self.priority, from: o.priority)
        // TODO: reason array
        FireKit.populate(&self.serviceProvider, from: o.serviceProvider)
        status = o.status
        // TODO: statusHistory array
        // TODO: type array
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

    public override func populate(from other: Any) {
        guard let o = other as? EncounterHospitalization else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.admitSource, from: o.admitSource)
        // TODO: admittingDiagnosis array
        FireKit.populate(&self.destination, from: o.destination)
        // TODO: dietPreference array
        // TODO: dischargeDiagnosis array
        FireKit.populate(&self.dischargeDisposition, from: o.dischargeDisposition)
        FireKit.populate(&self.origin, from: o.origin)
        FireKit.populate(&self.preAdmissionIdentifier, from: o.preAdmissionIdentifier)
        FireKit.populate(&self.reAdmission, from: o.reAdmission)
        // TODO: specialArrangement array
        // TODO: specialCourtesy array
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

    public override func populate(from other: Any) {
        guard let o = other as? EncounterLocation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.location, from: o.location)
        FireKit.populate(&self.period, from: o.period)
        status = o.status
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

    public override func populate(from other: Any) {
        guard let o = other as? EncounterParticipant else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.individual, from: o.individual)
        FireKit.populate(&self.period, from: o.period)
        // TODO: type array
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

    public override func populate(from other: Any) {
        guard let o = other as? EncounterStatusHistory else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.period, from: o.period)
        status = o.status
    }
}

