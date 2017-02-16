//
//  PersonTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class PersonTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Person {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Person {
		let instance = RealmSwiftFHIR.Person(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testPerson1() {		
		var instance: RealmSwiftFHIR.Person?
		do {
			instance = try runPerson1()
			try runPerson1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Person
			XCTAssertNotNil(copy)
			try runPerson1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Person successfully, but threw")
		}

		testPersonRealm1(instance: instance!)
	}

	func testPersonRealm1(instance: RealmSwiftFHIR.Person) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runPerson1(realm.objects(RealmSwiftFHIR.Person.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Person.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Person.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Person()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Person.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runPerson1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Person.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runPerson1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Person.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Person.self).count)
	}
	
	@discardableResult
	func runPerson1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Person {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "person-example-f002-ariadne.json")
		
		XCTAssertTrue(inst.active.value ?? false)
		XCTAssertEqual(inst.birthDate?.description, "1963")
		XCTAssertEqual(inst.gender, "female")
		XCTAssertEqual(inst.id, "f002")
		XCTAssertEqual(inst.link[0].target?.display, "Ariadne Bor-Jansma")
		XCTAssertEqual(inst.link[0].target?.reference, "RelatedPerson/f002")
		XCTAssertEqual(inst.name[0].text, "Ariadne Bor-Jansma")
		XCTAssertEqual(inst.name[0].use, "usual")
		XCTAssertEqual(inst.photo?.contentType, "image/jpeg")
		XCTAssertEqual(inst.telecom[0].system, "phone")
		XCTAssertEqual(inst.telecom[0].use, "home")
		XCTAssertEqual(inst.telecom[0].value, "+31201234567")
		XCTAssertEqual(inst.text?.div, "<div>\n     Ariadne Bor-Jansma\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testPerson2() {		
		var instance: RealmSwiftFHIR.Person?
		do {
			instance = try runPerson2()
			try runPerson2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Person
			XCTAssertNotNil(copy)
			try runPerson2(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Person successfully, but threw")
		}

		testPersonRealm2(instance: instance!)
	}

	func testPersonRealm2(instance: RealmSwiftFHIR.Person) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runPerson2(realm.objects(RealmSwiftFHIR.Person.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Person.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Person.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Person()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Person.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runPerson2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Person.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runPerson2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Person.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Person.self).count)
	}
	
	@discardableResult
	func runPerson2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Person {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "person-example.json")
		
		XCTAssertTrue(inst.active.value ?? false)
		XCTAssertEqual(inst.address[0].city, "PleasantVille")
		XCTAssertEqual(inst.address[0].line[0].value, "534 Erewhon St")
		XCTAssertEqual(inst.address[0].postalCode, "3999")
		XCTAssertEqual(inst.address[0].state, "Vic")
		XCTAssertEqual(inst.address[0].use, "home")
		XCTAssertEqual(inst.birthDate?.description, "1974-12-25")
		XCTAssertEqual(inst.gender, "male")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].assigner?.display, "Acme Healthcare")
		XCTAssertEqual(inst.identifier[0].period?.start?.description, "2001-05-06")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.2.36.146.595.217.0.1")
		XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "MR")
		XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
		XCTAssertEqual(inst.identifier[0].use, "usual")
		XCTAssertEqual(inst.identifier[0].value, "12345")
		XCTAssertEqual(inst.link[0].target?.display, "Peter Chalmers")
		XCTAssertEqual(inst.link[0].target?.reference, "RelatedPerson/peter")
		XCTAssertEqual(inst.link[1].target?.display, "Peter Chalmers")
		XCTAssertEqual(inst.link[1].target?.reference, "Patient/example")
		XCTAssertEqual(inst.name[0].family[0].value, "Chalmers")
		XCTAssertEqual(inst.name[0].given[0].value, "Peter")
		XCTAssertEqual(inst.name[0].given[1].value, "James")
		XCTAssertEqual(inst.name[0].use, "official")
		XCTAssertEqual(inst.name[1].given[0].value, "Jim")
		XCTAssertEqual(inst.name[1].use, "usual")
		XCTAssertEqual(inst.telecom[0].use, "home")
		XCTAssertEqual(inst.telecom[1].system, "phone")
		XCTAssertEqual(inst.telecom[1].use, "work")
		XCTAssertEqual(inst.telecom[1].value, "(03) 5555 6473")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
