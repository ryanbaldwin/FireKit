//
//  FamilyMemberHistoryTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-22.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-22
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class FamilyMemberHistoryTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.FamilyMemberHistory {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.FamilyMemberHistory {
        // print("Inflating FireKit.FamilyMemberHistory from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.FamilyMemberHistory.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testFamilyMemberHistory1() {   
        var instance: FireKit.FamilyMemberHistory?
        do {
            instance = try runFamilyMemberHistory1()
            try runFamilyMemberHistory1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory successfully, but threw: \(error)")
        }

        testFamilyMemberHistoryRealm1(instance!)
    }

    func testFamilyMemberHistory1Copying() {
        do {
            let instance = try runFamilyMemberHistory1()
            let copy = instance.copy() as? FireKit.FamilyMemberHistory
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runFamilyMemberHistory1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test FamilyMemberHistory successfully, but threw: \(error)")
        }
    }

    func testFamilyMemberHistory1Populatability() {
        do {
            let instance = try runFamilyMemberHistory1()
            let copy = FireKit.FamilyMemberHistory()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runFamilyMemberHistory1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test FamilyMemberHistory successfully, but threw: \(error)")
        }
    }

    func testFamilyMemberHistoryRealm1(_ instance: FireKit.FamilyMemberHistory) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runFamilyMemberHistory1(JSONEncoder().encode(realm.objects(FireKit.FamilyMemberHistory.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.FamilyMemberHistory.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.FamilyMemberHistory()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.FamilyMemberHistory.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.FamilyMemberHistory.self).count)
    }
    
    @discardableResult
    func runFamilyMemberHistory1(_ data: Data? = nil) throws -> FireKit.FamilyMemberHistory {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "familymemberhistory-example-mother.json")
        
        XCTAssertEqual(inst.condition[0].code?.coding[0].code, "371041009")
        XCTAssertEqual(inst.condition[0].code?.coding[0].display, "Embolic Stroke")
        XCTAssertEqual(inst.condition[0].code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.condition[0].code?.text, "Stroke")
        XCTAssertEqual(inst.condition[0].onsetQuantity?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.condition[0].onsetQuantity?.unit, "a")
        XCTAssertTrue(inst.condition[0].onsetQuantity?.value! == RealmDecimal(string: "56"))
        XCTAssertEqual(inst.id, "mother")
        XCTAssertEqual(inst.patient?.display, "Peter Patient")
        XCTAssertEqual(inst.patient?.reference, "Patient/100")
        XCTAssertEqual(inst.relationship?.coding[0].code, "mother")
        XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/familial-relationship")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.text?.div, "<div>Mother died of a stroke aged 56</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testFamilyMemberHistory2() {   
        var instance: FireKit.FamilyMemberHistory?
        do {
            instance = try runFamilyMemberHistory2()
            try runFamilyMemberHistory2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory successfully, but threw: \(error)")
        }

        testFamilyMemberHistoryRealm2(instance!)
    }

    func testFamilyMemberHistory2Copying() {
        do {
            let instance = try runFamilyMemberHistory2()
            let copy = instance.copy() as? FireKit.FamilyMemberHistory
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runFamilyMemberHistory2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test FamilyMemberHistory successfully, but threw: \(error)")
        }
    }

    func testFamilyMemberHistory2Populatability() {
        do {
            let instance = try runFamilyMemberHistory2()
            let copy = FireKit.FamilyMemberHistory()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runFamilyMemberHistory2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test FamilyMemberHistory successfully, but threw: \(error)")
        }
    }

    func testFamilyMemberHistoryRealm2(_ instance: FireKit.FamilyMemberHistory) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runFamilyMemberHistory2(JSONEncoder().encode(realm.objects(FireKit.FamilyMemberHistory.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.FamilyMemberHistory.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.FamilyMemberHistory()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.FamilyMemberHistory.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.FamilyMemberHistory.self).count)
    }
    
    @discardableResult
    func runFamilyMemberHistory2(_ data: Data? = nil) throws -> FireKit.FamilyMemberHistory {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "familymemberhistory-example.json")
        
        XCTAssertEqual(inst.condition[0].code?.coding[0].code, "315619001")
        XCTAssertEqual(inst.condition[0].code?.coding[0].display, "Myocardial Infarction")
        XCTAssertEqual(inst.condition[0].code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.condition[0].code?.text, "Heart Attack")
        XCTAssertEqual(inst.condition[0].note?.text, "Was fishing at the time. At least he went doing someting he loved.")
        XCTAssertEqual(inst.condition[0].onsetQuantity?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.condition[0].onsetQuantity?.unit, "a")
        XCTAssertTrue(inst.condition[0].onsetQuantity?.value! == RealmDecimal(string: "74"))
        XCTAssertEqual(inst.date?.description, "2011-03-18")
        XCTAssertEqual(inst.id, "father")
        XCTAssertEqual(inst.patient?.display, "Peter Patient")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.relationship?.coding[0].code, "father")
        XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/familial-relationship")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.text?.div, "<div>Father died of a heart attack aged 74</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}