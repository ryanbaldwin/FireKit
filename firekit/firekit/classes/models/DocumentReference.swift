//
//  DocumentReference.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DocumentReference) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A reference to a document.
 *
 *  A reference to a document .
 */
open class DocumentReference: DomainResource {
	override open class var resourceType: String {
		get { return "DocumentReference" }
	}

    @objc public dynamic var authenticator: Reference?
    public func upsert(authenticator: Reference?) {
        upsert(prop: &self.authenticator, val: authenticator)
    }
    public let author = RealmSwift.List<Reference>()
    @objc public dynamic var class_fhir: CodeableConcept?
    public func upsert(class_fhir: CodeableConcept?) {
        upsert(prop: &self.class_fhir, val: class_fhir)
    }
    public let content = RealmSwift.List<DocumentReferenceContent>()
    @objc public dynamic var context: DocumentReferenceContext?
    public func upsert(context: DocumentReferenceContext?) {
        upsert(prop: &self.context, val: context)
    }
    @objc public dynamic var created: DateTime?
    @objc public dynamic var custodian: Reference?
    public func upsert(custodian: Reference?) {
        upsert(prop: &self.custodian, val: custodian)
    }
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var docStatus: CodeableConcept?
    public func upsert(docStatus: CodeableConcept?) {
        upsert(prop: &self.docStatus, val: docStatus)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var indexed: Instant?
    @objc public dynamic var masterIdentifier: Identifier?
    public func upsert(masterIdentifier: Identifier?) {
        upsert(prop: &self.masterIdentifier, val: masterIdentifier)
    }
    public let relatesTo = RealmSwift.List<DocumentReferenceRelatesTo>()
    public let securityLabel = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(content: [DocumentReferenceContent], indexed: Instant, status: String, type: CodeableConcept) {
        self.init()
        self.content.append(objectsIn: content)
        self.indexed = indexed
        self.status = status
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authenticator = "authenticator"
        case author = "author"
        case class_fhir = "class"
        case content = "content"
        case context = "context"
        case created = "created"
        case custodian = "custodian"
        case description_fhir = "description"
        case docStatus = "docStatus"
        case identifier = "identifier"
        case indexed = "indexed"
        case masterIdentifier = "masterIdentifier"
        case relatesTo = "relatesTo"
        case securityLabel = "securityLabel"
        case status = "status"
        case subject = "subject"
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

        self.authenticator = try container.decodeIfPresent(Reference.self, forKey: .authenticator)
        self.author.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .author) ?? [])
        self.class_fhir = try container.decodeIfPresent(CodeableConcept.self, forKey: .class_fhir)
        self.content.append(objectsIn: try container.decodeIfPresent([DocumentReferenceContent].self, forKey: .content) ?? [])
        self.context = try container.decodeIfPresent(DocumentReferenceContext.self, forKey: .context)
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.custodian = try container.decodeIfPresent(Reference.self, forKey: .custodian)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.docStatus = try container.decodeIfPresent(CodeableConcept.self, forKey: .docStatus)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.indexed = try container.decodeIfPresent(Instant.self, forKey: .indexed)
        self.masterIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .masterIdentifier)
        self.relatesTo.append(objectsIn: try container.decodeIfPresent([DocumentReferenceRelatesTo].self, forKey: .relatesTo) ?? [])
        self.securityLabel.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .securityLabel) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.authenticator, forKey: .authenticator)
        try container.encode(self.author.flatMap { $0 }, forKey: .author)
        try container.encodeIfPresent(self.class_fhir, forKey: .class_fhir)
        try container.encode(self.content.flatMap { $0 }, forKey: .content)
        try container.encodeIfPresent(self.context, forKey: .context)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.custodian, forKey: .custodian)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.docStatus, forKey: .docStatus)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.indexed, forKey: .indexed)
        try container.encodeIfPresent(self.masterIdentifier, forKey: .masterIdentifier)
        try container.encode(self.relatesTo.flatMap { $0 }, forKey: .relatesTo)
        try container.encode(self.securityLabel.flatMap { $0 }, forKey: .securityLabel)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["authenticator"] {
				presentKeys.insert("authenticator")
				if let val = exist as? FHIRJSON {
					upsert(authenticator: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "authenticator", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.author) }
						self.author.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["class"] {
				presentKeys.insert("class")
				if let val = exist as? FHIRJSON {
					upsert(class_fhir: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "class", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["content"] {
				presentKeys.insert("content")
				if let val = exist as? [FHIRJSON] {
					if let vals = DocumentReferenceContent.instantiate(fromArray: val, owner: self) as? [DocumentReferenceContent] {
						if let realm = self.realm { realm.delete(self.content) }
						self.content.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "content", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "content"))
			}
			if let exist = js["context"] {
				presentKeys.insert("context")
				if let val = exist as? FHIRJSON {
					upsert(context: DocumentReferenceContext(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "context", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["custodian"] {
				presentKeys.insert("custodian")
				if let val = exist as? FHIRJSON {
					upsert(custodian: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "custodian", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["docStatus"] {
				presentKeys.insert("docStatus")
				if let val = exist as? FHIRJSON {
					upsert(docStatus: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "docStatus", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["indexed"] {
				presentKeys.insert("indexed")
				if let val = exist as? String {
					self.indexed = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "indexed", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "indexed"))
			}
			if let exist = js["masterIdentifier"] {
				presentKeys.insert("masterIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(masterIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "masterIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["relatesTo"] {
				presentKeys.insert("relatesTo")
				if let val = exist as? [FHIRJSON] {
					if let vals = DocumentReferenceRelatesTo.instantiate(fromArray: val, owner: self) as? [DocumentReferenceRelatesTo] {
						if let realm = self.realm { realm.delete(self.relatesTo) }
						self.relatesTo.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "relatesTo", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["securityLabel"] {
				presentKeys.insert("securityLabel")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.securityLabel) }
						self.securityLabel.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "securityLabel", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let authenticator = self.authenticator {
			json["authenticator"] = authenticator.asJSON()
		}
		if author.count > 0 {
			json["author"] = Array(author.map() { $0.asJSON() })
		}
		if let class_fhir = self.class_fhir {
			json["class"] = class_fhir.asJSON()
		}
		if content.count > 0 {
			json["content"] = Array(content.map() { $0.asJSON() })
		}
		if let context = self.context {
			json["context"] = context.asJSON()
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if let custodian = self.custodian {
			json["custodian"] = custodian.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let docStatus = self.docStatus {
			json["docStatus"] = docStatus.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let indexed = self.indexed {
			json["indexed"] = indexed.asJSON()
		}
		if let masterIdentifier = self.masterIdentifier {
			json["masterIdentifier"] = masterIdentifier.asJSON()
		}
		if relatesTo.count > 0 {
			json["relatesTo"] = Array(relatesTo.map() { $0.asJSON() })
		}
		if securityLabel.count > 0 {
			json["securityLabel"] = Array(securityLabel.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
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
			let clone = try JSONDecoder().decode(DocumentReference.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReference. Will return empty instance: \(error))")
		}
		return DocumentReference.init()
	}
}


/**
 *  Document referenced.
 *
 *  The document and format referenced. There may be multiple content element repetitions, each with a different format.
 */
open class DocumentReferenceContent: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceContent" }
	}

    @objc public dynamic var attachment: Attachment?
    public func upsert(attachment: Attachment?) {
        upsert(prop: &self.attachment, val: attachment)
    }
    public let format = RealmSwift.List<Coding>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(attachment: Attachment) {
        self.init()
        self.attachment = attachment
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case attachment = "attachment"
        case format = "format"
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

        self.attachment = try container.decodeIfPresent(Attachment.self, forKey: .attachment)
        self.format.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .format) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.attachment, forKey: .attachment)
        try container.encode(self.format.flatMap { $0 }, forKey: .format)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["attachment"] {
				presentKeys.insert("attachment")
				if let val = exist as? FHIRJSON {
					upsert(attachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "attachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "attachment"))
			}
			if let exist = js["format"] {
				presentKeys.insert("format")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.format) }
						self.format.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "format", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let attachment = self.attachment {
			json["attachment"] = attachment.asJSON()
		}
		if format.count > 0 {
			json["format"] = Array(format.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceContent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceContent. Will return empty instance: \(error))")
		}
		return DocumentReferenceContent.init()
	}
}


/**
 *  Clinical context of document.
 *
 *  The clinical context in which the document was prepared.
 */
open class DocumentReferenceContext: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceContext" }
	}

    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let event = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var facilityType: CodeableConcept?
    public func upsert(facilityType: CodeableConcept?) {
        upsert(prop: &self.facilityType, val: facilityType)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var practiceSetting: CodeableConcept?
    public func upsert(practiceSetting: CodeableConcept?) {
        upsert(prop: &self.practiceSetting, val: practiceSetting)
    }
    public let related = RealmSwift.List<DocumentReferenceContextRelated>()
    @objc public dynamic var sourcePatientInfo: Reference?
    public func upsert(sourcePatientInfo: Reference?) {
        upsert(prop: &self.sourcePatientInfo, val: sourcePatientInfo)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case encounter = "encounter"
        case event = "event"
        case facilityType = "facilityType"
        case period = "period"
        case practiceSetting = "practiceSetting"
        case related = "related"
        case sourcePatientInfo = "sourcePatientInfo"
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

        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.event.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .event) ?? [])
        self.facilityType = try container.decodeIfPresent(CodeableConcept.self, forKey: .facilityType)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.practiceSetting = try container.decodeIfPresent(CodeableConcept.self, forKey: .practiceSetting)
        self.related.append(objectsIn: try container.decodeIfPresent([DocumentReferenceContextRelated].self, forKey: .related) ?? [])
        self.sourcePatientInfo = try container.decodeIfPresent(Reference.self, forKey: .sourcePatientInfo)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(self.event.flatMap { $0 }, forKey: .event)
        try container.encodeIfPresent(self.facilityType, forKey: .facilityType)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.practiceSetting, forKey: .practiceSetting)
        try container.encode(self.related.flatMap { $0 }, forKey: .related)
        try container.encodeIfPresent(self.sourcePatientInfo, forKey: .sourcePatientInfo)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.event) }
						self.event.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["facilityType"] {
				presentKeys.insert("facilityType")
				if let val = exist as? FHIRJSON {
					upsert(facilityType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "facilityType", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["practiceSetting"] {
				presentKeys.insert("practiceSetting")
				if let val = exist as? FHIRJSON {
					upsert(practiceSetting: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "practiceSetting", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["related"] {
				presentKeys.insert("related")
				if let val = exist as? [FHIRJSON] {
					if let vals = DocumentReferenceContextRelated.instantiate(fromArray: val, owner: self) as? [DocumentReferenceContextRelated] {
						if let realm = self.realm { realm.delete(self.related) }
						self.related.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "related", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourcePatientInfo"] {
				presentKeys.insert("sourcePatientInfo")
				if let val = exist as? FHIRJSON {
					upsert(sourcePatientInfo: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "sourcePatientInfo", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if event.count > 0 {
			json["event"] = Array(event.map() { $0.asJSON() })
		}
		if let facilityType = self.facilityType {
			json["facilityType"] = facilityType.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let practiceSetting = self.practiceSetting {
			json["practiceSetting"] = practiceSetting.asJSON()
		}
		if related.count > 0 {
			json["related"] = Array(related.map() { $0.asJSON() })
		}
		if let sourcePatientInfo = self.sourcePatientInfo {
			json["sourcePatientInfo"] = sourcePatientInfo.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceContext.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceContext. Will return empty instance: \(error))")
		}
		return DocumentReferenceContext.init()
	}
}


/**
 *  Related identifiers or resources.
 *
 *  Related identifiers or resources associated with the DocumentReference.
 */
open class DocumentReferenceContextRelated: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceContextRelated" }
	}

    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var ref: Reference?
    public func upsert(ref: Reference?) {
        upsert(prop: &self.ref, val: ref)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "identifier"
        case ref = "ref"
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

        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.ref = try container.decodeIfPresent(Reference.self, forKey: .ref)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.ref, forKey: .ref)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ref"] {
				presentKeys.insert("ref")
				if let val = exist as? FHIRJSON {
					upsert(ref: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "ref", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let ref = self.ref {
			json["ref"] = ref.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceContextRelated.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceContextRelated. Will return empty instance: \(error))")
		}
		return DocumentReferenceContextRelated.init()
	}
}


/**
 *  Relationships to other documents.
 *
 *  Relationships that this document has with other document references that already exist.
 */
open class DocumentReferenceRelatesTo: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentReferenceRelatesTo" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, target: Reference) {
        self.init()
        self.code = code
        self.target = target
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case target = "target"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.target, forKey: .target)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? String {
					self.code = val
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					upsert(target: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "target"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DocumentReferenceRelatesTo.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DocumentReferenceRelatesTo. Will return empty instance: \(error))")
		}
		return DocumentReferenceRelatesTo.init()
	}
}

