//
//  DetectedIssueTests.swift
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


class DetectedIssueTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.DetectedIssue {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.DetectedIssue {
        print("Inflating FireKit.DetectedIssue from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.DetectedIssue.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testDetectedIssue1() {   
        var instance: FireKit.DetectedIssue?
        do {
            instance = try runDetectedIssue1()
            try runDetectedIssue1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw: \(error)")
        }

        testDetectedIssueRealm1(instance!)
    }

    func testDetectedIssue1Copying() {
        do {
            let instance = try runDetectedIssue1()
            let copy = instance.copy() as? FireKit.DetectedIssue
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDetectedIssue1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssue1Populatability() {
        do {
            let instance = try runDetectedIssue1()
            let copy = FireKit.DetectedIssue()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDetectedIssue1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssueRealm1(_ instance: FireKit.DetectedIssue) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDetectedIssue1(JSONEncoder().encode(realm.objects(FireKit.DetectedIssue.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DetectedIssue.self).count)
    }
    
    @discardableResult
    func runDetectedIssue1(_ data: Data? = nil) throws -> FireKit.DetectedIssue {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "detectedissue-example-allergy.json")
        
        XCTAssertEqual(inst.id, "allergy")
        XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testDetectedIssue2() {   
        var instance: FireKit.DetectedIssue?
        do {
            instance = try runDetectedIssue2()
            try runDetectedIssue2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw: \(error)")
        }

        testDetectedIssueRealm2(instance!)
    }

    func testDetectedIssue2Copying() {
        do {
            let instance = try runDetectedIssue2()
            let copy = instance.copy() as? FireKit.DetectedIssue
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDetectedIssue2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssue2Populatability() {
        do {
            let instance = try runDetectedIssue2()
            let copy = FireKit.DetectedIssue()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDetectedIssue2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssueRealm2(_ instance: FireKit.DetectedIssue) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDetectedIssue2(JSONEncoder().encode(realm.objects(FireKit.DetectedIssue.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DetectedIssue.self).count)
    }
    
    @discardableResult
    func runDetectedIssue2(_ data: Data? = nil) throws -> FireKit.DetectedIssue {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "detectedissue-example-dup.json")
        
        XCTAssertEqual(inst.author?.reference, "Device/dsp")
        XCTAssertEqual(inst.category?.coding[0].code, "DUPTHPY")
        XCTAssertEqual(inst.category?.coding[0].display, "Duplicate Therapy Alert")
        XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.date?.description, "2013-05-08")
        XCTAssertEqual(inst.detail, "Similar test was performed within the past 14 days")
        XCTAssertEqual(inst.id, "duplicate")
        XCTAssertEqual(inst.implicated[0].display, "Chest CT - ordered May 8, 2013 by Dr. Adam Careful")
        XCTAssertEqual(inst.implicated[0].reference, "DiagnosticOrder/di")
        XCTAssertEqual(inst.implicated[1].display, "Image 1 from Series 3: CT Images on Patient MINT (MINT1234) taken at 1-Jan 2011 01:20 AM")
        XCTAssertEqual(inst.implicated[1].reference, "ImagingStudy/example")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testDetectedIssue3() {   
        var instance: FireKit.DetectedIssue?
        do {
            instance = try runDetectedIssue3()
            try runDetectedIssue3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw: \(error)")
        }

        testDetectedIssueRealm3(instance!)
    }

    func testDetectedIssue3Copying() {
        do {
            let instance = try runDetectedIssue3()
            let copy = instance.copy() as? FireKit.DetectedIssue
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDetectedIssue3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssue3Populatability() {
        do {
            let instance = try runDetectedIssue3()
            let copy = FireKit.DetectedIssue()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDetectedIssue3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssueRealm3(_ instance: FireKit.DetectedIssue) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDetectedIssue3(JSONEncoder().encode(realm.objects(FireKit.DetectedIssue.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DetectedIssue.self).count)
    }
    
    @discardableResult
    func runDetectedIssue3(_ data: Data? = nil) throws -> FireKit.DetectedIssue {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "detectedissue-example-lab.json")
        
        XCTAssertEqual(inst.id, "lab")
        XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testDetectedIssue4() {   
        var instance: FireKit.DetectedIssue?
        do {
            instance = try runDetectedIssue4()
            try runDetectedIssue4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw: \(error)")
        }

        testDetectedIssueRealm4(instance!)
    }

    func testDetectedIssue4Copying() {
        do {
            let instance = try runDetectedIssue4()
            let copy = instance.copy() as? FireKit.DetectedIssue
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDetectedIssue4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssue4Populatability() {
        do {
            let instance = try runDetectedIssue4()
            let copy = FireKit.DetectedIssue()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDetectedIssue4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DetectedIssue successfully, but threw: \(error)")
        }
    }

    func testDetectedIssueRealm4(_ instance: FireKit.DetectedIssue) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDetectedIssue4(JSONEncoder().encode(realm.objects(FireKit.DetectedIssue.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDetectedIssue4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DetectedIssue.self).count)
    }
    
    @discardableResult
    func runDetectedIssue4(_ data: Data? = nil) throws -> FireKit.DetectedIssue {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "detectedissue-example.json")
        
        XCTAssertEqual(inst.author?.reference, "Device/dsp")
        XCTAssertEqual(inst.category?.coding[0].code, "DRG")
        XCTAssertEqual(inst.category?.coding[0].display, "Drug Interaction Alert")
        XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.date?.description, "2014-01-05")
        XCTAssertEqual(inst.id, "ddi")
        XCTAssertEqual(inst.implicated[0].display, "500 mg Acetaminophen tablet 1/day, PRN since 2010")
        XCTAssertEqual(inst.implicated[0].reference, "MedicationStatement/tylenol")
        XCTAssertEqual(inst.implicated[1].display, "Warfarin 1 MG TAB prescribed Jan. 5, 2014")
        XCTAssertEqual(inst.implicated[1].reference, "MedicationOrder/warfarin")
        XCTAssertEqual(inst.mitigation[0].action?.coding[0].code, "13")
        XCTAssertEqual(inst.mitigation[0].action?.coding[0].display, "Stopped Concurrent Therapy")
        XCTAssertEqual(inst.mitigation[0].action?.coding[0].system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.mitigation[0].action?.text, "Asked patient to discontinue regular use of Tylenol and to consult with clinician if they need to resume to allow appropriate INR monitoring")
        XCTAssertEqual(inst.mitigation[0].author?.display, "Dr. Adam Careful")
        XCTAssertEqual(inst.mitigation[0].author?.reference, "Practitioner/example")
        XCTAssertEqual(inst.mitigation[0].date?.description, "2014-01-05")
        XCTAssertEqual(inst.severity, "high")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}