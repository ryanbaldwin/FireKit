//
//  ContractTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
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
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Contract successfully, but threw")
		}

		testContractRealm1(instance: instance!)
	}

	func testContractRealm1(instance: RealmSwiftFHIR.Contract) {
		try! realm.write {
                realm.add(instance)
            }
        try! runContract1(realm.objects(RealmSwiftFHIR.Contract.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Contract.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Contract.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
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
