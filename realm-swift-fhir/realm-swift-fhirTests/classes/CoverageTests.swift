//
//  CoverageTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
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
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Coverage successfully, but threw")
		}

		testCoverageRealm1(instance: instance!)
	}

	func testCoverageRealm1(instance: RealmSwiftFHIR.Coverage) {
		try! realm.write {
                realm.add(instance)
            }
        try! runCoverage1(realm.objects(RealmSwiftFHIR.Coverage.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Coverage.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Coverage.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
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
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Coverage successfully, but threw")
		}

		testCoverageRealm2(instance: instance!)
	}

	func testCoverageRealm2(instance: RealmSwiftFHIR.Coverage) {
		try! realm.write {
                realm.add(instance)
            }
        try! runCoverage2(realm.objects(RealmSwiftFHIR.Coverage.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Coverage.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Coverage.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
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
