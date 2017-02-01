//
//  DeviceUseStatementTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
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
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceUseStatement successfully, but threw")
		}

		testDeviceUseStatementRealm1(instance: instance!)
	}

	func testDeviceUseStatementRealm1(instance: RealmSwiftFHIR.DeviceUseStatement) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceUseStatement1(realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceUseStatement.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
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
