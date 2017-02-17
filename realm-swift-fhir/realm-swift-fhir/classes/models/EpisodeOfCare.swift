//
//  EpisodeOfCare.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/EpisodeOfCare) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
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

	public dynamic var careManager: Reference?						
		
		
			public func upsert(careManager: Reference?) {
				upsert(prop: &self.careManager, val: careManager)
			}
	
	public let careTeam = RealmSwift.List<EpisodeOfCareCareTeam>()
	
	public let condition = RealmSwift.List<Reference>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var managingOrganization: Reference?						
		
		
			public func upsert(managingOrganization: Reference?) {
				upsert(prop: &self.managingOrganization, val: managingOrganization)
			}
	
	public dynamic var patient: Reference?						
		
		
			public func upsert(patient: Reference?) {
				upsert(prop: &self.patient, val: patient)
			}
	
	public dynamic var period: Period?						
		
		
			public func upsert(period: Period?) {
				upsert(prop: &self.period, val: period)
			}
	
	public let referralRequest = RealmSwift.List<Reference>()
	
	public dynamic var status: String?						
		
		
	
	public let statusHistory = RealmSwift.List<EpisodeOfCareStatusHistory>()
	
	public let type = RealmSwift.List<CodeableConcept>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(patient: Reference, status: String) {
		self.init(json: nil)
		self.patient = patient
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["careManager"] {
				presentKeys.insert("careManager")
				if let val = exist as? FHIRJSON {
					upsert(careManager: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "careManager", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["careTeam"] {
				presentKeys.insert("careTeam")
				if let val = exist as? [FHIRJSON] {
					if let vals = EpisodeOfCareCareTeam.instantiate(fromArray: val, owner: self) as? [EpisodeOfCareCareTeam] {
						if let realm = self.realm { realm.delete(self.careTeam) }
						self.careTeam.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "careTeam", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["condition"] {
				presentKeys.insert("condition")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.condition) }
						self.condition.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "condition", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["managingOrganization"] {
				presentKeys.insert("managingOrganization")
				if let val = exist as? FHIRJSON {
					upsert(managingOrganization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "managingOrganization", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["referralRequest"] {
				presentKeys.insert("referralRequest")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.referralRequest) }
						self.referralRequest.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "referralRequest", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
					if let vals = EpisodeOfCareStatusHistory.instantiate(fromArray: val, owner: self) as? [EpisodeOfCareStatusHistory] {
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
		
		if let careManager = self.careManager {
			json["careManager"] = careManager.asJSON()
		}
		if careTeam.count > 0 {
			json["careTeam"] = Array(careTeam.map() { $0.asJSON() })
		}
		if condition.count > 0 {
			json["condition"] = Array(condition.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let managingOrganization = self.managingOrganization {
			json["managingOrganization"] = managingOrganization.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if referralRequest.count > 0 {
			json["referralRequest"] = Array(referralRequest.map() { $0.asJSON() })
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
 *  Other practitioners facilitating this episode of care.
 *
 *  The list of practitioners that may be facilitating this episode of care for specific purposes.
 */
open class EpisodeOfCareCareTeam: BackboneElement {
	override open class var resourceType: String {
		get { return "EpisodeOfCareCareTeam" }
	}

	public dynamic var member: Reference?						
		
		
			public func upsert(member: Reference?) {
				upsert(prop: &self.member, val: member)
			}
	
	public dynamic var period: Period?						
		
		
			public func upsert(period: Period?) {
				upsert(prop: &self.period, val: period)
			}
	
	public let role = RealmSwift.List<CodeableConcept>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["member"] {
				presentKeys.insert("member")
				if let val = exist as? FHIRJSON {
					upsert(member: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "member", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.role) }
						self.role.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let member = self.member {
			json["member"] = member.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if role.count > 0 {
			json["role"] = Array(role.map() { $0.asJSON() })
		}
		
		return json
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

	public dynamic var period: Period?						
		
		
			public func upsert(period: Period?) {
				upsert(prop: &self.period, val: period)
			}
	
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
}

