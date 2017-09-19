//
//  ImmunizationRecommendation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Guidance or advice relating to an immunization.
 *
 *  A patient's point-in-time immunization and recommendation (i.e. forecasting a patient's immunization eligibility
 *  according to a published schedule) with optional supporting justification.
 */
open class ImmunizationRecommendation: DomainResource {
	override open class var resourceType: String {
		get { return "ImmunizationRecommendation" }
	}

    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    public let recommendation = RealmSwift.List<ImmunizationRecommendationRecommendation>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, recommendation: [ImmunizationRecommendationRecommendation]) {
        self.init()
        self.patient = patient
        self.recommendation.append(objectsIn: recommendation)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "identifier"
        case patient = "patient"
        case recommendation = "recommendation"
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

        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.recommendation.append(objectsIn: try container.decodeIfPresent([ImmunizationRecommendationRecommendation].self, forKey: .recommendation) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(Array(self.recommendation), forKey: .recommendation)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationRecommendation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationRecommendation. Will return empty instance: \(error))")
		}
		return ImmunizationRecommendation.init()
	}
}




/**
 *  Vaccine administration recommendations.
 */
open class ImmunizationRecommendationRecommendation: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationRecommendationRecommendation" }
	}

    @objc public dynamic var date: DateTime?
    public let dateCriterion = RealmSwift.List<ImmunizationRecommendationRecommendationDateCriterion>()
    public let doseNumber = RealmOptional<Int>()
    @objc public dynamic var forecastStatus: CodeableConcept?
    public func upsert(forecastStatus: CodeableConcept?) {
        upsert(prop: &self.forecastStatus, val: forecastStatus)
    }
    @objc public dynamic var protocol_fhir: ImmunizationRecommendationRecommendationProtocol?
    public func upsert(protocol_fhir: ImmunizationRecommendationRecommendationProtocol?) {
        upsert(prop: &self.protocol_fhir, val: protocol_fhir)
    }
    public let supportingImmunization = RealmSwift.List<Reference>()
    public let supportingPatientInformation = RealmSwift.List<Reference>()
    @objc public dynamic var vaccineCode: CodeableConcept?
    public func upsert(vaccineCode: CodeableConcept?) {
        upsert(prop: &self.vaccineCode, val: vaccineCode)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(date: DateTime, forecastStatus: CodeableConcept, vaccineCode: CodeableConcept) {
        self.init()
        self.date = date
        self.forecastStatus = forecastStatus
        self.vaccineCode = vaccineCode
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case dateCriterion = "dateCriterion"
        case doseNumber = "doseNumber"
        case forecastStatus = "forecastStatus"
        case protocol_fhir = "protocol"
        case supportingImmunization = "supportingImmunization"
        case supportingPatientInformation = "supportingPatientInformation"
        case vaccineCode = "vaccineCode"
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
        self.dateCriterion.append(objectsIn: try container.decodeIfPresent([ImmunizationRecommendationRecommendationDateCriterion].self, forKey: .dateCriterion) ?? [])
        self.doseNumber.value = try container.decodeIfPresent(Int.self, forKey: .doseNumber)
        self.forecastStatus = try container.decodeIfPresent(CodeableConcept.self, forKey: .forecastStatus)
        self.protocol_fhir = try container.decodeIfPresent(ImmunizationRecommendationRecommendationProtocol.self, forKey: .protocol_fhir)
        self.supportingImmunization.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supportingImmunization) ?? [])
        self.supportingPatientInformation.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supportingPatientInformation) ?? [])
        self.vaccineCode = try container.decodeIfPresent(CodeableConcept.self, forKey: .vaccineCode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encode(Array(self.dateCriterion), forKey: .dateCriterion)
        try container.encodeIfPresent(self.doseNumber.value, forKey: .doseNumber)
        try container.encodeIfPresent(self.forecastStatus, forKey: .forecastStatus)
        try container.encodeIfPresent(self.protocol_fhir, forKey: .protocol_fhir)
        try container.encode(Array(self.supportingImmunization), forKey: .supportingImmunization)
        try container.encode(Array(self.supportingPatientInformation), forKey: .supportingPatientInformation)
        try container.encodeIfPresent(self.vaccineCode, forKey: .vaccineCode)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationRecommendationRecommendation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationRecommendationRecommendation. Will return empty instance: \(error))")
		}
		return ImmunizationRecommendationRecommendation.init()
	}
}




/**
 *  Dates governing proposed immunization.
 *
 *  Vaccine date recommendations.  For example, earliest date to administer, latest date to administer, etc.
 */
open class ImmunizationRecommendationRecommendationDateCriterion: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationRecommendationRecommendationDateCriterion" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var value: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, val: DateTime) {
        self.init()
        self.code = code
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case value = "value"
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

        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.value = try container.decodeIfPresent(DateTime.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationRecommendationRecommendationDateCriterion.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationRecommendationRecommendationDateCriterion. Will return empty instance: \(error))")
		}
		return ImmunizationRecommendationRecommendationDateCriterion.init()
	}
}




/**
 *  Protocol used by recommendation.
 *
 *  Contains information about the protocol under which the vaccine was administered.
 */
open class ImmunizationRecommendationRecommendationProtocol: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationRecommendationRecommendationProtocol" }
	}

    @objc public dynamic var authority: Reference?
    public func upsert(authority: Reference?) {
        upsert(prop: &self.authority, val: authority)
    }
    @objc public dynamic var description_fhir: String?
    public let doseSequence = RealmOptional<Int>()
    @objc public dynamic var series: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authority = "authority"
        case description_fhir = "description"
        case doseSequence = "doseSequence"
        case series = "series"
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
        self.series = try container.decodeIfPresent(String.self, forKey: .series)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.authority, forKey: .authority)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.doseSequence.value, forKey: .doseSequence)
        try container.encodeIfPresent(self.series, forKey: .series)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImmunizationRecommendationRecommendationProtocol.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImmunizationRecommendationRecommendationProtocol. Will return empty instance: \(error))")
		}
		return ImmunizationRecommendationRecommendationProtocol.init()
	}
}



