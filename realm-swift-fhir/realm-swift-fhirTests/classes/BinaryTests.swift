//
//  BinaryTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class BinaryTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Binary {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Binary {
		let instance = RealmSwiftFHIR.Binary(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testBinary1() {		
		var instance: RealmSwiftFHIR.Binary?
		do {
			instance = try runBinary1()
			try runBinary1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Binary successfully, but threw")
		}

		testBinaryRealm1(instance: instance!)
	}

	func testBinaryRealm1(instance: RealmSwiftFHIR.Binary) {
		try! realm.write {
                realm.add(instance)
            }
        try! runBinary1(realm.objects(RealmSwiftFHIR.Binary.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Binary.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Binary.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runBinary1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Binary {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "binary-example.json")
		
		XCTAssertEqual(inst.contentType, "application/pdf")
		XCTAssertEqual(inst.id, "example")
		
		return inst
	}
}
