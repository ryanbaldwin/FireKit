//
//  GoalTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-11-07.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-11-07
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class GoalTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Goal {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Goal {
        // print("Inflating FireKit.Goal from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Goal.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testGoal1() {   
        var instance: FireKit.Goal?
        do {
            instance = try runGoal1()
            try runGoal1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Goal successfully, but threw: \(error)")
        }

        testGoalRealm1(instance!)
    }

    func testGoal1Copying() {
        do {
            let instance = try runGoal1()
            let copy = instance.copy() as? FireKit.Goal
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runGoal1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Goal successfully, but threw: \(error)")
        }
    }

    func testGoal1Populatability() {
        do {
            let instance = try runGoal1()
            let copy = FireKit.Goal()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runGoal1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Goal successfully, but threw: \(error)")
        }
    }

    func testGoal1NillingPopulatability() {
        do {
            let instance = try runGoal1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Goal()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Goal successfully, but threw: \(error)")
        }
    }

    func testGoalRealm1(_ instance: FireKit.Goal) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runGoal1(JSONEncoder().encode(realm.objects(FireKit.Goal.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Goal.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Goal.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Goal()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Goal.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Goal.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Goal.self).count)
    }
    
    @discardableResult
    func runGoal1(_ data: Data? = nil) throws -> FireKit.Goal {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "goal-example.json")
        
        XCTAssertEqual(inst.addresses[0].display, "obesity")
        XCTAssertEqual(inst.addresses[0].reference, "Condition/12345")
        XCTAssertEqual(inst.description_fhir, "Target weight is 160 to 180 lbs.")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].url, "measure")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueCodeableConcept?.coding[0].code, "3141-9")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueCodeableConcept?.coding[0].display, "Weight Measured")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueCodeableConcept?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].url, "detail")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.code, "[lb_av]")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.unit, "lbs")
        XCTAssertTrue(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.value! == RealmDecimal(string: "180"))
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.code, "[lb_av]")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.unit, "lbs")
        XCTAssertTrue(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.value! == RealmDecimal(string: "160"))
        XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/goal-target")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.status, "in-progress")
        XCTAssertEqual(inst.subject?.display, "Peter James Chalmers")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p> A simple care goal for a patient to lose weight due to obesity.</p>\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
}