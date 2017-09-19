//
//  EnrollmentResponseTests.swift
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


class EnrollmentResponseTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.EnrollmentResponse {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.EnrollmentResponse {
        print("Inflating FireKit.EnrollmentResponse from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.EnrollmentResponse.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testEnrollmentResponse1() {   
        var instance: FireKit.EnrollmentResponse?
        do {
            instance = try runEnrollmentResponse1()
            try runEnrollmentResponse1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test EnrollmentResponse successfully, but threw: \(error)")
        }

        testEnrollmentResponseRealm1(instance!)
    }

    func testEnrollmentResponse1Copying() {
        do {
            let instance = try runEnrollmentResponse1()
            let copy = instance.copy() as? FireKit.EnrollmentResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runEnrollmentResponse1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test EnrollmentResponse successfully, but threw: \(error)")
        }
    }

    func testEnrollmentResponse1Populatability() {
        do {
            let instance = try runEnrollmentResponse1()
            let copy = FireKit.EnrollmentResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runEnrollmentResponse1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test EnrollmentResponse successfully, but threw: \(error)")
        }
    }

    func testEnrollmentResponseRealm1(_ instance: FireKit.EnrollmentResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEnrollmentResponse1(JSONEncoder().encode(realm.objects(FireKit.EnrollmentResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.EnrollmentResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.EnrollmentResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.EnrollmentResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.EnrollmentResponse.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEnrollmentResponse1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.EnrollmentResponse.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEnrollmentResponse1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.EnrollmentResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.EnrollmentResponse.self).count)
    }
    
    @discardableResult
    func runEnrollmentResponse1(_ data: Data? = nil) throws -> FireKit.EnrollmentResponse {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "enrollmentresponse-example.json")
        
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.disposition, "Dependant added to policy.")
        XCTAssertEqual(inst.id, "ER2500")
        XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/enrollmentresponse")
        XCTAssertEqual(inst.identifier[0].value, "781234")
        XCTAssertEqual(inst.organization?.reference, "Organization/2")
        XCTAssertEqual(inst.outcome, "complete")
        XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
        XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EnrollmentResponse</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}