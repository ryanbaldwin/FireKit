//
//  DeviceComponentTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-19.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-19
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class DeviceComponentTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.DeviceComponent {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.DeviceComponent {
        // print("Inflating FireKit.DeviceComponent from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.DeviceComponent.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testDeviceComponent1() {   
        var instance: FireKit.DeviceComponent?
        do {
            instance = try runDeviceComponent1()
            try runDeviceComponent1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceComponent successfully, but threw: \(error)")
        }

        testDeviceComponentRealm1(instance!)
    }

    func testDeviceComponent1Copying() {
        do {
            let instance = try runDeviceComponent1()
            let copy = instance.copy() as? FireKit.DeviceComponent
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDeviceComponent1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DeviceComponent successfully, but threw: \(error)")
        }
    }

    func testDeviceComponent1Populatability() {
        do {
            let instance = try runDeviceComponent1()
            let copy = FireKit.DeviceComponent()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDeviceComponent1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DeviceComponent successfully, but threw: \(error)")
        }
    }

    func testDeviceComponentRealm1(_ instance: FireKit.DeviceComponent) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDeviceComponent1(JSONEncoder().encode(realm.objects(FireKit.DeviceComponent.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceComponent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceComponent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceComponent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DeviceComponent.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceComponent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceComponent.self).count)
    }
    
    @discardableResult
    func runDeviceComponent1(_ data: Data? = nil) throws -> FireKit.DeviceComponent {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "devicecomponent-example-prodspec.json")
        
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
        var instance: FireKit.DeviceComponent?
        do {
            instance = try runDeviceComponent2()
            try runDeviceComponent2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceComponent successfully, but threw: \(error)")
        }

        testDeviceComponentRealm2(instance!)
    }

    func testDeviceComponent2Copying() {
        do {
            let instance = try runDeviceComponent2()
            let copy = instance.copy() as? FireKit.DeviceComponent
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDeviceComponent2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DeviceComponent successfully, but threw: \(error)")
        }
    }

    func testDeviceComponent2Populatability() {
        do {
            let instance = try runDeviceComponent2()
            let copy = FireKit.DeviceComponent()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDeviceComponent2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DeviceComponent successfully, but threw: \(error)")
        }
    }

    func testDeviceComponentRealm2(_ instance: FireKit.DeviceComponent) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDeviceComponent2(JSONEncoder().encode(realm.objects(FireKit.DeviceComponent.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceComponent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceComponent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceComponent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DeviceComponent.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceComponent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceComponent.self).count)
    }
    
    @discardableResult
    func runDeviceComponent2(_ data: Data? = nil) throws -> FireKit.DeviceComponent {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "devicecomponent-example.json")
        
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