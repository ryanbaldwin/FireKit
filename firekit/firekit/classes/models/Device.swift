//
//  Device.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Device) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  An instance of a manufactured te that is used in the provision of healthcare.
 *
 *  This resource identifies an instance of a manufactured item that is used in the provision of healthcare without
 *  being substantially changed through that activity. The device may be a medical or non-medical device.  Medical
 *  devices includes durable (reusable) medical equipment, implantable devices, as well as disposable equipment used for
 *  diagnostic, treatment, and research for healthcare and public health.  Non-medical devices may include items such as
 *  a machine, cellphone, computer, application, etc.
 */
open class Device: DomainResource {
	override open class var resourceType: String {
		get { return "Device" }
	}

    public let contact = RealmSwift.List<ContactPoint>()
    @objc public dynamic var expiry: DateTime?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var lotNumber: String?
    @objc public dynamic var manufactureDate: DateTime?
    @objc public dynamic var manufacturer: String?
    @objc public dynamic var model: String?
    public let note = RealmSwift.List<Annotation>()
    @objc public dynamic var owner: Reference?
    public func upsert(owner: Reference?) {
        upsert(prop: &self.owner, val: owner)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var udi: String?
    @objc public dynamic var url: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: CodeableConcept) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case expiry = "expiry"
        case identifier = "identifier"
        case location = "location"
        case lotNumber = "lotNumber"
        case manufactureDate = "manufactureDate"
        case manufacturer = "manufacturer"
        case model = "model"
        case note = "note"
        case owner = "owner"
        case patient = "patient"
        case status = "status"
        case type = "type"
        case udi = "udi"
        case url = "url"
        case version = "version"
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

        self.contact.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .contact) ?? [])
        self.expiry = try container.decodeIfPresent(DateTime.self, forKey: .expiry)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.lotNumber = try container.decodeIfPresent(String.self, forKey: .lotNumber)
        self.manufactureDate = try container.decodeIfPresent(DateTime.self, forKey: .manufactureDate)
        self.manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        self.model = try container.decodeIfPresent(String.self, forKey: .model)
        self.note.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .note) ?? [])
        self.owner = try container.decodeIfPresent(Reference.self, forKey: .owner)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.udi = try container.decodeIfPresent(String.self, forKey: .udi)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.expiry, forKey: .expiry)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.lotNumber, forKey: .lotNumber)
        try container.encodeIfPresent(self.manufactureDate, forKey: .manufactureDate)
        try container.encodeIfPresent(self.manufacturer, forKey: .manufacturer)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(Array(self.note), forKey: .note)
        try container.encodeIfPresent(self.owner, forKey: .owner)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["expiry"] {
				presentKeys.insert("expiry")
				if let val = exist as? String {
					self.expiry = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "expiry", wants: String.self, has: type(of: exist)))
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
			if let exist = js["manufactureDate"] {
				presentKeys.insert("manufactureDate")
				if let val = exist as? String {
					self.manufactureDate = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "manufactureDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["manufacturer"] {
				presentKeys.insert("manufacturer")
				if let val = exist as? String {
					self.manufacturer = val
				}
				else {
					errors.append(FHIRJSONError(key: "manufacturer", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["model"] {
				presentKeys.insert("model")
				if let val = exist as? String {
					self.model = val
				}
				else {
					errors.append(FHIRJSONError(key: "model", wants: String.self, has: type(of: exist)))
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
			if let exist = js["owner"] {
				presentKeys.insert("owner")
				if let val = exist as? FHIRJSON {
					upsert(owner: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "owner", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
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
			if let exist = js["udi"] {
				presentKeys.insert("udi")
				if let val = exist as? String {
					self.udi = val
				}
				else {
					errors.append(FHIRJSONError(key: "udi", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["version"] {
				presentKeys.insert("version")
				if let val = exist as? String {
					self.version = val
				}
				else {
					errors.append(FHIRJSONError(key: "version", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let expiry = self.expiry {
			json["expiry"] = expiry.asJSON()
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
		if let manufactureDate = self.manufactureDate {
			json["manufactureDate"] = manufactureDate.asJSON()
		}
		if let manufacturer = self.manufacturer {
			json["manufacturer"] = manufacturer.asJSON()
		}
		if let model = self.model {
			json["model"] = model.asJSON()
		}
		if note.count > 0 {
			json["note"] = Array(note.map() { $0.asJSON() })
		}
		if let owner = self.owner {
			json["owner"] = owner.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let udi = self.udi {
			json["udi"] = udi.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Device.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Device. Will return empty instance: \(error))")
		}
		return Device.init()
	}
}

