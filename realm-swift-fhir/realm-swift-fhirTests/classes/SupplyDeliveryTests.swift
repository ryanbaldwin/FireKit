//
//  SupplyDeliveryTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class SupplyDeliveryTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.SupplyDelivery {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.SupplyDelivery {
		let instance = RealmSwiftFHIR.SupplyDelivery(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSupplyDelivery1() {		
		var instance: RealmSwiftFHIR.SupplyDelivery?
		do {
			instance = try runSupplyDelivery1()
			try runSupplyDelivery1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test SupplyDelivery successfully, but threw")
		}

		testSupplyDeliveryRealm1(instance: instance!)
	}

	func testSupplyDeliveryRealm1(instance: RealmSwiftFHIR.SupplyDelivery) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSupplyDelivery1(realm.objects(RealmSwiftFHIR.SupplyDelivery.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.SupplyDelivery.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.SupplyDelivery.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSupplyDelivery1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.SupplyDelivery {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "supplydelivery-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
