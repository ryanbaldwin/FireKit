//
//  DetectedIssue.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DetectedIssue) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Clinical issue with action.
 *
 *  Indicates an actual or potential clinical issue with or between one or more active or proposed clinical actions for
 *  a patient; e.g. Drug-drug interaction, Ineffective treatment frequency, Procedure-condition conflict, etc.
 */
open class DetectedIssue: DomainResource {
	override open class var resourceType: String {
		get { return "DetectedIssue" }
	}

    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var detail: String?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    public let implicated = RealmSwift.List<Reference>()
    public let mitigation = RealmSwift.List<DetectedIssueMitigation>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var reference: String?
    @objc public dynamic var severity: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case category = "category"
        case date = "date"
        case detail = "detail"
        case identifier = "identifier"
        case implicated = "implicated"
        case mitigation = "mitigation"
        case patient = "patient"
        case reference = "reference"
        case severity = "severity"
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

        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.detail = try container.decodeIfPresent(String.self, forKey: .detail)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.implicated.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .implicated) ?? [])
        self.mitigation.append(objectsIn: try container.decodeIfPresent([DetectedIssueMitigation].self, forKey: .mitigation) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encode(self.implicated.flatMap { $0 }, forKey: .implicated)
        try container.encode(self.mitigation.flatMap { $0 }, forKey: .mitigation)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.severity, forKey: .severity)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					upsert(author: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					upsert(category: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
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
				if let val = exist as? String {
					self.detail = val
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["implicated"] {
				presentKeys.insert("implicated")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.implicated) }
						self.implicated.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "implicated", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["mitigation"] {
				presentKeys.insert("mitigation")
				if let val = exist as? [FHIRJSON] {
					if let vals = DetectedIssueMitigation.instantiate(fromArray: val, owner: self) as? [DetectedIssueMitigation] {
						if let realm = self.realm { realm.delete(self.mitigation) }
						self.mitigation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "mitigation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? String {
					self.reference = val
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["severity"] {
				presentKeys.insert("severity")
				if let val = exist as? String {
					self.severity = val
				}
				else {
					errors.append(FHIRJSONError(key: "severity", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let detail = self.detail {
			json["detail"] = detail.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if implicated.count > 0 {
			json["implicated"] = Array(implicated.map() { $0.asJSON() })
		}
		if mitigation.count > 0 {
			json["mitigation"] = Array(mitigation.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let severity = self.severity {
			json["severity"] = severity.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DetectedIssue.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DetectedIssue. Will return empty instance: \(error))")
		}
		return DetectedIssue.init()
	}
}


/**
 *  Step taken to address.
 *
 *  Indicates an action that has been taken or is committed to to reduce or eliminate the likelihood of the risk
 *  identified by the detected issue from manifesting.  Can also reflect an observation of known mitigating factors that
 *  may reduce/eliminate the need for any action.
 */
open class DetectedIssueMitigation: BackboneElement {
	override open class var resourceType: String {
		get { return "DetectedIssueMitigation" }
	}

    @objc public dynamic var action: CodeableConcept?
    public func upsert(action: CodeableConcept?) {
        upsert(prop: &self.action, val: action)
    }
    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    @objc public dynamic var date: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: CodeableConcept) {
        self.init()
        self.action = action
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case author = "author"
        case date = "date"
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

        self.action = try container.decodeIfPresent(CodeableConcept.self, forKey: .action)
        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.date, forKey: .date)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? FHIRJSON {
					upsert(action: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "action"))
			}
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					upsert(author: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DetectedIssueMitigation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DetectedIssueMitigation. Will return empty instance: \(error))")
		}
		return DetectedIssueMitigation.init()
	}
}

