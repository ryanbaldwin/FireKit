//
//  EligibilityRequestTests.swift
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


class EligibilityRequestTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.EligibilityRequest {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.EligibilityRequest {
        // print("Inflating FireKit.EligibilityRequest from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.EligibilityRequest.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testEligibilityRequest1() {   
        var instance: FireKit.EligibilityRequest?
        do {
            instance = try runEligibilityRequest1()
            try runEligibilityRequest1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test EligibilityRequest successfully, but threw: \(error)")
        }

        testEligibilityRequestRealm1(instance!)
    }

    func testEligibilityRequest1Copying() {
        do {
            let instance = try runEligibilityRequest1()
            let copy = instance.copy() as? FireKit.EligibilityRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runEligibilityRequest1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test EligibilityRequest successfully, but threw: \(error)")
        }
    }

    func testEligibilityRequest1Populatability() {
        do {
            let instance = try runEligibilityRequest1()
            let copy = FireKit.EligibilityRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runEligibilityRequest1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test EligibilityRequest successfully, but threw: \(error)")
        }
    }

    func testEligibilityRequestRealm1(_ instance: FireKit.EligibilityRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEligibilityRequest1(JSONEncoder().encode(realm.objects(FireKit.EligibilityRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.EligibilityRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.EligibilityRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.EligibilityRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.EligibilityRequest.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.EligibilityRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.EligibilityRequest.self).count)
    }
    
    @discardableResult
    func runEligibilityRequest1(_ data: Data? = nil) throws -> FireKit.EligibilityRequest {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "eligibilityrequest-example.json")
        
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.id, "52345")
        XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/elegibilityrequest")
        XCTAssertEqual(inst.identifier[0].value, "52345")
        XCTAssertEqual(inst.organization?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EligibilityRequest</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}