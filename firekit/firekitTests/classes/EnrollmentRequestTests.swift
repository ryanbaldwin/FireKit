//
//  EnrollmentRequestTests.swift
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


class EnrollmentRequestTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.EnrollmentRequest {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.EnrollmentRequest {
        // print("Inflating FireKit.EnrollmentRequest from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.EnrollmentRequest.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testEnrollmentRequest1() {   
        var instance: FireKit.EnrollmentRequest?
        do {
            instance = try runEnrollmentRequest1()
            try runEnrollmentRequest1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test EnrollmentRequest successfully, but threw: \(error)")
        }

        testEnrollmentRequestRealm1(instance!)
    }

    func testEnrollmentRequest1Copying() {
        do {
            let instance = try runEnrollmentRequest1()
            let copy = instance.copy() as? FireKit.EnrollmentRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runEnrollmentRequest1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test EnrollmentRequest successfully, but threw: \(error)")
        }
    }

    func testEnrollmentRequest1Populatability() {
        do {
            let instance = try runEnrollmentRequest1()
            let copy = FireKit.EnrollmentRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runEnrollmentRequest1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test EnrollmentRequest successfully, but threw: \(error)")
        }
    }

    func testEnrollmentRequestRealm1(_ instance: FireKit.EnrollmentRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEnrollmentRequest1(JSONEncoder().encode(realm.objects(FireKit.EnrollmentRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.EnrollmentRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.EnrollmentRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.EnrollmentRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.EnrollmentRequest.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.EnrollmentRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.EnrollmentRequest.self).count)
    }
    
    @discardableResult
    func runEnrollmentRequest1(_ data: Data? = nil) throws -> FireKit.EnrollmentRequest {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "enrollmentrequest-example.json")
        
        XCTAssertEqual(inst.coverage?.reference, "Coverage/9876B1")
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.id, "22345")
        XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/enrollmentrequest")
        XCTAssertEqual(inst.identifier[0].value, "EN22345")
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.relationship?.code, "spouse")
        XCTAssertEqual(inst.subject?.reference, "Patient/1")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EnrollmentRequest.</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}