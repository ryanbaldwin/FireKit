//
//  StructureDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/StructureDefinition) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Structural Definition.
 *
 *  A definition of a FHIR structure. This resource is used to describe the underlying resources, data types defined in
 *  FHIR, and also for describing extensions, and constraints on resources and data types.
 */
open class StructureDefinition: DomainResource {
	override open class var resourceType: String {
		get { return "StructureDefinition" }
	}

    public let abstract = RealmOptional<Bool>()
    @objc public dynamic var base: String?
    public let code = RealmSwift.List<Coding>()
    @objc public dynamic var constrainedType: String?
    public let contact = RealmSwift.List<StructureDefinitionContact>()
    public let context = RealmSwift.List<RealmString>()
    @objc public dynamic var contextType: String?
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var differential: StructureDefinitionDifferential?
    public func upsert(differential: StructureDefinitionDifferential?) {
        upsert(prop: &self.differential, val: differential)
    }
    @objc public dynamic var display: String?
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var fhirVersion: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var kind: String?
    public let mapping = RealmSwift.List<StructureDefinitionMapping>()
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var snapshot: StructureDefinitionSnapshot?
    public func upsert(snapshot: StructureDefinitionSnapshot?) {
        upsert(prop: &self.snapshot, val: snapshot)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(abstract: Bool, kind: String, name: String, status: String, url: String) {
        self.init()
        self.abstract.value = abstract
        self.kind = kind
        self.name = name
        self.status = status
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case abstract = "abstract"
        case base = "base"
        case code = "code"
        case constrainedType = "constrainedType"
        case contact = "contact"
        case context = "context"
        case contextType = "contextType"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case differential = "differential"
        case display = "display"
        case experimental = "experimental"
        case fhirVersion = "fhirVersion"
        case identifier = "identifier"
        case kind = "kind"
        case mapping = "mapping"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case snapshot = "snapshot"
        case status = "status"
        case url = "url"
        case useContext = "useContext"
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
        self.abstract.value = try container.decodeIfPresent(Bool.self, forKey: .abstract)
        self.base = try container.decodeIfPresent(String.self, forKey: .base)
        self.constrainedType = try container.decodeIfPresent(String.self, forKey: .constrainedType)
        self.contextType = try container.decodeIfPresent(String.self, forKey: .contextType)
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.fhirVersion = try container.decodeIfPresent(String.self, forKey: .fhirVersion)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abstract.value, forKey: .abstract)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encode(self.code.flatMap { $0 }, forKey: .code)
        try container.encodeIfPresent(self.constrainedType, forKey: .constrainedType)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encode(self.context.flatMap { $0.value }, forKey: .context)
        try container.encodeIfPresent(self.contextType, forKey: .contextType)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.differential, forKey: .differential)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.fhirVersion, forKey: .fhirVersion)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encode(self.mapping.flatMap { $0 }, forKey: .mapping)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.snapshot, forKey: .snapshot)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(self.useContext.flatMap { $0 }, forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["abstract"] {
				presentKeys.insert("abstract")
				if let val = exist as? Bool {
					self.abstract.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "abstract", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "abstract"))
			}
			if let exist = js["base"] {
				presentKeys.insert("base")
				if let val = exist as? String {
					self.base = val
				}
				else {
					errors.append(FHIRJSONError(key: "base", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.code) }
						self.code.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["constrainedType"] {
				presentKeys.insert("constrainedType")
				if let val = exist as? String {
					self.constrainedType = val
				}
				else {
					errors.append(FHIRJSONError(key: "constrainedType", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = StructureDefinitionContact.instantiate(fromArray: val, owner: self) as? [StructureDefinitionContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["context"] {
				presentKeys.insert("context")
				if let val = exist as? [String] {
					self.context.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "context", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["contextType"] {
				presentKeys.insert("contextType")
				if let val = exist as? String {
					self.contextType = val
				}
				else {
					errors.append(FHIRJSONError(key: "contextType", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["copyright"] {
				presentKeys.insert("copyright")
				if let val = exist as? String {
					self.copyright = val
				}
				else {
					errors.append(FHIRJSONError(key: "copyright", wants: String.self, has: type(of: exist)))
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
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["differential"] {
				presentKeys.insert("differential")
				if let val = exist as? FHIRJSON {
					upsert(differential: StructureDefinitionDifferential(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "differential", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["display"] {
				presentKeys.insert("display")
				if let val = exist as? String {
					self.display = val
				}
				else {
					errors.append(FHIRJSONError(key: "display", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["experimental"] {
				presentKeys.insert("experimental")
				if let val = exist as? Bool {
					self.experimental.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "experimental", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["fhirVersion"] {
				presentKeys.insert("fhirVersion")
				if let val = exist as? String {
					self.fhirVersion = val
				}
				else {
					errors.append(FHIRJSONError(key: "fhirVersion", wants: String.self, has: type(of: exist)))
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
			if let exist = js["kind"] {
				presentKeys.insert("kind")
				if let val = exist as? String {
					self.kind = val
				}
				else {
					errors.append(FHIRJSONError(key: "kind", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "kind"))
			}
			if let exist = js["mapping"] {
				presentKeys.insert("mapping")
				if let val = exist as? [FHIRJSON] {
					if let vals = StructureDefinitionMapping.instantiate(fromArray: val, owner: self) as? [StructureDefinitionMapping] {
						if let realm = self.realm { realm.delete(self.mapping) }
						self.mapping.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "mapping", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "name"))
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
			if let exist = js["requirements"] {
				presentKeys.insert("requirements")
				if let val = exist as? String {
					self.requirements = val
				}
				else {
					errors.append(FHIRJSONError(key: "requirements", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["snapshot"] {
				presentKeys.insert("snapshot")
				if let val = exist as? FHIRJSON {
					upsert(snapshot: StructureDefinitionSnapshot(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "snapshot", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "url"))
			}
			if let exist = js["useContext"] {
				presentKeys.insert("useContext")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.useContext) }
						self.useContext.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "useContext", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if let abstract = self.abstract.value {
			json["abstract"] = abstract.asJSON()
		}
		if let base = self.base {
			json["base"] = base.asJSON()
		}
		if code.count > 0 {
			json["code"] = Array(code.map() { $0.asJSON() })
		}
		if let constrainedType = self.constrainedType {
			json["constrainedType"] = constrainedType.asJSON()
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if context.count > 0 {
			json["context"] = Array(context.map() { $0.value })
		}
		if let contextType = self.contextType {
			json["contextType"] = contextType.asJSON()
		}
		if let copyright = self.copyright {
			json["copyright"] = copyright.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let differential = self.differential {
			json["differential"] = differential.asJSON()
		}
		if let display = self.display {
			json["display"] = display.asJSON()
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let fhirVersion = self.fhirVersion {
			json["fhirVersion"] = fhirVersion.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if mapping.count > 0 {
			json["mapping"] = Array(mapping.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let requirements = self.requirements {
			json["requirements"] = requirements.asJSON()
		}
		if let snapshot = self.snapshot {
			json["snapshot"] = snapshot.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if useContext.count > 0 {
			json["useContext"] = Array(useContext.map() { $0.asJSON() })
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class StructureDefinitionContact: BackboneElement {
	override open class var resourceType: String {
		get { return "StructureDefinitionContact" }
	}

    @objc public dynamic var name: String?
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
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
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.telecom.flatMap { $0 }, forKey: .telecom)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
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
		
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}


/**
 *  Differential view of the structure.
 *
 *  A differential view is expressed relative to the base StructureDefinition - a statement of differences that it
 *  applies.
 */
open class StructureDefinitionDifferential: BackboneElement {
	override open class var resourceType: String {
		get { return "StructureDefinitionDifferential" }
	}

    public let element = RealmSwift.List<ElementDefinition>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(element: [ElementDefinition]) {
        self.init()
        self.element.append(objectsIn: element)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case element = "element"
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
        try container.encode(self.element.flatMap { $0 }, forKey: .element)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["element"] {
				presentKeys.insert("element")
				if let val = exist as? [FHIRJSON] {
					if let vals = ElementDefinition.instantiate(fromArray: val, owner: self) as? [ElementDefinition] {
						if let realm = self.realm { realm.delete(self.element) }
						self.element.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "element", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "element"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if element.count > 0 {
			json["element"] = Array(element.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}


/**
 *  External specification that the content is mapped to.
 *
 *  An external specification that the content is mapped to.
 */
open class StructureDefinitionMapping: BackboneElement {
	override open class var resourceType: String {
		get { return "StructureDefinitionMapping" }
	}

    @objc public dynamic var comments: String?
    @objc public dynamic var identity: String?
    @objc public dynamic var name: String?
    @objc public dynamic var uri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identity: String) {
        self.init()
        self.identity = identity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case comments = "comments"
        case identity = "identity"
        case name = "name"
        case uri = "uri"
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
        self.comments = try container.decodeIfPresent(String.self, forKey: .comments)
        self.identity = try container.decodeIfPresent(String.self, forKey: .identity)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.uri = try container.decodeIfPresent(String.self, forKey: .uri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.comments, forKey: .comments)
        try container.encodeIfPresent(self.identity, forKey: .identity)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.uri, forKey: .uri)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["comments"] {
				presentKeys.insert("comments")
				if let val = exist as? String {
					self.comments = val
				}
				else {
					errors.append(FHIRJSONError(key: "comments", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identity"] {
				presentKeys.insert("identity")
				if let val = exist as? String {
					self.identity = val
				}
				else {
					errors.append(FHIRJSONError(key: "identity", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identity"))
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["uri"] {
				presentKeys.insert("uri")
				if let val = exist as? String {
					self.uri = val
				}
				else {
					errors.append(FHIRJSONError(key: "uri", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let comments = self.comments {
			json["comments"] = comments.asJSON()
		}
		if let identity = self.identity {
			json["identity"] = identity.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let uri = self.uri {
			json["uri"] = uri.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Snapshot view of the structure.
 *
 *  A snapshot view is expressed in a stand alone form that can be used and interpreted without considering the base
 *  StructureDefinition.
 */
open class StructureDefinitionSnapshot: BackboneElement {
	override open class var resourceType: String {
		get { return "StructureDefinitionSnapshot" }
	}

    public let element = RealmSwift.List<ElementDefinition>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(element: [ElementDefinition]) {
        self.init()
        self.element.append(objectsIn: element)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case element = "element"
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
        try container.encode(self.element.flatMap { $0 }, forKey: .element)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["element"] {
				presentKeys.insert("element")
				if let val = exist as? [FHIRJSON] {
					if let vals = ElementDefinition.instantiate(fromArray: val, owner: self) as? [ElementDefinition] {
						if let realm = self.realm { realm.delete(self.element) }
						self.element.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "element", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "element"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if element.count > 0 {
			json["element"] = Array(element.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}

