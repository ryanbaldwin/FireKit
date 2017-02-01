//
//  ImmunizationRecommendation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImmunizationRecommendation) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
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
	
	public dynamic var patient: Reference?
	
	public let recommendation = RealmSwift.List<ImmunizationRecommendationRecommendation>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(patient: Reference, recommendation: [ImmunizationRecommendationRecommendation]) {
		self.init(json: nil)
		self.patient = patient
		self.recommendation.append(objectsIn: recommendation)
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
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
					self.patient = Reference(json: val, owner: self)
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
}


/**
 *  Vaccine administration recommendations.
 */
open class ImmunizationRecommendationRecommendation: BackboneElement {
	override open class var resourceType: String {
		get { return "ImmunizationRecommendationRecommendation" }
	}

	public dynamic var date: DateTime?
	
	public let dateCriterion = RealmSwift.List<ImmunizationRecommendationRecommendationDateCriterion>()
	
	public let doseNumber = RealmOptional<Int>()
	
	public dynamic var forecastStatus: CodeableConcept?
	
	public dynamic var protocol_fhir: ImmunizationRecommendationRecommendationProtocol?
	
	public let supportingImmunization = RealmSwift.List<Reference>()
	
	public let supportingPatientInformation = RealmSwift.List<Reference>()
	
	public dynamic var vaccineCode: CodeableConcept?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(date: DateTime, forecastStatus: CodeableConcept, vaccineCode: CodeableConcept) {
		self.init(json: nil)
		self.date = date
		self.forecastStatus = forecastStatus
		self.vaccineCode = vaccineCode
	}
	
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
					self.forecastStatus = CodeableConcept(json: val, owner: self)
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
					self.protocol_fhir = ImmunizationRecommendationRecommendationProtocol(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "protocol", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["supportingImmunization"] {
				presentKeys.insert("supportingImmunization")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
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
					self.vaccineCode = CodeableConcept(json: val, owner: self)
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

	public dynamic var code: CodeableConcept?
	
	public dynamic var value: DateTime?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: CodeableConcept, val: DateTime) {
		self.init(json: nil)
		self.code = code
		self.value = val
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					self.code = CodeableConcept(json: val, owner: self)
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

	public dynamic var authority: Reference?
	
	public dynamic var description_fhir: String?
	
	public let doseSequence = RealmOptional<Int>()
	
	public dynamic var series: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["authority"] {
				presentKeys.insert("authority")
				if let val = exist as? FHIRJSON {
					self.authority = Reference(json: val, owner: self)
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
}

