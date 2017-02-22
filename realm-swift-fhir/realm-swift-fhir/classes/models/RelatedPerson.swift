//
//  RelatedPerson.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/RelatedPerson) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  An person that is related to a patient, but who is not a direct target of care.
 *
 *  Information about a person that is involved in the care for a patient, but who is not the target of healthcare, nor
 *  has a formal responsibility in the care process.
 */
open class RelatedPerson: DomainResource {
	override open class var resourceType: String {
		get { return "RelatedPerson" }
	}
    
    public let address = RealmSwift.List<Address>()    
    public dynamic var birthDate: FHIRDate?        
        
    public dynamic var gender: String?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var name: HumanName?        
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }    
    public dynamic var patient: Reference?        
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }    
    public dynamic var period: Period?        
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }    
    public let photo = RealmSwift.List<Attachment>()    
    public dynamic var relationship: CodeableConcept?        
    public func upsert(relationship: CodeableConcept?) {
        upsert(prop: &self.relationship, val: relationship)
    }    
    public let telecom = RealmSwift.List<ContactPoint>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference) {
        self.init(json: nil)
        self.patient = patient
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["relationship"] {
				presentKeys.insert("relationship")
				if let val = exist as? FHIRJSON {
					upsert(relationship: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "relationship", wants: FHIRJSON.self, has: type(of: exist)))
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
		
		if address.count > 0 {
			json["address"] = Array(address.map() { $0.asJSON() })
		}
		if let birthDate = self.birthDate {
			json["birthDate"] = birthDate.asJSON()
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
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if photo.count > 0 {
			json["photo"] = Array(photo.map() { $0.asJSON() })
		}
		if let relationship = self.relationship {
			json["relationship"] = relationship.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}

