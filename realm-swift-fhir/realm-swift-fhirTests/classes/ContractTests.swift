//
//  ContractTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ContractTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Contract {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Contract {
		let instance = RealmSwiftFHIR.Contract(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testContract1() {		
		var instance: RealmSwiftFHIR.Contract?
		do {
			instance = try runContract1()
			try runContract1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Contract
			XCTAssertNotNil(copy)
			try runContract1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Contract successfully, but threw")
		}

		testContractRealm1(instance: instance!)
	}

	func testContractRealm1(instance: RealmSwiftFHIR.Contract) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runContract1(realm.objects(RealmSwiftFHIR.Contract.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Contract.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Contract.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Contract()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Contract.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runContract1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Contract.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runContract1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Contract.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Contract.self).count)
	}
	
	@discardableResult
	func runContract1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Contract {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "contract-example.json")
		
		XCTAssertEqual(inst.id, "C-123")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the contract</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
