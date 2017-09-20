//
//  QuestionnaireResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/QuestionnaireResponse) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.authored = try container.decodeIfPresent(DateTime.self, forKey: .authored)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.group = try container.decodeIfPresent(QuestionnaireResponseGroup.self, forKey: .group)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.questionnaire = try container.decodeIfPresent(Reference.self, forKey: .questionnaire)
        self.source = try container.decodeIfPresent(Reference.self, forKey: .source)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
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

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(QuestionnaireResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy QuestionnaireResponse. Will return empty instance: \(error))")
		}
		return QuestionnaireResponse.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? QuestionnaireResponse else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.author, from: o.author)
        FireKit.populate(&self.authored, from: o.authored)
        FireKit.populate(&self.encounter, from: o.encounter)
        FireKit.populate(&self.group, from: o.group)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.questionnaire, from: o.questionnaire)
        FireKit.populate(&self.source, from: o.source)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
    }
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

        self.group.append(objectsIn: try container.decodeIfPresent([QuestionnaireResponseGroup].self, forKey: .group) ?? [])
        self.linkId = try container.decodeIfPresent(String.self, forKey: .linkId)
        self.question.append(objectsIn: try container.decodeIfPresent([QuestionnaireResponseGroupQuestion].self, forKey: .question) ?? [])
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.group), forKey: .group)
        try container.encodeIfPresent(self.linkId, forKey: .linkId)
        try container.encode(Array(self.question), forKey: .question)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(QuestionnaireResponseGroup.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy QuestionnaireResponseGroup. Will return empty instance: \(error))")
		}
		return QuestionnaireResponseGroup.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? QuestionnaireResponseGroup else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.group.enumerated() {
            guard index < self.group.count else {
                self.group.append(t)
                continue
            }
            self.group[index].populate(from: t)
        }
    
        if self.group.count > o.group.count {
            for i in self.group.count...o.group.count {
                let objectToRemove = self.group[i]
                self.group.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        linkId = o.linkId

        for (index, t) in o.question.enumerated() {
            guard index < self.question.count else {
                self.question.append(t)
                continue
            }
            self.question[index].populate(from: t)
        }
    
        if self.question.count > o.question.count {
            for i in self.question.count...o.question.count {
                let objectToRemove = self.question[i]
                self.question.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.subject, from: o.subject)
        text = o.text
        title = o.title
    }
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

        self.answer.append(objectsIn: try container.decodeIfPresent([QuestionnaireResponseGroupQuestionAnswer].self, forKey: .answer) ?? [])
        self.linkId = try container.decodeIfPresent(String.self, forKey: .linkId)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.answer), forKey: .answer)
        try container.encodeIfPresent(self.linkId, forKey: .linkId)
        try container.encodeIfPresent(self.text, forKey: .text)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(QuestionnaireResponseGroupQuestion.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy QuestionnaireResponseGroupQuestion. Will return empty instance: \(error))")
		}
		return QuestionnaireResponseGroupQuestion.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? QuestionnaireResponseGroupQuestion else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.answer.enumerated() {
            guard index < self.answer.count else {
                self.answer.append(t)
                continue
            }
            self.answer[index].populate(from: t)
        }
    
        if self.answer.count > o.answer.count {
            for i in self.answer.count...o.answer.count {
                let objectToRemove = self.answer[i]
                self.answer.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        linkId = o.linkId
        text = o.text
    }
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

        self.group.append(objectsIn: try container.decodeIfPresent([QuestionnaireResponseGroup].self, forKey: .group) ?? [])
        self.valueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .valueAttachment)
        self.valueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .valueBoolean)
        self.valueCoding = try container.decodeIfPresent(Coding.self, forKey: .valueCoding)
        self.valueDate = try container.decodeIfPresent(FHIRDate.self, forKey: .valueDate)
        self.valueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .valueDateTime)
        self.valueDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .valueDecimal)
        self.valueInstant = try container.decodeIfPresent(Instant.self, forKey: .valueInstant)
        self.valueInteger.value = try container.decodeIfPresent(Int.self, forKey: .valueInteger)
        self.valueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .valueQuantity)
        self.valueReference = try container.decodeIfPresent(Reference.self, forKey: .valueReference)
        self.valueString = try container.decodeIfPresent(String.self, forKey: .valueString)
        self.valueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .valueTime)
        self.valueUri = try container.decodeIfPresent(String.self, forKey: .valueUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.group), forKey: .group)
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

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(QuestionnaireResponseGroupQuestionAnswer.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy QuestionnaireResponseGroupQuestionAnswer. Will return empty instance: \(error))")
		}
		return QuestionnaireResponseGroupQuestionAnswer.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? QuestionnaireResponseGroupQuestionAnswer else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.group.enumerated() {
            guard index < self.group.count else {
                self.group.append(t)
                continue
            }
            self.group[index].populate(from: t)
        }
    
        if self.group.count > o.group.count {
            for i in self.group.count...o.group.count {
                let objectToRemove = self.group[i]
                self.group.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.valueAttachment, from: o.valueAttachment)
        valueBoolean.value = o.valueBoolean.value
        FireKit.populate(&self.valueCoding, from: o.valueCoding)
        FireKit.populate(&self.valueDate, from: o.valueDate)
        FireKit.populate(&self.valueDateTime, from: o.valueDateTime)
        valueDecimal = o.valueDecimal
        FireKit.populate(&self.valueInstant, from: o.valueInstant)
        valueInteger.value = o.valueInteger.value
        FireKit.populate(&self.valueQuantity, from: o.valueQuantity)
        FireKit.populate(&self.valueReference, from: o.valueReference)
        valueString = o.valueString
        FireKit.populate(&self.valueTime, from: o.valueTime)
        valueUri = o.valueUri
    }
}

