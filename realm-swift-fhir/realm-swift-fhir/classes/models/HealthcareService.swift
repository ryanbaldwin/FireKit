//
//  HealthcareService.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/HealthcareService) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  The details of a healthcare service available at a location.
 */
open class HealthcareService: DomainResource {
	override open class var resourceType: String {
		get { return "HealthcareService" }
	}

	public let appointmentRequired = RealmOptional<Bool>()
	
	public dynamic var availabilityExceptions: String?
	
	public let availableTime = RealmSwift.List<HealthcareServiceAvailableTime>()
	
	public let characteristic = RealmSwift.List<CodeableConcept>()
	
	public dynamic var comment: String?
	
	public let coverageArea = RealmSwift.List<Reference>()
	
	public dynamic var eligibility: CodeableConcept?
	
	public dynamic var eligibilityNote: String?
	
	public dynamic var extraDetails: String?
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var location: Reference?
	
	public let notAvailable = RealmSwift.List<HealthcareServiceNotAvailable>()
	
	public dynamic var photo: Attachment?
	
	public let programName = RealmSwift.List<RealmString>()
	
	public dynamic var providedBy: Reference?
	
	public dynamic var publicKey: String?
	
	public let referralMethod = RealmSwift.List<CodeableConcept>()
	
	public dynamic var serviceCategory: CodeableConcept?
	
	public dynamic var serviceName: String?
	
	public let serviceProvisionCode = RealmSwift.List<CodeableConcept>()
	
	public let serviceType = RealmSwift.List<HealthcareServiceServiceType>()
	
	public let telecom = RealmSwift.List<ContactPoint>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(location: Reference) {
		self.init(json: nil)
		self.location = location
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["appointmentRequired"] {
				presentKeys.insert("appointmentRequired")
				if let val = exist as? Bool {
					self.appointmentRequired.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "appointmentRequired", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["availabilityExceptions"] {
				presentKeys.insert("availabilityExceptions")
				if let val = exist as? String {
					self.availabilityExceptions = val
				}
				else {
					errors.append(FHIRJSONError(key: "availabilityExceptions", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["availableTime"] {
				presentKeys.insert("availableTime")
				if let val = exist as? [FHIRJSON] {
					if let vals = HealthcareServiceAvailableTime.instantiate(fromArray: val, owner: self) as? [HealthcareServiceAvailableTime] {
						if let realm = self.realm { realm.delete(self.availableTime) }
						self.availableTime.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "availableTime", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["characteristic"] {
				presentKeys.insert("characteristic")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.characteristic) }
						self.characteristic.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "characteristic", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["comment"] {
				presentKeys.insert("comment")
				if let val = exist as? String {
					self.comment = val
				}
				else {
					errors.append(FHIRJSONError(key: "comment", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["coverageArea"] {
				presentKeys.insert("coverageArea")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.coverageArea) }
						self.coverageArea.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "coverageArea", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["eligibility"] {
				presentKeys.insert("eligibility")
				if let val = exist as? FHIRJSON {
					if let eligibility = self.eligibility {
                        errors.append(contentsOf: eligibility.populate(from: val) ?? [])
                    } else {
                        self.eligibility = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "eligibility", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["eligibilityNote"] {
				presentKeys.insert("eligibilityNote")
				if let val = exist as? String {
					self.eligibilityNote = val
				}
				else {
					errors.append(FHIRJSONError(key: "eligibilityNote", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["extraDetails"] {
				presentKeys.insert("extraDetails")
				if let val = exist as? String {
					self.extraDetails = val
				}
				else {
					errors.append(FHIRJSONError(key: "extraDetails", wants: String.self, has: type(of: exist)))
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
					if let location = self.location {
                        errors.append(contentsOf: location.populate(from: val) ?? [])
                    } else {
                        self.location = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "location"))
			}
			if let exist = js["notAvailable"] {
				presentKeys.insert("notAvailable")
				if let val = exist as? [FHIRJSON] {
					if let vals = HealthcareServiceNotAvailable.instantiate(fromArray: val, owner: self) as? [HealthcareServiceNotAvailable] {
						if let realm = self.realm { realm.delete(self.notAvailable) }
						self.notAvailable.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "notAvailable", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["photo"] {
				presentKeys.insert("photo")
				if let val = exist as? FHIRJSON {
					if let photo = self.photo {
                        errors.append(contentsOf: photo.populate(from: val) ?? [])
                    } else {
                        self.photo = Attachment(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "photo", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["programName"] {
				presentKeys.insert("programName")
				if let val = exist as? [String] {
					self.programName.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "programName", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["providedBy"] {
				presentKeys.insert("providedBy")
				if let val = exist as? FHIRJSON {
					if let providedBy = self.providedBy {
                        errors.append(contentsOf: providedBy.populate(from: val) ?? [])
                    } else {
                        self.providedBy = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "providedBy", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["publicKey"] {
				presentKeys.insert("publicKey")
				if let val = exist as? String {
					self.publicKey = val
				}
				else {
					errors.append(FHIRJSONError(key: "publicKey", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["referralMethod"] {
				presentKeys.insert("referralMethod")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.referralMethod) }
						self.referralMethod.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "referralMethod", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["serviceCategory"] {
				presentKeys.insert("serviceCategory")
				if let val = exist as? FHIRJSON {
					if let serviceCategory = self.serviceCategory {
                        errors.append(contentsOf: serviceCategory.populate(from: val) ?? [])
                    } else {
                        self.serviceCategory = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "serviceCategory", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["serviceName"] {
				presentKeys.insert("serviceName")
				if let val = exist as? String {
					self.serviceName = val
				}
				else {
					errors.append(FHIRJSONError(key: "serviceName", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["serviceProvisionCode"] {
				presentKeys.insert("serviceProvisionCode")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.serviceProvisionCode) }
						self.serviceProvisionCode.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "serviceProvisionCode", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["serviceType"] {
				presentKeys.insert("serviceType")
				if let val = exist as? [FHIRJSON] {
					if let vals = HealthcareServiceServiceType.instantiate(fromArray: val, owner: self) as? [HealthcareServiceServiceType] {
						if let realm = self.realm { realm.delete(self.serviceType) }
						self.serviceType.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "serviceType", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["telecom"] {
				presentKeys.insert("telecom")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.telecom) }
						self.telecom.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "telecom", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let appointmentRequired = self.appointmentRequired.value {
			json["appointmentRequired"] = appointmentRequired.asJSON()
		}
		if let availabilityExceptions = self.availabilityExceptions {
			json["availabilityExceptions"] = availabilityExceptions.asJSON()
		}
		if availableTime.count > 0 {
			json["availableTime"] = Array(availableTime.map() { $0.asJSON() })
		}
		if characteristic.count > 0 {
			json["characteristic"] = Array(characteristic.map() { $0.asJSON() })
		}
		if let comment = self.comment {
			json["comment"] = comment.asJSON()
		}
		if coverageArea.count > 0 {
			json["coverageArea"] = Array(coverageArea.map() { $0.asJSON() })
		}
		if let eligibility = self.eligibility {
			json["eligibility"] = eligibility.asJSON()
		}
		if let eligibilityNote = self.eligibilityNote {
			json["eligibilityNote"] = eligibilityNote.asJSON()
		}
		if let extraDetails = self.extraDetails {
			json["extraDetails"] = extraDetails.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if notAvailable.count > 0 {
			json["notAvailable"] = Array(notAvailable.map() { $0.asJSON() })
		}
		if let photo = self.photo {
			json["photo"] = photo.asJSON()
		}
		if programName.count > 0 {
			json["programName"] = Array(programName.map() { $0.value })
		}
		if let providedBy = self.providedBy {
			json["providedBy"] = providedBy.asJSON()
		}
		if let publicKey = self.publicKey {
			json["publicKey"] = publicKey.asJSON()
		}
		if referralMethod.count > 0 {
			json["referralMethod"] = Array(referralMethod.map() { $0.asJSON() })
		}
		if let serviceCategory = self.serviceCategory {
			json["serviceCategory"] = serviceCategory.asJSON()
		}
		if let serviceName = self.serviceName {
			json["serviceName"] = serviceName.asJSON()
		}
		if serviceProvisionCode.count > 0 {
			json["serviceProvisionCode"] = Array(serviceProvisionCode.map() { $0.asJSON() })
		}
		if serviceType.count > 0 {
			json["serviceType"] = Array(serviceType.map() { $0.asJSON() })
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Times the Service Site is available.
 *
 *  A collection of times that the Service Site is available.
 */
open class HealthcareServiceAvailableTime: BackboneElement {
	override open class var resourceType: String {
		get { return "HealthcareServiceAvailableTime" }
	}

	public let allDay = RealmOptional<Bool>()
	
	public dynamic var availableEndTime: FHIRTime?
	
	public dynamic var availableStartTime: FHIRTime?
	
	public let daysOfWeek = RealmSwift.List<RealmString>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["allDay"] {
				presentKeys.insert("allDay")
				if let val = exist as? Bool {
					self.allDay.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "allDay", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["availableEndTime"] {
				presentKeys.insert("availableEndTime")
				if let val = exist as? String {
					self.availableEndTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "availableEndTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["availableStartTime"] {
				presentKeys.insert("availableStartTime")
				if let val = exist as? String {
					self.availableStartTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "availableStartTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["daysOfWeek"] {
				presentKeys.insert("daysOfWeek")
				if let val = exist as? [String] {
					self.daysOfWeek.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "daysOfWeek", wants: Array<String>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let allDay = self.allDay.value {
			json["allDay"] = allDay.asJSON()
		}
		if let availableEndTime = self.availableEndTime {
			json["availableEndTime"] = availableEndTime.asJSON()
		}
		if let availableStartTime = self.availableStartTime {
			json["availableStartTime"] = availableStartTime.asJSON()
		}
		if daysOfWeek.count > 0 {
			json["daysOfWeek"] = Array(daysOfWeek.map() { $0.value })
		}
		
		return json
	}
}


/**
 *  Not available during this time due to provided reason.
 *
 *  The HealthcareService is not available during this period of time due to the provided reason.
 */
open class HealthcareServiceNotAvailable: BackboneElement {
	override open class var resourceType: String {
		get { return "HealthcareServiceNotAvailable" }
	}

	public dynamic var description_fhir: String?
	
	public dynamic var during: Period?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(description_fhir: String) {
		self.init(json: nil)
		self.description_fhir = description_fhir
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "description"))
			}
			if let exist = js["during"] {
				presentKeys.insert("during")
				if let val = exist as? FHIRJSON {
					if let during = self.during {
                        errors.append(contentsOf: during.populate(from: val) ?? [])
                    } else {
                        self.during = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "during", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let during = self.during {
			json["during"] = during.asJSON()
		}
		
		return json
	}
}


/**
 *  Specific service delivered or performed.
 *
 *  A specific type of service that may be delivered or performed.
 */
open class HealthcareServiceServiceType: BackboneElement {
	override open class var resourceType: String {
		get { return "HealthcareServiceServiceType" }
	}

	public let specialty = RealmSwift.List<CodeableConcept>()
	
	public dynamic var type: CodeableConcept?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(type: CodeableConcept) {
		self.init(json: nil)
		self.type = type
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["specialty"] {
				presentKeys.insert("specialty")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.specialty) }
						self.specialty.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "specialty", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					if let type = self.type {
                        errors.append(contentsOf: type.populate(from: val) ?? [])
                    } else {
                        self.type = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if specialty.count > 0 {
			json["specialty"] = Array(specialty.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

