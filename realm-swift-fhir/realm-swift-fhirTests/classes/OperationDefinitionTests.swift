//
//  OperationDefinitionTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class OperationDefinitionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.OperationDefinition {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.OperationDefinition {
		let instance = RealmSwiftFHIR.OperationDefinition(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testOperationDefinition1() {		
		var instance: RealmSwiftFHIR.OperationDefinition?
		do {
			instance = try runOperationDefinition1()
			try runOperationDefinition1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationDefinition successfully, but threw")
		}

		testOperationDefinitionRealm1(instance: instance!)
	}

	func testOperationDefinitionRealm1(instance: RealmSwiftFHIR.OperationDefinition) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationDefinition1(realm.objects(RealmSwiftFHIR.OperationDefinition.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationDefinition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationDefinition.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOperationDefinition1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationDefinition {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationdefinition-example.json")
		
		XCTAssertEqual(inst.base?.reference, "OperationDefinition/Questionnaire-populate")
		XCTAssertEqual(inst.code, "populate")
		XCTAssertEqual(inst.contact[0].name, "System Administrator")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "email")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "beep@coyote.acme.com")
		XCTAssertEqual(inst.date?.description, "2015-08-04")
		XCTAssertEqual(inst.description_fhir, "Limited implementation of the Populate Questionnaire implemenation")
		XCTAssertEqual(inst.id, "example")
		XCTAssertTrue(inst.instance.value ?? false)
		XCTAssertEqual(inst.kind, "operation")
		XCTAssertEqual(inst.name, "Populate Questionnaire")
		XCTAssertEqual(inst.notes, "Only implemented for Labs and Medications so far")
		XCTAssertEqual(inst.parameter[0].max, "1")
		XCTAssertEqual(inst.parameter[0].min.value, 1)
		XCTAssertEqual(inst.parameter[0].name, "subject")
		XCTAssertEqual(inst.parameter[0].type, "Reference")
		XCTAssertEqual(inst.parameter[0].use, "in")
		XCTAssertEqual(inst.parameter[1].documentation, "The partially (or fully)-populated set of answers for the specified Questionnaire")
		XCTAssertEqual(inst.parameter[1].max, "1")
		XCTAssertEqual(inst.parameter[1].min.value, 1)
		XCTAssertEqual(inst.parameter[1].name, "return")
		XCTAssertEqual(inst.parameter[1].type, "QuestionnaireResponse")
		XCTAssertEqual(inst.parameter[1].use, "out")
		XCTAssertEqual(inst.publisher, "Acme Healthcare Services")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertFalse(inst.system.value ?? true)
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type[0].value, "Questionnaire")
		XCTAssertEqual(inst.url, "http://h7.org/fhir/OperationDefinition/example")
		XCTAssertEqual(inst.version, "B")
		
		return inst
	}
}
