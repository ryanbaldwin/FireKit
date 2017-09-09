//
//  Practitioner.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Practitioner) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A person with a  formal responsibility in the provisioning of healthcare or related services.
 *
 *  A person who is directly or indirectly involved in the provisioning of healthcare.
 */
open class Practitioner: DomainResource {
	override open class var resourceType: String {
		get { return "Practitioner" }
	}

    public let active = RealmOptional<Bool>()
    public let address = RealmSwift.List<Address>()
    @objc public dynamic var birthDate: FHIRDate?
    public let communication = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: HumanName?
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }
    public let photo = RealmSwift.List<Attachment>()
    public let practitionerRole = RealmSwift.List<PractitionerPractitionerRole>()
    public let qualification = RealmSwift.List<PractitionerQualification>()
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case active = "active"
        case address = "address"
        case birthDate = "birthDate"
        case communication = "communication"
        case gender = "gender"
        case identifier = "identifier"
        case name = "name"
        case photo = "photo"
        case practitionerRole = "practitionerRole"
        case qualification = "qualification"
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
        if let activeVal = try container.decodeIfPresent(Bool.self, forKey: .active) {
          self.active.value = activeVal
        }
        if let addressVals = try container.decodeIfPresent([Address].self, forKey: .address) {
          // Address: FHIRJSON
        }
        // FHIRDate: String
        if let birthDateVal = try container.decodeIfPresent(FHIRDate.self, forKey: .birthDate) {
          self.birthDate = birthDateVal
        }
        if let communicationVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .communication) {
          // CodeableConcept: FHIRJSON
        }
        // String: String
        if let genderVal = try container.decodeIfPresent(String.self, forKey: .gender) {
          self.gender = genderVal
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        // HumanName: FHIRJSON
        if let nameVal = try container.decodeIfPresent(HumanName.self, forKey: .name) {
          self.name = nameVal
        }
        if let photoVals = try container.decodeIfPresent([Attachment].self, forKey: .photo) {
          // Attachment: FHIRJSON
        }
        if let practitionerRoleVals = try container.decodeIfPresent([PractitionerPractitionerRole].self, forKey: .practitionerRole) {
          // PractitionerPractitionerRole: FHIRJSON
        }
        if let qualificationVals = try container.decodeIfPresent([PractitionerQualification].self, forKey: .qualification) {
          // PractitionerQualification: FHIRJSON
        }
        if let telecomVals = try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) {
          // ContactPoint: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.active.value, forKey: .active)
        try container.encode(self.address.flatMap { $0 }, forKey: .address)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encode(self.communication.flatMap { $0 }, forKey: .communication)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.photo.flatMap { $0 }, forKey: .photo)
        try container.encode(self.practitionerRole.flatMap { $0 }, forKey: .practitionerRole)
        try container.encode(self.qualification.flatMap { $0 }, forKey: .qualification)
        try container.encode(self.telecom.flatMap { $0 }, forKey: .telecom)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["active"] {
				presentKeys.insert("active")
				if let val = exist as? Bool {
					self.active.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "active", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? [FHIRJSON] {
					if let vals = Address.instantiate(fromArray: val, owner: self) as? [Address] {
						if let realm = self.realm { realm.delete(self.address) }
						self.address.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["birthDate"] {
				presentKeys.insert("birthDate")
				if let val = exist as? String {
					self.birthDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "birthDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["communication"] {
				presentKeys.insert("communication")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.communication) }
						self.communication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "communication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["gender"] {
				presentKeys.insert("gender")
				if let val = exist as? String {
					self.gender = val
				}
				else {
					errors.append(FHIRJSONError(key: "gender", wants: String.self, has: type(of: exist)))
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
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? FHIRJSON {
					upsert(name: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["photo"] {
				presentKeys.insert("photo")
				if let val = exist as? [FHIRJSON] {
					if let vals = Attachment.instantiate(fromArray: val, owner: self) as? [Attachment] {
						if let realm = self.realm { realm.delete(self.photo) }
						self.photo.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "photo", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["practitionerRole"] {
				presentKeys.insert("practitionerRole")
				if let val = exist as? [FHIRJSON] {
					if let vals = PractitionerPractitionerRole.instantiate(fromArray: val, owner: self) as? [PractitionerPractitionerRole] {
						if let realm = self.realm { realm.delete(self.practitionerRole) }
						self.practitionerRole.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "practitionerRole", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["qualification"] {
				presentKeys.insert("qualification")
				if let val = exist as? [FHIRJSON] {
					if let vals = PractitionerQualification.instantiate(fromArray: val, owner: self) as? [PractitionerQualification] {
						if let realm = self.realm { realm.delete(self.qualification) }
						self.qualification.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "qualification", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if let active = self.active.value {
			json["active"] = active.asJSON()
		}
		if address.count > 0 {
			json["address"] = Array(address.map() { $0.asJSON() })
		}
		if let birthDate = self.birthDate {
			json["birthDate"] = birthDate.asJSON()
		}
		if communication.count > 0 {
			json["communication"] = Array(communication.map() { $0.asJSON() })
		}
		if let gender = self.gender {
			json["gender"] = gender.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if photo.count > 0 {
			json["photo"] = Array(photo.map() { $0.asJSON() })
		}
		if practitionerRole.count > 0 {
			json["practitionerRole"] = Array(practitionerRole.map() { $0.asJSON() })
		}
		if qualification.count > 0 {
			json["qualification"] = Array(qualification.map() { $0.asJSON() })
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}


/**
 *  Roles/organizations the practitioner is associated with.
 *
 *  The list of roles/organizations that the practitioner is associated with.
 */
open class PractitionerPractitionerRole: BackboneElement {
	override open class var resourceType: String {
		get { return "PractitionerPractitionerRole" }
	}

    public let healthcareService = RealmSwift.List<Reference>()
    public let location = RealmSwift.List<Reference>()
    @objc public dynamic var managingOrganization: Reference?
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var role: CodeableConcept?
    public func upsert(role: CodeableConcept?) {
        upsert(prop: &self.role, val: role)
    }
    public let specialty = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case healthcareService = "healthcareService"
        case location = "location"
        case managingOrganization = "managingOrganization"
        case period = "period"
        case role = "role"
        case specialty = "specialty"
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


        if let healthcareServiceVals = try container.decodeIfPresent([Reference].self, forKey: .healthcareService) {
          // Reference: FHIRJSON
        }
        if let locationVals = try container.decodeIfPresent([Reference].self, forKey: .location) {
          // Reference: FHIRJSON
        }
        // Reference: FHIRJSON
        if let managingOrganizationVal = try container.decodeIfPresent(Reference.self, forKey: .managingOrganization) {
          self.managingOrganization = managingOrganizationVal
        }
        // Period: FHIRJSON
        if let periodVal = try container.decodeIfPresent(Period.self, forKey: .period) {
          self.period = periodVal
        }
        // CodeableConcept: FHIRJSON
        if let roleVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .role) {
          self.role = roleVal
        }
        if let specialtyVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .specialty) {
          // CodeableConcept: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.healthcareService.flatMap { $0 }, forKey: .healthcareService)
        try container.encode(self.location.flatMap { $0 }, forKey: .location)
        try container.encodeIfPresent(self.managingOrganization, forKey: .managingOrganization)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encode(self.specialty.flatMap { $0 }, forKey: .specialty)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["healthcareService"] {
				presentKeys.insert("healthcareService")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.healthcareService) }
						self.healthcareService.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "healthcareService", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.location) }
						self.location.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
				if let val = exist as? FHIRJSON {
					upsert(role: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if healthcareService.count > 0 {
			json["healthcareService"] = Array(healthcareService.map() { $0.asJSON() })
		}
		if location.count > 0 {
			json["location"] = Array(location.map() { $0.asJSON() })
		}
		if let managingOrganization = self.managingOrganization {
			json["managingOrganization"] = managingOrganization.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		if specialty.count > 0 {
			json["specialty"] = Array(specialty.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}


/**
 *  Qualifications obtained by training and certification.
 */
open class PractitionerQualification: BackboneElement {
	override open class var resourceType: String {
		get { return "PractitionerQualification" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var issuer: Reference?
    public func upsert(issuer: Reference?) {
        upsert(prop: &self.issuer, val: issuer)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case identifier = "identifier"
        case issuer = "issuer"
        case period = "period"
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


        // CodeableConcept: FHIRJSON
        if let codeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .code) {
          self.code = codeVal
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        // Reference: FHIRJSON
        if let issuerVal = try container.decodeIfPresent(Reference.self, forKey: .issuer) {
          self.issuer = issuerVal
        }
        // Period: FHIRJSON
        if let periodVal = try container.decodeIfPresent(Period.self, forKey: .period) {
          self.period = periodVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.issuer, forKey: .issuer)
        try container.encodeIfPresent(self.period, forKey: .period)
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
			if let exist = js["issuer"] {
				presentKeys.insert("issuer")
				if let val = exist as? FHIRJSON {
					upsert(issuer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "issuer", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let issuer = self.issuer {
			json["issuer"] = issuer.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		
		return json
	}
*/
}

