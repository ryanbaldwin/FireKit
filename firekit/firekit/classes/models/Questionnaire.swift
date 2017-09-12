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

