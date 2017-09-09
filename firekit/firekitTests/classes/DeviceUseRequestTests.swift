//
//  DeviceUseRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class DeviceUseRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.DeviceUseRequest {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.DeviceUseRequest {
		let instance = FireKit.DeviceUseRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDeviceUseRequest1() {		
		var instance: FireKit.DeviceUseRequest?
		do {
			instance = try runDeviceUseRequest1()
			try runDeviceUseRequest1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.DeviceUseRequest
			XCTAssertNotNil(copy)
			try runDeviceUseRequest1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceUseRequest1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest successfully, but threw")
		}

		testDeviceUseRequestRealm1(instance!)
	}

    func testDeviceUseRequest1RealmPK() {        
        do {
            let instance: FireKit.DeviceUseRequest = try runDeviceUseRequest1()
            let copy = (instance.copy() as! FireKit.DeviceUseRequest)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest's PKs, but threw: \(error)")
        }
    }

	func testDeviceUseRequestRealm1(_ instance: FireKit.DeviceUseRequest) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceUseRequest1(realm.objects(FireKit.DeviceUseRequest.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceUseRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceUseRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceUseRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceUseRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceUseRequest.self).count)
	}
	
	@discardableResult
	func runDeviceUseRequest1(_ json: FHIRJSON? = nil) throws -> FireKit.DeviceUseRequest {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("deviceuserequest-example.json")
		
		XCTAssertEqual(inst.device?.reference, "Device/example")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
