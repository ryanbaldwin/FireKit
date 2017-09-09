//
//  DocumentManifest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DocumentManifest) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A manifest that defines a set of documents.
 */
open class DocumentManifest: DomainResource {
	override open class var resourceType: String {
		get { return "DocumentManifest" }
	}

    public let author = RealmSwift.List<Reference>()
    public let content = RealmSwift.List<DocumentManifestContent>()
    @objc public dynamic var created: DateTime?
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var masterIdentifier: Identifier?
    public func upsert(masterIdentifier: Identifier?) {
        upsert(prop: &self.masterIdentifier, val: masterIdentifier)
    }
    public let recipient = RealmSwift.List<Reference>()
    public let related = RealmSwift.List<DocumentManifestRelated>()
    @objc public dynamic var source: String?
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
    public convenience init(content: [DocumentManifestContent], status: String) {
        self.init()
        self.content.append(objectsIn: content)
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case created = "created"
        case description_fhir = "description"
        case identifier = "identifier"
        case masterIdentifier = "masterIdentifier"
        case recipient = "recipient"
        case related = "related"
        case source = "source"
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
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.author.flatMap { $0 }, forKey: .author)
        try container.encode(self.content.flatMap { $0 }, forKey: .content)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.masterIdentifier, forKey: .masterIdentifier)
        try container.encode(self.recipient.flatMap { $0 }, forKey: .recipient)
        try container.encode(self.related.flatMap { $0 }, forKey: .related)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["content"] {
				presentKeys.insert("content")
				if let val = exist as? [FHIRJSON] {
					if let vals = DocumentManifestContent.instantiate(fromArray: val, owner: self) as? [DocumentManifestContent] {
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
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
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
			if let exist = js["masterIdentifier"] {
				presentKeys.insert("masterIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(masterIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "masterIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["recipient"] {
				presentKeys.insert("recipient")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.recipient) }
						self.recipient.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "recipient", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["related"] {
				presentKeys.insert("related")
				if let val = exist as? [FHIRJSON] {
					if let vals = DocumentManifestRelated.instantiate(fromArray: val, owner: self) as? [DocumentManifestRelated] {
						if let realm = self.realm { realm.delete(self.related) }
						self.related.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "related", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? String {
					self.source = val
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: String.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if author.count > 0 {
			json["author"] = Array(author.map() { $0.asJSON() })
		}
		if content.count > 0 {
			json["content"] = Array(content.map() { $0.asJSON() })
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let masterIdentifier = self.masterIdentifier {
			json["masterIdentifier"] = masterIdentifier.asJSON()
		}
		if recipient.count > 0 {
			json["recipient"] = Array(recipient.map() { $0.asJSON() })
		}
		if related.count > 0 {
			json["related"] = Array(related.map() { $0.asJSON() })
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
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  The items included.
 *
 *  The list of Documents included in the manifest.
 */
open class DocumentManifestContent: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentManifestContent" }
	}

    @objc public dynamic var pAttachment: Attachment?
    public func upsert(pAttachment: Attachment?) {
        upsert(prop: &self.pAttachment, val: pAttachment)
    }
    @objc public dynamic var pReference: Reference?
    public func upsert(pReference: Reference?) {
        upsert(prop: &self.pReference, val: pReference)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(pAttachment: Attachment, pReference: Reference) {
        self.init()
        self.pAttachment = pAttachment
        self.pReference = pReference
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case pAttachment = "pAttachment"
        case pReference = "pReference"
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.pAttachment, forKey: .pAttachment)
        try container.encodeIfPresent(self.pReference, forKey: .pReference)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["pAttachment"] {
				presentKeys.insert("pAttachment")
				if let val = exist as? FHIRJSON {
					upsert(pAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "pAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["pReference"] {
				presentKeys.insert("pReference")
				if let val = exist as? FHIRJSON {
					upsert(pReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "pReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.pAttachment && nil == self.pReference {
				errors.append(FHIRJSONError(key: "p*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let pAttachment = self.pAttachment {
			json["pAttachment"] = pAttachment.asJSON()
		}
		if let pReference = self.pReference {
			json["pReference"] = pReference.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Related things.
 *
 *  Related identifiers or resources associated with the DocumentManifest.
 */
open class DocumentManifestRelated: BackboneElement {
	override open class var resourceType: String {
		get { return "DocumentManifestRelated" }
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
}

