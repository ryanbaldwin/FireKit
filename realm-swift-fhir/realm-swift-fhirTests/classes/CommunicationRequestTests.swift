//
//  CommunicationRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class CommunicationRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.CommunicationRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.CommunicationRequest {
		let instance = RealmSwiftFHIR.CommunicationRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testCommunicationRequest1() {		
		var instance: RealmSwiftFHIR.CommunicationRequest?
		do {
			instance = try runCommunicationRequest1()
			try runCommunicationRequest1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test CommunicationRequest successfully, but threw")
		}

		testCommunicationRequestRealm1(instance: instance!)
	}

	func testCommunicationRequestRealm1(instance: RealmSwiftFHIR.CommunicationRequest) {
		try! realm.write {
                realm.add(instance)
            }
        try! runCommunicationRequest1(realm.objects(RealmSwiftFHIR.CommunicationRequest.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.CommunicationRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.CommunicationRequest.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runCommunicationRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.CommunicationRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "communicationrequest-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
