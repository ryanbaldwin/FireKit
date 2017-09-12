//
//  Questionnaire.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Questionnaire) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A structured set of questions.
 *
 *  A structured set of questions intended to guide the collection of answers. The questions are ordered and grouped
 *  into coherent subsets, corresponding to the structure of the grouping of the underlying questions.
 */
open class Questionnaire: DomainResource {
	override open class var resourceType: String {
		get { return "Questionnaire" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var group: QuestionnaireGroup?
    public func upsert(group: QuestionnaireGroup?) {
        upsert(prop: &self.group, val: group)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var publisher: String?
    @objc public dynamic var status: String?
    public let subjectType = RealmSwift.List<RealmString>()
    public let telecom = RealmSwift.List<ContactPoint>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(group: QuestionnaireGroup, status: String) {
        self.init()
        self.group = group
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case group = "group"
        case identifier = "identifier"
        case publisher = "publisher"
        case status = "status"
        case subjectType = "subjectType"
        case telecom = "telecom"
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

        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.group = try container.decodeIfPresent(QuestionnaireGroup.self, forKey: .group)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subjectType.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .subjectType) ?? [])
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.group, forKey: .group)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.subjectType), forKey: .subjectType)
        try container.encode(Array(self.telecom), forKey: .telecom)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
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
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? FHIRJSON {
					upsert(group: QuestionnaireGroup(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "group"))
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
			if let exist = js["publisher"] {
				presentKeys.insert("publisher")
				if let val = exist as? String {
					self.publisher = val
				}
				else {
					errors.append(FHIRJSONError(key: "publisher", wants: String.self, has: type(of: exist)))
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
			if let exist = js["subjectType"] {
				presentKeys.insert("subjectType")
				if let val = exist as? [String] {
					self.subjectType.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "subjectType", wants: Array<String>.self, has: type(of: exist)))
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
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let group = self.group {
			json["group"] = group.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if subjectType.count > 0 {
			json["subjectType"] = Array(subjectType.map() { $0.value })
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
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
			let clone = try JSONDecoder().decode(Questionnaire.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Questionnaire. Will return empty instance: \(error))")
		}
		return Questionnaire.init()
	}
}


/**
 *  Grouped questions.
 *
 *  A collection of related questions (or further groupings of questions).
 */
open class QuestionnaireGroup: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireGroup" }
	}

    public let concept = RealmSwift.List<Coding>()
    public let group = RealmSwift.List<QuestionnaireGroup>()
    @objc public dynamic var linkId: String?
    public let question = RealmSwift.List<QuestionnaireGroupQuestion>()
    public let repeats = RealmOptional<Bool>()
    public let required = RealmOptional<Bool>()
    @objc public dynamic var text: String?
    @objc public dynamic var title: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case concept = "concept"
        case group = "group"
        case linkId = "linkId"
        case question = "question"
        case repeats = "repeats"
        case required = "required"
        case text = "text"
        case title = "title"
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

        self.concept.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .concept) ?? [])
        self.group.append(objectsIn: try container.decodeIfPresent([QuestionnaireGroup].self, forKey: .group) ?? [])
        self.linkId = try container.decodeIfPresent(String.self, forKey: .linkId)
        self.question.append(objectsIn: try container.decodeIfPresent([QuestionnaireGroupQuestion].self, forKey: .question) ?? [])
        self.repeats.value = try container.decodeIfPresent(Bool.self, forKey: .repeats)
        self.required.value = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.concept), forKey: .concept)
        try container.encode(Array(self.group), forKey: .group)
        try container.encodeIfPresent(self.linkId, forKey: .linkId)
        try container.encode(Array(self.question), forKey: .question)
        try container.encodeIfPresent(self.repeats.value, forKey: .repeats)
        try container.encodeIfPresent(self.required.value, forKey: .required)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.title, forKey: .title)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["concept"] {
				presentKeys.insert("concept")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.concept) }
						self.concept.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "concept", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireGroup.instantiate(fromArray: val, owner: self) as? [QuestionnaireGroup] {
						if let realm = self.realm { realm.delete(self.group) }
						self.group.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["linkId"] {
				presentKeys.insert("linkId")
				if let val = exist as? String {
					self.linkId = val
				}
				else {
					errors.append(FHIRJSONError(key: "linkId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["question"] {
				presentKeys.insert("question")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireGroupQuestion.instantiate(fromArray: val, owner: self) as? [QuestionnaireGroupQuestion] {
						if let realm = self.realm { realm.delete(self.question) }
						self.question.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "question", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["repeats"] {
				presentKeys.insert("repeats")
				if let val = exist as? Bool {
					self.repeats.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "repeats", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["required"] {
				presentKeys.insert("required")
				if let val = exist as? Bool {
					self.required.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "required", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["title"] {
				presentKeys.insert("title")
				if let val = exist as? String {
					self.title = val
				}
				else {
					errors.append(FHIRJSONError(key: "title", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if concept.count > 0 {
			json["concept"] = Array(concept.map() { $0.asJSON() })
		}
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let linkId = self.linkId {
			json["linkId"] = linkId.asJSON()
		}
		if question.count > 0 {
			json["question"] = Array(question.map() { $0.asJSON() })
		}
		if let repeats = self.repeats.value {
			json["repeats"] = repeats.asJSON()
		}
		if let required = self.required.value {
			json["required"] = required.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(QuestionnaireGroup.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy QuestionnaireGroup. Will return empty instance: \(error))")
		}
		return QuestionnaireGroup.init()
	}
}


/**
 *  Questions in this group.
 *
 *  Set of questions within this group. The order of questions within the group is relevant.
 */
open class QuestionnaireGroupQuestion: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireGroupQuestion" }
	}

    public let concept = RealmSwift.List<Coding>()
    public let group = RealmSwift.List<QuestionnaireGroup>()
    @objc public dynamic var linkId: String?
    public let option = RealmSwift.List<Coding>()
    @objc public dynamic var options: Reference?
    public func upsert(options: Reference?) {
        upsert(prop: &self.options, val: options)
    }
    public let repeats = RealmOptional<Bool>()
    public let required = RealmOptional<Bool>()
    @objc public dynamic var text: String?
    @objc public dynamic var type: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case concept = "concept"
        case group = "group"
        case linkId = "linkId"
        case option = "option"
        case options = "options"
        case repeats = "repeats"
        case required = "required"
        case text = "text"
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

        self.concept.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .concept) ?? [])
        self.group.append(objectsIn: try container.decodeIfPresent([QuestionnaireGroup].self, forKey: .group) ?? [])
        self.linkId = try container.decodeIfPresent(String.self, forKey: .linkId)
        self.option.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .option) ?? [])
        self.options = try container.decodeIfPresent(Reference.self, forKey: .options)
        self.repeats.value = try container.decodeIfPresent(Bool.self, forKey: .repeats)
        self.required.value = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.concept), forKey: .concept)
        try container.encode(Array(self.group), forKey: .group)
        try container.encodeIfPresent(self.linkId, forKey: .linkId)
        try container.encode(Array(self.option), forKey: .option)
        try container.encodeIfPresent(self.options, forKey: .options)
        try container.encodeIfPresent(self.repeats.value, forKey: .repeats)
        try container.encodeIfPresent(self.required.value, forKey: .required)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["concept"] {
				presentKeys.insert("concept")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.concept) }
						self.concept.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "concept", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireGroup.instantiate(fromArray: val, owner: self) as? [QuestionnaireGroup] {
						if let realm = self.realm { realm.delete(self.group) }
						self.group.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["linkId"] {
				presentKeys.insert("linkId")
				if let val = exist as? String {
					self.linkId = val
				}
				else {
					errors.append(FHIRJSONError(key: "linkId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["option"] {
				presentKeys.insert("option")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.option) }
						self.option.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "option", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["options"] {
				presentKeys.insert("options")
				if let val = exist as? FHIRJSON {
					upsert(options: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "options", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["repeats"] {
				presentKeys.insert("repeats")
				if let val = exist as? Bool {
					self.repeats.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "repeats", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["required"] {
				presentKeys.insert("required")
				if let val = exist as? Bool {
					self.required.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "required", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if concept.count > 0 {
			json["concept"] = Array(concept.map() { $0.asJSON() })
		}
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let linkId = self.linkId {
			json["linkId"] = linkId.asJSON()
		}
		if option.count > 0 {
			json["option"] = Array(option.map() { $0.asJSON() })
		}
		if let options = self.options {
			json["options"] = options.asJSON()
		}
		if let repeats = self.repeats.value {
			json["repeats"] = repeats.asJSON()
		}
		if let required = self.required.value {
			json["required"] = required.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(QuestionnaireGroupQuestion.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy QuestionnaireGroupQuestion. Will return empty instance: \(error))")
		}
		return QuestionnaireGroupQuestion.init()
	}
}

