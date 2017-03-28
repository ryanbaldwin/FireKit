//
//  DeviceUseStatementTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-03-28.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DeviceUseStatementTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DeviceUseStatement {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DeviceUseStatement {
		let instance = RealmSwiftFHIR.DeviceUseStatement(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDeviceUseStatement1() {		
		var instance: RealmSwiftFHIR.DeviceUseStatement?
		do {
			instance = try runDeviceUseStatement1()
			try runDeviceUseStatement1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DeviceUseStatement
			XCTAssertNotNil(copy)
			try runDeviceUseStatement1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceUseStatement1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceUseStatement successfully, but threw")
		}

		testDeviceUseStatementRealm1(instance: instance!)
	}

    func testDeviceUseStatement1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DeviceUseStatement = try runDeviceUseStatement1()
            let copy = (instance.copy() as! RealmSwiftFHIR.DeviceUseStatement)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceUseStatement's PKs, but threw: \(error)")
        }
    }

	func testDeviceUseStatementRealm1(instance: RealmSwiftFHIR.DeviceUseStatement) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceUseStatement1(realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DeviceUseStatement()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DeviceUseStatement.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceUseStatement1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DeviceUseStatement.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceUseStatement1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).count)
	}
	
	@discardableResult
	func runDeviceUseStatement1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DeviceUseStatement {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "deviceusestatement-example.json")
		
		XCTAssertEqual(inst.device?.reference, "Device/example")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
