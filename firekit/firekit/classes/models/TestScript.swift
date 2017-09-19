//
//  TestScript.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/TestScript) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? TestScript else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: contact array
        copyright = o.copyright
        date = o.date
        description_fhir = o.description_fhir
        experimental.value = o.experimental.value
        // TODO: fixture array
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.metadata, from: o.metadata)
        multiserver.value = o.multiserver.value
        name = o.name
        // TODO: profile array
        publisher = o.publisher
        requirements = o.requirements
        FireKit.populate(&self.setup, from: o.setup)
        status = o.status
        FireKit.populate(&self.teardown, from: o.teardown)
        // TODO: test array
        url = o.url
        // TODO: useContext array
        // TODO: variable array
        version = o.version
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        name = o.name
        // TODO: telecom array
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptFixture else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        autocreate.value = o.autocreate.value
        autodelete.value = o.autodelete.value
        FireKit.populate(&self.resource, from: o.resource)
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptMetadata else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: capability array
        // TODO: link array
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptMetadataCapability else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.conformance, from: o.conformance)
        description_fhir = o.description_fhir
        destination.value = o.destination.value
        // TODO: link array
        required.value = o.required.value
        validated.value = o.validated.value
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptMetadataLink else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        description_fhir = o.description_fhir
        url = o.url
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptSetup else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: action array
        FireKit.populate(&self.metadata, from: o.metadata)
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptSetupAction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.assert, from: o.assert)
        FireKit.populate(&self.operation, from: o.operation)
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptSetupActionAssert else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        compareToSourceId = o.compareToSourceId
        compareToSourcePath = o.compareToSourcePath
        contentType = o.contentType
        description_fhir = o.description_fhir
        direction = o.direction
        headerField = o.headerField
        label = o.label
        minimumId = o.minimumId
        navigationLinks.value = o.navigationLinks.value
        operator_fhir = o.operator_fhir
        path = o.path
        resource = o.resource
        response = o.response
        responseCode = o.responseCode
        sourceId = o.sourceId
        validateProfileId = o.validateProfileId
        value = o.value
        warningOnly.value = o.warningOnly.value
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptSetupActionOperation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        accept = o.accept
        contentType = o.contentType
        description_fhir = o.description_fhir
        destination.value = o.destination.value
        encodeRequestUrl.value = o.encodeRequestUrl.value
        label = o.label
        params = o.params
        // TODO: requestHeader array
        resource = o.resource
        responseId = o.responseId
        sourceId = o.sourceId
        targetId = o.targetId
        FireKit.populate(&self.type, from: o.type)
        url = o.url
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptSetupActionOperationRequestHeader else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        field = o.field
        value = o.value
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptTeardown else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: action array
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptTeardownAction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.operation, from: o.operation)
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptTest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: action array
        description_fhir = o.description_fhir
        FireKit.populate(&self.metadata, from: o.metadata)
        name = o.name
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptTestAction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.assert, from: o.assert)
        FireKit.populate(&self.operation, from: o.operation)
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

    public override func populate(from other: Any) {
        guard let o = other as? TestScriptVariable else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        headerField = o.headerField
        name = o.name
        path = o.path
        sourceId = o.sourceId
    }
}

