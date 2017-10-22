//
//  RiskAssessmentTests.swift
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


class RiskAssessmentTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.RiskAssessment {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.RiskAssessment {
        // print("Inflating FireKit.RiskAssessment from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.RiskAssessment.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testRiskAssessment1() {   
        var instance: FireKit.RiskAssessment?
        do {
            instance = try runRiskAssessment1()
            try runRiskAssessment1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RiskAssessment successfully, but threw: \(error)")
        }

        testRiskAssessmentRealm1(instance!)
    }

    func testRiskAssessment1Copying() {
        do {
            let instance = try runRiskAssessment1()
            let copy = instance.copy() as? FireKit.RiskAssessment
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRiskAssessment1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment1Populatability() {
        do {
            let instance = try runRiskAssessment1()
            let copy = FireKit.RiskAssessment()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRiskAssessment1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment1NillingPopulatability() {
        do {
            let instance = try runRiskAssessment1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RiskAssessment()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessmentRealm1(_ instance: FireKit.RiskAssessment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRiskAssessment1(JSONEncoder().encode(realm.objects(FireKit.RiskAssessment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RiskAssessment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RiskAssessment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RiskAssessment.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RiskAssessment.self).count)
    }
    
    @discardableResult
    func runRiskAssessment1(_ data: Data? = nil) throws -> FireKit.RiskAssessment {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "riskassessment-example-cardiac.json")
        
        XCTAssertEqual(inst.basis[0].reference, "Patient/example")
        XCTAssertEqual(inst.basis[1].reference, "DiagnosticReport/lipids")
        XCTAssertEqual(inst.basis[2].reference, "Observation/blood-pressure")
        XCTAssertEqual(inst.date?.description, "2014-07-19T16:04:00Z")
        XCTAssertEqual(inst.id, "cardiac")
        XCTAssertEqual(inst.performer?.display, "http://cvdrisk.nhlbi.nih.gov/#cholesterol")
        XCTAssertEqual(inst.prediction[0].outcome?.text, "Heart Attack")
        XCTAssertTrue(inst.prediction[0].probabilityDecimal! == RealmDecimal(string: "0.02"))
        XCTAssertEqual(inst.prediction[0].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[0].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[0].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[0].whenRange?.high?.value! == RealmDecimal(string: "49"))
        XCTAssertEqual(inst.prediction[0].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[0].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[0].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[0].whenRange?.low?.value! == RealmDecimal(string: "39"))
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testRiskAssessment2() {   
        var instance: FireKit.RiskAssessment?
        do {
            instance = try runRiskAssessment2()
            try runRiskAssessment2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RiskAssessment successfully, but threw: \(error)")
        }

        testRiskAssessmentRealm2(instance!)
    }

    func testRiskAssessment2Copying() {
        do {
            let instance = try runRiskAssessment2()
            let copy = instance.copy() as? FireKit.RiskAssessment
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRiskAssessment2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment2Populatability() {
        do {
            let instance = try runRiskAssessment2()
            let copy = FireKit.RiskAssessment()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRiskAssessment2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment2NillingPopulatability() {
        do {
            let instance = try runRiskAssessment2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RiskAssessment()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessmentRealm2(_ instance: FireKit.RiskAssessment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRiskAssessment2(JSONEncoder().encode(realm.objects(FireKit.RiskAssessment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RiskAssessment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RiskAssessment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RiskAssessment.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RiskAssessment.self).count)
    }
    
    @discardableResult
    func runRiskAssessment2(_ data: Data? = nil) throws -> FireKit.RiskAssessment {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "riskassessment-example-population.json")
        
        XCTAssertEqual(inst.id, "population")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Todo - e.g. probable number of infections in a given region over a time period for a given disease based on vaccination rates and other factors</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testRiskAssessment3() {   
        var instance: FireKit.RiskAssessment?
        do {
            instance = try runRiskAssessment3()
            try runRiskAssessment3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RiskAssessment successfully, but threw: \(error)")
        }

        testRiskAssessmentRealm3(instance!)
    }

    func testRiskAssessment3Copying() {
        do {
            let instance = try runRiskAssessment3()
            let copy = instance.copy() as? FireKit.RiskAssessment
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRiskAssessment3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment3Populatability() {
        do {
            let instance = try runRiskAssessment3()
            let copy = FireKit.RiskAssessment()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRiskAssessment3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment3NillingPopulatability() {
        do {
            let instance = try runRiskAssessment3()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RiskAssessment()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessmentRealm3(_ instance: FireKit.RiskAssessment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRiskAssessment3(JSONEncoder().encode(realm.objects(FireKit.RiskAssessment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RiskAssessment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RiskAssessment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RiskAssessment.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RiskAssessment.self).count)
    }
    
    @discardableResult
    func runRiskAssessment3(_ data: Data? = nil) throws -> FireKit.RiskAssessment {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "riskassessment-example-prognosis.json")
        
        XCTAssertEqual(inst.condition?.display, "Ischemic Stroke")
        XCTAssertEqual(inst.condition?.reference, "Condition/stroke")
        XCTAssertEqual(inst.date?.description, "2010-11-22")
        XCTAssertEqual(inst.id, "prognosis")
        XCTAssertEqual(inst.prediction[0].outcome?.coding[0].code, "249943000:363698007=72098002,260868000=6934004")
        XCTAssertEqual(inst.prediction[0].outcome?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.prediction[0].outcome?.text, "permanent weakness of the left arm")
        XCTAssertEqual(inst.prediction[0].probabilityCodeableConcept?.coding[0].code, "moderate")
        XCTAssertEqual(inst.prediction[0].probabilityCodeableConcept?.coding[0].display, "moderate likelihood")
        XCTAssertEqual(inst.prediction[0].probabilityCodeableConcept?.coding[0].system, "http://hl7.org/fhir/risk-probability")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Moderate risk of permanent weakness of the left arm, but otherwise no permanent disability</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testRiskAssessment4() {   
        var instance: FireKit.RiskAssessment?
        do {
            instance = try runRiskAssessment4()
            try runRiskAssessment4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RiskAssessment successfully, but threw: \(error)")
        }

        testRiskAssessmentRealm4(instance!)
    }

    func testRiskAssessment4Copying() {
        do {
            let instance = try runRiskAssessment4()
            let copy = instance.copy() as? FireKit.RiskAssessment
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRiskAssessment4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment4Populatability() {
        do {
            let instance = try runRiskAssessment4()
            let copy = FireKit.RiskAssessment()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRiskAssessment4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessment4NillingPopulatability() {
        do {
            let instance = try runRiskAssessment4()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RiskAssessment()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RiskAssessment successfully, but threw: \(error)")
        }
    }

    func testRiskAssessmentRealm4(_ instance: FireKit.RiskAssessment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRiskAssessment4(JSONEncoder().encode(realm.objects(FireKit.RiskAssessment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RiskAssessment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RiskAssessment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RiskAssessment.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RiskAssessment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RiskAssessment.self).count)
    }
    
    @discardableResult
    func runRiskAssessment4(_ data: Data? = nil) throws -> FireKit.RiskAssessment {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "riskassessment-example.json")
        
        XCTAssertEqual(inst.basis[0].reference, "List/prognosis")
        XCTAssertEqual(inst.date?.description, "2006-01-13T23:01:00Z")
        XCTAssertEqual(inst.id, "genetic")
        XCTAssertEqual(inst.method?.coding[0].code, "BRCAPRO")
        XCTAssertEqual(inst.prediction[0].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[0].probabilityDecimal! == RealmDecimal(string: "0.000168"))
        XCTAssertEqual(inst.prediction[0].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[0].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[0].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[0].whenRange?.high?.value! == RealmDecimal(string: "53"))
        XCTAssertEqual(inst.prediction[1].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[1].probabilityDecimal! == RealmDecimal(string: "0.000368"))
        XCTAssertEqual(inst.prediction[1].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[1].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[1].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[1].whenRange?.high?.value! == RealmDecimal(string: "57"))
        XCTAssertEqual(inst.prediction[1].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[1].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[1].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[1].whenRange?.low?.value! == RealmDecimal(string: "54"))
        XCTAssertEqual(inst.prediction[2].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[2].probabilityDecimal! == RealmDecimal(string: "0.000594"))
        XCTAssertEqual(inst.prediction[2].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[2].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[2].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[2].whenRange?.high?.value! == RealmDecimal(string: "62"))
        XCTAssertEqual(inst.prediction[2].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[2].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[2].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[2].whenRange?.low?.value! == RealmDecimal(string: "58"))
        XCTAssertEqual(inst.prediction[3].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[3].probabilityDecimal! == RealmDecimal(string: "0.000838"))
        XCTAssertEqual(inst.prediction[3].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[3].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[3].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[3].whenRange?.high?.value! == RealmDecimal(string: "67"))
        XCTAssertEqual(inst.prediction[3].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[3].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[3].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[3].whenRange?.low?.value! == RealmDecimal(string: "63"))
        XCTAssertEqual(inst.prediction[4].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[4].probabilityDecimal! == RealmDecimal(string: "0.001089"))
        XCTAssertEqual(inst.prediction[4].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[4].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[4].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[4].whenRange?.high?.value! == RealmDecimal(string: "72"))
        XCTAssertEqual(inst.prediction[4].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[4].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[4].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[4].whenRange?.low?.value! == RealmDecimal(string: "68"))
        XCTAssertEqual(inst.prediction[5].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[5].probabilityDecimal! == RealmDecimal(string: "0.001327"))
        XCTAssertEqual(inst.prediction[5].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[5].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[5].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[5].whenRange?.high?.value! == RealmDecimal(string: "77"))
        XCTAssertEqual(inst.prediction[5].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[5].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[5].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[5].whenRange?.low?.value! == RealmDecimal(string: "73"))
        XCTAssertEqual(inst.prediction[6].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[6].probabilityDecimal! == RealmDecimal(string: "0.00153"))
        XCTAssertEqual(inst.prediction[6].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[6].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[6].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[6].whenRange?.high?.value! == RealmDecimal(string: "82"))
        XCTAssertEqual(inst.prediction[6].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[6].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[6].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[6].whenRange?.low?.value! == RealmDecimal(string: "78"))
        XCTAssertEqual(inst.prediction[7].outcome?.text, "Breast Cancer")
        XCTAssertTrue(inst.prediction[7].probabilityDecimal! == RealmDecimal(string: "0.001663"))
        XCTAssertEqual(inst.prediction[7].whenRange?.high?.code, "a")
        XCTAssertEqual(inst.prediction[7].whenRange?.high?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[7].whenRange?.high?.unit, "years")
        XCTAssertTrue(inst.prediction[7].whenRange?.high?.value! == RealmDecimal(string: "88"))
        XCTAssertEqual(inst.prediction[7].whenRange?.low?.code, "a")
        XCTAssertEqual(inst.prediction[7].whenRange?.low?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.prediction[7].whenRange?.low?.unit, "years")
        XCTAssertTrue(inst.prediction[7].whenRange?.low?.value! == RealmDecimal(string: "83"))
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}