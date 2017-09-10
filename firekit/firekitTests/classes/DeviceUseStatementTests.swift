//
//  DeviceUseStatementTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class DeviceUseStatementTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func inflateFrom(filename: String) throws -> FireKit.DeviceUseStatement {
		return try inflateFrom(data: try readJSONFile(filename))
	}
	
	func inflateFrom(data: Data) throws -> FireKit.DeviceUseStatement {
      let data = NSKeyedArchiver.archivedData(withRootObject: data)
		  let instance = try JSONDecoder().decode(FireKit.DeviceUseStatement.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testDeviceUseStatement1() {		
		var instance: FireKit.DeviceUseStatement?
		do {
			instance = try runDeviceUseStatement1()
			try runDeviceUseStatement1(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.DeviceUseStatement
			XCTAssertNotNil(copy)
			try runDeviceUseStatement1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceUseStatement1(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test DeviceUseStatement successfully, but threw: \(error)")
		}

		testDeviceUseStatementRealm1(instance!)
	}

    func testDeviceUseStatement1RealmPK() {        
        do {
            let instance: FireKit.DeviceUseStatement = try runDeviceUseStatement1()
            let copy = (instance.copy() as! FireKit.DeviceUseStatement)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceUseStatement's PKs, but threw: \(error)")
        }
    }

	func testDeviceUseStatementRealm1(_ instance: FireKit.DeviceUseStatement) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runDeviceUseStatement1(JSONEncoder().encode(realm.objects(FireKit.DeviceUseStatement.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseStatement.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceUseStatement.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceUseStatement()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DeviceUseStatement.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDeviceUseStatement1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DeviceUseStatement.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDeviceUseStatement1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseStatement.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceUseStatement.self).count)
	}
	
	@discardableResult
	func runDeviceUseStatement1(_ data: Data? = nil) throws -> FireKit.DeviceUseStatement {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "deviceusestatement-example.json")
		
		XCTAssertEqual(inst.device?.reference, "Device/example")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
