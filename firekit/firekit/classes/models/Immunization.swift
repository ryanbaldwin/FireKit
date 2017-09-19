//
//  Immunization.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Immunization) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Immunization event information.
 *
 *  Describes the event of a patient being administered a vaccination or a record of a vaccination as reported by a
 *  patient, a clinician or another party and may include vaccine reaction information and what vaccination protocol was
 *  followed.
 */
open class Immunization: DomainResource {
	override open class var resourceType: String {
		get { return "Immunization" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var doseQuantity: Quantity?
    public func upsert(doseQuantity: Quantity?) {
        upsert(prop: &self.doseQuantity, val: doseQuantity)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var expirationDate: FHIRDate?
    @objc public dynamic var explanation: ImmunizationExplanation?
    public func upsert(explanation: ImmunizationExplanation?) {
        upsert(prop: &self.explanation, val: explanation)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var lotNumber: String?
    @objc public dynamic var manufacturer: Reference?
    public func upsert(manufacturer: Reference?) {
        upsert(prop: &self.manufacturer, val: manufacturer)
    }
    public let note = RealmSwift.List<Annotation>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var performer: Reference?
    public func upsert(performer: Reference?) {
        upsert(prop: &self.performer, val: performer)
    }
    public let reaction = RealmSwift.List<ImmunizationReaction>()
    public let reported = RealmOptional<Bool>()
    @objc public dynamic var requester: Reference?
    public func upsert(requester: Reference?) {
        upsert(prop: &self.requester, val: requester)
    }
    @objc public dynamic var route: CodeableConcept?
    public func upsert(route: CodeableConcept?) {
        upsert(prop: &self.route, val: route)
    }
    @objc public dynamic var site: CodeableConcept?
    public func upsert(site: CodeableConcept?) {
        upsert(prop: &self.site, val: site)
    }
    @objc public dynamic var status: String?
    public let vaccinationProtocol = RealmSwift.List<ImmunizationVaccinationProtocol>()
    @objc public dynamic var vaccineCode: CodeableConcept?
    public func upsert(vaccineCode: CodeableConcept?) {
        upsert(prop: &self.vaccineCode, val: vaccineCode)
    }
    public let wasNotGiven = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, reported: Bool, status: String, vaccineCode: CodeableConcept, wasNotGiven: Bool) {
        self.init()
        self.patient = patient
        self.reported.value = reported
        self.status = status
        self.vaccineCode = vaccineCode
        self.wasNotGiven.value = wasNotGiven
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case doseQuantity = "doseQuantity"
        case encounter = "encounter"
        case expirationDate = "expirationDate"
        case explanation = "explanation"
        case identifier = "identifier"
        case location = "location"
        case lotNumber = "lotNumber"
        case manufacturer = "manufacturer"
        case note = "note"
        case patient = "patient"
        case performer = "performer"
        case reaction = "reaction"
        case reported = "reported"
        case requester = "requester"
        case route = "route"
        case site = "site"
        case status = "status"
        case vaccinationProtocol = "vaccinationProtocol"
        case vaccineCode = "vaccineCode"
        case wasNotGiven = "wasNotGiven"
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
        self.doseQuantity = try container.decodeIfPresent(Quantity.self, forKey: .doseQuantity)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.expirationDate = try container.decodeIfPresent(FHIRDate.self, forKey: .expirationDate)
        self.explanation = try container.decodeIfPresent(ImmunizationExplanation.self, forKey: .explanation)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.lotNumber = try container.decodeIfPresent(String.self, forKey: .lotNumber)
        self.manufacturer = try container.decodeIfPresent(Reference.self, forKey: .manufacturer)
        self.note.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .note) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.performer = try container.decodeIfPresent(Reference.self, forKey: .performer)
        self.reaction.append(objectsIn: try container.decodeIfPresent([ImmunizationReaction].self, forKey: .reaction) ?? [])
        self.reported.value = try container.decodeIfPresent(Bool.self, forKey: .reported)
        self.requester = try container.decodeIfPresent(Reference.self, forKey: .requester)
        self.route = try container.decodeIfPresent(CodeableConcept.self, forKey: .route)
        self.site = try container.decodeIfPresent(CodeableConcept.self, forKey: .site)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.vaccinationProtocol.append(objectsIn: try container.decodeIfPresent([ImmunizationVaccinationProtocol].self, forKey: .vaccinationProtocol) ?? [])
        self.vaccineCode = try container.decodeIfPresent(CodeableConcept.self, forKey: .vaccineCode)
        self.wasNotGiven.value = try container.decodeIfPresent(Bool.self, forKey: .wasNotGiven)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.doseQuantity, forKey: .doseQuantity)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.expirationDate, forKey: .expirationDate)
        try container.encodeIfPresent(self.explanation, forKey: .explanation)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.lotNumber, forKey: .lotNumber)
        try container.encodeIfPresent(self.manufacturer, forKey: .manufacturer)
        try container.encode(Array(self.note), forKey: .note)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.performer, forKey: .performer)
        try container.encode(Array(self.reaction), forKey: .reaction)
        try container.encodeIfPresent(self.reported.value, forKey: .reported)
        try container.encodeIfPresent(self.requester, forKey: .requester)
        try container.encodeIfPresent(self.route, forKey: .route)
        try container.encodeIfPresent(self.site, forKey: .site)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.vaccinationProtocol), forKey: .vaccinationProtocol)
        try container.encodeIfPresent(self.vaccineCode, forKey: .vaccineCode)
        try container.encodeIfPresent(self.wasNotGiven.value, forKey: .wasNotGiven)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Immunization.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Immunization. Will return empty instance: \(error))")
		}
		return Immunization.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Immunization else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        date = o.date
        FireKit.populate(&self.doseQuantity, from: o.doseQuantity)
        FireKit.populate(&self.encounter, from: o.encounter)
        expirationDate = o.expirationDate
        FireKit.populate(&self.explanation, from: o.explanation)
        FireKit.populateList(&self.identifier, from: o.identifier)
        FireKit.populate(&self.location, from: o.location)
        lotNumber = o.lotNumber
        FireKit.populate(&self.manufacturer, from: o.manufacturer)
        FireKit.populateList(&self.note, from: o.note)
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.performer, from: o.performer)
        FireKit.populateList(&self.reaction, from: o.reaction)
        reported.value = o.reported.value
        FireKit.populate(&self.requester, from: o.requester)
        FireKit.populate(&self.route, from: o.route)
        FireKit.populate(&self.site, from: o.site)
        status = o.status
        FireKit.populateList(&self.vaccinationProtocol, from: o.vaccinationProtocol)
        FireKit.populate(&self.vaccineCode, from: o.vaccineCode)
        wasNotGiven.value = o.wasNotGiven.value
    }
}


/**
 *  Administration/non-administration reasons.
 *
 *  Reasons why a vaccine was or was not administered.
 */
open class ImmunizationExplanation: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationExplanation" }
	}

    public let reason = RealmSwift.List<CodeableConcept>()
    public let reasonNotGiven = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case reason = "reason"
        case reasonNotGiven = "reasonNotGiven"
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

        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.reasonNotGiven.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reasonNotGiven) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encode(Array(self.reasonNotGiven), forKey: .reasonNotGiven)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationExplanation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationExplanation. Will return empty instance: \(error))")
		}
		return ImmunizationExplanation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImmunizationExplanation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.reason, from: o.reason)
        FireKit.populateList(&self.reasonNotGiven, from: o.reasonNotGiven)
    }
}


/**
 *  Details of a reaction that follows immunization.
 *
 *  Categorical data indicating that an adverse event is associated in time to an immunization.
 */
open class ImmunizationReaction: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationReaction" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var detail: Reference?
    public func upsert(detail: Reference?) {
        upsert(prop: &self.detail, val: detail)
    }
    public let reported = RealmOptional<Bool>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case detail = "detail"
        case reported = "reported"
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
        self.detail = try container.decodeIfPresent(Reference.self, forKey: .detail)
        self.reported.value = try container.decodeIfPresent(Bool.self, forKey: .reported)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encodeIfPresent(self.reported.value, forKey: .reported)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationReaction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationReaction. Will return empty instance: \(error))")
		}
		return ImmunizationReaction.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImmunizationReaction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        date = o.date
        FireKit.populate(&self.detail, from: o.detail)
        reported.value = o.reported.value
    }
}


/**
 *  What protocol was followed.
 *
 *  Contains information about the protocol(s) under which the vaccine was administered.
 */
open class ImmunizationVaccinationProtocol: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationVaccinationProtocol" }
	}

    @objc public dynamic var authority: Reference?
    public func upsert(authority: Reference?) {
        upsert(prop: &self.authority, val: authority)
    }
    @objc public dynamic var description_fhir: String?
    public let doseSequence = RealmOptional<Int>()
    @objc public dynamic var doseStatus: CodeableConcept?
    public func upsert(doseStatus: CodeableConcept?) {
        upsert(prop: &self.doseStatus, val: doseStatus)
    }
    @objc public dynamic var doseStatusReason: CodeableConcept?
    public func upsert(doseStatusReason: CodeableConcept?) {
        upsert(prop: &self.doseStatusReason, val: doseStatusReason)
    }
    @objc public dynamic var series: String?
    public let seriesDoses = RealmOptional<Int>()
    public let targetDisease = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(doseSequence: Int, doseStatus: CodeableConcept, targetDisease: [CodeableConcept]) {
        self.init()
        self.doseSequence.value = doseSequence
        self.doseStatus = doseStatus
        self.targetDisease.append(objectsIn: targetDisease)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authority = "authority"
        case description_fhir = "description"
        case doseSequence = "doseSequence"
        case doseStatus = "doseStatus"
        case doseStatusReason = "doseStatusReason"
        case series = "series"
        case seriesDoses = "seriesDoses"
        case targetDisease = "targetDisease"
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

        self.authority = try container.decodeIfPresent(Reference.self, forKey: .authority)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.doseSequence.value = try container.decodeIfPresent(Int.self, forKey: .doseSequence)
        self.doseStatus = try container.decodeIfPresent(CodeableConcept.self, forKey: .doseStatus)
        self.doseStatusReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .doseStatusReason)
        self.series = try container.decodeIfPresent(String.self, forKey: .series)
        self.seriesDoses.value = try container.decodeIfPresent(Int.self, forKey: .seriesDoses)
        self.targetDisease.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .targetDisease) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.authority, forKey: .authority)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.doseSequence.value, forKey: .doseSequence)
        try container.encodeIfPresent(self.doseStatus, forKey: .doseStatus)
        try container.encodeIfPresent(self.doseStatusReason, forKey: .doseStatusReason)
        try container.encodeIfPresent(self.series, forKey: .series)
        try container.encodeIfPresent(self.seriesDoses.value, forKey: .seriesDoses)
        try container.encode(Array(self.targetDisease), forKey: .targetDisease)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationVaccinationProtocol.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationVaccinationProtocol. Will return empty instance: \(error))")
		}
		return ImmunizationVaccinationProtocol.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImmunizationVaccinationProtocol else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.authority, from: o.authority)
        description_fhir = o.description_fhir
        doseSequence.value = o.doseSequence.value
        FireKit.populate(&self.doseStatus, from: o.doseStatus)
        FireKit.populate(&self.doseStatusReason, from: o.doseStatusReason)
        series = o.series
        seriesDoses.value = o.seriesDoses.value
        FireKit.populateList(&self.targetDisease, from: o.targetDisease)
    }
}

