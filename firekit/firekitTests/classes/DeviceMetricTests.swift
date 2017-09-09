//
//  DeviceMetricTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class DeviceMetricTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.DeviceMetric {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.DeviceMetric {
		let instance = FireKit.DeviceMetric(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDeviceMetric1() {		
		var instance: FireKit.DeviceMetric?
		do {
			instance = try runDeviceMetric1()
			try runDeviceMetric1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.DeviceMetric
			XCTAssertNotNil(copy)
			try runDeviceMetric1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceMetric1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceMetric successfully, but threw")
		}

		testDeviceMetricRealm1(instance!)
	}

    func testDeviceMetric1RealmPK() {        
        do {
            let instance: FireKit.DeviceMetric = try runDeviceMetric1()
            let copy = (instance.copy() as! FireKit.DeviceMetric)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceMetric's PKs, but threw: \(error)")
        }
    }

	func testDeviceMetricRealm1(_ instance: FireKit.DeviceMetric) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceMetric1(realm.objects(FireKit.DeviceMetric.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceMetric.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceMetric.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceMetric()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DeviceMetric.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceMetric1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DeviceMetric.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceMetric1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceMetric.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceMetric.self).count)
	}
	
	@discardableResult
	func runDeviceMetric1(_ json: FHIRJSON? = nil) throws -> FireKit.DeviceMetric {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("devicemetric-example.json")
		
		XCTAssertEqual(inst.category, "measurement")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier?.system, "http://goodcare.org/devicemetric/id")
		XCTAssertEqual(inst.identifier?.value, "345675")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "150456")
		XCTAssertEqual(inst.type?.coding[0].display, "MDC_PULS_OXIM_SAT_O2")
		XCTAssertEqual(inst.type?.coding[0].system, "https://rtmms.nist.gov")
		XCTAssertEqual(inst.unit?.coding[0].code, "262688")
		XCTAssertEqual(inst.unit?.coding[0].display, "MDC_DIM_PERCENT")
		XCTAssertEqual(inst.unit?.coding[0].system, "https://rtmms.nist.gov")
		
		return inst
	}
}
