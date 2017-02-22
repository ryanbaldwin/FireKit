//
//  CoverageTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class CoverageTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Coverage {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Coverage {
		let instance = RealmSwiftFHIR.Coverage(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testCoverage1() {		
		var instance: RealmSwiftFHIR.Coverage?
		do {
			instance = try runCoverage1()
			try runCoverage1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Coverage
			XCTAssertNotNil(copy)
			try runCoverage1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runCoverage1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Coverage successfully, but threw")
		}

		testCoverageRealm1(instance: instance!)
	}

    func testCoverage1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Coverage = try runCoverage1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Coverage)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Coverage's PKs, but threw: \(error)")
        }
    }

	func testCoverageRealm1(instance: RealmSwiftFHIR.Coverage) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runCoverage1(realm.objects(RealmSwiftFHIR.Coverage.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Coverage.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Coverage.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Coverage()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Coverage.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runCoverage1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Coverage.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runCoverage1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Coverage.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Coverage.self).count)
	}
	
	@discardableResult
	func runCoverage1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Coverage {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "coverage-example-2.json")
		
		XCTAssertEqual(inst.dependent.value, 1)
		XCTAssertEqual(inst.id, "7546D")
		XCTAssertEqual(inst.identifier[0].system, "http://xyz.com/codes/identifier")
		XCTAssertEqual(inst.identifier[0].value, "AB9876")
		XCTAssertEqual(inst.issuer?.reference, "Organization/2")
		XCTAssertEqual(inst.period?.end?.description, "2012-03-17")
		XCTAssertEqual(inst.period?.start?.description, "2011-03-17")
		XCTAssertEqual(inst.plan, "11024")
		XCTAssertEqual(inst.subPlan, "D15C9")
		XCTAssertEqual(inst.subscriber?.reference, "Patient/5")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the coverage</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.code, "EHCPOL")
		XCTAssertEqual(inst.type?.display, "extended healthcare")
		XCTAssertEqual(inst.type?.system, "http://hl7.org/fhir/v3/ActCode")
		
		return inst
	}
	
	func testCoverage2() {		
		var instance: RealmSwiftFHIR.Coverage?
		do {
			instance = try runCoverage2()
			try runCoverage2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Coverage
			XCTAssertNotNil(copy)
			try runCoverage2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runCoverage2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Coverage successfully, but threw")
		}

		testCoverageRealm2(instance: instance!)
	}

    func testCoverage2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Coverage = try runCoverage2()
            let copy = (instance.copy() as! RealmSwiftFHIR.Coverage)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Coverage's PKs, but threw: \(error)")
        }
    }

	func testCoverageRealm2(instance: RealmSwiftFHIR.Coverage) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runCoverage2(realm.objects(RealmSwiftFHIR.Coverage.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Coverage.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Coverage.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Coverage()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Coverage.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runCoverage2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Coverage.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runCoverage2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Coverage.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Coverage.self).count)
	}
	
	@discardableResult
	func runCoverage2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Coverage {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "coverage-example.json")
		
		XCTAssertEqual(inst.dependent.value, 1)
		XCTAssertEqual(inst.id, "9876B1")
		XCTAssertEqual(inst.identifier[0].system, "http://benefitsinc.com/certificate")
		XCTAssertEqual(inst.identifier[0].value, "12345")
		XCTAssertEqual(inst.issuer?.reference, "Organization/2")
		XCTAssertEqual(inst.period?.end?.description, "2012-05-23")
		XCTAssertEqual(inst.period?.start?.description, "2011-05-23")
		XCTAssertEqual(inst.plan, "CBI35")
		XCTAssertEqual(inst.sequence.value, 1)
		XCTAssertEqual(inst.subPlan, "123")
		XCTAssertEqual(inst.subscriber?.reference, "Patient/4")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the coverage</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.code, "EHCPOL")
		XCTAssertEqual(inst.type?.display, "extended healthcare")
		XCTAssertEqual(inst.type?.system, "http://hl7.org/fhir/v3/ActCode")
		
		return inst
	}
}
