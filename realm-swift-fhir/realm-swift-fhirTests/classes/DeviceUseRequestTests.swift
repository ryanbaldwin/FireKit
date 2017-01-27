//
//  DeviceUseRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DeviceUseRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DeviceUseRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DeviceUseRequest {
		let instance = RealmSwiftFHIR.DeviceUseRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDeviceUseRequest1() {		
		var instance: RealmSwiftFHIR.DeviceUseRequest?
		do {
			instance = try runDeviceUseRequest1()
			try runDeviceUseRequest1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest successfully, but threw")
		}

		testDeviceUseRequestRealm1(instance: instance!)
	}

	func testDeviceUseRequestRealm1(instance: RealmSwiftFHIR.DeviceUseRequest) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceUseRequest1(realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDeviceUseRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DeviceUseRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "deviceuserequest-example.json")
		
		XCTAssertEqual(inst.device?.reference, "Device/example")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
