//
//  Encounter.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Encounter) on 2017-01-27.
//  2017, SMART Health IT.
//

import Foundation
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

	public dynamic var appointment: Reference?
	public dynamic var class_fhir: String?
	public let episodeOfCare = RealmSwift.List<Reference>()
	public dynamic var hospitalization: EncounterHospitalization?
	public let identifier = RealmSwift.List<Identifier>()
	public let incomingReferral = RealmSwift.List<Reference>()
	public let indication = RealmSwift.List<Reference>()
	public dynamic var length: Quantity?
	public let location = RealmSwift.List<EncounterLocation>()
	public dynamic var partOf: Reference?
	public let participant = RealmSwift.List<EncounterParticipant>()
	public dynamic var patient: Reference?
	public dynamic var period: Period?
	public dynamic var priority: CodeableConcept?
	public let reason = RealmSwift.List<CodeableConcept>()
	public dynamic var serviceProvider: Reference?
	public dynamic var status: String?
	public let statusHistory = RealmSwift.List<EncounterStatusHistory>()
	public let type = RealmSwift.List<CodeableConcept>()

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(status: String) {
		self.init(json: nil)
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["appointment"] {
				presentKeys.insert("appointment")
				if let val = exist as? FHIRJSON {
					self.appointment = Reference(json: val, owner: self)
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
					self.hospitalization = EncounterHospitalization(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "hospitalization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
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
			if let exist = js["incomingReferral"] {
				presentKeys.insert("incomingReferral")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
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
					self.length = Quantity(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "length", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? [FHIRJSON] {
					if let vals = EncounterLocation.instantiate(fromArray: val, owner: self) as? [EncounterLocation] {
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
					self.partOf = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "partOf", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["participant"] {
				presentKeys.insert("participant")
				if let val = exist as? [FHIRJSON] {
					if let vals = EncounterParticipant.instantiate(fromArray: val, owner: self) as? [EncounterParticipant] {
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
					self.patient = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					self.period = Period(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? FHIRJSON {
					self.priority = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
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
					self.serviceProvider = Reference(json: val, owner: self)
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
}


/**
 *  Details about the admission to a healthcare service.
 */
open class EncounterHospitalization: BackboneElement {
	override open class var resourceType: String {
		get { return "EncounterHospitalization" }
	}

	public dynamic var admitSource: CodeableConcept?
	public let admittingDiagnosis = RealmSwift.List<Reference>()
	public dynamic var destination: Reference?
	public let dietPreference = RealmSwift.List<CodeableConcept>()
	public let dischargeDiagnosis = RealmSwift.List<Reference>()
	public dynamic var dischargeDisposition: CodeableConcept?
	public dynamic var origin: Reference?
	public dynamic var preAdmissionIdentifier: Identifier?
	public dynamic var reAdmission: CodeableConcept?
	public let specialArrangement = RealmSwift.List<CodeableConcept>()
	public let specialCourtesy = RealmSwift.List<CodeableConcept>()

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["admitSource"] {
				presentKeys.insert("admitSource")
				if let val = exist as? FHIRJSON {
					self.admitSource = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "admitSource", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["admittingDiagnosis"] {
				presentKeys.insert("admittingDiagnosis")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
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
					self.destination = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["dietPreference"] {
				presentKeys.insert("dietPreference")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
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
					self.dischargeDisposition = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "dischargeDisposition", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["origin"] {
				presentKeys.insert("origin")
				if let val = exist as? FHIRJSON {
					self.origin = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "origin", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["preAdmissionIdentifier"] {
				presentKeys.insert("preAdmissionIdentifier")
				if let val = exist as? FHIRJSON {
					self.preAdmissionIdentifier = Identifier(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "preAdmissionIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reAdmission"] {
				presentKeys.insert("reAdmission")
				if let val = exist as? FHIRJSON {
					self.reAdmission = CodeableConcept(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "reAdmission", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["specialArrangement"] {
				presentKeys.insert("specialArrangement")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
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

	public dynamic var location: Reference?
	public dynamic var period: Period?
	public dynamic var status: String?

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(location: Reference) {
		self.init(json: nil)
		self.location = location
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					self.location = Reference(json: val, owner: self)
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
					self.period = Period(json: val, owner: self)
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

	public dynamic var individual: Reference?
	public dynamic var period: Period?
	public let type = RealmSwift.List<CodeableConcept>()

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["individual"] {
				presentKeys.insert("individual")
				if let val = exist as? FHIRJSON {
					self.individual = Reference(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "individual", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					self.period = Period(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
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

	public dynamic var period: Period?
	public dynamic var status: String?

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(period: Period, status: String) {
		self.init(json: nil)
		self.period = period
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					self.period = Period(json: val, owner: self)
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
}

