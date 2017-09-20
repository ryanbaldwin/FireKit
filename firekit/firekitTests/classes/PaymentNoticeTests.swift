//
//  PaymentNoticeTests.swift
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


class PaymentNoticeTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.PaymentNotice {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.PaymentNotice {
        // print("Inflating FireKit.PaymentNotice from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.PaymentNotice.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testPaymentNotice1() {   
        var instance: FireKit.PaymentNotice?
        do {
            instance = try runPaymentNotice1()
            try runPaymentNotice1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test PaymentNotice successfully, but threw: \(error)")
        }

        testPaymentNoticeRealm1(instance!)
    }

    func testPaymentNotice1Copying() {
        do {
            let instance = try runPaymentNotice1()
            let copy = instance.copy() as? FireKit.PaymentNotice
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runPaymentNotice1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test PaymentNotice successfully, but threw: \(error)")
        }
    }

    func testPaymentNotice1Populatability() {
        do {
            let instance = try runPaymentNotice1()
            let copy = FireKit.PaymentNotice()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runPaymentNotice1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test PaymentNotice successfully, but threw: \(error)")
        }
    }

    func testPaymentNoticeRealm1(_ instance: FireKit.PaymentNotice) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPaymentNotice1(JSONEncoder().encode(realm.objects(FireKit.PaymentNotice.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.PaymentNotice.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.PaymentNotice.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.PaymentNotice()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.PaymentNotice.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.PaymentNotice.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.PaymentNotice.self).count)
    }
    
    @discardableResult
    func runPaymentNotice1(_ data: Data? = nil) throws -> FireKit.PaymentNotice {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "paymentnotice-example.json")
        
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.id, "77654")
        XCTAssertEqual(inst.identifier[0].system, "http://benefitsinc.com/paymentnotice")
        XCTAssertEqual(inst.identifier[0].value, "776543")
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.paymentStatus?.code, "paid")
        XCTAssertEqual(inst.paymentStatus?.system, "http://hl7.org/fhir/paymentstatus")
        XCTAssertEqual(inst.request?.reference, "http://benefitsinc.com/fhir/oralhealthclaim/12345")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the PaymentNotice</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}