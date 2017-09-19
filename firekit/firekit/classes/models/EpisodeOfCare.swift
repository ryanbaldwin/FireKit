//
//  EpisodeOfCare.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/EpisodeOfCare) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  An association of a Patient with an Organization and  Healthcare Provider(s) for a period of time that the
 *  Organization assumes some level of responsibility.
 *
 *  An association between a patient and an organization / healthcare provider(s) during which time encounters may
 *  occur. The managing organization assumes a level of responsibility for the patient during this time.
 */
open class EpisodeOfCare: DomainResource {
	override open class var resourceType: String {
		get { return "EpisodeOfCare" }
	}

    @objc public dynamic var careManager: Reference?
    public func upsert(careManager: Reference?) {
        upsert(prop: &self.careManager, val: careManager)
    }
    public let careTeam = RealmSwift.List<EpisodeOfCareCareTeam>()
    public let condition = RealmSwift.List<Reference>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var managingOrganization: Reference?
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let referralRequest = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?
    public let statusHistory = RealmSwift.List<EpisodeOfCareStatusHistory>()
    public let type = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, status: String) {
        self.init()
        self.patient = patient
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case careManager = "careManager"
        case careTeam = "careTeam"
        case condition = "condition"
        case identifier = "identifier"
        case managingOrganization = "managingOrganization"
        case patient = "patient"
        case period = "period"
        case referralRequest = "referralRequest"
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

        self.careManager = try container.decodeIfPresent(Reference.self, forKey: .careManager)
        self.careTeam.append(objectsIn: try container.decodeIfPresent([EpisodeOfCareCareTeam].self, forKey: .careTeam) ?? [])
        self.condition.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .condition) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.managingOrganization = try container.decodeIfPresent(Reference.self, forKey: .managingOrganization)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.referralRequest.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .referralRequest) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.statusHistory.append(objectsIn: try container.decodeIfPresent([EpisodeOfCareStatusHistory].self, forKey: .statusHistory) ?? [])
        self.type.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.careManager, forKey: .careManager)
        try container.encode(Array(self.careTeam), forKey: .careTeam)
        try container.encode(Array(self.condition), forKey: .condition)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.managingOrganization, forKey: .managingOrganization)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.referralRequest), forKey: .referralRequest)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.statusHistory), forKey: .statusHistory)
        try container.encode(Array(self.type), forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EpisodeOfCare.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EpisodeOfCare. Will return empty instance: \(error))")
		}
		return EpisodeOfCare.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? EpisodeOfCare else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.careManager, from: o.careManager)
        FireKit.populateList(&self.careTeam, from: o.careTeam)
        FireKit.populateList(&self.condition, from: o.condition)
        FireKit.populateList(&self.identifier, from: o.identifier)
        FireKit.populate(&self.managingOrganization, from: o.managingOrganization)
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.period, from: o.period)
        FireKit.populateList(&self.referralRequest, from: o.referralRequest)
        status = o.status
        FireKit.populateList(&self.statusHistory, from: o.statusHistory)
        FireKit.populateList(&self.type, from: o.type)
    }
}


/**
 *  Other practitioners facilitating this episode of care.
 *
 *  The list of practitioners that may be facilitating this episode of care for specific purposes.
 */
open class EpisodeOfCareCareTeam: BackboneElement {
	override open class var resourceType: String {
		get { return "EpisodeOfCareCareTeam" }
	}

    @objc public dynamic var member: Reference?
    public func upsert(member: Reference?) {
        upsert(prop: &self.member, val: member)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let role = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case member = "member"
        case period = "period"
        case role = "role"
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

        self.member = try container.decodeIfPresent(Reference.self, forKey: .member)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.role.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .role) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.member, forKey: .member)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.role), forKey: .role)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EpisodeOfCareCareTeam.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EpisodeOfCareCareTeam. Will return empty instance: \(error))")
		}
		return EpisodeOfCareCareTeam.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? EpisodeOfCareCareTeam else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.member, from: o.member)
        FireKit.populate(&self.period, from: o.period)
        FireKit.populateList(&self.role, from: o.role)
    }
}


/**
 *  Past list of status codes.
 *
 *  The history of statuses that the EpisodeOfCare has been through (without requiring processing the history of the
 *  resource).
 */
open class EpisodeOfCareStatusHistory: BackboneElement {
	override open class var resourceType: String {
		get { return "EpisodeOfCareStatusHistory" }
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
			let clone = try JSONDecoder().decode(EpisodeOfCareStatusHistory.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EpisodeOfCareStatusHistory. Will return empty instance: \(error))")
		}
		return EpisodeOfCareStatusHistory.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? EpisodeOfCareStatusHistory else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.period, from: o.period)
        status = o.status
    }
}

