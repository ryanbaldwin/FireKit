//
//  OrderTests.swift
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


class OrderTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Order {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Order {
        // print("Inflating FireKit.Order from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Order.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testOrder1() {   
        var instance: FireKit.Order?
        do {
            instance = try runOrder1()
            try runOrder1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Order successfully, but threw: \(error)")
        }

        testOrderRealm1(instance!)
    }

    func testOrder1Copying() {
        do {
            let instance = try runOrder1()
            let copy = instance.copy() as? FireKit.Order
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOrder1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Order successfully, but threw: \(error)")
        }
    }

    func testOrder1Populatability() {
        do {
            let instance = try runOrder1()
            let copy = FireKit.Order()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOrder1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Order successfully, but threw: \(error)")
        }
    }

    func testOrder1NillingPopulatability() {
        do {
            let instance = try runOrder1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Order()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Order successfully, but threw: \(error)")
        }
    }

    func testOrderRealm1(_ instance: FireKit.Order) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOrder1(JSONEncoder().encode(realm.objects(FireKit.Order.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Order.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Order()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Order.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Order.self).count)
    }
    
    @discardableResult
    func runOrder1(_ data: Data? = nil) throws -> FireKit.Order {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "order-example-f201-physiotherapy.json")
        
        XCTAssertEqual(inst.date?.description, "2013-03-05T12:00:00+01:00")
        XCTAssertEqual(inst.detail[0].display, "Consultation, not yet developed")
        XCTAssertEqual(inst.id, "f201")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "It concerns a one-off order for consultation in order to evaluate the stairs walking ability of Roel.")
        XCTAssertEqual(inst.source?.reference, "Practitioner/f201")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.target?.display, "Juri van Gelder")
        XCTAssertEqual(inst.target?.reference, "Practitioner/f203")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.when?.code?.coding[0].code, "394848005")
        XCTAssertEqual(inst.when?.code?.coding[0].display, "Normal priority")
        XCTAssertEqual(inst.when?.code?.coding[0].system, "http://snomed.info/sct")

        return inst
    }
    
    func testOrder2() {   
        var instance: FireKit.Order?
        do {
            instance = try runOrder2()
            try runOrder2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Order successfully, but threw: \(error)")
        }

        testOrderRealm2(instance!)
    }

    func testOrder2Copying() {
        do {
            let instance = try runOrder2()
            let copy = instance.copy() as? FireKit.Order
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOrder2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Order successfully, but threw: \(error)")
        }
    }

    func testOrder2Populatability() {
        do {
            let instance = try runOrder2()
            let copy = FireKit.Order()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOrder2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Order successfully, but threw: \(error)")
        }
    }

    func testOrder2NillingPopulatability() {
        do {
            let instance = try runOrder2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Order()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Order successfully, but threw: \(error)")
        }
    }

    func testOrderRealm2(_ instance: FireKit.Order) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOrder2(JSONEncoder().encode(realm.objects(FireKit.Order.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Order.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Order()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Order.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Order.self).count)
    }
    
    @discardableResult
    func runOrder2(_ data: Data? = nil) throws -> FireKit.Order {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "order-example.json")
        
        XCTAssertEqual(inst.date?.description, "2012-12-28T09:03:04+11:00")
        XCTAssertEqual(inst.detail[0].reference, "MedicationOrder/example")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "Standard admission testing")
        XCTAssertEqual(inst.source?.reference, "Practitioner/example")
        XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
        XCTAssertEqual(inst.text?.div, "<div>Request for Prescription (on patient Donald DUCK @ Acme Healthcare, Inc. MR = 654321)</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.when?.code?.coding[0].code, "today")
        XCTAssertEqual(inst.when?.code?.coding[0].system, "http://acme.com/codes/request-priority")

        return inst
    }
}