//
//  EnrollmentRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class EnrollmentRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.EnrollmentRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.EnrollmentRequest {
		let instance = RealmSwiftFHIR.EnrollmentRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testEnrollmentRequest1() {		
		var instance: RealmSwiftFHIR.EnrollmentRequest?
		do {
			instance = try runEnrollmentRequest1()
			try runEnrollmentRequest1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test EnrollmentRequest successfully, but threw")
		}

		testEnrollmentRequestRealm1(instance: instance!)
	}

	func testEnrollmentRequestRealm1(instance: RealmSwiftFHIR.EnrollmentRequest) {
		try! realm.write {
                realm.add(instance)
            }
        try! runEnrollmentRequest1(realm.objects(RealmSwiftFHIR.EnrollmentRequest.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EnrollmentRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.EnrollmentRequest.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runEnrollmentRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.EnrollmentRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "enrollmentrequest-example.json")
		
		XCTAssertEqual(inst.coverage?.reference, "Coverage/9876B1")
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.id, "22345")
		XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/enrollmentrequest")
		XCTAssertEqual(inst.identifier[0].value, "EN22345")
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.relationship?.code, "spouse")
		XCTAssertEqual(inst.subject?.reference, "Patient/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EnrollmentRequest.</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
