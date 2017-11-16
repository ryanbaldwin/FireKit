//
//  EligibilityResponseTests.swift
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


class EligibilityResponseTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.EligibilityResponse {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.EligibilityResponse {
        // print("Inflating FireKit.EligibilityResponse from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.EligibilityResponse.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testEligibilityResponse1() {   
        var instance: FireKit.EligibilityResponse?
        do {
            instance = try runEligibilityResponse1()
            try runEligibilityResponse1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test EligibilityResponse successfully, but threw: \(error)")
        }

        testEligibilityResponseRealm1(instance!)
    }

    func testEligibilityResponse1Copying() {
        do {
            let instance = try runEligibilityResponse1()
            let copy = instance.copy() as? FireKit.EligibilityResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runEligibilityResponse1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test EligibilityResponse successfully, but threw: \(error)")
        }
    }

    func testEligibilityResponse1Populatability() {
        do {
            let instance = try runEligibilityResponse1()
            let copy = FireKit.EligibilityResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runEligibilityResponse1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test EligibilityResponse successfully, but threw: \(error)")
        }
    }

    func testEligibilityResponse1NillingPopulatability() {
        do {
            let instance = try runEligibilityResponse1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.EligibilityResponse()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test EligibilityResponse successfully, but threw: \(error)")
        }
    }

    func testEligibilityResponseRealm1(_ instance: FireKit.EligibilityResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEligibilityResponse1(JSONEncoder().encode(realm.objects(FireKit.EligibilityResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.EligibilityResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.EligibilityResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.EligibilityResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.EligibilityResponse.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.EligibilityResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.EligibilityResponse.self).count)
    }
    
    @discardableResult
    func runEligibilityResponse1(_ data: Data? = nil) throws -> FireKit.EligibilityResponse {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "eligibilityresponse-example.json")
        
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.disposition, "Policy is currently in-force.")
        XCTAssertEqual(inst.id, "E2500")
        XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/eligibilityresponse")
        XCTAssertEqual(inst.identifier[0].value, "881234")
        XCTAssertEqual(inst.organization?.reference, "Organization/2")
        XCTAssertEqual(inst.outcome, "complete")
        XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
        XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EligibilityResponse.</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}