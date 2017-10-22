//
//  ScheduleTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-22.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-22
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class ScheduleTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Schedule {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Schedule {
        // print("Inflating FireKit.Schedule from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Schedule.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testSchedule1() {   
        var instance: FireKit.Schedule?
        do {
            instance = try runSchedule1()
            try runSchedule1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Schedule successfully, but threw: \(error)")
        }

        testScheduleRealm1(instance!)
    }

    func testSchedule1Copying() {
        do {
            let instance = try runSchedule1()
            let copy = instance.copy() as? FireKit.Schedule
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runSchedule1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Schedule successfully, but threw: \(error)")
        }
    }

    func testSchedule1Populatability() {
        do {
            let instance = try runSchedule1()
            let copy = FireKit.Schedule()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runSchedule1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Schedule successfully, but threw: \(error)")
        }
    }

    func testSchedule1NillingPopulatability() {
        do {
            let instance = try runSchedule1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Schedule()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Schedule successfully, but threw: \(error)")
        }
    }

    func testScheduleRealm1(_ instance: FireKit.Schedule) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSchedule1(JSONEncoder().encode(realm.objects(FireKit.Schedule.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Schedule.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Schedule.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Schedule()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Schedule.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Schedule.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Schedule.self).count)
    }
    
    @discardableResult
    func runSchedule1(_ data: Data? = nil) throws -> FireKit.Schedule {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "schedule-example.json")
        
        XCTAssertEqual(inst.actor?.display, "Burgers UMC, South Wing, second floor")
        XCTAssertEqual(inst.actor?.reference, "Location/1")
        XCTAssertEqual(inst.comment, "Assessments should be performed before requesting appointments in this slot.")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "http://example.org/scheduleid")
        XCTAssertEqual(inst.identifier[0].use, "usual")
        XCTAssertEqual(inst.identifier[0].value, "45")
        XCTAssertEqual(inst.planningHorizon?.end?.description, "2013-12-25T09:30:00Z")
        XCTAssertEqual(inst.planningHorizon?.start?.description, "2013-12-25T09:15:00Z")
        XCTAssertEqual(inst.text?.div, "<div>\n      Burgers UMC, South Wing, second floor Physiotherapy Schedule\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type[0].coding[0].code, "45")
        XCTAssertEqual(inst.type[0].coding[0].display, "Physiotherapy")

        return inst
    }
}