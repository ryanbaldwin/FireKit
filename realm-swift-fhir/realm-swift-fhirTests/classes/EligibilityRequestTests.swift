//
//  EligibilityRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class EligibilityRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.EligibilityRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.EligibilityRequest {
		let instance = RealmSwiftFHIR.EligibilityRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testEligibilityRequest1() {		
		var instance: RealmSwiftFHIR.EligibilityRequest?
		do {
			instance = try runEligibilityRequest1()
			try runEligibilityRequest1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test EligibilityRequest successfully, but threw")
		}

		testEligibilityRequestRealm1(instance: instance!)
	}

	func testEligibilityRequestRealm1(instance: RealmSwiftFHIR.EligibilityRequest) {
		try! realm.write {
                realm.add(instance)
            }
        try! runEligibilityRequest1(realm.objects(RealmSwiftFHIR.EligibilityRequest.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EligibilityRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.EligibilityRequest.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runEligibilityRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.EligibilityRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "eligibilityrequest-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.id, "52345")
		XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/elegibilityrequest")
		XCTAssertEqual(inst.identifier[0].value, "52345")
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EligibilityRequest</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
