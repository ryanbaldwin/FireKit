//
//  ImplementationGuide.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImplementationGuide) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A set of rules about how FHIR is used.
 *
 *  A set of rules or how FHIR is used to solve a particular problem. This resource is used to gather all the parts of
 *  an implementation guide into a logical whole, and to publish a computable definition of all the parts.
 */
open class ImplementationGuide: DomainResource {
	override open class var resourceType: String {
		get { return "ImplementationGuide" }
	}

    public let binary = RealmSwift.List<RealmString>()
    public let contact = RealmSwift.List<ImplementationGuideContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    public let dependency = RealmSwift.List<ImplementationGuideDependency>()
    @objc public dynamic var description_fhir: String?
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var fhirVersion: String?
    public let global = RealmSwift.List<ImplementationGuideGlobal>()
    @objc public dynamic var name: String?
    public let package = RealmSwift.List<ImplementationGuidePackage>()
    @objc public dynamic var page: ImplementationGuidePage?
    public func upsert(page: ImplementationGuidePage?) {
        upsert(prop: &self.page, val: page)
    }
    @objc public dynamic var publisher: String?
    @objc public dynamic var status: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, package: [ImplementationGuidePackage], page: ImplementationGuidePage, status: String, url: String) {
        self.init()
        self.name = name
        self.package.append(objectsIn: package)
        self.page = page
        self.status = status
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case binary = "binary"
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case dependency = "dependency"
        case description_fhir = "description"
        case experimental = "experimental"
        case fhirVersion = "fhirVersion"
        case global = "global"
        case name = "name"
        case package = "package"
        case page = "page"
        case publisher = "publisher"
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

        self.binary.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .binary) ?? [])
        self.contact.append(objectsIn: try container.decodeIfPresent([ImplementationGuideContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.dependency.append(objectsIn: try container.decodeIfPresent([ImplementationGuideDependency].self, forKey: .dependency) ?? [])
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.fhirVersion = try container.decodeIfPresent(String.self, forKey: .fhirVersion)
        self.global.append(objectsIn: try container.decodeIfPresent([ImplementationGuideGlobal].self, forKey: .global) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.package.append(objectsIn: try container.decodeIfPresent([ImplementationGuidePackage].self, forKey: .package) ?? [])
        self.page = try container.decodeIfPresent(ImplementationGuidePage.self, forKey: .page)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.binary), forKey: .binary)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encode(Array(self.dependency), forKey: .dependency)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.fhirVersion, forKey: .fhirVersion)
        try container.encode(Array(self.global), forKey: .global)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.package), forKey: .package)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(Array(self.useContext), forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImplementationGuide.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuide. Will return empty instance: \(error))")
		}
		return ImplementationGuide.init()
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ImplementationGuideContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuideContact" }
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
			let clone = try JSONDecoder().decode(ImplementationGuideContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuideContact. Will return empty instance: \(error))")
		}
		return ImplementationGuideContact.init()
	}
}


/**
 *  Another Implementation guide this depends on.
 *
 *  Another implementation guide that this implementation depends on. Typically, an implementation guide uses value
 *  sets, profiles etc.defined in other implementation guides.
 */
open class ImplementationGuideDependency: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuideDependency" }
	}

    @objc public dynamic var type: String?
    @objc public dynamic var uri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String, uri: String) {
        self.init()
        self.type = type
        self.uri = uri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case type = "type"
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

        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.uri = try container.decodeIfPresent(String.self, forKey: .uri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.uri, forKey: .uri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImplementationGuideDependency.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuideDependency. Will return empty instance: \(error))")
		}
		return ImplementationGuideDependency.init()
	}
}


/**
 *  Profiles that apply globally.
 *
 *  A set of profiles that all resources covered by this implementation guide must conform to.
 */
open class ImplementationGuideGlobal: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuideGlobal" }
	}

    @objc public dynamic var profile: Reference?
    public func upsert(profile: Reference?) {
        upsert(prop: &self.profile, val: profile)
    }
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(profile: Reference, type: String) {
        self.init()
        self.profile = profile
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case profile = "profile"
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

        self.profile = try container.decodeIfPresent(Reference.self, forKey: .profile)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.profile, forKey: .profile)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImplementationGuideGlobal.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuideGlobal. Will return empty instance: \(error))")
		}
		return ImplementationGuideGlobal.init()
	}
}


/**
 *  Group of resources as used in .page.package.
 *
 *  A logical group of resources. Logical groups can be used when building pages.
 */
open class ImplementationGuidePackage: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuidePackage" }
	}

    @objc public dynamic var description_fhir: String?
    @objc public dynamic var name: String?
    public let resource = RealmSwift.List<ImplementationGuidePackageResource>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, resource: [ImplementationGuidePackageResource]) {
        self.init()
        self.name = name
        self.resource.append(objectsIn: resource)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case name = "name"
        case resource = "resource"
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
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.resource.append(objectsIn: try container.decodeIfPresent([ImplementationGuidePackageResource].self, forKey: .resource) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.resource), forKey: .resource)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImplementationGuidePackage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuidePackage. Will return empty instance: \(error))")
		}
		return ImplementationGuidePackage.init()
	}
}


/**
 *  Resource in the implementation guide.
 *
 *  A resource that is part of the implementation guide. Conformance resources (value set, structure definition,
 *  conformance statements etc.) are obvious candidates for inclusion, but any kind of resource can be included as an
 *  example resource.
 */
open class ImplementationGuidePackageResource: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuidePackageResource" }
	}

    @objc public dynamic var acronym: String?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var exampleFor: Reference?
    public func upsert(exampleFor: Reference?) {
        upsert(prop: &self.exampleFor, val: exampleFor)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var purpose: String?
    @objc public dynamic var sourceReference: Reference?
    public func upsert(sourceReference: Reference?) {
        upsert(prop: &self.sourceReference, val: sourceReference)
    }
    @objc public dynamic var sourceUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(purpose: String, sourceReference: Reference, sourceUri: String) {
        self.init()
        self.purpose = purpose
        self.sourceReference = sourceReference
        self.sourceUri = sourceUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case acronym = "acronym"
        case description_fhir = "description"
        case exampleFor = "exampleFor"
        case name = "name"
        case purpose = "purpose"
        case sourceReference = "sourceReference"
        case sourceUri = "sourceUri"
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

        self.acronym = try container.decodeIfPresent(String.self, forKey: .acronym)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.exampleFor = try container.decodeIfPresent(Reference.self, forKey: .exampleFor)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.purpose = try container.decodeIfPresent(String.self, forKey: .purpose)
        self.sourceReference = try container.decodeIfPresent(Reference.self, forKey: .sourceReference)
        self.sourceUri = try container.decodeIfPresent(String.self, forKey: .sourceUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.acronym, forKey: .acronym)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.exampleFor, forKey: .exampleFor)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.purpose, forKey: .purpose)
        try container.encodeIfPresent(self.sourceReference, forKey: .sourceReference)
        try container.encodeIfPresent(self.sourceUri, forKey: .sourceUri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImplementationGuidePackageResource.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuidePackageResource. Will return empty instance: \(error))")
		}
		return ImplementationGuidePackageResource.init()
	}
}


/**
 *  Page/Section in the Guide.
 *
 *  A page / section in the implementation guide. The root page is the implementation guide home page.
 */
open class ImplementationGuidePage: BackboneElement {
	override open class var resourceType: String {
		get { return "ImplementationGuidePage" }
	}

    @objc public dynamic var format: String?
    @objc public dynamic var kind: String?
    @objc public dynamic var name: String?
    public let package = RealmSwift.List<RealmString>()
    public let page = RealmSwift.List<ImplementationGuidePage>()
    @objc public dynamic var source: String?
    public let type = RealmSwift.List<RealmString>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(kind: String, name: String, source: String) {
        self.init()
        self.kind = kind
        self.name = name
        self.source = source
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case format = "format"
        case kind = "kind"
        case name = "name"
        case package = "package"
        case page = "page"
        case source = "source"
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

        self.format = try container.decodeIfPresent(String.self, forKey: .format)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.package.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .package) ?? [])
        self.page.append(objectsIn: try container.decodeIfPresent([ImplementationGuidePage].self, forKey: .page) ?? [])
        self.source = try container.decodeIfPresent(String.self, forKey: .source)
        self.type.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.package), forKey: .package)
        try container.encode(Array(self.page), forKey: .page)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encode(Array(self.type), forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImplementationGuidePage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImplementationGuidePage. Will return empty instance: \(error))")
		}
		return ImplementationGuidePage.init()
	}
}

