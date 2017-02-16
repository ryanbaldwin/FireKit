//
//  BasicTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class BasicTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Basic {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Basic {
		let instance = RealmSwiftFHIR.Basic(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testBasic1() {		
		var instance: RealmSwiftFHIR.Basic?
		do {
			instance = try runBasic1()
			try runBasic1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Basic
			XCTAssertNotNil(copy)
			try runBasic1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Basic successfully, but threw")
		}

		testBasicRealm1(instance: instance!)
	}

	func testBasicRealm1(instance: RealmSwiftFHIR.Basic) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runBasic1(realm.objects(RealmSwiftFHIR.Basic.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Basic.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Basic.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Basic()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Basic.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBasic1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Basic.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBasic1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Basic.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Basic.self).count)
	}
	
	@discardableResult
	func runBasic1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Basic {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "basic-example-narrative.json")
		
		XCTAssertEqual(inst.code?.text, "Example Narrative Tester")
		XCTAssertEqual(inst.id, "basic-example-narrative")
		XCTAssertEqual(inst.text?.status, "additional")
		
		return inst
	}
	
	func testBasic2() {		
		var instance: RealmSwiftFHIR.Basic?
		do {
			instance = try runBasic2()
			try runBasic2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Basic
			XCTAssertNotNil(copy)
			try runBasic2(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Basic successfully, but threw")
		}

		testBasicRealm2(instance: instance!)
	}

	func testBasicRealm2(instance: RealmSwiftFHIR.Basic) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runBasic2(realm.objects(RealmSwiftFHIR.Basic.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Basic.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Basic.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Basic()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Basic.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBasic2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Basic.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBasic2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Basic.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Basic.self).count)
	}
	
	@discardableResult
	func runBasic2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Basic {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "basic-example.json")
		
		XCTAssertEqual(inst.author?.reference, "Practitioner/example")
		XCTAssertEqual(inst.code?.coding[0].code, "referral")
		XCTAssertEqual(inst.code?.coding[0].system, "http://hl7.org/fhir/basic-resource-type")
		XCTAssertEqual(inst.created?.description, "2013-05-14")
		XCTAssertEqual(inst.extension_fhir[0].url, "http://example.org/do-not-use/fhir-extensions/referral#requestingPractitioner")
		XCTAssertEqual(inst.extension_fhir[0].valueReference?.display, "Dokter Bronsig")
		XCTAssertEqual(inst.extension_fhir[0].valueReference?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.extension_fhir[1].url, "http://example.org/do-not-use/fhir-extensions/referral#notes")
		XCTAssertEqual(inst.extension_fhir[1].valueString, "The patient had fever peaks over the last couple of days. He is worried about these peaks.")
		XCTAssertEqual(inst.extension_fhir[2].url, "http://example.org/do-not-use/fhir-extensions/referral#fulfillingEncounter")
		XCTAssertEqual(inst.extension_fhir[2].valueReference?.reference, "Encounter/f201")
		XCTAssertEqual(inst.id, "referral")
		XCTAssertEqual(inst.modifierExtension[0].url, "http://example.org/do-not-use/fhir-extensions/referral#referredForService")
		XCTAssertEqual(inst.modifierExtension[0].valueCodeableConcept?.coding[0].code, "11429006")
		XCTAssertEqual(inst.modifierExtension[0].valueCodeableConcept?.coding[0].display, "Consultation")
		XCTAssertEqual(inst.modifierExtension[0].valueCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifierExtension[1].url, "http://example.org/do-not-use/fhir-extensions/referral#targetDate")
		XCTAssertEqual(inst.modifierExtension[1].valuePeriod?.end?.description, "2013-04-15")
		XCTAssertEqual(inst.modifierExtension[1].valuePeriod?.start?.description, "2013-04-01")
		XCTAssertEqual(inst.modifierExtension[2].url, "http://example.org/do-not-use/fhir-extensions/referral#status")
		XCTAssertEqual(inst.modifierExtension[2].valueCode, "complete")
		XCTAssertEqual(inst.subject?.display, "Roel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testBasic3() {		
		var instance: RealmSwiftFHIR.Basic?
		do {
			instance = try runBasic3()
			try runBasic3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Basic
			XCTAssertNotNil(copy)
			try runBasic3(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Basic successfully, but threw")
		}

		testBasicRealm3(instance: instance!)
	}

	func testBasicRealm3(instance: RealmSwiftFHIR.Basic) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runBasic3(realm.objects(RealmSwiftFHIR.Basic.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Basic.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Basic.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Basic()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Basic.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBasic3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Basic.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBasic3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Basic.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Basic.self).count)
	}
	
	@discardableResult
	func runBasic3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Basic {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "basic-example2.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "UMLCLASSMODEL")
		XCTAssertEqual(inst.code?.coding[0].system, "http://example.org/do-not-use/fhir-codes#resourceTypes")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].url, "name")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueString, "Class1")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[0].url, "name")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[0].valueString, "attribute1")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[1].url, "minOccurs")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[1].valueInteger.value, 1)
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[2].url, "maxOccurs")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].extension_fhir[2].valueCode, "*")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].url, "attribute")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[0].url, "name")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[0].valueString, "attribute2")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[1].url, "minOccurs")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[1].valueInteger.value, 0)
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[2].url, "maxOccurs")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].extension_fhir[2].valueInteger.value, 1)
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[2].url, "attribute")
		XCTAssertEqual(inst.extension_fhir[0].url, "http://example.org/do-not-use/fhir-extensions/UMLclass")
		XCTAssertEqual(inst.id, "classModel")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p><b>Class1</b></p>\n      <ul>\n        <li>Attribute1: 1..*</li>\n        <li>Attribute2: 0..1</li>\n      </ul>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
