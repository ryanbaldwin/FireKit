//
//  DeviceComponentTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
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
			let copy = instance!.copy() as? RealmSwiftFHIR.DeviceComponent
			XCTAssertNotNil(copy)
			try runDeviceComponent1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceComponent1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceComponent successfully, but threw")
		}

		testDeviceComponentRealm1(instance: instance!)
	}

    func testDeviceComponent1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DeviceComponent = try runDeviceComponent1()
            let copy = (instance.copy() as! RealmSwiftFHIR.DeviceComponent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceComponent's PKs, but threw: \(error)")
        }
    }

	func testDeviceComponentRealm1(instance: RealmSwiftFHIR.DeviceComponent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceComponent1(realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DeviceComponent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DeviceComponent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceComponent1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DeviceComponent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceComponent1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)
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
			let copy = instance!.copy() as? RealmSwiftFHIR.DeviceComponent
			XCTAssertNotNil(copy)
			try runDeviceComponent2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceComponent2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DeviceComponent successfully, but threw")
		}

		testDeviceComponentRealm2(instance: instance!)
	}

    func testDeviceComponent2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DeviceComponent = try runDeviceComponent2()
            let copy = (instance.copy() as! RealmSwiftFHIR.DeviceComponent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceComponent's PKs, but threw: \(error)")
        }
    }

	func testDeviceComponentRealm2(instance: RealmSwiftFHIR.DeviceComponent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDeviceComponent2(realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DeviceComponent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DeviceComponent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DeviceComponent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceComponent2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DeviceComponent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDeviceComponent2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DeviceComponent.self).count)
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
