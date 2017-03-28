//
//  Patient.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Patient) on 2017-03-28.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Information about an individual or animal receiving health care services.
 *
 *  Demographics and other administrative information about an individual or animal receiving care or other health-
 *  related services.
 */
open class Patient: DomainResource {
	override open class var resourceType: String {
		get { return "Patient" }
	}
    
    public let active = RealmOptional<Bool>()    
    public let address = RealmSwift.List<Address>()    
    public dynamic var animal: PatientAnimal?        
    public func upsert(animal: PatientAnimal?) {
        upsert(prop: &self.animal, val: animal)
    }    
    public dynamic var birthDate: FHIRDate?        
        
    public let careProvider = RealmSwift.List<Reference>()    
    public let communication = RealmSwift.List<PatientCommunication>()    
    public let contact = RealmSwift.List<PatientContact>()    
    public let deceasedBoolean = RealmOptional<Bool>()    
    public dynamic var deceasedDateTime: DateTime?        
        
    public dynamic var gender: String?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public let link = RealmSwift.List<PatientLink>()    
    public dynamic var managingOrganization: Reference?        
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }    
    public dynamic var maritalStatus: CodeableConcept?        
    public func upsert(maritalStatus: CodeableConcept?) {
        upsert(prop: &self.maritalStatus, val: maritalStatus)
    }    
    public let multipleBirthBoolean = RealmOptional<Bool>()    
    public let multipleBirthInteger = RealmOptional<Int>()    
    public let name = RealmSwift.List<HumanName>()    
    public let photo = RealmSwift.List<Attachment>()    
    public let telecom = RealmSwift.List<ContactPoint>()

	
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
			if let exist = js["animal"] {
				presentKeys.insert("animal")
				if let val = exist as? FHIRJSON {
					upsert(animal: PatientAnimal(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "animal", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["careProvider"] {
				presentKeys.insert("careProvider")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.careProvider) }
						self.careProvider.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "careProvider", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["communication"] {
				presentKeys.insert("communication")
				if let val = exist as? [FHIRJSON] {
					if let vals = PatientCommunication.instantiate(fromArray: val, owner: self) as? [PatientCommunication] {
						if let realm = self.realm { realm.delete(self.communication) }
						self.communication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "communication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = PatientContact.instantiate(fromArray: val, owner: self) as? [PatientContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedBoolean"] {
				presentKeys.insert("deceasedBoolean")
				if let val = exist as? Bool {
					self.deceasedBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["deceasedDateTime"] {
				presentKeys.insert("deceasedDateTime")
				if let val = exist as? String {
					self.deceasedDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "deceasedDateTime", wants: String.self, has: type(of: exist)))
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
			if let exist = js["link"] {
				presentKeys.insert("link")
				if let val = exist as? [FHIRJSON] {
					if let vals = PatientLink.instantiate(fromArray: val, owner: self) as? [PatientLink] {
						if let realm = self.realm { realm.delete(self.link) }
						self.link.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "link", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["maritalStatus"] {
				presentKeys.insert("maritalStatus")
				if let val = exist as? FHIRJSON {
					upsert(maritalStatus: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maritalStatus", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["multipleBirthBoolean"] {
				presentKeys.insert("multipleBirthBoolean")
				if let val = exist as? Bool {
					self.multipleBirthBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "multipleBirthBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["multipleBirthInteger"] {
				presentKeys.insert("multipleBirthInteger")
				if let val = exist as? Int {
					self.multipleBirthInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "multipleBirthInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? [FHIRJSON] {
					if let vals = HumanName.instantiate(fromArray: val, owner: self) as? [HumanName] {
						if let realm = self.realm { realm.delete(self.name) }
						self.name.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if let animal = self.animal {
			json["animal"] = animal.asJSON()
		}
		if let birthDate = self.birthDate {
			json["birthDate"] = birthDate.asJSON()
		}
		if careProvider.count > 0 {
			json["careProvider"] = Array(careProvider.map() { $0.asJSON() })
		}
		if communication.count > 0 {
			json["communication"] = Array(communication.map() { $0.asJSON() })
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let deceasedBoolean = self.deceasedBoolean.value {
			json["deceasedBoolean"] = deceasedBoolean.asJSON()
		}
		if let deceasedDateTime = self.deceasedDateTime {
			json["deceasedDateTime"] = deceasedDateTime.asJSON()
		}
		if let gender = self.gender {
			json["gender"] = gender.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if link.count > 0 {
			json["link"] = Array(link.map() { $0.asJSON() })
		}
		if let managingOrganization = self.managingOrganization {
			json["managingOrganization"] = managingOrganization.asJSON()
		}
		if let maritalStatus = self.maritalStatus {
			json["maritalStatus"] = maritalStatus.asJSON()
		}
		if let multipleBirthBoolean = self.multipleBirthBoolean.value {
			json["multipleBirthBoolean"] = multipleBirthBoolean.asJSON()
		}
		if let multipleBirthInteger = self.multipleBirthInteger.value {
			json["multipleBirthInteger"] = multipleBirthInteger.asJSON()
		}
		if name.count > 0 {
			json["name"] = Array(name.map() { $0.asJSON() })
		}
		if photo.count > 0 {
			json["photo"] = Array(photo.map() { $0.asJSON() })
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  This patient is known to be an animal (non-human).
 *
 *  This patient is known to be an animal.
 */
open class PatientAnimal: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientAnimal" }
	}
    
    public dynamic var breed: CodeableConcept?        
    public func upsert(breed: CodeableConcept?) {
        upsert(prop: &self.breed, val: breed)
    }    
    public dynamic var genderStatus: CodeableConcept?        
    public func upsert(genderStatus: CodeableConcept?) {
        upsert(prop: &self.genderStatus, val: genderStatus)
    }    
    public dynamic var species: CodeableConcept?        
    public func upsert(species: CodeableConcept?) {
        upsert(prop: &self.species, val: species)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(species: CodeableConcept) {
        self.init(json: nil)
        self.species = species
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["breed"] {
				presentKeys.insert("breed")
				if let val = exist as? FHIRJSON {
					upsert(breed: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "breed", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["genderStatus"] {
				presentKeys.insert("genderStatus")
				if let val = exist as? FHIRJSON {
					upsert(genderStatus: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "genderStatus", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["species"] {
				presentKeys.insert("species")
				if let val = exist as? FHIRJSON {
					upsert(species: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "species", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "species"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let breed = self.breed {
			json["breed"] = breed.asJSON()
		}
		if let genderStatus = self.genderStatus {
			json["genderStatus"] = genderStatus.asJSON()
		}
		if let species = self.species {
			json["species"] = species.asJSON()
		}
		
		return json
	}
}


/**
 *  A list of Languages which may be used to communicate with the patient about his or her health.
 *
 *  Languages which may be used to communicate with the patient about his or her health.
 */
open class PatientCommunication: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientCommunication" }
	}
    
    public dynamic var language: CodeableConcept?        
    public func upsert(language: CodeableConcept?) {
        upsert(prop: &self.language, val: language)
    }    
    public let preferred = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(language: CodeableConcept) {
        self.init(json: nil)
        self.language = language
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["language"] {
				presentKeys.insert("language")
				if let val = exist as? FHIRJSON {
					upsert(language: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "language", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "language"))
			}
			if let exist = js["preferred"] {
				presentKeys.insert("preferred")
				if let val = exist as? Bool {
					self.preferred.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "preferred", wants: Bool.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let language = self.language {
			json["language"] = language.asJSON()
		}
		if let preferred = self.preferred.value {
			json["preferred"] = preferred.asJSON()
		}
		
		return json
	}
}


/**
 *  A contact party (e.g. guardian, partner, friend) for the patient.
 */
open class PatientContact: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientContact" }
	}
    
    public dynamic var address: Address?        
    public func upsert(address: Address?) {
        upsert(prop: &self.address, val: address)
    }    
    public dynamic var gender: String?        
        
    public dynamic var name: HumanName?        
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }    
    public dynamic var organization: Reference?        
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }    
    public dynamic var period: Period?        
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }    
    public let relationship = RealmSwift.List<CodeableConcept>()    
    public let telecom = RealmSwift.List<ContactPoint>()

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? FHIRJSON {
					upsert(address: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? FHIRJSON {
					upsert(name: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["organization"] {
				presentKeys.insert("organization")
				if let val = exist as? FHIRJSON {
					upsert(organization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "organization", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["relationship"] {
				presentKeys.insert("relationship")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.relationship) }
						self.relationship.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "relationship", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let gender = self.gender {
			json["gender"] = gender.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if relationship.count > 0 {
			json["relationship"] = Array(relationship.map() { $0.asJSON() })
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Link to another patient resource that concerns the same actual person.
 *
 *  Link to another patient resource that concerns the same actual patient.
 */
open class PatientLink: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientLink" }
	}
    
    public dynamic var other: Reference?        
    public func upsert(other: Reference?) {
        upsert(prop: &self.other, val: other)
    }    
    public dynamic var type: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(other: Reference, type: String) {
        self.init(json: nil)
        self.other = other
        self.type = type
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["other"] {
				presentKeys.insert("other")
				if let val = exist as? FHIRJSON {
					upsert(other: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "other", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "other"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
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
		
		if let other = self.other {
			json["other"] = other.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

