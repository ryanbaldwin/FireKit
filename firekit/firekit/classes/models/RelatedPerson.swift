//
//  RelatedPerson.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/RelatedPerson) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
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
    @objc public dynamic var birthDate: FHIRDate?
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: HumanName?
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let photo = RealmSwift.List<Attachment>()
    @objc public dynamic var relationship: CodeableConcept?
    public func upsert(relationship: CodeableConcept?) {
        upsert(prop: &self.relationship, val: relationship)
    }
    public let telecom = RealmSwift.List<ContactPoint>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference) {
        self.init()
        self.patient = patient
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case birthDate = "birthDate"
        case gender = "gender"
        case identifier = "identifier"
        case name = "name"
        case patient = "patient"
        case period = "period"
        case photo = "photo"
        case relationship = "relationship"
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

        self.address.append(objectsIn: try container.decodeIfPresent([Address].self, forKey: .address) ?? [])
        self.birthDate = try container.decodeIfPresent(FHIRDate.self, forKey: .birthDate)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.name = try container.decodeIfPresent(HumanName.self, forKey: .name)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.photo.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .photo) ?? [])
        self.relationship = try container.decodeIfPresent(CodeableConcept.self, forKey: .relationship)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.address), forKey: .address)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.photo), forKey: .photo)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }
/*
	
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
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(RelatedPerson.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy RelatedPerson. Will return empty instance: \(error))")
		}
		return RelatedPerson.init()
	}
}

