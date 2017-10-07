//
//  DeviceMetricTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-06.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-06
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class DeviceMetricTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.DeviceMetric {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.DeviceMetric {
        // print("Inflating FireKit.DeviceMetric from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.DeviceMetric.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testDeviceMetric1() {   
        var instance: FireKit.DeviceMetric?
        do {
            instance = try runDeviceMetric1()
            try runDeviceMetric1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceMetric successfully, but threw: \(error)")
        }

        testDeviceMetricRealm1(instance!)
    }

    func testDeviceMetric1Copying() {
        do {
            let instance = try runDeviceMetric1()
            let copy = instance.copy() as? FireKit.DeviceMetric
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDeviceMetric1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DeviceMetric successfully, but threw: \(error)")
        }
    }

    func testDeviceMetric1Populatability() {
        do {
            let instance = try runDeviceMetric1()
            let copy = FireKit.DeviceMetric()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDeviceMetric1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DeviceMetric successfully, but threw: \(error)")
        }
    }

    func testDeviceMetricRealm1(_ instance: FireKit.DeviceMetric) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDeviceMetric1(JSONEncoder().encode(realm.objects(FireKit.DeviceMetric.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceMetric.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceMetric.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceMetric()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.DeviceMetric.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceMetric.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceMetric.self).count)
    }
    
    @discardableResult
    func runDeviceMetric1(_ data: Data? = nil) throws -> FireKit.DeviceMetric {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "devicemetric-example.json")
        
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