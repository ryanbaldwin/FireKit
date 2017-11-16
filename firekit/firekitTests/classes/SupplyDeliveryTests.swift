//
//  SupplyDeliveryTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-11-13.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-11-13
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class SupplyDeliveryTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.SupplyDelivery {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.SupplyDelivery {
        // print("Inflating FireKit.SupplyDelivery from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.SupplyDelivery.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testSupplyDelivery1() {   
        var instance: FireKit.SupplyDelivery?
        do {
            instance = try runSupplyDelivery1()
            try runSupplyDelivery1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test SupplyDelivery successfully, but threw: \(error)")
        }

        testSupplyDeliveryRealm1(instance!)
    }

    func testSupplyDelivery1Copying() {
        do {
            let instance = try runSupplyDelivery1()
            let copy = instance.copy() as? FireKit.SupplyDelivery
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runSupplyDelivery1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test SupplyDelivery successfully, but threw: \(error)")
        }
    }

    func testSupplyDelivery1Populatability() {
        do {
            let instance = try runSupplyDelivery1()
            let copy = FireKit.SupplyDelivery()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runSupplyDelivery1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test SupplyDelivery successfully, but threw: \(error)")
        }
    }

    func testSupplyDelivery1NillingPopulatability() {
        do {
            let instance = try runSupplyDelivery1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.SupplyDelivery()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test SupplyDelivery successfully, but threw: \(error)")
        }
    }

    func testSupplyDeliveryRealm1(_ instance: FireKit.SupplyDelivery) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSupplyDelivery1(JSONEncoder().encode(realm.objects(FireKit.SupplyDelivery.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.SupplyDelivery.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.SupplyDelivery.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.SupplyDelivery()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.SupplyDelivery.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.SupplyDelivery.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.SupplyDelivery.self).count)
    }
    
    @discardableResult
    func runSupplyDelivery1(_ data: Data? = nil) throws -> FireKit.SupplyDelivery {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "supplydelivery-example.json")
        
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}