//
//  BinaryTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
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
			let copy = instance!.copy() as? RealmSwiftFHIR.Binary
			XCTAssertNotNil(copy)
			try runBinary1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Binary successfully, but threw")
		}

		testBinaryRealm1(instance: instance!)
	}

	func testBinaryRealm1(instance: RealmSwiftFHIR.Binary) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runBinary1(realm.objects(RealmSwiftFHIR.Binary.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Binary.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Binary.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Binary()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Binary.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBinary1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Binary.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBinary1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Binary.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Binary.self).count)
	}
	
	@discardableResult
	func runBinary1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Binary {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "binary-example.json")
		
		XCTAssertEqual(inst.contentType, "application/pdf")
		XCTAssertEqual(inst.id, "example")
		
		return inst
	}
}
