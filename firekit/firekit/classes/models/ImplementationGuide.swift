//
//  ImplementationGuide.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImplementationGuide) on 2017-09-10.
//  2017, SMART Health IT.
//

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
        try container.encode(self.binary.flatMap { $0.value }, forKey: .binary)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encode(self.dependency.flatMap { $0 }, forKey: .dependency)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.fhirVersion, forKey: .fhirVersion)
        try container.encode(self.global.flatMap { $0 }, forKey: .global)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.package.flatMap { $0 }, forKey: .package)
        try container.encodeIfPresent(self.page, forKey: .page)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(self.useContext.flatMap { $0 }, forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["binary"] {
				presentKeys.insert("binary")
				if let val = exist as? [String] {
					self.binary.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "binary", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuideContact.instantiate(fromArray: val, owner: self) as? [ImplementationGuideContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["dependency"] {
				presentKeys.insert("dependency")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuideDependency.instantiate(fromArray: val, owner: self) as? [ImplementationGuideDependency] {
						if let realm = self.realm { realm.delete(self.dependency) }
						self.dependency.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dependency", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["global"] {
				presentKeys.insert("global")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuideGlobal.instantiate(fromArray: val, owner: self) as? [ImplementationGuideGlobal] {
						if let realm = self.realm { realm.delete(self.global) }
						self.global.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "global", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["package"] {
				presentKeys.insert("package")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuidePackage.instantiate(fromArray: val, owner: self) as? [ImplementationGuidePackage] {
						if let realm = self.realm { realm.delete(self.package) }
						self.package.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "package", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "package"))
			}
			if let exist = js["page"] {
				presentKeys.insert("page")
				if let val = exist as? FHIRJSON {
					upsert(page: ImplementationGuidePage(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "page", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "page"))
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
		
		if binary.count > 0 {
			json["binary"] = Array(binary.map() { $0.value })
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let copyright = self.copyright {
			json["copyright"] = copyright.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if dependency.count > 0 {
			json["dependency"] = Array(dependency.map() { $0.asJSON() })
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let fhirVersion = self.fhirVersion {
			json["fhirVersion"] = fhirVersion.asJSON()
		}
		if global.count > 0 {
			json["global"] = Array(global.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if package.count > 0 {
			json["package"] = Array(package.map() { $0.asJSON() })
		}
		if let page = self.page {
			json["page"] = page.asJSON()
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
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
			else {
				errors.append(FHIRJSONError(key: "uri"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let uri = self.uri {
			json["uri"] = uri.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? FHIRJSON {
					upsert(profile: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "profile"))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let profile = self.profile {
			json["profile"] = profile.asJSON()
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
        try container.encode(self.resource.flatMap { $0 }, forKey: .resource)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
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
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuidePackageResource.instantiate(fromArray: val, owner: self) as? [ImplementationGuidePackageResource] {
						if let realm = self.realm { realm.delete(self.resource) }
						self.resource.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "resource"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if resource.count > 0 {
			json["resource"] = Array(resource.map() { $0.asJSON() })
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["acronym"] {
				presentKeys.insert("acronym")
				if let val = exist as? String {
					self.acronym = val
				}
				else {
					errors.append(FHIRJSONError(key: "acronym", wants: String.self, has: type(of: exist)))
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
			if let exist = js["exampleFor"] {
				presentKeys.insert("exampleFor")
				if let val = exist as? FHIRJSON {
					upsert(exampleFor: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleFor", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["purpose"] {
				presentKeys.insert("purpose")
				if let val = exist as? String {
					self.purpose = val
				}
				else {
					errors.append(FHIRJSONError(key: "purpose", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "purpose"))
			}
			if let exist = js["sourceReference"] {
				presentKeys.insert("sourceReference")
				if let val = exist as? FHIRJSON {
					upsert(sourceReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "sourceReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourceUri"] {
				presentKeys.insert("sourceUri")
				if let val = exist as? String {
					self.sourceUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "sourceUri", wants: String.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.sourceUri && nil == self.sourceReference {
				errors.append(FHIRJSONError(key: "source*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let acronym = self.acronym {
			json["acronym"] = acronym.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let exampleFor = self.exampleFor {
			json["exampleFor"] = exampleFor.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let purpose = self.purpose {
			json["purpose"] = purpose.asJSON()
		}
		if let sourceReference = self.sourceReference {
			json["sourceReference"] = sourceReference.asJSON()
		}
		if let sourceUri = self.sourceUri {
			json["sourceUri"] = sourceUri.asJSON()
		}
		
		return json
	}
*/
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
        try container.encode(self.package.flatMap { $0.value }, forKey: .package)
        try container.encode(self.page.flatMap { $0 }, forKey: .page)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encode(self.type.flatMap { $0.value }, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["format"] {
				presentKeys.insert("format")
				if let val = exist as? String {
					self.format = val
				}
				else {
					errors.append(FHIRJSONError(key: "format", wants: String.self, has: type(of: exist)))
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
			if let exist = js["package"] {
				presentKeys.insert("package")
				if let val = exist as? [String] {
					self.package.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "package", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["page"] {
				presentKeys.insert("page")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImplementationGuidePage.instantiate(fromArray: val, owner: self) as? [ImplementationGuidePage] {
						if let realm = self.realm { realm.delete(self.page) }
						self.page.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "page", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "source"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [String] {
					self.type.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<String>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let format = self.format {
			json["format"] = format.asJSON()
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if package.count > 0 {
			json["package"] = Array(package.map() { $0.value })
		}
		if page.count > 0 {
			json["page"] = Array(page.map() { $0.asJSON() })
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.value })
		}
		
		return json
	}
*/
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

