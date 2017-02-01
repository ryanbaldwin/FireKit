//
//  DeviceMetricTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DeviceMetricTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DeviceMetric {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DeviceMetric {
		let instance = RealmSwiftFHIR.DeviceMetric(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDeviceMetric1() {		
		var instance: RealmSwiftFHIR.DeviceMetric?
		do {
			instance = try runDeviceMetric1()
			try runDeviceMetric1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceMetric successfully, but threw")
		}

		testDeviceMetricRealm1(instance: instance!)
	}

	func testDeviceMetricRealm1(instance: RealmSwiftFHIR.DeviceMetric) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceMetric1(realm.objects(RealmSwiftFHIR.DeviceMetric.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceMetric.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceMetric.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDeviceMetric1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DeviceMetric {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "devicemetric-example.json")
		
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
