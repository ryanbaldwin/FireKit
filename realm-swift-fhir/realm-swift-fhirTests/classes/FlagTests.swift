//
//  FlagTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class FlagTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Flag {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Flag {
		let instance = RealmSwiftFHIR.Flag(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testFlag1() {		
		var instance: RealmSwiftFHIR.Flag?
		do {
			instance = try runFlag1()
			try runFlag1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Flag
			XCTAssertNotNil(copy)
			try runFlag1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runFlag1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Flag successfully, but threw")
		}

		testFlagRealm1(instance: instance!)
	}

    func testFlag1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Flag = try runFlag1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Flag)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Flag's PKs, but threw: \(error)")
        }
    }

	func testFlagRealm1(instance: RealmSwiftFHIR.Flag) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runFlag1(realm.objects(RealmSwiftFHIR.Flag.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Flag.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Flag.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Flag()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Flag.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFlag1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Flag.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFlag1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Flag.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Flag.self).count)
	}
	
	@discardableResult
	func runFlag1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Flag {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "flag-example-encounter.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "infection")
		XCTAssertEqual(inst.category?.coding[0].display, "Infection Control Level")
		XCTAssertEqual(inst.category?.coding[0].system, "http://example.org/local")
		XCTAssertEqual(inst.code?.coding[0].code, "l3")
		XCTAssertEqual(inst.code?.coding[0].display, "Follow Level 3 Protocol")
		XCTAssertEqual(inst.code?.coding[0].system, "http://example.org/local/if1")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
		XCTAssertEqual(inst.id, "example-encounter")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.subject?.display, "Peter Patient")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>Follow Infection Control Level 3 Protocol</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testFlag2() {		
		var instance: RealmSwiftFHIR.Flag?
		do {
			instance = try runFlag2()
			try runFlag2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Flag
			XCTAssertNotNil(copy)
			try runFlag2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runFlag2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Flag successfully, but threw")
		}

		testFlagRealm2(instance: instance!)
	}

    func testFlag2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Flag = try runFlag2()
            let copy = (instance.copy() as! RealmSwiftFHIR.Flag)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Flag's PKs, but threw: \(error)")
        }
    }

	func testFlagRealm2(instance: RealmSwiftFHIR.Flag) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runFlag2(realm.objects(RealmSwiftFHIR.Flag.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Flag.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Flag.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Flag()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Flag.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFlag2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Flag.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFlag2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Flag.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Flag.self).count)
	}
	
	@discardableResult
	func runFlag2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Flag {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "flag-example.json")
		
		XCTAssertEqual(inst.author?.display, "Nancy Nurse")
		XCTAssertEqual(inst.author?.reference, "Practitioner/example")
		XCTAssertEqual(inst.category?.coding[0].code, "admin")
		XCTAssertEqual(inst.category?.coding[0].display, "Admin")
		XCTAssertEqual(inst.category?.coding[0].system, "http://example.org/local")
		XCTAssertEqual(inst.category?.text, "admin")
		XCTAssertEqual(inst.code?.coding[0].code, "bigdog")
		XCTAssertEqual(inst.code?.coding[0].display, "Big dog")
		XCTAssertEqual(inst.code?.coding[0].system, "http://example.org/local")
		XCTAssertEqual(inst.code?.text, "Patient has a big dog at his home. Always always wear a suit of armor or take other active counter-measures")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.subject?.display, "Peter Patient")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>Large Dog warning for Peter Patient</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
