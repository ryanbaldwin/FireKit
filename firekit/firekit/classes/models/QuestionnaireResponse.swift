//
//  QuestionnaireResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A structured set of questions and their answers.
 *
 *  A structured set of questions and their answers. The questions are ordered and grouped into coherent subsets,
 *  corresponding to the structure of the grouping of the underlying questions.
 */
open class QuestionnaireResponse: DomainResource {
	override open class var resourceType: String {
		get { return "QuestionnaireResponse" }
	}

    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    @objc public dynamic var authored: DateTime?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var group: QuestionnaireResponseGroup?
    public func upsert(group: QuestionnaireResponseGroup?) {
        upsert(prop: &self.group, val: group)
    }
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var questionnaire: Reference?
    public func upsert(questionnaire: Reference?) {
        upsert(prop: &self.questionnaire, val: questionnaire)
    }
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case authored = "authored"
        case encounter = "encounter"
        case group = "group"
        case identifier = "identifier"
        case questionnaire = "questionnaire"
        case source = "source"
        case status = "status"
        case subject = "subject"
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


        // Reference: FHIRJSON
        if let authorVal = try container.decodeIfPresent(Reference.self, forKey: .author) {
          self.author = authorVal
        }
        // DateTime: String
        if let authoredVal = try container.decodeIfPresent(DateTime.self, forKey: .authored) {
          self.authored = authoredVal
        }
        // Reference: FHIRJSON
        if let encounterVal = try container.decodeIfPresent(Reference.self, forKey: .encounter) {
          self.encounter = encounterVal
        }
        // QuestionnaireResponseGroup: FHIRJSON
        if let groupVal = try container.decodeIfPresent(QuestionnaireResponseGroup.self, forKey: .group) {
          self.group = groupVal
        }
        // Identifier: FHIRJSON
        if let identifierVal = try container.decodeIfPresent(Identifier.self, forKey: .identifier) {
          self.identifier = identifierVal
        }
        // Reference: FHIRJSON
        if let questionnaireVal = try container.decodeIfPresent(Reference.self, forKey: .questionnaire) {
          self.questionnaire = questionnaireVal
        }
        // Reference: FHIRJSON
        if let sourceVal = try container.decodeIfPresent(Reference.self, forKey: .source) {
          self.source = sourceVal
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        // Reference: FHIRJSON
        if let subjectVal = try container.decodeIfPresent(Reference.self, forKey: .subject) {
          self.subject = subjectVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.authored, forKey: .authored)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.group, forKey: .group)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.questionnaire, forKey: .questionnaire)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
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
			if let exist = js["authored"] {
				presentKeys.insert("authored")
				if let val = exist as? String {
					self.authored = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "authored", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? FHIRJSON {
					upsert(group: QuestionnaireResponseGroup(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["questionnaire"] {
				presentKeys.insert("questionnaire")
				if let val = exist as? FHIRJSON {
					upsert(questionnaire: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "questionnaire", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
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
		if let authored = self.authored {
			json["authored"] = authored.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let group = self.group {
			json["group"] = group.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let questionnaire = self.questionnaire {
			json["questionnaire"] = questionnaire.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Grouped questions.
 *
 *  A group of questions to a possibly similarly grouped set of questions in the questionnaire response.
 */
open class QuestionnaireResponseGroup: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireResponseGroup" }
	}

    public let group = RealmSwift.List<QuestionnaireResponseGroup>()
    @objc public dynamic var linkId: String?
    public let question = RealmSwift.List<QuestionnaireResponseGroupQuestion>()
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var text: String?
    @objc public dynamic var title: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case group = "group"
        case linkId = "linkId"
        case question = "question"
        case subject = "subject"
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


        if let groupVals = try container.decodeIfPresent([QuestionnaireResponseGroup].self, forKey: .group) {
          // QuestionnaireResponseGroup: FHIRJSON
        }
        // String: String
        if let linkIdVal = try container.decodeIfPresent(String.self, forKey: .linkId) {
          self.linkId = linkIdVal
        }
        if let questionVals = try container.decodeIfPresent([QuestionnaireResponseGroupQuestion].self, forKey: .question) {
          // QuestionnaireResponseGroupQuestion: FHIRJSON
        }
        // Reference: FHIRJSON
        if let subjectVal = try container.decodeIfPresent(Reference.self, forKey: .subject) {
          self.subject = subjectVal
        }
        // String: String
        if let textVal = try container.decodeIfPresent(String.self, forKey: .text) {
          self.text = textVal
        }
        // String: String
        if let titleVal = try container.decodeIfPresent(String.self, forKey: .title) {
          self.title = titleVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.group.flatMap { $0 }, forKey: .group)
        try container.encodeIfPresent(self.linkId, forKey: .linkId)
        try container.encode(self.question.flatMap { $0 }, forKey: .question)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.title, forKey: .title)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroup.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroup] {
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
					if let vals = QuestionnaireResponseGroupQuestion.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroupQuestion] {
						if let realm = self.realm { realm.delete(self.question) }
						self.question.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "question", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
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
		
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let linkId = self.linkId {
			json["linkId"] = linkId.asJSON()
		}
		if question.count > 0 {
			json["question"] = Array(question.map() { $0.asJSON() })
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
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
}


/**
 *  Questions in this group.
 *
 *  Set of questions within this group. The order of questions within the group is relevant.
 */
open class QuestionnaireResponseGroupQuestion: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireResponseGroupQuestion" }
	}

    public let answer = RealmSwift.List<QuestionnaireResponseGroupQuestionAnswer>()
    @objc public dynamic var linkId: String?
    @objc public dynamic var text: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case answer = "answer"
        case linkId = "linkId"
        case text = "text"
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


        if let answerVals = try container.decodeIfPresent([QuestionnaireResponseGroupQuestionAnswer].self, forKey: .answer) {
          // QuestionnaireResponseGroupQuestionAnswer: FHIRJSON
        }
        // String: String
        if let linkIdVal = try container.decodeIfPresent(String.self, forKey: .linkId) {
          self.linkId = linkIdVal
        }
        // String: String
        if let textVal = try container.decodeIfPresent(String.self, forKey: .text) {
          self.text = textVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.answer.flatMap { $0 }, forKey: .answer)
        try container.encodeIfPresent(self.linkId, forKey: .linkId)
        try container.encodeIfPresent(self.text, forKey: .text)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["answer"] {
				presentKeys.insert("answer")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroupQuestionAnswer.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroupQuestionAnswer] {
						if let realm = self.realm { realm.delete(self.answer) }
						self.answer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "answer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if answer.count > 0 {
			json["answer"] = Array(answer.map() { $0.asJSON() })
		}
		if let linkId = self.linkId {
			json["linkId"] = linkId.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  The response(s) to the question.
 *
 *  The respondent's answer(s) to the question.
 */
open class QuestionnaireResponseGroupQuestionAnswer: BackboneElement {
	override open class var resourceType: String {
		get { return "QuestionnaireResponseGroupQuestionAnswer" }
	}

    public let group = RealmSwift.List<QuestionnaireResponseGroup>()
    @objc public dynamic var valueAttachment: Attachment?
    public func upsert(valueAttachment: Attachment?) {
        upsert(prop: &self.valueAttachment, val: valueAttachment)
    }
    public let valueBoolean = RealmOptional<Bool>()
    @objc public dynamic var valueCoding: Coding?
    public func upsert(valueCoding: Coding?) {
        upsert(prop: &self.valueCoding, val: valueCoding)
    }
    @objc public dynamic var valueDate: FHIRDate?
    @objc public dynamic var valueDateTime: DateTime?
    @objc public dynamic var valueDecimal: RealmDecimal?
    @objc public dynamic var valueInstant: Instant?
    public let valueInteger = RealmOptional<Int>()
    @objc public dynamic var valueQuantity: Quantity?
    public func upsert(valueQuantity: Quantity?) {
        upsert(prop: &self.valueQuantity, val: valueQuantity)
    }
    @objc public dynamic var valueReference: Reference?
    public func upsert(valueReference: Reference?) {
        upsert(prop: &self.valueReference, val: valueReference)
    }
    @objc public dynamic var valueString: String?
    @objc public dynamic var valueTime: FHIRTime?
    @objc public dynamic var valueUri: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case group = "group"
        case valueAttachment = "valueAttachment"
        case valueBoolean = "valueBoolean"
        case valueCoding = "valueCoding"
        case valueDate = "valueDate"
        case valueDateTime = "valueDateTime"
        case valueDecimal = "valueDecimal"
        case valueInstant = "valueInstant"
        case valueInteger = "valueInteger"
        case valueQuantity = "valueQuantity"
        case valueReference = "valueReference"
        case valueString = "valueString"
        case valueTime = "valueTime"
        case valueUri = "valueUri"
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


        if let groupVals = try container.decodeIfPresent([QuestionnaireResponseGroup].self, forKey: .group) {
          // QuestionnaireResponseGroup: FHIRJSON
        }
        // Attachment: FHIRJSON
        if let valueAttachmentVal = try container.decodeIfPresent(Attachment.self, forKey: .valueAttachment) {
          self.valueAttachment = valueAttachmentVal
        }
        // Bool: Bool
        if let valueBooleanVal = try container.decodeIfPresent(Bool.self, forKey: .valueBoolean) {
          self.valueBoolean.value = valueBooleanVal
        }
        // Coding: FHIRJSON
        if let valueCodingVal = try container.decodeIfPresent(Coding.self, forKey: .valueCoding) {
          self.valueCoding = valueCodingVal
        }
        // FHIRDate: String
        if let valueDateVal = try container.decodeIfPresent(FHIRDate.self, forKey: .valueDate) {
          self.valueDate = valueDateVal
        }
        // DateTime: String
        if let valueDateTimeVal = try container.decodeIfPresent(DateTime.self, forKey: .valueDateTime) {
          self.valueDateTime = valueDateTimeVal
        }
        // RealmDecimal: NSNumber
        if let valueDecimalVal = try container.decodeIfPresent(RealmDecimal.self, forKey: .valueDecimal) {
          self.valueDecimal = valueDecimalVal
        }
        // Instant: String
        if let valueInstantVal = try container.decodeIfPresent(Instant.self, forKey: .valueInstant) {
          self.valueInstant = valueInstantVal
        }
        // Int: Int
        if let valueIntegerVal = try container.decodeIfPresent(Int.self, forKey: .valueInteger) {
          self.valueInteger.value = valueIntegerVal
        }
        // Quantity: FHIRJSON
        if let valueQuantityVal = try container.decodeIfPresent(Quantity.self, forKey: .valueQuantity) {
          self.valueQuantity = valueQuantityVal
        }
        // Reference: FHIRJSON
        if let valueReferenceVal = try container.decodeIfPresent(Reference.self, forKey: .valueReference) {
          self.valueReference = valueReferenceVal
        }
        // String: String
        if let valueStringVal = try container.decodeIfPresent(String.self, forKey: .valueString) {
          self.valueString = valueStringVal
        }
        // FHIRTime: String
        if let valueTimeVal = try container.decodeIfPresent(FHIRTime.self, forKey: .valueTime) {
          self.valueTime = valueTimeVal
        }
        // String: String
        if let valueUriVal = try container.decodeIfPresent(String.self, forKey: .valueUri) {
          self.valueUri = valueUriVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.group.flatMap { $0 }, forKey: .group)
        try container.encodeIfPresent(self.valueAttachment, forKey: .valueAttachment)
        try container.encodeIfPresent(self.valueBoolean.value, forKey: .valueBoolean)
        try container.encodeIfPresent(self.valueCoding, forKey: .valueCoding)
        try container.encodeIfPresent(self.valueDate, forKey: .valueDate)
        try container.encodeIfPresent(self.valueDateTime, forKey: .valueDateTime)
        try container.encodeIfPresent(self.valueDecimal, forKey: .valueDecimal)
        try container.encodeIfPresent(self.valueInstant, forKey: .valueInstant)
        try container.encodeIfPresent(self.valueInteger.value, forKey: .valueInteger)
        try container.encodeIfPresent(self.valueQuantity, forKey: .valueQuantity)
        try container.encodeIfPresent(self.valueReference, forKey: .valueReference)
        try container.encodeIfPresent(self.valueString, forKey: .valueString)
        try container.encodeIfPresent(self.valueTime, forKey: .valueTime)
        try container.encodeIfPresent(self.valueUri, forKey: .valueUri)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["group"] {
				presentKeys.insert("group")
				if let val = exist as? [FHIRJSON] {
					if let vals = QuestionnaireResponseGroup.instantiate(fromArray: val, owner: self) as? [QuestionnaireResponseGroup] {
						if let realm = self.realm { realm.delete(self.group) }
						self.group.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "group", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueAttachment"] {
				presentKeys.insert("valueAttachment")
				if let val = exist as? FHIRJSON {
					upsert(valueAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueBoolean"] {
				presentKeys.insert("valueBoolean")
				if let val = exist as? Bool {
					self.valueBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueCoding"] {
				presentKeys.insert("valueCoding")
				if let val = exist as? FHIRJSON {
					upsert(valueCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDate"] {
				presentKeys.insert("valueDate")
				if let val = exist as? String {
					self.valueDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDateTime"] {
				presentKeys.insert("valueDateTime")
				if let val = exist as? String {
					self.valueDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDecimal"] {
				presentKeys.insert("valueDecimal")
				if let val = exist as? NSNumber {
					self.valueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInstant"] {
				presentKeys.insert("valueInstant")
				if let val = exist as? String {
					self.valueInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInteger"] {
				presentKeys.insert("valueInteger")
				if let val = exist as? Int {
					self.valueInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueQuantity"] {
				presentKeys.insert("valueQuantity")
				if let val = exist as? FHIRJSON {
					upsert(valueQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueReference"] {
				presentKeys.insert("valueReference")
				if let val = exist as? FHIRJSON {
					upsert(valueReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueString"] {
				presentKeys.insert("valueString")
				if let val = exist as? String {
					self.valueString = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueTime"] {
				presentKeys.insert("valueTime")
				if let val = exist as? String {
					self.valueTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueUri"] {
				presentKeys.insert("valueUri")
				if let val = exist as? String {
					self.valueUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueUri", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if group.count > 0 {
			json["group"] = Array(group.map() { $0.asJSON() })
		}
		if let valueAttachment = self.valueAttachment {
			json["valueAttachment"] = valueAttachment.asJSON()
		}
		if let valueBoolean = self.valueBoolean.value {
			json["valueBoolean"] = valueBoolean.asJSON()
		}
		if let valueCoding = self.valueCoding {
			json["valueCoding"] = valueCoding.asJSON()
		}
		if let valueDate = self.valueDate {
			json["valueDate"] = valueDate.asJSON()
		}
		if let valueDateTime = self.valueDateTime {
			json["valueDateTime"] = valueDateTime.asJSON()
		}
		if let valueDecimal = self.valueDecimal {
			json["valueDecimal"] = valueDecimal.asJSON()
		}
		if let valueInstant = self.valueInstant {
			json["valueInstant"] = valueInstant.asJSON()
		}
		if let valueInteger = self.valueInteger.value {
			json["valueInteger"] = valueInteger.asJSON()
		}
		if let valueQuantity = self.valueQuantity {
			json["valueQuantity"] = valueQuantity.asJSON()
		}
		if let valueReference = self.valueReference {
			json["valueReference"] = valueReference.asJSON()
		}
		if let valueString = self.valueString {
			json["valueString"] = valueString.asJSON()
		}
		if let valueTime = self.valueTime {
			json["valueTime"] = valueTime.asJSON()
		}
		if let valueUri = self.valueUri {
			json["valueUri"] = valueUri.asJSON()
		}
		
		return json
	}
*/
}

