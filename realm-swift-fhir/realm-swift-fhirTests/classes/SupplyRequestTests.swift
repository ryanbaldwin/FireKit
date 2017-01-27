//
//  SupplyRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class SupplyRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.SupplyRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.SupplyRequest {
		let instance = RealmSwiftFHIR.SupplyRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSupplyRequest1() {		
		var instance: RealmSwiftFHIR.SupplyRequest?
		do {
			instance = try runSupplyRequest1()
			try runSupplyRequest1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test SupplyRequest successfully, but threw")
		}

		testSupplyRequestRealm1(instance: instance!)
	}

	func testSupplyRequestRealm1(instance: RealmSwiftFHIR.SupplyRequest) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSupplyRequest1(realm.objects(RealmSwiftFHIR.SupplyRequest.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.SupplyRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.SupplyRequest.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSupplyRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.SupplyRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "supplyrequest-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
