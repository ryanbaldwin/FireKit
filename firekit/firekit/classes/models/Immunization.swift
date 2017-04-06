//
//  Immunization.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Immunization) on 2017-04-06.
//  2017, SMART Health IT.
//

import Foundation
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
    
    public dynamic var date: DateTime?        
        
    public dynamic var doseQuantity: Quantity?        
    public func upsert(doseQuantity: Quantity?) {
        upsert(prop: &self.doseQuantity, val: doseQuantity)
    }    
    public dynamic var encounter: Reference?        
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }    
    public dynamic var expirationDate: FHIRDate?        
        
    public dynamic var explanation: ImmunizationExplanation?        
    public func upsert(explanation: ImmunizationExplanation?) {
        upsert(prop: &self.explanation, val: explanation)
    }    
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var location: Reference?        
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }    
    public dynamic var lotNumber: String?        
        
    public dynamic var manufacturer: Reference?        
    public func upsert(manufacturer: Reference?) {
        upsert(prop: &self.manufacturer, val: manufacturer)
    }    
    public let note = RealmSwift.List<Annotation>()    
    public dynamic var patient: Reference?        
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }    
    public dynamic var performer: Reference?        
    public func upsert(performer: Reference?) {
        upsert(prop: &self.performer, val: performer)
    }    
    public let reaction = RealmSwift.List<ImmunizationReaction>()    
    public let reported = RealmOptional<Bool>()    
    public dynamic var requester: Reference?        
    public func upsert(requester: Reference?) {
        upsert(prop: &self.requester, val: requester)
    }    
    public dynamic var route: CodeableConcept?        
    public func upsert(route: CodeableConcept?) {
        upsert(prop: &self.route, val: route)
    }    
    public dynamic var site: CodeableConcept?        
    public func upsert(site: CodeableConcept?) {
        upsert(prop: &self.site, val: site)
    }    
    public dynamic var status: String?        
        
    public let vaccinationProtocol = RealmSwift.List<ImmunizationVaccinationProtocol>()    
    public dynamic var vaccineCode: CodeableConcept?        
    public func upsert(vaccineCode: CodeableConcept?) {
        upsert(prop: &self.vaccineCode, val: vaccineCode)
    }    
    public let wasNotGiven = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, reported: Bool, status: String, vaccineCode: CodeableConcept, wasNotGiven: Bool) {
        self.init(json: nil)
        self.patient = patient
        self.reported.value = reported
        self.status = status
        self.vaccineCode = vaccineCode
        self.wasNotGiven.value = wasNotGiven
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
			if let exist = js["doseQuantity"] {
				presentKeys.insert("doseQuantity")
				if let val = exist as? FHIRJSON {
					upsert(doseQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "doseQuantity", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["expirationDate"] {
				presentKeys.insert("expirationDate")
				if let val = exist as? String {
					self.expirationDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "expirationDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["explanation"] {
				presentKeys.insert("explanation")
				if let val = exist as? FHIRJSON {
					upsert(explanation: ImmunizationExplanation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "explanation", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					upsert(location: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["lotNumber"] {
				presentKeys.insert("lotNumber")
				if let val = exist as? String {
					self.lotNumber = val
				}
				else {
					errors.append(FHIRJSONError(key: "lotNumber", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["manufacturer"] {
				presentKeys.insert("manufacturer")
				if let val = exist as? FHIRJSON {
					upsert(manufacturer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "manufacturer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? [FHIRJSON] {
					if let vals = Annotation.instantiate(fromArray: val, owner: self) as? [Annotation] {
						if let realm = self.realm { realm.delete(self.note) }
						self.note.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? FHIRJSON {
					upsert(performer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reaction"] {
				presentKeys.insert("reaction")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImmunizationReaction.instantiate(fromArray: val, owner: self) as? [ImmunizationReaction] {
						if let realm = self.realm { realm.delete(self.reaction) }
						self.reaction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reaction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reported"] {
				presentKeys.insert("reported")
				if let val = exist as? Bool {
					self.reported.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "reported", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "reported"))
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
			if let exist = js["route"] {
				presentKeys.insert("route")
				if let val = exist as? FHIRJSON {
					upsert(route: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "route", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["site"] {
				presentKeys.insert("site")
				if let val = exist as? FHIRJSON {
					upsert(site: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "site", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["vaccinationProtocol"] {
				presentKeys.insert("vaccinationProtocol")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImmunizationVaccinationProtocol.instantiate(fromArray: val, owner: self) as? [ImmunizationVaccinationProtocol] {
						if let realm = self.realm { realm.delete(self.vaccinationProtocol) }
						self.vaccinationProtocol.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "vaccinationProtocol", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["wasNotGiven"] {
				presentKeys.insert("wasNotGiven")
				if let val = exist as? Bool {
					self.wasNotGiven.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "wasNotGiven", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "wasNotGiven"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let doseQuantity = self.doseQuantity {
			json["doseQuantity"] = doseQuantity.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let expirationDate = self.expirationDate {
			json["expirationDate"] = expirationDate.asJSON()
		}
		if let explanation = self.explanation {
			json["explanation"] = explanation.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let lotNumber = self.lotNumber {
			json["lotNumber"] = lotNumber.asJSON()
		}
		if let manufacturer = self.manufacturer {
			json["manufacturer"] = manufacturer.asJSON()
		}
		if note.count > 0 {
			json["note"] = Array(note.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let performer = self.performer {
			json["performer"] = performer.asJSON()
		}
		if reaction.count > 0 {
			json["reaction"] = Array(reaction.map() { $0.asJSON() })
		}
		if let reported = self.reported.value {
			json["reported"] = reported.asJSON()
		}
		if let requester = self.requester {
			json["requester"] = requester.asJSON()
		}
		if let route = self.route {
			json["route"] = route.asJSON()
		}
		if let site = self.site {
			json["site"] = site.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if vaccinationProtocol.count > 0 {
			json["vaccinationProtocol"] = Array(vaccinationProtocol.map() { $0.asJSON() })
		}
		if let vaccineCode = self.vaccineCode {
			json["vaccineCode"] = vaccineCode.asJSON()
		}
		if let wasNotGiven = self.wasNotGiven.value {
			json["wasNotGiven"] = wasNotGiven.asJSON()
		}
		
		return json
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

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["reasonNotGiven"] {
				presentKeys.insert("reasonNotGiven")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonNotGiven) }
						self.reasonNotGiven.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonNotGiven", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if reason.count > 0 {
			json["reason"] = Array(reason.map() { $0.asJSON() })
		}
		if reasonNotGiven.count > 0 {
			json["reasonNotGiven"] = Array(reasonNotGiven.map() { $0.asJSON() })
		}
		
		return json
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
    
    public dynamic var date: DateTime?        
        
    public dynamic var detail: Reference?        
    public func upsert(detail: Reference?) {
        upsert(prop: &self.detail, val: detail)
    }    
    public let reported = RealmOptional<Bool>()

	
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
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? FHIRJSON {
					upsert(detail: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reported"] {
				presentKeys.insert("reported")
				if let val = exist as? Bool {
					self.reported.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "reported", wants: Bool.self, has: type(of: exist)))
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
		if let detail = self.detail {
			json["detail"] = detail.asJSON()
		}
		if let reported = self.reported.value {
			json["reported"] = reported.asJSON()
		}
		
		return json
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
    
    public dynamic var authority: Reference?        
    public func upsert(authority: Reference?) {
        upsert(prop: &self.authority, val: authority)
    }    
    public dynamic var description_fhir: String?        
        
    public let doseSequence = RealmOptional<Int>()    
    public dynamic var doseStatus: CodeableConcept?        
    public func upsert(doseStatus: CodeableConcept?) {
        upsert(prop: &self.doseStatus, val: doseStatus)
    }    
    public dynamic var doseStatusReason: CodeableConcept?        
    public func upsert(doseStatusReason: CodeableConcept?) {
        upsert(prop: &self.doseStatusReason, val: doseStatusReason)
    }    
    public dynamic var series: String?        
        
    public let seriesDoses = RealmOptional<Int>()    
    public let targetDisease = RealmSwift.List<CodeableConcept>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(doseSequence: Int, doseStatus: CodeableConcept, targetDisease: [CodeableConcept]) {
        self.init(json: nil)
        self.doseSequence.value = doseSequence
        self.doseStatus = doseStatus
        self.targetDisease.append(objectsIn: targetDisease)
    }

	
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
			else {
				errors.append(FHIRJSONError(key: "doseSequence"))
			}
			if let exist = js["doseStatus"] {
				presentKeys.insert("doseStatus")
				if let val = exist as? FHIRJSON {
					upsert(doseStatus: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "doseStatus", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "doseStatus"))
			}
			if let exist = js["doseStatusReason"] {
				presentKeys.insert("doseStatusReason")
				if let val = exist as? FHIRJSON {
					upsert(doseStatusReason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "doseStatusReason", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["seriesDoses"] {
				presentKeys.insert("seriesDoses")
				if let val = exist as? Int {
					self.seriesDoses.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "seriesDoses", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["targetDisease"] {
				presentKeys.insert("targetDisease")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.targetDisease) }
						self.targetDisease.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "targetDisease", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "targetDisease"))
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
		if let doseStatus = self.doseStatus {
			json["doseStatus"] = doseStatus.asJSON()
		}
		if let doseStatusReason = self.doseStatusReason {
			json["doseStatusReason"] = doseStatusReason.asJSON()
		}
		if let series = self.series {
			json["series"] = series.asJSON()
		}
		if let seriesDoses = self.seriesDoses.value {
			json["seriesDoses"] = seriesDoses.asJSON()
		}
		if targetDisease.count > 0 {
			json["targetDisease"] = Array(targetDisease.map() { $0.asJSON() })
		}
		
		return json
	}
}

