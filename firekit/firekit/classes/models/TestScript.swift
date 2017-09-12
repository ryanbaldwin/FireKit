//
//  TestScript.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/TestScript) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Describes a set of tests.
 *
 *  TestScript is a resource that specifies a suite of tests against a FHIR server implementation to determine
 *  compliance against the FHIR specification.
 */
open class TestScript: DomainResource {
	override open class var resourceType: String {
		get { return "TestScript" }
	}

    public let contact = RealmSwift.List<TestScriptContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let experimental = RealmOptional<Bool>()
    public let fixture = RealmSwift.List<TestScriptFixture>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var metadata: TestScriptMetadata?
    public func upsert(metadata: TestScriptMetadata?) {
        upsert(prop: &self.metadata, val: metadata)
    }
    public let multiserver = RealmOptional<Bool>()
    @objc public dynamic var name: String?
    public let profile = RealmSwift.List<Reference>()
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var setup: TestScriptSetup?
    public func upsert(setup: TestScriptSetup?) {
        upsert(prop: &self.setup, val: setup)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var teardown: TestScriptTeardown?
    public func upsert(teardown: TestScriptTeardown?) {
        upsert(prop: &self.teardown, val: teardown)
    }
    public let test = RealmSwift.List<TestScriptTest>()
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    public let variable = RealmSwift.List<TestScriptVariable>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, status: String, url: String) {
        self.init()
        self.name = name
        self.status = status
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case experimental = "experimental"
        case fixture = "fixture"
        case identifier = "identifier"
        case metadata = "metadata"
        case multiserver = "multiserver"
        case name = "name"
        case profile = "profile"
        case publisher = "publisher"
        case requirements = "requirements"
        case setup = "setup"
        case status = "status"
        case teardown = "teardown"
        case test = "test"
        case url = "url"
        case useContext = "useContext"
        case variable = "variable"
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

        self.contact.append(objectsIn: try container.decodeIfPresent([TestScriptContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.fixture.append(objectsIn: try container.decodeIfPresent([TestScriptFixture].self, forKey: .fixture) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.metadata = try container.decodeIfPresent(TestScriptMetadata.self, forKey: .metadata)
        self.multiserver.value = try container.decodeIfPresent(Bool.self, forKey: .multiserver)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profile.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .profile) ?? [])
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.setup = try container.decodeIfPresent(TestScriptSetup.self, forKey: .setup)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.teardown = try container.decodeIfPresent(TestScriptTeardown.self, forKey: .teardown)
        self.test.append(objectsIn: try container.decodeIfPresent([TestScriptTest].self, forKey: .test) ?? [])
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
        self.variable.append(objectsIn: try container.decodeIfPresent([TestScriptVariable].self, forKey: .variable) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encode(Array(self.fixture), forKey: .fixture)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.multiserver.value, forKey: .multiserver)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.profile), forKey: .profile)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.setup, forKey: .setup)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.teardown, forKey: .teardown)
        try container.encode(Array(self.test), forKey: .test)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(Array(self.useContext), forKey: .useContext)
        try container.encode(Array(self.variable), forKey: .variable)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptContact.instantiate(fromArray: val, owner: self) as? [TestScriptContact] {
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
			if let exist = js["fixture"] {
				presentKeys.insert("fixture")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptFixture.instantiate(fromArray: val, owner: self) as? [TestScriptFixture] {
						if let realm = self.realm { realm.delete(self.fixture) }
						self.fixture.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "fixture", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["metadata"] {
				presentKeys.insert("metadata")
				if let val = exist as? FHIRJSON {
					upsert(metadata: TestScriptMetadata(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "metadata", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["multiserver"] {
				presentKeys.insert("multiserver")
				if let val = exist as? Bool {
					self.multiserver.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "multiserver", wants: Bool.self, has: type(of: exist)))
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
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.profile) }
						self.profile.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["requirements"] {
				presentKeys.insert("requirements")
				if let val = exist as? String {
					self.requirements = val
				}
				else {
					errors.append(FHIRJSONError(key: "requirements", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["setup"] {
				presentKeys.insert("setup")
				if let val = exist as? FHIRJSON {
					upsert(setup: TestScriptSetup(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "setup", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["teardown"] {
				presentKeys.insert("teardown")
				if let val = exist as? FHIRJSON {
					upsert(teardown: TestScriptTeardown(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "teardown", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["test"] {
				presentKeys.insert("test")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptTest.instantiate(fromArray: val, owner: self) as? [TestScriptTest] {
						if let realm = self.realm { realm.delete(self.test) }
						self.test.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "test", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
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
			if let exist = js["variable"] {
				presentKeys.insert("variable")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptVariable.instantiate(fromArray: val, owner: self) as? [TestScriptVariable] {
						if let realm = self.realm { realm.delete(self.variable) }
						self.variable.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "variable", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
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
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if fixture.count > 0 {
			json["fixture"] = Array(fixture.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let metadata = self.metadata {
			json["metadata"] = metadata.asJSON()
		}
		if let multiserver = self.multiserver.value {
			json["multiserver"] = multiserver.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if profile.count > 0 {
			json["profile"] = Array(profile.map() { $0.asJSON() })
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let requirements = self.requirements {
			json["requirements"] = requirements.asJSON()
		}
		if let setup = self.setup {
			json["setup"] = setup.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let teardown = self.teardown {
			json["teardown"] = teardown.asJSON()
		}
		if test.count > 0 {
			json["test"] = Array(test.map() { $0.asJSON() })
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if useContext.count > 0 {
			json["useContext"] = Array(useContext.map() { $0.asJSON() })
		}
		if variable.count > 0 {
			json["variable"] = Array(variable.map() { $0.asJSON() })
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
			let clone = try JSONDecoder().decode(TestScript.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScript. Will return empty instance: \(error))")
		}
		return TestScript.init()
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class TestScriptContact: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptContact" }
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
			let clone = try JSONDecoder().decode(TestScriptContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptContact. Will return empty instance: \(error))")
		}
		return TestScriptContact.init()
	}
}


/**
 *  Fixture in the test script - by reference (uri).
 *
 *  Fixture in the test script - by reference (uri). All fixtures are required for the test script to execute.
 */
open class TestScriptFixture: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptFixture" }
	}

    public let autocreate = RealmOptional<Bool>()
    public let autodelete = RealmOptional<Bool>()
    @objc public dynamic var resource: Reference?
    public func upsert(resource: Reference?) {
        upsert(prop: &self.resource, val: resource)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case autocreate = "autocreate"
        case autodelete = "autodelete"
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

        self.autocreate.value = try container.decodeIfPresent(Bool.self, forKey: .autocreate)
        self.autodelete.value = try container.decodeIfPresent(Bool.self, forKey: .autodelete)
        self.resource = try container.decodeIfPresent(Reference.self, forKey: .resource)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.autocreate.value, forKey: .autocreate)
        try container.encodeIfPresent(self.autodelete.value, forKey: .autodelete)
        try container.encodeIfPresent(self.resource, forKey: .resource)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["autocreate"] {
				presentKeys.insert("autocreate")
				if let val = exist as? Bool {
					self.autocreate.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "autocreate", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["autodelete"] {
				presentKeys.insert("autodelete")
				if let val = exist as? Bool {
					self.autodelete.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "autodelete", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? FHIRJSON {
					upsert(resource: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let autocreate = self.autocreate.value {
			json["autocreate"] = autocreate.asJSON()
		}
		if let autodelete = self.autodelete.value {
			json["autodelete"] = autodelete.asJSON()
		}
		if let resource = self.resource {
			json["resource"] = resource.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptFixture.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptFixture. Will return empty instance: \(error))")
		}
		return TestScriptFixture.init()
	}
}


/**
 *  Required capability that is assumed to function correctly on the FHIR server being tested.
 *
 *  The required capability must exist and are assumed to function correctly on the FHIR server being tested.
 */
open class TestScriptMetadata: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptMetadata" }
	}

    public let capability = RealmSwift.List<TestScriptMetadataCapability>()
    public let link = RealmSwift.List<TestScriptMetadataLink>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(capability: [TestScriptMetadataCapability]) {
        self.init()
        self.capability.append(objectsIn: capability)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case capability = "capability"
        case link = "link"
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

        self.capability.append(objectsIn: try container.decodeIfPresent([TestScriptMetadataCapability].self, forKey: .capability) ?? [])
        self.link.append(objectsIn: try container.decodeIfPresent([TestScriptMetadataLink].self, forKey: .link) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.capability), forKey: .capability)
        try container.encode(Array(self.link), forKey: .link)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["capability"] {
				presentKeys.insert("capability")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptMetadataCapability.instantiate(fromArray: val, owner: self) as? [TestScriptMetadataCapability] {
						if let realm = self.realm { realm.delete(self.capability) }
						self.capability.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "capability", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "capability"))
			}
			if let exist = js["link"] {
				presentKeys.insert("link")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptMetadataLink.instantiate(fromArray: val, owner: self) as? [TestScriptMetadataLink] {
						if let realm = self.realm { realm.delete(self.link) }
						self.link.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "link", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if capability.count > 0 {
			json["capability"] = Array(capability.map() { $0.asJSON() })
		}
		if link.count > 0 {
			json["link"] = Array(link.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptMetadata.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptMetadata. Will return empty instance: \(error))")
		}
		return TestScriptMetadata.init()
	}
}


/**
 *  Capabilities  that are assumed to function correctly on the FHIR server being tested.
 *
 *  Capabilities that must exist and are assumed to function correctly on the FHIR server being tested.
 */
open class TestScriptMetadataCapability: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptMetadataCapability" }
	}

    @objc public dynamic var conformance: Reference?
    public func upsert(conformance: Reference?) {
        upsert(prop: &self.conformance, val: conformance)
    }
    @objc public dynamic var description_fhir: String?
    public let destination = RealmOptional<Int>()
    public let link = RealmSwift.List<RealmString>()
    public let required = RealmOptional<Bool>()
    public let validated = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(conformance: Reference) {
        self.init()
        self.conformance = conformance
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case conformance = "conformance"
        case description_fhir = "description"
        case destination = "destination"
        case link = "link"
        case required = "required"
        case validated = "validated"
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

        self.conformance = try container.decodeIfPresent(Reference.self, forKey: .conformance)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.destination.value = try container.decodeIfPresent(Int.self, forKey: .destination)
        self.link.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .link) ?? [])
        self.required.value = try container.decodeIfPresent(Bool.self, forKey: .required)
        self.validated.value = try container.decodeIfPresent(Bool.self, forKey: .validated)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.conformance, forKey: .conformance)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.destination.value, forKey: .destination)
        try container.encode(Array(self.link), forKey: .link)
        try container.encodeIfPresent(self.required.value, forKey: .required)
        try container.encodeIfPresent(self.validated.value, forKey: .validated)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["conformance"] {
				presentKeys.insert("conformance")
				if let val = exist as? FHIRJSON {
					upsert(conformance: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "conformance", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "conformance"))
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
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? Int {
					self.destination.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["link"] {
				presentKeys.insert("link")
				if let val = exist as? [String] {
					self.link.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "link", wants: Array<String>.self, has: type(of: exist)))
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
			if let exist = js["validated"] {
				presentKeys.insert("validated")
				if let val = exist as? Bool {
					self.validated.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "validated", wants: Bool.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let conformance = self.conformance {
			json["conformance"] = conformance.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let destination = self.destination.value {
			json["destination"] = destination.asJSON()
		}
		if link.count > 0 {
			json["link"] = Array(link.map() { $0.value })
		}
		if let required = self.required.value {
			json["required"] = required.asJSON()
		}
		if let validated = self.validated.value {
			json["validated"] = validated.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptMetadataCapability.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptMetadataCapability. Will return empty instance: \(error))")
		}
		return TestScriptMetadataCapability.init()
	}
}


/**
 *  Links to the FHIR specification.
 *
 *  A link to the FHIR specification that this test is covering.
 */
open class TestScriptMetadataLink: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptMetadataLink" }
	}

    @objc public dynamic var description_fhir: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(url: String) {
        self.init()
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case url = "url"
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
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.url, forKey: .url)
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptMetadataLink.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptMetadataLink. Will return empty instance: \(error))")
		}
		return TestScriptMetadataLink.init()
	}
}


/**
 *  A series of required setup operations before tests are executed.
 */
open class TestScriptSetup: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptSetup" }
	}

    public let action = RealmSwift.List<TestScriptSetupAction>()
    @objc public dynamic var metadata: TestScriptMetadata?
    public func upsert(metadata: TestScriptMetadata?) {
        upsert(prop: &self.metadata, val: metadata)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: [TestScriptSetupAction]) {
        self.init()
        self.action.append(objectsIn: action)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case metadata = "metadata"
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

        self.action.append(objectsIn: try container.decodeIfPresent([TestScriptSetupAction].self, forKey: .action) ?? [])
        self.metadata = try container.decodeIfPresent(TestScriptMetadata.self, forKey: .metadata)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.action), forKey: .action)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptSetupAction.instantiate(fromArray: val, owner: self) as? [TestScriptSetupAction] {
						if let realm = self.realm { realm.delete(self.action) }
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "action"))
			}
			if let exist = js["metadata"] {
				presentKeys.insert("metadata")
				if let val = exist as? FHIRJSON {
					upsert(metadata: TestScriptMetadata(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "metadata", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		if let metadata = self.metadata {
			json["metadata"] = metadata.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptSetup.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptSetup. Will return empty instance: \(error))")
		}
		return TestScriptSetup.init()
	}
}


/**
 *  A setup operation or assert to perform.
 *
 *  Action would contain either an operation or an assertion.
 */
open class TestScriptSetupAction: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptSetupAction" }
	}

    @objc public dynamic var assert: TestScriptSetupActionAssert?
    public func upsert(assert: TestScriptSetupActionAssert?) {
        upsert(prop: &self.assert, val: assert)
    }
    @objc public dynamic var operation: TestScriptSetupActionOperation?
    public func upsert(operation: TestScriptSetupActionOperation?) {
        upsert(prop: &self.operation, val: operation)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case assert = "assert"
        case operation = "operation"
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

        self.assert = try container.decodeIfPresent(TestScriptSetupActionAssert.self, forKey: .assert)
        self.operation = try container.decodeIfPresent(TestScriptSetupActionOperation.self, forKey: .operation)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.assert, forKey: .assert)
        try container.encodeIfPresent(self.operation, forKey: .operation)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["assert"] {
				presentKeys.insert("assert")
				if let val = exist as? FHIRJSON {
					upsert(assert: TestScriptSetupActionAssert(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "assert", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["operation"] {
				presentKeys.insert("operation")
				if let val = exist as? FHIRJSON {
					upsert(operation: TestScriptSetupActionOperation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "operation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let assert = self.assert {
			json["assert"] = assert.asJSON()
		}
		if let operation = self.operation {
			json["operation"] = operation.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptSetupAction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptSetupAction. Will return empty instance: \(error))")
		}
		return TestScriptSetupAction.init()
	}
}


/**
 *  The assertion to perform.
 *
 *  Evaluates the results of previous operations to determine if the server under test behaves appropriately.
 */
open class TestScriptSetupActionAssert: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptSetupActionAssert" }
	}

    @objc public dynamic var compareToSourceId: String?
    @objc public dynamic var compareToSourcePath: String?
    @objc public dynamic var contentType: String?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var direction: String?
    @objc public dynamic var headerField: String?
    @objc public dynamic var label: String?
    @objc public dynamic var minimumId: String?
    public let navigationLinks = RealmOptional<Bool>()
    @objc public dynamic var operator_fhir: String?
    @objc public dynamic var path: String?
    @objc public dynamic var resource: String?
    @objc public dynamic var response: String?
    @objc public dynamic var responseCode: String?
    @objc public dynamic var sourceId: String?
    @objc public dynamic var validateProfileId: String?
    @objc public dynamic var value: String?
    public let warningOnly = RealmOptional<Bool>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case compareToSourceId = "compareToSourceId"
        case compareToSourcePath = "compareToSourcePath"
        case contentType = "contentType"
        case description_fhir = "description"
        case direction = "direction"
        case headerField = "headerField"
        case label = "label"
        case minimumId = "minimumId"
        case navigationLinks = "navigationLinks"
        case operator_fhir = "operator"
        case path = "path"
        case resource = "resource"
        case response = "response"
        case responseCode = "responseCode"
        case sourceId = "sourceId"
        case validateProfileId = "validateProfileId"
        case value = "value"
        case warningOnly = "warningOnly"
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

        self.compareToSourceId = try container.decodeIfPresent(String.self, forKey: .compareToSourceId)
        self.compareToSourcePath = try container.decodeIfPresent(String.self, forKey: .compareToSourcePath)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.direction = try container.decodeIfPresent(String.self, forKey: .direction)
        self.headerField = try container.decodeIfPresent(String.self, forKey: .headerField)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.minimumId = try container.decodeIfPresent(String.self, forKey: .minimumId)
        self.navigationLinks.value = try container.decodeIfPresent(Bool.self, forKey: .navigationLinks)
        self.operator_fhir = try container.decodeIfPresent(String.self, forKey: .operator_fhir)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.resource = try container.decodeIfPresent(String.self, forKey: .resource)
        self.response = try container.decodeIfPresent(String.self, forKey: .response)
        self.responseCode = try container.decodeIfPresent(String.self, forKey: .responseCode)
        self.sourceId = try container.decodeIfPresent(String.self, forKey: .sourceId)
        self.validateProfileId = try container.decodeIfPresent(String.self, forKey: .validateProfileId)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
        self.warningOnly.value = try container.decodeIfPresent(Bool.self, forKey: .warningOnly)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.compareToSourceId, forKey: .compareToSourceId)
        try container.encodeIfPresent(self.compareToSourcePath, forKey: .compareToSourcePath)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.direction, forKey: .direction)
        try container.encodeIfPresent(self.headerField, forKey: .headerField)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.minimumId, forKey: .minimumId)
        try container.encodeIfPresent(self.navigationLinks.value, forKey: .navigationLinks)
        try container.encodeIfPresent(self.operator_fhir, forKey: .operator_fhir)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.resource, forKey: .resource)
        try container.encodeIfPresent(self.response, forKey: .response)
        try container.encodeIfPresent(self.responseCode, forKey: .responseCode)
        try container.encodeIfPresent(self.sourceId, forKey: .sourceId)
        try container.encodeIfPresent(self.validateProfileId, forKey: .validateProfileId)
        try container.encodeIfPresent(self.value, forKey: .value)
        try container.encodeIfPresent(self.warningOnly.value, forKey: .warningOnly)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["compareToSourceId"] {
				presentKeys.insert("compareToSourceId")
				if let val = exist as? String {
					self.compareToSourceId = val
				}
				else {
					errors.append(FHIRJSONError(key: "compareToSourceId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["compareToSourcePath"] {
				presentKeys.insert("compareToSourcePath")
				if let val = exist as? String {
					self.compareToSourcePath = val
				}
				else {
					errors.append(FHIRJSONError(key: "compareToSourcePath", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentType"] {
				presentKeys.insert("contentType")
				if let val = exist as? String {
					self.contentType = val
				}
				else {
					errors.append(FHIRJSONError(key: "contentType", wants: String.self, has: type(of: exist)))
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
			if let exist = js["direction"] {
				presentKeys.insert("direction")
				if let val = exist as? String {
					self.direction = val
				}
				else {
					errors.append(FHIRJSONError(key: "direction", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["headerField"] {
				presentKeys.insert("headerField")
				if let val = exist as? String {
					self.headerField = val
				}
				else {
					errors.append(FHIRJSONError(key: "headerField", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["label"] {
				presentKeys.insert("label")
				if let val = exist as? String {
					self.label = val
				}
				else {
					errors.append(FHIRJSONError(key: "label", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minimumId"] {
				presentKeys.insert("minimumId")
				if let val = exist as? String {
					self.minimumId = val
				}
				else {
					errors.append(FHIRJSONError(key: "minimumId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["navigationLinks"] {
				presentKeys.insert("navigationLinks")
				if let val = exist as? Bool {
					self.navigationLinks.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "navigationLinks", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["operator"] {
				presentKeys.insert("operator")
				if let val = exist as? String {
					self.operator_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "operator", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["path"] {
				presentKeys.insert("path")
				if let val = exist as? String {
					self.path = val
				}
				else {
					errors.append(FHIRJSONError(key: "path", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? String {
					self.resource = val
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? String {
					self.response = val
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["responseCode"] {
				presentKeys.insert("responseCode")
				if let val = exist as? String {
					self.responseCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "responseCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourceId"] {
				presentKeys.insert("sourceId")
				if let val = exist as? String {
					self.sourceId = val
				}
				else {
					errors.append(FHIRJSONError(key: "sourceId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["validateProfileId"] {
				presentKeys.insert("validateProfileId")
				if let val = exist as? String {
					self.validateProfileId = val
				}
				else {
					errors.append(FHIRJSONError(key: "validateProfileId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["warningOnly"] {
				presentKeys.insert("warningOnly")
				if let val = exist as? Bool {
					self.warningOnly.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "warningOnly", wants: Bool.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let compareToSourceId = self.compareToSourceId {
			json["compareToSourceId"] = compareToSourceId.asJSON()
		}
		if let compareToSourcePath = self.compareToSourcePath {
			json["compareToSourcePath"] = compareToSourcePath.asJSON()
		}
		if let contentType = self.contentType {
			json["contentType"] = contentType.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let direction = self.direction {
			json["direction"] = direction.asJSON()
		}
		if let headerField = self.headerField {
			json["headerField"] = headerField.asJSON()
		}
		if let label = self.label {
			json["label"] = label.asJSON()
		}
		if let minimumId = self.minimumId {
			json["minimumId"] = minimumId.asJSON()
		}
		if let navigationLinks = self.navigationLinks.value {
			json["navigationLinks"] = navigationLinks.asJSON()
		}
		if let operator_fhir = self.operator_fhir {
			json["operator"] = operator_fhir.asJSON()
		}
		if let path = self.path {
			json["path"] = path.asJSON()
		}
		if let resource = self.resource {
			json["resource"] = resource.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		if let responseCode = self.responseCode {
			json["responseCode"] = responseCode.asJSON()
		}
		if let sourceId = self.sourceId {
			json["sourceId"] = sourceId.asJSON()
		}
		if let validateProfileId = self.validateProfileId {
			json["validateProfileId"] = validateProfileId.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		if let warningOnly = self.warningOnly.value {
			json["warningOnly"] = warningOnly.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptSetupActionAssert.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptSetupActionAssert. Will return empty instance: \(error))")
		}
		return TestScriptSetupActionAssert.init()
	}
}


/**
 *  The setup operation to perform.
 *
 *  The operation to perform.
 */
open class TestScriptSetupActionOperation: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptSetupActionOperation" }
	}

    @objc public dynamic var accept: String?
    @objc public dynamic var contentType: String?
    @objc public dynamic var description_fhir: String?
    public let destination = RealmOptional<Int>()
    public let encodeRequestUrl = RealmOptional<Bool>()
    @objc public dynamic var label: String?
    @objc public dynamic var params: String?
    public let requestHeader = RealmSwift.List<TestScriptSetupActionOperationRequestHeader>()
    @objc public dynamic var resource: String?
    @objc public dynamic var responseId: String?
    @objc public dynamic var sourceId: String?
    @objc public dynamic var targetId: String?
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var url: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case accept = "accept"
        case contentType = "contentType"
        case description_fhir = "description"
        case destination = "destination"
        case encodeRequestUrl = "encodeRequestUrl"
        case label = "label"
        case params = "params"
        case requestHeader = "requestHeader"
        case resource = "resource"
        case responseId = "responseId"
        case sourceId = "sourceId"
        case targetId = "targetId"
        case type = "type"
        case url = "url"
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

        self.accept = try container.decodeIfPresent(String.self, forKey: .accept)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.destination.value = try container.decodeIfPresent(Int.self, forKey: .destination)
        self.encodeRequestUrl.value = try container.decodeIfPresent(Bool.self, forKey: .encodeRequestUrl)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.params = try container.decodeIfPresent(String.self, forKey: .params)
        self.requestHeader.append(objectsIn: try container.decodeIfPresent([TestScriptSetupActionOperationRequestHeader].self, forKey: .requestHeader) ?? [])
        self.resource = try container.decodeIfPresent(String.self, forKey: .resource)
        self.responseId = try container.decodeIfPresent(String.self, forKey: .responseId)
        self.sourceId = try container.decodeIfPresent(String.self, forKey: .sourceId)
        self.targetId = try container.decodeIfPresent(String.self, forKey: .targetId)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.accept, forKey: .accept)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.destination.value, forKey: .destination)
        try container.encodeIfPresent(self.encodeRequestUrl.value, forKey: .encodeRequestUrl)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.params, forKey: .params)
        try container.encode(Array(self.requestHeader), forKey: .requestHeader)
        try container.encodeIfPresent(self.resource, forKey: .resource)
        try container.encodeIfPresent(self.responseId, forKey: .responseId)
        try container.encodeIfPresent(self.sourceId, forKey: .sourceId)
        try container.encodeIfPresent(self.targetId, forKey: .targetId)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["accept"] {
				presentKeys.insert("accept")
				if let val = exist as? String {
					self.accept = val
				}
				else {
					errors.append(FHIRJSONError(key: "accept", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentType"] {
				presentKeys.insert("contentType")
				if let val = exist as? String {
					self.contentType = val
				}
				else {
					errors.append(FHIRJSONError(key: "contentType", wants: String.self, has: type(of: exist)))
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
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? Int {
					self.destination.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["encodeRequestUrl"] {
				presentKeys.insert("encodeRequestUrl")
				if let val = exist as? Bool {
					self.encodeRequestUrl.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "encodeRequestUrl", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["label"] {
				presentKeys.insert("label")
				if let val = exist as? String {
					self.label = val
				}
				else {
					errors.append(FHIRJSONError(key: "label", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["params"] {
				presentKeys.insert("params")
				if let val = exist as? String {
					self.params = val
				}
				else {
					errors.append(FHIRJSONError(key: "params", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestHeader"] {
				presentKeys.insert("requestHeader")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptSetupActionOperationRequestHeader.instantiate(fromArray: val, owner: self) as? [TestScriptSetupActionOperationRequestHeader] {
						if let realm = self.realm { realm.delete(self.requestHeader) }
						self.requestHeader.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "requestHeader", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? String {
					self.resource = val
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["responseId"] {
				presentKeys.insert("responseId")
				if let val = exist as? String {
					self.responseId = val
				}
				else {
					errors.append(FHIRJSONError(key: "responseId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourceId"] {
				presentKeys.insert("sourceId")
				if let val = exist as? String {
					self.sourceId = val
				}
				else {
					errors.append(FHIRJSONError(key: "sourceId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["targetId"] {
				presentKeys.insert("targetId")
				if let val = exist as? String {
					self.targetId = val
				}
				else {
					errors.append(FHIRJSONError(key: "targetId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let accept = self.accept {
			json["accept"] = accept.asJSON()
		}
		if let contentType = self.contentType {
			json["contentType"] = contentType.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let destination = self.destination.value {
			json["destination"] = destination.asJSON()
		}
		if let encodeRequestUrl = self.encodeRequestUrl.value {
			json["encodeRequestUrl"] = encodeRequestUrl.asJSON()
		}
		if let label = self.label {
			json["label"] = label.asJSON()
		}
		if let params = self.params {
			json["params"] = params.asJSON()
		}
		if requestHeader.count > 0 {
			json["requestHeader"] = Array(requestHeader.map() { $0.asJSON() })
		}
		if let resource = self.resource {
			json["resource"] = resource.asJSON()
		}
		if let responseId = self.responseId {
			json["responseId"] = responseId.asJSON()
		}
		if let sourceId = self.sourceId {
			json["sourceId"] = sourceId.asJSON()
		}
		if let targetId = self.targetId {
			json["targetId"] = targetId.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptSetupActionOperation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptSetupActionOperation. Will return empty instance: \(error))")
		}
		return TestScriptSetupActionOperation.init()
	}
}


/**
 *  Each operation can have one ore more header elements.
 *
 *  Header elements would be used to set HTTP headers.
 */
open class TestScriptSetupActionOperationRequestHeader: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptSetupActionOperationRequestHeader" }
	}

    @objc public dynamic var field: String?
    @objc public dynamic var value: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(field: String, val: String) {
        self.init()
        self.field = field
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case field = "field"
        case value = "value"
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

        self.field = try container.decodeIfPresent(String.self, forKey: .field)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.field, forKey: .field)
        try container.encodeIfPresent(self.value, forKey: .value)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["field"] {
				presentKeys.insert("field")
				if let val = exist as? String {
					self.field = val
				}
				else {
					errors.append(FHIRJSONError(key: "field", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "field"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "value"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let field = self.field {
			json["field"] = field.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptSetupActionOperationRequestHeader.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptSetupActionOperationRequestHeader. Will return empty instance: \(error))")
		}
		return TestScriptSetupActionOperationRequestHeader.init()
	}
}


/**
 *  A series of required clean up steps.
 *
 *  A series of operations required to clean up after the all the tests are executed (successfully or otherwise).
 */
open class TestScriptTeardown: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptTeardown" }
	}

    public let action = RealmSwift.List<TestScriptTeardownAction>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: [TestScriptTeardownAction]) {
        self.init()
        self.action.append(objectsIn: action)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
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

        self.action.append(objectsIn: try container.decodeIfPresent([TestScriptTeardownAction].self, forKey: .action) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.action), forKey: .action)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptTeardownAction.instantiate(fromArray: val, owner: self) as? [TestScriptTeardownAction] {
						if let realm = self.realm { realm.delete(self.action) }
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "action"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptTeardown.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptTeardown. Will return empty instance: \(error))")
		}
		return TestScriptTeardown.init()
	}
}


/**
 *  One or more teardown operations to perform.
 *
 *  The teardown action will only contain an operation.
 */
open class TestScriptTeardownAction: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptTeardownAction" }
	}

    @objc public dynamic var operation: TestScriptSetupActionOperation?
    public func upsert(operation: TestScriptSetupActionOperation?) {
        upsert(prop: &self.operation, val: operation)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case operation = "operation"
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

        self.operation = try container.decodeIfPresent(TestScriptSetupActionOperation.self, forKey: .operation)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.operation, forKey: .operation)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["operation"] {
				presentKeys.insert("operation")
				if let val = exist as? FHIRJSON {
					upsert(operation: TestScriptSetupActionOperation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "operation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let operation = self.operation {
			json["operation"] = operation.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptTeardownAction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptTeardownAction. Will return empty instance: \(error))")
		}
		return TestScriptTeardownAction.init()
	}
}


/**
 *  A test in this script.
 */
open class TestScriptTest: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptTest" }
	}

    public let action = RealmSwift.List<TestScriptTestAction>()
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var metadata: TestScriptMetadata?
    public func upsert(metadata: TestScriptMetadata?) {
        upsert(prop: &self.metadata, val: metadata)
    }
    @objc public dynamic var name: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: [TestScriptTestAction]) {
        self.init()
        self.action.append(objectsIn: action)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case description_fhir = "description"
        case metadata = "metadata"
        case name = "name"
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

        self.action.append(objectsIn: try container.decodeIfPresent([TestScriptTestAction].self, forKey: .action) ?? [])
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.metadata = try container.decodeIfPresent(TestScriptMetadata.self, forKey: .metadata)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.action), forKey: .action)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.metadata, forKey: .metadata)
        try container.encodeIfPresent(self.name, forKey: .name)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? [FHIRJSON] {
					if let vals = TestScriptTestAction.instantiate(fromArray: val, owner: self) as? [TestScriptTestAction] {
						if let realm = self.realm { realm.delete(self.action) }
						self.action.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "action"))
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
			if let exist = js["metadata"] {
				presentKeys.insert("metadata")
				if let val = exist as? FHIRJSON {
					upsert(metadata: TestScriptMetadata(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "metadata", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if action.count > 0 {
			json["action"] = Array(action.map() { $0.asJSON() })
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let metadata = self.metadata {
			json["metadata"] = metadata.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptTest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptTest. Will return empty instance: \(error))")
		}
		return TestScriptTest.init()
	}
}


/**
 *  A test operation or assert to perform.
 *
 *  Action would contain either an operation or an assertion.
 */
open class TestScriptTestAction: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptTestAction" }
	}

    @objc public dynamic var assert: TestScriptSetupActionAssert?
    public func upsert(assert: TestScriptSetupActionAssert?) {
        upsert(prop: &self.assert, val: assert)
    }
    @objc public dynamic var operation: TestScriptSetupActionOperation?
    public func upsert(operation: TestScriptSetupActionOperation?) {
        upsert(prop: &self.operation, val: operation)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case assert = "assert"
        case operation = "operation"
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

        self.assert = try container.decodeIfPresent(TestScriptSetupActionAssert.self, forKey: .assert)
        self.operation = try container.decodeIfPresent(TestScriptSetupActionOperation.self, forKey: .operation)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.assert, forKey: .assert)
        try container.encodeIfPresent(self.operation, forKey: .operation)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["assert"] {
				presentKeys.insert("assert")
				if let val = exist as? FHIRJSON {
					upsert(assert: TestScriptSetupActionAssert(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "assert", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["operation"] {
				presentKeys.insert("operation")
				if let val = exist as? FHIRJSON {
					upsert(operation: TestScriptSetupActionOperation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "operation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let assert = self.assert {
			json["assert"] = assert.asJSON()
		}
		if let operation = self.operation {
			json["operation"] = operation.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptTestAction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptTestAction. Will return empty instance: \(error))")
		}
		return TestScriptTestAction.init()
	}
}


/**
 *  Placeholder for evaluated elements.
 *
 *  Variable is set based either on element value in response body or on header field value in the response headers.
 */
open class TestScriptVariable: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptVariable" }
	}

    @objc public dynamic var headerField: String?
    @objc public dynamic var name: String?
    @objc public dynamic var path: String?
    @objc public dynamic var sourceId: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String) {
        self.init()
        self.name = name
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case headerField = "headerField"
        case name = "name"
        case path = "path"
        case sourceId = "sourceId"
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

        self.headerField = try container.decodeIfPresent(String.self, forKey: .headerField)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.sourceId = try container.decodeIfPresent(String.self, forKey: .sourceId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.headerField, forKey: .headerField)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.sourceId, forKey: .sourceId)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["headerField"] {
				presentKeys.insert("headerField")
				if let val = exist as? String {
					self.headerField = val
				}
				else {
					errors.append(FHIRJSONError(key: "headerField", wants: String.self, has: type(of: exist)))
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
			if let exist = js["path"] {
				presentKeys.insert("path")
				if let val = exist as? String {
					self.path = val
				}
				else {
					errors.append(FHIRJSONError(key: "path", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourceId"] {
				presentKeys.insert("sourceId")
				if let val = exist as? String {
					self.sourceId = val
				}
				else {
					errors.append(FHIRJSONError(key: "sourceId", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let headerField = self.headerField {
			json["headerField"] = headerField.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let path = self.path {
			json["path"] = path.asJSON()
		}
		if let sourceId = self.sourceId {
			json["sourceId"] = sourceId.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TestScriptVariable.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TestScriptVariable. Will return empty instance: \(error))")
		}
		return TestScriptVariable.init()
	}
}

