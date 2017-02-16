//
//  DeviceUseRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
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
			let copy = instance!.copy() as? RealmSwiftFHIR.DeviceUseRequest
			XCTAssertNotNil(copy)
			try runDeviceUseRequest1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest successfully, but threw")
		}

		testDeviceUseRequestRealm1(instance: instance!)
	}

	func testDeviceUseRequestRealm1(instance: RealmSwiftFHIR.DeviceUseRequest) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceUseRequest1(realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DeviceUseRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceUseRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceUseRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DeviceUseRequest.self).count)
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
