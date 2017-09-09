//
//  HealthcareService.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/HealthcareService) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  The details of a healthcare service available at a location.
 */
open class HealthcareService: DomainResource {
	override open class var resourceType: String {
		get { return "HealthcareService" }
	}

    public let appointmentRequired = RealmOptional<Bool>()
    @objc public dynamic var availabilityExceptions: String?
    public let availableTime = RealmSwift.List<HealthcareServiceAvailableTime>()
    public let characteristic = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var comment: String?
    public let coverageArea = RealmSwift.List<Reference>()
    @objc public dynamic var eligibility: CodeableConcept?
    public func upsert(eligibility: CodeableConcept?) {
        upsert(prop: &self.eligibility, val: eligibility)
    }
    @objc public dynamic var eligibilityNote: String?
    @objc public dynamic var extraDetails: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    public let notAvailable = RealmSwift.List<HealthcareServiceNotAvailable>()
    @objc public dynamic var photo: Attachment?
    public func upsert(photo: Attachment?) {
        upsert(prop: &self.photo, val: photo)
    }
    public let programName = RealmSwift.List<RealmString>()
    @objc public dynamic var providedBy: Reference?
    public func upsert(providedBy: Reference?) {
        upsert(prop: &self.providedBy, val: providedBy)
    }
    @objc public dynamic var publicKey: String?
    public let referralMethod = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var serviceCategory: CodeableConcept?
    public func upsert(serviceCategory: CodeableConcept?) {
        upsert(prop: &self.serviceCategory, val: serviceCategory)
    }
    @objc public dynamic var serviceName: String?
    public let serviceProvisionCode = RealmSwift.List<CodeableConcept>()
    public let serviceType = RealmSwift.List<HealthcareServiceServiceType>()
    public let telecom = RealmSwift.List<ContactPoint>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(location: Reference) {
        self.init()
        self.location = location
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case appointmentRequired = "appointmentRequired"
        case availabilityExceptions = "availabilityExceptions"
        case availableTime = "availableTime"
        case characteristic = "characteristic"
        case comment = "comment"
        case coverageArea = "coverageArea"
        case eligibility = "eligibility"
        case eligibilityNote = "eligibilityNote"
        case extraDetails = "extraDetails"
        case identifier = "identifier"
        case location = "location"
        case notAvailable = "notAvailable"
        case photo = "photo"
        case programName = "programName"
        case providedBy = "providedBy"
        case publicKey = "publicKey"
        case referralMethod = "referralMethod"
        case serviceCategory = "serviceCategory"
        case serviceName = "serviceName"
        case serviceProvisionCode = "serviceProvisionCode"
        case serviceType = "serviceType"
        case telecom = "telecom"
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


        // Bool: Bool
        if let appointmentRequiredVal = try container.decodeIfPresent(Bool.self, forKey: .appointmentRequired) {
          self.appointmentRequired.value = appointmentRequiredVal
        }
        // String: String
        if let availabilityExceptionsVal = try container.decodeIfPresent(String.self, forKey: .availabilityExceptions) {
          self.availabilityExceptions = availabilityExceptionsVal
        }
        if let availableTimeVals = try container.decodeIfPresent([HealthcareServiceAvailableTime].self, forKey: .availableTime) {
          // HealthcareServiceAvailableTime: FHIRJSON
        }
        if let characteristicVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .characteristic) {
          // CodeableConcept: FHIRJSON
        }
        // String: String
        if let commentVal = try container.decodeIfPresent(String.self, forKey: .comment) {
          self.comment = commentVal
        }
        if let coverageAreaVals = try container.decodeIfPresent([Reference].self, forKey: .coverageArea) {
          // Reference: FHIRJSON
        }
        // CodeableConcept: FHIRJSON
        if let eligibilityVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .eligibility) {
          self.eligibility = eligibilityVal
        }
        // String: String
        if let eligibilityNoteVal = try container.decodeIfPresent(String.self, forKey: .eligibilityNote) {
          self.eligibilityNote = eligibilityNoteVal
        }
        // String: String
        if let extraDetailsVal = try container.decodeIfPresent(String.self, forKey: .extraDetails) {
          self.extraDetails = extraDetailsVal
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        // Reference: FHIRJSON
        if let locationVal = try container.decodeIfPresent(Reference.self, forKey: .location) {
          self.location = locationVal
        }
        if let notAvailableVals = try container.decodeIfPresent([HealthcareServiceNotAvailable].self, forKey: .notAvailable) {
          // HealthcareServiceNotAvailable: FHIRJSON
        }
        // Attachment: FHIRJSON
        if let photoVal = try container.decodeIfPresent(Attachment.self, forKey: .photo) {
          self.photo = photoVal
        }
        if let programNameVals = try container.decodeIfPresent([String].self, forKey: .programName) {
          // String: String
        }
        // Reference: FHIRJSON
        if let providedByVal = try container.decodeIfPresent(Reference.self, forKey: .providedBy) {
          self.providedBy = providedByVal
        }
        // String: String
        if let publicKeyVal = try container.decodeIfPresent(String.self, forKey: .publicKey) {
          self.publicKey = publicKeyVal
        }
        if let referralMethodVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .referralMethod) {
          // CodeableConcept: FHIRJSON
        }
        // CodeableConcept: FHIRJSON
        if let serviceCategoryVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .serviceCategory) {
          self.serviceCategory = serviceCategoryVal
        }
        // String: String
        if let serviceNameVal = try container.decodeIfPresent(String.self, forKey: .serviceName) {
          self.serviceName = serviceNameVal
        }
        if let serviceProvisionCodeVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .serviceProvisionCode) {
          // CodeableConcept: FHIRJSON
        }
        if let serviceTypeVals = try container.decodeIfPresent([HealthcareServiceServiceType].self, forKey: .serviceType) {
          // HealthcareServiceServiceType: FHIRJSON
        }
        if let telecomVals = try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) {
          // ContactPoint: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.appointmentRequired.value, forKey: .appointmentRequired)
        try container.encodeIfPresent(self.availabilityExceptions, forKey: .availabilityExceptions)
        try container.encode(self.availableTime.flatMap { $0 }, forKey: .availableTime)
        try container.encode(self.characteristic.flatMap { $0 }, forKey: .characteristic)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encode(self.coverageArea.flatMap { $0 }, forKey: .coverageArea)
        try container.encodeIfPresent(self.eligibility, forKey: .eligibility)
        try container.encodeIfPresent(self.eligibilityNote, forKey: .eligibilityNote)
        try container.encodeIfPresent(self.extraDetails, forKey: .extraDetails)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encode(self.notAvailable.flatMap { $0 }, forKey: .notAvailable)
        try container.encodeIfPresent(self.photo, forKey: .photo)
        try container.encode(self.programName.flatMap { $0.value }, forKey: .programName)
        try container.encodeIfPresent(self.providedBy, forKey: .providedBy)
        try container.encodeIfPresent(self.publicKey, forKey: .publicKey)
        try container.encode(self.referralMethod.flatMap { $0 }, forKey: .referralMethod)
        try container.encodeIfPresent(self.serviceCategory, forKey: .serviceCategory)
        try container.encodeIfPresent(self.serviceName, forKey: .serviceName)
        try container.encode(self.serviceProvisionCode.flatMap { $0 }, forKey: .serviceProvisionCode)
        try container.encode(self.serviceType.flatMap { $0 }, forKey: .serviceType)
        try container.encode(self.telecom.flatMap { $0 }, forKey: .telecom)
    }
/*
	
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
					upsert(eligibility: CodeableConcept(json: val, owner: self))
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
					upsert(location: Reference(json: val, owner: self))
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
					upsert(photo: Attachment(json: val, owner: self))
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
					upsert(providedBy: Reference(json: val, owner: self))
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
					upsert(serviceCategory: CodeableConcept(json: val, owner: self))
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
*/
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
    @objc public dynamic var availableEndTime: FHIRTime?
    @objc public dynamic var availableStartTime: FHIRTime?
    public let daysOfWeek = RealmSwift.List<RealmString>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case allDay = "allDay"
        case availableEndTime = "availableEndTime"
        case availableStartTime = "availableStartTime"
        case daysOfWeek = "daysOfWeek"
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


        // Bool: Bool
        if let allDayVal = try container.decodeIfPresent(Bool.self, forKey: .allDay) {
          self.allDay.value = allDayVal
        }
        // FHIRTime: String
        if let availableEndTimeVal = try container.decodeIfPresent(FHIRTime.self, forKey: .availableEndTime) {
          self.availableEndTime = availableEndTimeVal
        }
        // FHIRTime: String
        if let availableStartTimeVal = try container.decodeIfPresent(FHIRTime.self, forKey: .availableStartTime) {
          self.availableStartTime = availableStartTimeVal
        }
        if let daysOfWeekVals = try container.decodeIfPresent([String].self, forKey: .daysOfWeek) {
          // String: String
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.allDay.value, forKey: .allDay)
        try container.encodeIfPresent(self.availableEndTime, forKey: .availableEndTime)
        try container.encodeIfPresent(self.availableStartTime, forKey: .availableStartTime)
        try container.encode(self.daysOfWeek.flatMap { $0.value }, forKey: .daysOfWeek)
    }
/*
	
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
*/
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

    @objc public dynamic var description_fhir: String?
    @objc public dynamic var during: Period?
    public func upsert(during: Period?) {
        upsert(prop: &self.during, val: during)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(description_fhir: String) {
        self.init()
        self.description_fhir = description_fhir
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case during = "during"
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


        // String: String
        if let description_fhirVal = try container.decodeIfPresent(String.self, forKey: .description_fhir) {
          self.description_fhir = description_fhirVal
        }
        // Period: FHIRJSON
        if let duringVal = try container.decodeIfPresent(Period.self, forKey: .during) {
          self.during = duringVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.during, forKey: .during)
    }
/*
	
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
					upsert(during: Period(json: val, owner: self))
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
*/
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
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: CodeableConcept) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case specialty = "specialty"
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


        if let specialtyVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .specialty) {
          // CodeableConcept: FHIRJSON
        }
        // CodeableConcept: FHIRJSON
        if let typeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .type) {
          self.type = typeVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.specialty.flatMap { $0 }, forKey: .specialty)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
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
					upsert(type: CodeableConcept(json: val, owner: self))
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
*/
}

