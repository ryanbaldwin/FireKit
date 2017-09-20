//
//  OrderResponseTests.swift
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


class OrderResponseTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.OrderResponse {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.OrderResponse {
        // print("Inflating FireKit.OrderResponse from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.OrderResponse.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testOrderResponse1() {   
        var instance: FireKit.OrderResponse?
        do {
            instance = try runOrderResponse1()
            try runOrderResponse1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OrderResponse successfully, but threw: \(error)")
        }

        testOrderResponseRealm1(instance!)
    }

    func testOrderResponse1Copying() {
        do {
            let instance = try runOrderResponse1()
            let copy = instance.copy() as? FireKit.OrderResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOrderResponse1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OrderResponse successfully, but threw: \(error)")
        }
    }

    func testOrderResponse1Populatability() {
        do {
            let instance = try runOrderResponse1()
            let copy = FireKit.OrderResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOrderResponse1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OrderResponse successfully, but threw: \(error)")
        }
    }

    func testOrderResponseRealm1(_ instance: FireKit.OrderResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOrderResponse1(JSONEncoder().encode(realm.objects(FireKit.OrderResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OrderResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OrderResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OrderResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.OrderResponse.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OrderResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OrderResponse.self).count)
    }
    
    @discardableResult
    func runOrderResponse1(_ data: Data? = nil) throws -> FireKit.OrderResponse {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "orderresponse-example.json")
        
        XCTAssertEqual(inst.date?.description, "2012-12-28T13:10:56+11:00")
        XCTAssertEqual(inst.fulfillment[0].reference, "DiagnosticReport/101")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.orderStatus, "completed")
        XCTAssertEqual(inst.request?.reference, "Order/example")
        XCTAssertEqual(inst.text?.div, "<div>Lab Report completed at 13:10 28-Dec 2012</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.who?.reference, "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f")

        return inst
    }
}