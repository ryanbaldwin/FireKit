//
//  FlagTests.swift
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


class FlagTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Flag {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Flag {
        // print("Inflating FireKit.Flag from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Flag.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testFlag1() {   
        var instance: FireKit.Flag?
        do {
            instance = try runFlag1()
            try runFlag1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Flag successfully, but threw: \(error)")
        }

        testFlagRealm1(instance!)
    }

    func testFlag1Copying() {
        do {
            let instance = try runFlag1()
            let copy = instance.copy() as? FireKit.Flag
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runFlag1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Flag successfully, but threw: \(error)")
        }
    }

    func testFlag1Populatability() {
        do {
            let instance = try runFlag1()
            let copy = FireKit.Flag()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runFlag1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Flag successfully, but threw: \(error)")
        }
    }

    func testFlag1NillingPopulatability() {
        do {
            let instance = try runFlag1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Flag()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Flag successfully, but threw: \(error)")
        }
    }

    func testFlagRealm1(_ instance: FireKit.Flag) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runFlag1(JSONEncoder().encode(realm.objects(FireKit.Flag.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Flag.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Flag.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Flag()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Flag.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Flag.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Flag.self).count)
    }
    
    @discardableResult
    func runFlag1(_ data: Data? = nil) throws -> FireKit.Flag {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "flag-example-encounter.json")
        
        XCTAssertEqual(inst.category?.coding[0].code, "infection")
        XCTAssertEqual(inst.category?.coding[0].display, "Infection Control Level")
        XCTAssertEqual(inst.category?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.code?.coding[0].code, "l3")
        XCTAssertEqual(inst.code?.coding[0].display, "Follow Level 3 Protocol")
        XCTAssertEqual(inst.code?.coding[0].system, "http://example.org/local/if1")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
        XCTAssertEqual(inst.id, "example-encounter")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Peter Patient")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>Follow Infection Control Level 3 Protocol</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testFlag2() {   
        var instance: FireKit.Flag?
        do {
            instance = try runFlag2()
            try runFlag2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Flag successfully, but threw: \(error)")
        }

        testFlagRealm2(instance!)
    }

    func testFlag2Copying() {
        do {
            let instance = try runFlag2()
            let copy = instance.copy() as? FireKit.Flag
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runFlag2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Flag successfully, but threw: \(error)")
        }
    }

    func testFlag2Populatability() {
        do {
            let instance = try runFlag2()
            let copy = FireKit.Flag()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runFlag2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Flag successfully, but threw: \(error)")
        }
    }

    func testFlag2NillingPopulatability() {
        do {
            let instance = try runFlag2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Flag()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Flag successfully, but threw: \(error)")
        }
    }

    func testFlagRealm2(_ instance: FireKit.Flag) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runFlag2(JSONEncoder().encode(realm.objects(FireKit.Flag.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Flag.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Flag.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Flag()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Flag.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Flag.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Flag.self).count)
    }
    
    @discardableResult
    func runFlag2(_ data: Data? = nil) throws -> FireKit.Flag {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "flag-example.json")
        
        XCTAssertEqual(inst.author?.display, "Nancy Nurse")
        XCTAssertEqual(inst.author?.reference, "Practitioner/example")
        XCTAssertEqual(inst.category?.coding[0].code, "admin")
        XCTAssertEqual(inst.category?.coding[0].display, "Admin")
        XCTAssertEqual(inst.category?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.category?.text, "admin")
        XCTAssertEqual(inst.code?.coding[0].code, "bigdog")
        XCTAssertEqual(inst.code?.coding[0].display, "Big dog")
        XCTAssertEqual(inst.code?.coding[0].system, "http://example.org/local")
        XCTAssertEqual(inst.code?.text, "Patient has a big dog at his home. Always always wear a suit of armor or take other active counter-measures")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.subject?.display, "Peter Patient")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>Large Dog warning for Peter Patient</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}