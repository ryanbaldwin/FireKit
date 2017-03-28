//
//  TestScript.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/TestScript) on 2017-03-28.
//  2017, SMART Health IT.
//

import Foundation
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
    public dynamic var copyright: String?        
        
    public dynamic var date: DateTime?        
        
    public dynamic var description_fhir: String?        
        
    public let experimental = RealmOptional<Bool>()    
    public let fixture = RealmSwift.List<TestScriptFixture>()    
    public dynamic var identifier: Identifier?        
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }    
    public dynamic var metadata: TestScriptMetadata?        
    public func upsert(metadata: TestScriptMetadata?) {
        upsert(prop: &self.metadata, val: metadata)
    }    
    public let multiserver = RealmOptional<Bool>()    
    public dynamic var name: String?        
        
    public let profile = RealmSwift.List<Reference>()    
    public dynamic var publisher: String?        
        
    public dynamic var requirements: String?        
        
    public dynamic var setup: TestScriptSetup?        
    public func upsert(setup: TestScriptSetup?) {
        upsert(prop: &self.setup, val: setup)
    }    
    public dynamic var status: String?        
        
    public dynamic var teardown: TestScriptTeardown?        
    public func upsert(teardown: TestScriptTeardown?) {
        upsert(prop: &self.teardown, val: teardown)
    }    
    public let test = RealmSwift.List<TestScriptTest>()    
    public dynamic var url: String?        
        
    public let useContext = RealmSwift.List<CodeableConcept>()    
    public let variable = RealmSwift.List<TestScriptVariable>()    
    public dynamic var version: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, status: String, url: String) {
        self.init(json: nil)
        self.name = name
        self.status = status
        self.url = url
    }

	
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
    
    public dynamic var name: String?        
        
    public let telecom = RealmSwift.List<ContactPoint>()

	
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
    public dynamic var resource: Reference?        
    public func upsert(resource: Reference?) {
        upsert(prop: &self.resource, val: resource)
    }

	
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
        self.init(json: nil)
        self.capability.append(objectsIn: capability)
    }

	
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
    
    public dynamic var conformance: Reference?        
    public func upsert(conformance: Reference?) {
        upsert(prop: &self.conformance, val: conformance)
    }    
    public dynamic var description_fhir: String?        
        
    public let destination = RealmOptional<Int>()    
    public let link = RealmSwift.List<RealmString>()    
    public let required = RealmOptional<Bool>()    
    public let validated = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(conformance: Reference) {
        self.init(json: nil)
        self.conformance = conformance
    }

	
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
    
    public dynamic var description_fhir: String?        
        
    public dynamic var url: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(url: String) {
        self.init(json: nil)
        self.url = url
    }

	
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
}


/**
 *  A series of required setup operations before tests are executed.
 */
open class TestScriptSetup: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptSetup" }
	}
    
    public let action = RealmSwift.List<TestScriptSetupAction>()    
    public dynamic var metadata: TestScriptMetadata?        
    public func upsert(metadata: TestScriptMetadata?) {
        upsert(prop: &self.metadata, val: metadata)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: [TestScriptSetupAction]) {
        self.init(json: nil)
        self.action.append(objectsIn: action)
    }

	
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
    
    public dynamic var assert: TestScriptSetupActionAssert?        
    public func upsert(assert: TestScriptSetupActionAssert?) {
        upsert(prop: &self.assert, val: assert)
    }    
    public dynamic var operation: TestScriptSetupActionOperation?        
    public func upsert(operation: TestScriptSetupActionOperation?) {
        upsert(prop: &self.operation, val: operation)
    }

	
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
    
    public dynamic var compareToSourceId: String?        
        
    public dynamic var compareToSourcePath: String?        
        
    public dynamic var contentType: String?        
        
    public dynamic var description_fhir: String?        
        
    public dynamic var direction: String?        
        
    public dynamic var headerField: String?        
        
    public dynamic var label: String?        
        
    public dynamic var minimumId: String?        
        
    public let navigationLinks = RealmOptional<Bool>()    
    public dynamic var operator_fhir: String?        
        
    public dynamic var path: String?        
        
    public dynamic var resource: String?        
        
    public dynamic var response: String?        
        
    public dynamic var responseCode: String?        
        
    public dynamic var sourceId: String?        
        
    public dynamic var validateProfileId: String?        
        
    public dynamic var value: String?        
        
    public let warningOnly = RealmOptional<Bool>()

	
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
    
    public dynamic var accept: String?        
        
    public dynamic var contentType: String?        
        
    public dynamic var description_fhir: String?        
        
    public let destination = RealmOptional<Int>()    
    public let encodeRequestUrl = RealmOptional<Bool>()    
    public dynamic var label: String?        
        
    public dynamic var params: String?        
        
    public let requestHeader = RealmSwift.List<TestScriptSetupActionOperationRequestHeader>()    
    public dynamic var resource: String?        
        
    public dynamic var responseId: String?        
        
    public dynamic var sourceId: String?        
        
    public dynamic var targetId: String?        
        
    public dynamic var type: Coding?        
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }    
    public dynamic var url: String?        
    

	
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
    
    public dynamic var field: String?        
        
    public dynamic var value: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(field: String, val: String) {
        self.init(json: nil)
        self.field = field
        self.value = val
    }

	
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
        self.init(json: nil)
        self.action.append(objectsIn: action)
    }

	
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
    
    public dynamic var operation: TestScriptSetupActionOperation?        
    public func upsert(operation: TestScriptSetupActionOperation?) {
        upsert(prop: &self.operation, val: operation)
    }

	
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
}


/**
 *  A test in this script.
 */
open class TestScriptTest: BackboneElement {
	override open class var resourceType: String {
		get { return "TestScriptTest" }
	}
    
    public let action = RealmSwift.List<TestScriptTestAction>()    
    public dynamic var description_fhir: String?        
        
    public dynamic var metadata: TestScriptMetadata?        
    public func upsert(metadata: TestScriptMetadata?) {
        upsert(prop: &self.metadata, val: metadata)
    }    
    public dynamic var name: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: [TestScriptTestAction]) {
        self.init(json: nil)
        self.action.append(objectsIn: action)
    }

	
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
    
    public dynamic var assert: TestScriptSetupActionAssert?        
    public func upsert(assert: TestScriptSetupActionAssert?) {
        upsert(prop: &self.assert, val: assert)
    }    
    public dynamic var operation: TestScriptSetupActionOperation?        
    public func upsert(operation: TestScriptSetupActionOperation?) {
        upsert(prop: &self.operation, val: operation)
    }

	
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
    
    public dynamic var headerField: String?        
        
    public dynamic var name: String?        
        
    public dynamic var path: String?        
        
    public dynamic var sourceId: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String) {
        self.init(json: nil)
        self.name = name
    }

	
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
}

