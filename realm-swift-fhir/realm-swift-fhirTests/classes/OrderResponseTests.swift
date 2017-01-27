//
//  OrderResponseTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class OrderResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.OrderResponse {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.OrderResponse {
		let instance = RealmSwiftFHIR.OrderResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testOrderResponse1() {		
		var instance: RealmSwiftFHIR.OrderResponse?
		do {
			instance = try runOrderResponse1()
			try runOrderResponse1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OrderResponse successfully, but threw")
		}

		testOrderResponseRealm1(instance: instance!)
	}

	func testOrderResponseRealm1(instance: RealmSwiftFHIR.OrderResponse) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrderResponse1(realm.objects(RealmSwiftFHIR.OrderResponse.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OrderResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OrderResponse.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrderResponse1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OrderResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "orderresponse-example.json")
		
		XCTAssertEqual(inst.date?.description, "2012-12-28T13:10:56+11:00")
		XCTAssertEqual(inst.fulfillment[0].reference, "DiagnosticReport/101")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.orderStatus, "completed")
		XCTAssertEqual(inst.request?.reference, "Order/example")
		XCTAssertEqual(inst.text?.div, "<div>Lab Report completed at 13:10 28-Dec 2012</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.who?.reference, "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f")
		
		return inst
	}
}
