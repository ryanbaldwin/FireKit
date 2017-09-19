//
//  StructureDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/StructureDefinition) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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
        self.code.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .code) ?? [])
        self.constrainedType = try container.decodeIfPresent(String.self, forKey: .constrainedType)
        self.contact.append(objectsIn: try container.decodeIfPresent([StructureDefinitionContact].self, forKey: .contact) ?? [])
        self.context.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .context) ?? [])
        self.contextType = try container.decodeIfPresent(String.self, forKey: .contextType)
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.differential = try container.decodeIfPresent(StructureDefinitionDifferential.self, forKey: .differential)
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.fhirVersion = try container.decodeIfPresent(String.self, forKey: .fhirVersion)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.mapping.append(objectsIn: try container.decodeIfPresent([StructureDefinitionMapping].self, forKey: .mapping) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.snapshot = try container.decodeIfPresent(StructureDefinitionSnapshot.self, forKey: .snapshot)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abstract.value, forKey: .abstract)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encode(Array(self.code), forKey: .code)
        try container.encodeIfPresent(self.constrainedType, forKey: .constrainedType)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encode(Array(self.context), forKey: .context)
        try container.encodeIfPresent(self.contextType, forKey: .contextType)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.differential, forKey: .differential)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.fhirVersion, forKey: .fhirVersion)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encode(Array(self.mapping), forKey: .mapping)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.snapshot, forKey: .snapshot)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(Array(self.useContext), forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(StructureDefinition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy StructureDefinition. Will return empty instance: \(error))")
		}
		return StructureDefinition.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? StructureDefinition else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        abstract.value = o.abstract.value
        base = o.base
        FireKit.populateList(&self.code, from: o.code)
        constrainedType = o.constrainedType
        FireKit.populateList(&self.contact, from: o.contact)
        FireKit.populateList(&self.context, from: o.context)
        contextType = o.contextType
        copyright = o.copyright
        date = o.date
        description_fhir = o.description_fhir
        FireKit.populate(&self.differential, from: o.differential)
        display = o.display
        experimental.value = o.experimental.value
        fhirVersion = o.fhirVersion
        FireKit.populateList(&self.identifier, from: o.identifier)
        kind = o.kind
        FireKit.populateList(&self.mapping, from: o.mapping)
        name = o.name
        publisher = o.publisher
        requirements = o.requirements
        FireKit.populate(&self.snapshot, from: o.snapshot)
        status = o.status
        url = o.url
        FireKit.populateList(&self.useContext, from: o.useContext)
        version = o.version
    }
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
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(StructureDefinitionContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy StructureDefinitionContact. Will return empty instance: \(error))")
		}
		return StructureDefinitionContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? StructureDefinitionContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        name = o.name
        FireKit.populateList(&self.telecom, from: o.telecom)
    }
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

        self.element.append(objectsIn: try container.decodeIfPresent([ElementDefinition].self, forKey: .element) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.element), forKey: .element)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(StructureDefinitionDifferential.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy StructureDefinitionDifferential. Will return empty instance: \(error))")
		}
		return StructureDefinitionDifferential.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? StructureDefinitionDifferential else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.element, from: o.element)
    }
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

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(StructureDefinitionMapping.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy StructureDefinitionMapping. Will return empty instance: \(error))")
		}
		return StructureDefinitionMapping.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? StructureDefinitionMapping else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        comments = o.comments
        identity = o.identity
        name = o.name
        uri = o.uri
    }
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

        self.element.append(objectsIn: try container.decodeIfPresent([ElementDefinition].self, forKey: .element) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.element), forKey: .element)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(StructureDefinitionSnapshot.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy StructureDefinitionSnapshot. Will return empty instance: \(error))")
		}
		return StructureDefinitionSnapshot.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? StructureDefinitionSnapshot else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.element, from: o.element)
    }
}

