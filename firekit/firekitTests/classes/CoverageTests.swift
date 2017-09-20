//
//  CoverageTests.swift
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


class CoverageTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Coverage {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Coverage {
        // print("Inflating FireKit.Coverage from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Coverage.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testCoverage1() {   
        var instance: FireKit.Coverage?
        do {
            instance = try runCoverage1()
            try runCoverage1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Coverage successfully, but threw: \(error)")
        }

        testCoverageRealm1(instance!)
    }

    func testCoverage1Copying() {
        do {
            let instance = try runCoverage1()
            let copy = instance.copy() as? FireKit.Coverage
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCoverage1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Coverage successfully, but threw: \(error)")
        }
    }

    func testCoverage1Populatability() {
        do {
            let instance = try runCoverage1()
            let copy = FireKit.Coverage()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCoverage1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Coverage successfully, but threw: \(error)")
        }
    }

    func testCoverageRealm1(_ instance: FireKit.Coverage) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCoverage1(JSONEncoder().encode(realm.objects(FireKit.Coverage.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Coverage.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Coverage.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Coverage()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Coverage.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Coverage.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Coverage.self).count)
    }
    
    @discardableResult
    func runCoverage1(_ data: Data? = nil) throws -> FireKit.Coverage {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "coverage-example-2.json")
        
        XCTAssertEqual(inst.dependent.value, 1)
        XCTAssertEqual(inst.id, "7546D")
        XCTAssertEqual(inst.identifier[0].system, "http://xyz.com/codes/identifier")
        XCTAssertEqual(inst.identifier[0].value, "AB9876")
        XCTAssertEqual(inst.issuer?.reference, "Organization/2")
        XCTAssertEqual(inst.period?.end?.description, "2012-03-17")
        XCTAssertEqual(inst.period?.start?.description, "2011-03-17")
        XCTAssertEqual(inst.plan, "11024")
        XCTAssertEqual(inst.subPlan, "D15C9")
        XCTAssertEqual(inst.subscriber?.reference, "Patient/5")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the coverage</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.code, "EHCPOL")
        XCTAssertEqual(inst.type?.display, "extended healthcare")
        XCTAssertEqual(inst.type?.system, "http://hl7.org/fhir/v3/ActCode")

        return inst
    }
    
    func testCoverage2() {   
        var instance: FireKit.Coverage?
        do {
            instance = try runCoverage2()
            try runCoverage2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Coverage successfully, but threw: \(error)")
        }

        testCoverageRealm2(instance!)
    }

    func testCoverage2Copying() {
        do {
            let instance = try runCoverage2()
            let copy = instance.copy() as? FireKit.Coverage
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCoverage2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Coverage successfully, but threw: \(error)")
        }
    }

    func testCoverage2Populatability() {
        do {
            let instance = try runCoverage2()
            let copy = FireKit.Coverage()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCoverage2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Coverage successfully, but threw: \(error)")
        }
    }

    func testCoverageRealm2(_ instance: FireKit.Coverage) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCoverage2(JSONEncoder().encode(realm.objects(FireKit.Coverage.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Coverage.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Coverage.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Coverage()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Coverage.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Coverage.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Coverage.self).count)
    }
    
    @discardableResult
    func runCoverage2(_ data: Data? = nil) throws -> FireKit.Coverage {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "coverage-example.json")
        
        XCTAssertEqual(inst.dependent.value, 1)
        XCTAssertEqual(inst.id, "9876B1")
        XCTAssertEqual(inst.identifier[0].system, "http://benefitsinc.com/certificate")
        XCTAssertEqual(inst.identifier[0].value, "12345")
        XCTAssertEqual(inst.issuer?.reference, "Organization/2")
        XCTAssertEqual(inst.period?.end?.description, "2012-05-23")
        XCTAssertEqual(inst.period?.start?.description, "2011-05-23")
        XCTAssertEqual(inst.plan, "CBI35")
        XCTAssertEqual(inst.sequence.value, 1)
        XCTAssertEqual(inst.subPlan, "123")
        XCTAssertEqual(inst.subscriber?.reference, "Patient/4")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the coverage</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.code, "EHCPOL")
        XCTAssertEqual(inst.type?.display, "extended healthcare")
        XCTAssertEqual(inst.type?.system, "http://hl7.org/fhir/v3/ActCode")

        return inst
    }
}