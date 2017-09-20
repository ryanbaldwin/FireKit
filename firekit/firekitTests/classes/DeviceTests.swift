//
//  DeviceTests.swift
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


class DeviceTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Device {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Device {
        // print("Inflating FireKit.Device from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Device.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testDevice1() {   
        var instance: FireKit.Device?
        do {
            instance = try runDevice1()
            try runDevice1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw: \(error)")
        }

        testDeviceRealm1(instance!)
    }

    func testDevice1Copying() {
        do {
            let instance = try runDevice1()
            let copy = instance.copy() as? FireKit.Device
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDevice1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Device successfully, but threw: \(error)")
        }
    }

    func testDevice1Populatability() {
        do {
            let instance = try runDevice1()
            let copy = FireKit.Device()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDevice1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Device successfully, but threw: \(error)")
        }
    }

    func testDeviceRealm1(_ instance: FireKit.Device) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDevice1(JSONEncoder().encode(realm.objects(FireKit.Device.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Device.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Device.self).count)
    }
    
    @discardableResult
    func runDevice1(_ data: Data? = nil) throws -> FireKit.Device {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "device-example-f001-feedingtube.json")
        
        XCTAssertEqual(inst.expiry?.description, "2020-08-08")
        XCTAssertEqual(inst.id, "f001")
        XCTAssertEqual(inst.identifier[0].system, "http:/goodhealthhospital/identifier/devices")
        XCTAssertEqual(inst.identifier[0].value, "12345")
        XCTAssertEqual(inst.location?.display, "Central Supply")
        XCTAssertEqual(inst.manufactureDate?.description, "2015-08-08")
        XCTAssertEqual(inst.owner?.reference, "Organization/2.16.840.1.113883.19.5")
        XCTAssertEqual(inst.status, "available")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "25062003")
        XCTAssertEqual(inst.type?.coding[0].display, "Feeding tube, device")
        XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.udi, "(01)00000123000017(10)ABC123(17)120415")

        return inst
    }
    
    func testDevice2() {   
        var instance: FireKit.Device?
        do {
            instance = try runDevice2()
            try runDevice2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw: \(error)")
        }

        testDeviceRealm2(instance!)
    }

    func testDevice2Copying() {
        do {
            let instance = try runDevice2()
            let copy = instance.copy() as? FireKit.Device
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDevice2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Device successfully, but threw: \(error)")
        }
    }

    func testDevice2Populatability() {
        do {
            let instance = try runDevice2()
            let copy = FireKit.Device()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDevice2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Device successfully, but threw: \(error)")
        }
    }

    func testDeviceRealm2(_ instance: FireKit.Device) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDevice2(JSONEncoder().encode(realm.objects(FireKit.Device.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Device.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Device.self).count)
    }
    
    @discardableResult
    func runDevice2(_ data: Data? = nil) throws -> FireKit.Device {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "device-example-ihe-pcd.json")
        
        XCTAssertEqual(inst.id, "ihe-pcd")
        XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "SNO")
        XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
        XCTAssertEqual(inst.identifier[0].type?.text, "Serial Number")
        XCTAssertEqual(inst.identifier[0].value, "AMID-123-456")
        XCTAssertEqual(inst.lotNumber, "12345")
        XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
        XCTAssertEqual(inst.model, "A.1.1")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Acme Patient Monitor</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.text, "Vital Signs Monitor")

        return inst
    }
    
    func testDevice3() {   
        var instance: FireKit.Device?
        do {
            instance = try runDevice3()
            try runDevice3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw: \(error)")
        }

        testDeviceRealm3(instance!)
    }

    func testDevice3Copying() {
        do {
            let instance = try runDevice3()
            let copy = instance.copy() as? FireKit.Device
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDevice3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Device successfully, but threw: \(error)")
        }
    }

    func testDevice3Populatability() {
        do {
            let instance = try runDevice3()
            let copy = FireKit.Device()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDevice3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Device successfully, but threw: \(error)")
        }
    }

    func testDeviceRealm3(_ instance: FireKit.Device) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDevice3(JSONEncoder().encode(realm.objects(FireKit.Device.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Device.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Device.self).count)
    }
    
    @discardableResult
    func runDevice3(_ data: Data? = nil) throws -> FireKit.Device {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "device-example-pacemaker.json")
        
        XCTAssertEqual(inst.contact[0].system, "phone")
        XCTAssertEqual(inst.contact[0].value, "ext 4352")
        XCTAssertEqual(inst.id, "example-pacemaker")
        XCTAssertEqual(inst.identifier[0].system, "http://acme.com/devices/pacemakers/octane/serial")
        XCTAssertEqual(inst.identifier[0].value, "1234-5678-90AB-CDEF")
        XCTAssertEqual(inst.lotNumber, "1234-5678")
        XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
        XCTAssertEqual(inst.model, "PM/Octane 2014")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "octane2014")
        XCTAssertEqual(inst.type?.coding[0].display, "Performance pace maker for high octane patients")
        XCTAssertEqual(inst.type?.coding[0].system, "http://acme.com/devices")

        return inst
    }
    
    func testDevice4() {   
        var instance: FireKit.Device?
        do {
            instance = try runDevice4()
            try runDevice4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw: \(error)")
        }

        testDeviceRealm4(instance!)
    }

    func testDevice4Copying() {
        do {
            let instance = try runDevice4()
            let copy = instance.copy() as? FireKit.Device
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDevice4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Device successfully, but threw: \(error)")
        }
    }

    func testDevice4Populatability() {
        do {
            let instance = try runDevice4()
            let copy = FireKit.Device()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDevice4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Device successfully, but threw: \(error)")
        }
    }

    func testDeviceRealm4(_ instance: FireKit.Device) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDevice4(JSONEncoder().encode(realm.objects(FireKit.Device.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Device.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Device.self).count)
    }
    
    @discardableResult
    func runDevice4(_ data: Data? = nil) throws -> FireKit.Device {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "device-example-software.json")
        
        XCTAssertEqual(inst.contact[0].system, "other")
        XCTAssertEqual(inst.contact[0].value, "http://acme.com")
        XCTAssertEqual(inst.id, "software")
        XCTAssertEqual(inst.identifier[0].system, "http://acme.com/ehr/client-ids")
        XCTAssertEqual(inst.identifier[0].value, "goodhealth")
        XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.text, "EHR")
        XCTAssertEqual(inst.url, "http://acme.com/goodhealth/ehr/")
        XCTAssertEqual(inst.version, "10.23-23423")

        return inst
    }
    
    func testDevice5() {   
        var instance: FireKit.Device?
        do {
            instance = try runDevice5()
            try runDevice5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw: \(error)")
        }

        testDeviceRealm5(instance!)
    }

    func testDevice5Copying() {
        do {
            let instance = try runDevice5()
            let copy = instance.copy() as? FireKit.Device
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDevice5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Device successfully, but threw: \(error)")
        }
    }

    func testDevice5Populatability() {
        do {
            let instance = try runDevice5()
            let copy = FireKit.Device()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDevice5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Device successfully, but threw: \(error)")
        }
    }

    func testDeviceRealm5(_ instance: FireKit.Device) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDevice5(JSONEncoder().encode(realm.objects(FireKit.Device.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Device.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Device.self).count)
    }
    
    @discardableResult
    func runDevice5(_ data: Data? = nil) throws -> FireKit.Device {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "device-example.json")
        
        XCTAssertEqual(inst.contact[0].system, "phone")
        XCTAssertEqual(inst.contact[0].value, "ext 4352")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "http://goodcare.org/devices/id")
        XCTAssertEqual(inst.identifier[0].value, "345675")
        XCTAssertEqual(inst.identifier[1].type?.coding[0].code, "SNO")
        XCTAssertEqual(inst.identifier[1].type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
        XCTAssertEqual(inst.identifier[1].type?.text, "Serial Number")
        XCTAssertEqual(inst.identifier[1].value, "AMID-342135-8464")
        XCTAssertEqual(inst.lotNumber, "43453424")
        XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
        XCTAssertEqual(inst.model, "AB 45-J")
        XCTAssertEqual(inst.note[0].authorReference?.reference, "Practitioner/xcda-author")
        XCTAssertEqual(inst.note[0].text, "QA Checked")
        XCTAssertEqual(inst.note[0].time?.description, "2015-06-28T14:03:32+10:00")
        XCTAssertEqual(inst.status, "available")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "86184003")
        XCTAssertEqual(inst.type?.coding[0].display, "Electrocardiographic monitor and recorder")
        XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.type?.text, "ECG")

        return inst
    }
}