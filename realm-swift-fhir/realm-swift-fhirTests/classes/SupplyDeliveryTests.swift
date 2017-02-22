//
//  SupplyDeliveryTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
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
			let copy = instance!.copy() as? RealmSwiftFHIR.SupplyDelivery
			XCTAssertNotNil(copy)
			try runSupplyDelivery1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runSupplyDelivery1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test SupplyDelivery successfully, but threw")
		}

		testSupplyDeliveryRealm1(instance: instance!)
	}

    func testSupplyDelivery1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.SupplyDelivery = try runSupplyDelivery1()
            let copy = (instance.copy() as! RealmSwiftFHIR.SupplyDelivery)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test SupplyDelivery's PKs, but threw: \(error)")
        }
    }

	func testSupplyDeliveryRealm1(instance: RealmSwiftFHIR.SupplyDelivery) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSupplyDelivery1(realm.objects(RealmSwiftFHIR.SupplyDelivery.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.SupplyDelivery.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.SupplyDelivery.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.SupplyDelivery()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.SupplyDelivery.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSupplyDelivery1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.SupplyDelivery.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSupplyDelivery1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.SupplyDelivery.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.SupplyDelivery.self).count)
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
