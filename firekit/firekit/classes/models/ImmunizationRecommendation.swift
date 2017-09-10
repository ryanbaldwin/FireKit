//
//  ImmunizationRecommendation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation) on 2017-09-10.
//  2017, SMART Health IT.
//

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
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(self.recommendation.flatMap { $0 }, forKey: .recommendation)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			else {
				errors.append(FHIRJSONError(key: "patient"))
			}
			if let exist = js["recommendation"] {
				presentKeys.insert("recommendation")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImmunizationRecommendationRecommendation.instantiate(fromArray: val, owner: self) as? [ImmunizationRecommendationRecommendation] {
						if let realm = self.realm { realm.delete(self.recommendation) }
						self.recommendation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "recommendation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "recommendation"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if recommendation.count > 0 {
			json["recommendation"] = Array(recommendation.map() { $0.asJSON() })
		}
		
		return json
	}
*/
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
        try container.encode(self.dateCriterion.flatMap { $0 }, forKey: .dateCriterion)
        try container.encodeIfPresent(self.doseNumber.value, forKey: .doseNumber)
        try container.encodeIfPresent(self.forecastStatus, forKey: .forecastStatus)
        try container.encodeIfPresent(self.protocol_fhir, forKey: .protocol_fhir)
        try container.encode(self.supportingImmunization.flatMap { $0 }, forKey: .supportingImmunization)
        try container.encode(self.supportingPatientInformation.flatMap { $0 }, forKey: .supportingPatientInformation)
        try container.encodeIfPresent(self.vaccineCode, forKey: .vaccineCode)
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
			else {
				errors.append(FHIRJSONError(key: "date"))
			}
			if let exist = js["dateCriterion"] {
				presentKeys.insert("dateCriterion")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImmunizationRecommendationRecommendationDateCriterion.instantiate(fromArray: val, owner: self) as? [ImmunizationRecommendationRecommendationDateCriterion] {
						if let realm = self.realm { realm.delete(self.dateCriterion) }
						self.dateCriterion.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dateCriterion", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["doseNumber"] {
				presentKeys.insert("doseNumber")
				if let val = exist as? Int {
					self.doseNumber.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "doseNumber", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["forecastStatus"] {
				presentKeys.insert("forecastStatus")
				if let val = exist as? FHIRJSON {
					upsert(forecastStatus: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "forecastStatus", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "forecastStatus"))
			}
			if let exist = js["protocol"] {
				presentKeys.insert("protocol")
				if let val = exist as? FHIRJSON {
					upsert(protocol_fhir: ImmunizationRecommendationRecommendationProtocol(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "protocol", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["supportingImmunization"] {
				presentKeys.insert("supportingImmunization")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.supportingImmunization) }
						self.supportingImmunization.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "supportingImmunization", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["supportingPatientInformation"] {
				presentKeys.insert("supportingPatientInformation")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.supportingPatientInformation) }
						self.supportingPatientInformation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "supportingPatientInformation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["vaccineCode"] {
				presentKeys.insert("vaccineCode")
				if let val = exist as? FHIRJSON {
					upsert(vaccineCode: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "vaccineCode", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "vaccineCode"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if dateCriterion.count > 0 {
			json["dateCriterion"] = Array(dateCriterion.map() { $0.asJSON() })
		}
		if let doseNumber = self.doseNumber.value {
			json["doseNumber"] = doseNumber.asJSON()
		}
		if let forecastStatus = self.forecastStatus {
			json["forecastStatus"] = forecastStatus.asJSON()
		}
		if let protocol_fhir = self.protocol_fhir {
			json["protocol"] = protocol_fhir.asJSON()
		}
		if supportingImmunization.count > 0 {
			json["supportingImmunization"] = Array(supportingImmunization.map() { $0.asJSON() })
		}
		if supportingPatientInformation.count > 0 {
			json["supportingPatientInformation"] = Array(supportingPatientInformation.map() { $0.asJSON() })
		}
		if let vaccineCode = self.vaccineCode {
			json["vaccineCode"] = vaccineCode.asJSON()
		}
		
		return json
	}
*/
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
/*
	
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
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "value"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["authority"] {
				presentKeys.insert("authority")
				if let val = exist as? FHIRJSON {
					upsert(authority: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "authority", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["doseSequence"] {
				presentKeys.insert("doseSequence")
				if let val = exist as? Int {
					self.doseSequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "doseSequence", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["series"] {
				presentKeys.insert("series")
				if let val = exist as? String {
					self.series = val
				}
				else {
					errors.append(FHIRJSONError(key: "series", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let authority = self.authority {
			json["authority"] = authority.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let doseSequence = self.doseSequence.value {
			json["doseSequence"] = doseSequence.asJSON()
		}
		if let series = self.series {
			json["series"] = series.asJSON()
		}
		
		return json
	}
*/
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

