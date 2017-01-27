//
//  EnrollmentResponseTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class EnrollmentResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.EnrollmentResponse {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.EnrollmentResponse {
		let instance = RealmSwiftFHIR.EnrollmentResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testEnrollmentResponse1() {		
		var instance: RealmSwiftFHIR.EnrollmentResponse?
		do {
			instance = try runEnrollmentResponse1()
			try runEnrollmentResponse1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test EnrollmentResponse successfully, but threw")
		}

		testEnrollmentResponseRealm1(instance: instance!)
	}

	func testEnrollmentResponseRealm1(instance: RealmSwiftFHIR.EnrollmentResponse) {
		try! realm.write {
                realm.add(instance)
            }
        try! runEnrollmentResponse1(realm.objects(RealmSwiftFHIR.EnrollmentResponse.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EnrollmentResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.EnrollmentResponse.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runEnrollmentResponse1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.EnrollmentResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "enrollmentresponse-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.disposition, "Dependant added to policy.")
		XCTAssertEqual(inst.id, "ER2500")
		XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/enrollmentresponse")
		XCTAssertEqual(inst.identifier[0].value, "781234")
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.outcome, "complete")
		XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
		XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EnrollmentResponse</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
