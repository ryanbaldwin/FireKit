//
//  GroupTests.swift
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


class GroupTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Group {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Group {
        // print("Inflating FireKit.Group from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Group.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testGroup1() {   
        var instance: FireKit.Group?
        do {
            instance = try runGroup1()
            try runGroup1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Group successfully, but threw: \(error)")
        }

        testGroupRealm1(instance!)
    }

    func testGroup1Copying() {
        do {
            let instance = try runGroup1()
            let copy = instance.copy() as? FireKit.Group
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runGroup1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Group successfully, but threw: \(error)")
        }
    }

    func testGroup1Populatability() {
        do {
            let instance = try runGroup1()
            let copy = FireKit.Group()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runGroup1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Group successfully, but threw: \(error)")
        }
    }

    func testGroupRealm1(_ instance: FireKit.Group) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runGroup1(JSONEncoder().encode(realm.objects(FireKit.Group.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Group.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Group.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Group()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Group.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Group.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Group.self).count)
    }
    
    @discardableResult
    func runGroup1(_ data: Data? = nil) throws -> FireKit.Group {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "group-example-member.json")
        
        XCTAssertTrue(inst.actual.value ?? false)
        XCTAssertEqual(inst.id, "102")
        XCTAssertEqual(inst.member[0].entity?.reference, "Patient/pat1")
        XCTAssertEqual(inst.member[0].period?.start?.description, "2014-10-08")
        XCTAssertEqual(inst.member[1].entity?.reference, "Patient/pat2")
        XCTAssertTrue(inst.member[1].inactive.value ?? false)
        XCTAssertEqual(inst.member[1].period?.start?.description, "2015-04-02")
        XCTAssertEqual(inst.member[2].entity?.reference, "Patient/pat3")
        XCTAssertEqual(inst.member[2].period?.start?.description, "2015-08-06")
        XCTAssertEqual(inst.member[3].entity?.reference, "Patient/pat4")
        XCTAssertEqual(inst.member[3].period?.start?.description, "2015-08-06")
        XCTAssertEqual(inst.text?.status, "additional")
        XCTAssertEqual(inst.type, "person")

        return inst
    }
    
    func testGroup2() {   
        var instance: FireKit.Group?
        do {
            instance = try runGroup2()
            try runGroup2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Group successfully, but threw: \(error)")
        }

        testGroupRealm2(instance!)
    }

    func testGroup2Copying() {
        do {
            let instance = try runGroup2()
            let copy = instance.copy() as? FireKit.Group
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runGroup2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Group successfully, but threw: \(error)")
        }
    }

    func testGroup2Populatability() {
        do {
            let instance = try runGroup2()
            let copy = FireKit.Group()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runGroup2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Group successfully, but threw: \(error)")
        }
    }

    func testGroupRealm2(_ instance: FireKit.Group) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runGroup2(JSONEncoder().encode(realm.objects(FireKit.Group.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Group.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Group.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Group()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Group.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Group.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Group.self).count)
    }
    
    @discardableResult
    func runGroup2(_ data: Data? = nil) throws -> FireKit.Group {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "group-example.json")
        
        XCTAssertTrue(inst.actual.value ?? false)
        XCTAssertEqual(inst.characteristic[0].code?.text, "gender")
        XCTAssertFalse(inst.characteristic[0].exclude.value ?? true)
        XCTAssertEqual(inst.characteristic[0].valueCodeableConcept?.text, "mixed")
        XCTAssertEqual(inst.characteristic[1].code?.text, "owner")
        XCTAssertFalse(inst.characteristic[1].exclude.value ?? true)
        XCTAssertEqual(inst.characteristic[1].valueCodeableConcept?.text, "John Smith")
        XCTAssertEqual(inst.code?.text, "Horse")
        XCTAssertEqual(inst.id, "101")
        XCTAssertEqual(inst.name, "John's herd")
        XCTAssertEqual(inst.quantity.value, 25)
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Herd of 25 horses</p>\n      <p>Gender: mixed</p>\n      <p>Owner: John Smith</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "additional")
        XCTAssertEqual(inst.type, "animal")

        return inst
    }
}