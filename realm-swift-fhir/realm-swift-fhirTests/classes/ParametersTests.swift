//
//  ParametersTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-17.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ParametersTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Parameters {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Parameters {
		let instance = RealmSwiftFHIR.Parameters(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testParameters1() {		
		var instance: RealmSwiftFHIR.Parameters?
		do {
			instance = try runParameters1()
			try runParameters1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Parameters
			XCTAssertNotNil(copy)
			try runParameters1(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Parameters successfully, but threw")
		}

		testParametersRealm1(instance: instance!)
	}

    func testParameters1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Parameters = try runParameters1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Parameters)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Parameters's PKs, but threw: \(error)")
        }
    }

	func testParametersRealm1(instance: RealmSwiftFHIR.Parameters) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runParameters1(realm.objects(RealmSwiftFHIR.Parameters.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Parameters.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Parameters.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Parameters()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Parameters.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runParameters1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Parameters.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runParameters1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Parameters.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Parameters.self).count)
	}
	
	@discardableResult
	func runParameters1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Parameters {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "parameters-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.parameter[0].name, "start")
		XCTAssertEqual(inst.parameter[0].valueDate?.description, "2010-01-01")
		XCTAssertEqual(inst.parameter[1].name, "end")
		
		return inst
	}
}
