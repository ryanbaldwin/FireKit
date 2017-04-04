//
//  OperationDefinitionTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-04-03.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class OperationDefinitionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> FireKit.OperationDefinition {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> FireKit.OperationDefinition {
		let instance = FireKit.OperationDefinition(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testOperationDefinition1() {		
		var instance: FireKit.OperationDefinition?
		do {
			instance = try runOperationDefinition1()
			try runOperationDefinition1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.OperationDefinition
			XCTAssertNotNil(copy)
			try runOperationDefinition1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runOperationDefinition1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationDefinition successfully, but threw")
		}

		testOperationDefinitionRealm1(instance: instance!)
	}

    func testOperationDefinition1RealmPK() {        
        do {
            let instance: FireKit.OperationDefinition = try runOperationDefinition1()
            let copy = (instance.copy() as! FireKit.OperationDefinition)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationDefinition's PKs, but threw: \(error)")
        }
    }

	func testOperationDefinitionRealm1(instance: FireKit.OperationDefinition) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationDefinition1(realm.objects(FireKit.OperationDefinition.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationDefinition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationDefinition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationDefinition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationDefinition.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationDefinition1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationDefinition.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationDefinition1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationDefinition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationDefinition.self).count)
	}
	
	@discardableResult
	func runOperationDefinition1(_ json: FHIRJSON? = nil) throws -> FireKit.OperationDefinition {
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
