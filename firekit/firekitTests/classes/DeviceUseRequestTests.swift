//
//  DeviceUseRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-22.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-22
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class DeviceUseRequestTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.DeviceUseRequest {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.DeviceUseRequest {
        // print("Inflating FireKit.DeviceUseRequest from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.DeviceUseRequest.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testDeviceUseRequest1() {   
        var instance: FireKit.DeviceUseRequest?
        do {
            instance = try runDeviceUseRequest1()
            try runDeviceUseRequest1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest successfully, but threw: \(error)")
        }

        testDeviceUseRequestRealm1(instance!)
    }

    func testDeviceUseRequest1Copying() {
        do {
            let instance = try runDeviceUseRequest1()
            let copy = instance.copy() as? FireKit.DeviceUseRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDeviceUseRequest1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DeviceUseRequest successfully, but threw: \(error)")
        }
    }

    func testDeviceUseRequest1Populatability() {
        do {
            let instance = try runDeviceUseRequest1()
            let copy = FireKit.DeviceUseRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDeviceUseRequest1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DeviceUseRequest successfully, but threw: \(error)")
        }
    }

    func testDeviceUseRequest1NillingPopulatability() {
        do {
            let instance = try runDeviceUseRequest1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.DeviceUseRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test DeviceUseRequest successfully, but threw: \(error)")
        }
    }

    func testDeviceUseRequestRealm1(_ instance: FireKit.DeviceUseRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDeviceUseRequest1(JSONEncoder().encode(realm.objects(FireKit.DeviceUseRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceUseRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceUseRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceUseRequest.self).count)
    }
    
    @discardableResult
    func runDeviceUseRequest1(_ data: Data? = nil) throws -> FireKit.DeviceUseRequest {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "deviceuserequest-example.json")
        
        XCTAssertEqual(inst.device?.reference, "Device/example")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}