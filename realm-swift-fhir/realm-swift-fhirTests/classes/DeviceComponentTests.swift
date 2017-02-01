//
//  DeviceComponentTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DeviceComponentTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DeviceComponent {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DeviceComponent {
		let instance = RealmSwiftFHIR.DeviceComponent(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDeviceComponent1() {		
		var instance: RealmSwiftFHIR.DeviceComponent?
		do {
			instance = try runDeviceComponent1()
			try runDeviceComponent1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceComponent successfully, but threw")
		}

		testDeviceComponentRealm1(instance: instance!)
	}

	func testDeviceComponentRealm1(instance: RealmSwiftFHIR.DeviceComponent) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceComponent1(realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDeviceComponent1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DeviceComponent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "devicecomponent-example-prodspec.json")
		
		XCTAssertEqual(inst.contained[0].id, "d1")
		XCTAssertEqual(inst.id, "example-prodspec")
		XCTAssertEqual(inst.identifier?.type?.text, "Handle ID")
		XCTAssertEqual(inst.identifier?.value, "0")
		XCTAssertEqual(inst.languageCode?.coding[0].code, "en-US")
		XCTAssertEqual(inst.languageCode?.coding[0].system, "http://tools.ietf.org/html/bcp47")
		XCTAssertEqual(inst.lastSystemChange?.description, "2014-10-07T14:45:00Z")
		XCTAssertEqual(inst.operationalStatus[0].coding[0].code, "0")
		XCTAssertEqual(inst.operationalStatus[0].coding[0].display, "disconnected")
		XCTAssertEqual(inst.operationalStatus[0].coding[0].system, "urn:iso:std:iso:11073:10101")
		XCTAssertEqual(inst.productionSpecification[0].productionSpec, "xa-12324-b")
		XCTAssertEqual(inst.productionSpecification[0].specType?.coding[0].code, "1")
		XCTAssertEqual(inst.productionSpecification[0].specType?.coding[0].display, "Serial number")
		XCTAssertEqual(inst.productionSpecification[1].productionSpec, "1.1")
		XCTAssertEqual(inst.productionSpecification[1].specType?.coding[0].code, "3")
		XCTAssertEqual(inst.productionSpecification[1].specType?.coding[0].display, "Hardware version")
		XCTAssertEqual(inst.productionSpecification[2].productionSpec, "1.12")
		XCTAssertEqual(inst.productionSpecification[2].specType?.coding[0].code, "4")
		XCTAssertEqual(inst.productionSpecification[2].specType?.coding[0].display, "Software version")
		XCTAssertEqual(inst.productionSpecification[3].productionSpec, "1.0.23")
		XCTAssertEqual(inst.productionSpecification[3].specType?.coding[0].code, "5")
		XCTAssertEqual(inst.productionSpecification[3].specType?.coding[0].display, "Firmware version")
		XCTAssertEqual(inst.source?.reference, "#d1")
		XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p>Example of a simple MDS from a pulse oximeter containment tree</p>\n\t\t</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "2000")
		XCTAssertEqual(inst.type?.coding[0].display, "MDC_DEV_ANALY_SAT_O2_MDS")
		XCTAssertEqual(inst.type?.coding[0].system, "urn:iso:std:iso:11073:10101")
		
		return inst
	}
	
	func testDeviceComponent2() {		
		var instance: RealmSwiftFHIR.DeviceComponent?
		do {
			instance = try runDeviceComponent2()
			try runDeviceComponent2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceComponent successfully, but threw")
		}

		testDeviceComponentRealm2(instance: instance!)
	}

	func testDeviceComponentRealm2(instance: RealmSwiftFHIR.DeviceComponent) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceComponent2(realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDeviceComponent2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DeviceComponent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "devicecomponent-example.json")
		
		XCTAssertEqual(inst.contained[0].id, "d1")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier?.type?.text, "Handle ID")
		XCTAssertEqual(inst.identifier?.value, "0")
		XCTAssertEqual(inst.languageCode?.coding[0].code, "en-US")
		XCTAssertEqual(inst.languageCode?.coding[0].system, "http://tools.ietf.org/html/bcp47")
		XCTAssertEqual(inst.lastSystemChange?.description, "2014-10-07T14:45:00Z")
		XCTAssertEqual(inst.operationalStatus[0].coding[0].code, "0")
		XCTAssertEqual(inst.operationalStatus[0].coding[0].display, "disconnected")
		XCTAssertEqual(inst.operationalStatus[0].coding[0].system, "urn:iso:std:iso:11073:10101")
		XCTAssertEqual(inst.source?.reference, "#d1")
		XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p>Example of a simple MDS from a pulse oximeter containment tree</p>\n\t\t</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "2000")
		XCTAssertEqual(inst.type?.coding[0].display, "MDC_DEV_ANALY_SAT_O2_MDS")
		XCTAssertEqual(inst.type?.coding[0].system, "urn:iso:std:iso:11073:10101")
		
		return inst
	}
}
