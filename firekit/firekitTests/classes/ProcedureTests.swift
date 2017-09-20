//
//  ProcedureTests.swift
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


class ProcedureTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Procedure {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Procedure {
        // print("Inflating FireKit.Procedure from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Procedure.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testProcedure1() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure1()
            try runProcedure1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm1(instance!)
    }

    func testProcedure1Copying() {
        do {
            let instance = try runProcedure1()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure1Populatability() {
        do {
            let instance = try runProcedure1()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm1(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure1(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure1(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-biopsy.json")
        
        XCTAssertEqual(inst.bodySite[0].coding[0].code, "368225008")
        XCTAssertEqual(inst.bodySite[0].coding[0].display, "Entire Left Forearm")
        XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.bodySite[0].text, "Left forearm")
        XCTAssertEqual(inst.code?.coding[0].code, "90105005")
        XCTAssertEqual(inst.code?.coding[0].display, "Biopsy of soft tissue of forearm (Procedure)")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.text, "Biopsy of suspected melanoma L) arm")
        XCTAssertEqual(inst.followUp[0].text, "Review in clinic")
        XCTAssertEqual(inst.id, "biopsy")
        XCTAssertEqual(inst.notes[0].text, "Standard Biopsy")
        XCTAssertEqual(inst.performedDateTime?.description, "2014-02-03")
        XCTAssertEqual(inst.performer[0].actor?.display, "Dr Bert Biopser")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/example")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "Dark lesion l) forearm. getting darker last 3 months.")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>Biopsy of suspected melanoma L) arm</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure2() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure2()
            try runProcedure2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm2(instance!)
    }

    func testProcedure2Copying() {
        do {
            let instance = try runProcedure2()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure2Populatability() {
        do {
            let instance = try runProcedure2()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm2(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure2(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure2(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-f001-heart.json")
        
        XCTAssertEqual(inst.bodySite[0].coding[0].code, "17401000")
        XCTAssertEqual(inst.bodySite[0].coding[0].display, "Heart valve structure")
        XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.coding[0].code, "34068001")
        XCTAssertEqual(inst.code?.coding[0].display, "Heart valve replacement")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/f001")
        XCTAssertEqual(inst.followUp[0].text, "described in care plan")
        XCTAssertEqual(inst.id, "f001")
        XCTAssertEqual(inst.outcome?.text, "improved blood circulation")
        XCTAssertEqual(inst.performedPeriod?.end?.description, "2011-06-27")
        XCTAssertEqual(inst.performedPeriod?.start?.description, "2011-06-26")
        XCTAssertEqual(inst.performer[0].actor?.display, "P. Voigt")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/f002")
        XCTAssertEqual(inst.performer[0].role?.coding[0].code, "01.000")
        XCTAssertEqual(inst.performer[0].role?.coding[0].display, "Arts")
        XCTAssertEqual(inst.performer[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
        XCTAssertEqual(inst.performer[0].role?.text, "Care role")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "Heart valve disorder")
        XCTAssertEqual(inst.report[0].display, "Lab results blood test")
        XCTAssertEqual(inst.report[0].reference, "DiagnosticReport/f001")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure3() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure3()
            try runProcedure3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm3(instance!)
    }

    func testProcedure3Copying() {
        do {
            let instance = try runProcedure3()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure3Populatability() {
        do {
            let instance = try runProcedure3()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm3(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure3(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure3(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-f002-lung.json")
        
        XCTAssertEqual(inst.bodySite[0].coding[0].code, "39607008")
        XCTAssertEqual(inst.bodySite[0].coding[0].display, "Lung structure")
        XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.coding[0].code, "359615001")
        XCTAssertEqual(inst.code?.coding[0].display, "Partial lobectomy of lung")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/f002")
        XCTAssertEqual(inst.followUp[0].text, "described in care plan")
        XCTAssertEqual(inst.id, "f002")
        XCTAssertEqual(inst.outcome?.text, "improved blood circulation")
        XCTAssertEqual(inst.performedPeriod?.end?.description, "2013-03-08T09:30:10+01:00")
        XCTAssertEqual(inst.performedPeriod?.start?.description, "2013-03-08T09:00:10+01:00")
        XCTAssertEqual(inst.performer[0].actor?.display, "M.I.M. Versteegh")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/f003")
        XCTAssertEqual(inst.performer[0].role?.coding[0].code, "01.000")
        XCTAssertEqual(inst.performer[0].role?.coding[0].display, "Arts")
        XCTAssertEqual(inst.performer[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
        XCTAssertEqual(inst.performer[0].role?.text, "Care role")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "Malignant tumor of lung")
        XCTAssertEqual(inst.report[0].display, "Lab results blood test")
        XCTAssertEqual(inst.report[0].reference, "DiagnosticReport/f001")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure4() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure4()
            try runProcedure4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm4(instance!)
    }

    func testProcedure4Copying() {
        do {
            let instance = try runProcedure4()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure4Populatability() {
        do {
            let instance = try runProcedure4()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm4(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure4(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure4(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-f003-abscess.json")
        
        XCTAssertEqual(inst.bodySite[0].coding[0].code, "83030008")
        XCTAssertEqual(inst.bodySite[0].coding[0].display, "Retropharyngeal area")
        XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.coding[0].code, "172960003")
        XCTAssertEqual(inst.code?.coding[0].display, "Incision of retropharyngeal abscess")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/f003")
        XCTAssertEqual(inst.followUp[0].text, "described in care plan")
        XCTAssertEqual(inst.id, "f003")
        XCTAssertEqual(inst.outcome?.text, "removal of the retropharyngeal abscess")
        XCTAssertEqual(inst.performedPeriod?.end?.description, "2013-03-24T10:30:10+01:00")
        XCTAssertEqual(inst.performedPeriod?.start?.description, "2013-03-24T09:30:10+01:00")
        XCTAssertEqual(inst.performer[0].actor?.display, "E.M.J.M. van den broek")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/f001")
        XCTAssertEqual(inst.performer[0].role?.coding[0].code, "01.000")
        XCTAssertEqual(inst.performer[0].role?.coding[0].display, "Arts")
        XCTAssertEqual(inst.performer[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
        XCTAssertEqual(inst.performer[0].role?.text, "Care role")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "abcess in retropharyngeal area")
        XCTAssertEqual(inst.report[0].display, "Lab results blood test")
        XCTAssertEqual(inst.report[0].reference, "DiagnosticReport/f001")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure5() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure5()
            try runProcedure5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm5(instance!)
    }

    func testProcedure5Copying() {
        do {
            let instance = try runProcedure5()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure5Populatability() {
        do {
            let instance = try runProcedure5()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm5(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure5(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure5(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-f004-tracheotomy.json")
        
        XCTAssertEqual(inst.bodySite[0].coding[0].code, "83030008")
        XCTAssertEqual(inst.bodySite[0].coding[0].display, "Retropharyngeal area")
        XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.coding[0].code, "48387007")
        XCTAssertEqual(inst.code?.coding[0].display, "Tracheotomy")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/f003")
        XCTAssertEqual(inst.followUp[0].text, "described in care plan")
        XCTAssertEqual(inst.id, "f004")
        XCTAssertEqual(inst.outcome?.text, "removal of the retropharyngeal abscess")
        XCTAssertEqual(inst.performedPeriod?.end?.description, "2013-03-22T10:30:10+01:00")
        XCTAssertEqual(inst.performedPeriod?.start?.description, "2013-03-22T09:30:10+01:00")
        XCTAssertEqual(inst.performer[0].actor?.display, "A. Langeveld")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/f005")
        XCTAssertEqual(inst.performer[0].role?.coding[0].code, "01.000")
        XCTAssertEqual(inst.performer[0].role?.coding[0].display, "Arts")
        XCTAssertEqual(inst.performer[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
        XCTAssertEqual(inst.performer[0].role?.text, "Care role")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "ensure breathing during surgery")
        XCTAssertEqual(inst.report[0].display, "???????????")
        XCTAssertEqual(inst.report[0].reference, "DiagnosticReport/f001")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure6() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure6()
            try runProcedure6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm6(instance!)
    }

    func testProcedure6Copying() {
        do {
            let instance = try runProcedure6()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure6Populatability() {
        do {
            let instance = try runProcedure6()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm6(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure6(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure6(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-f201-tpf.json")
        
        XCTAssertEqual(inst.bodySite[0].coding[0].code, "272676008")
        XCTAssertEqual(inst.bodySite[0].coding[0].display, "Sphenoid bone")
        XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.coding[0].code, "367336001")
        XCTAssertEqual(inst.code?.coding[0].display, "Chemotherapy")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.encounter?.display, "Roel's encounter on January 28th, 2013")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/f202")
        XCTAssertEqual(inst.id, "f201")
        XCTAssertEqual(inst.notes[0].text, "Eerste neo-adjuvante TPF-kuur bij groot proces in sphenoid met intracraniale uitbreiding.")
        XCTAssertEqual(inst.performedPeriod?.end?.description, "2013-01-28T14:27:00+01:00")
        XCTAssertEqual(inst.performedPeriod?.start?.description, "2013-01-28T13:31:00+01:00")
        XCTAssertEqual(inst.performer[0].actor?.display, "Dokter Bronsig")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/f201")
        XCTAssertEqual(inst.performer[0].role?.coding[0].code, "310512001")
        XCTAssertEqual(inst.performer[0].role?.coding[0].display, "Medical oncologist")
        XCTAssertEqual(inst.performer[0].role?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "DiagnosticReport/f201")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure7() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure7()
            try runProcedure7(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm7(instance!)
    }

    func testProcedure7Copying() {
        do {
            let instance = try runProcedure7()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure7Populatability() {
        do {
            let instance = try runProcedure7()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm7(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure7(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure7(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example-implant.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "25267002")
        XCTAssertEqual(inst.code?.coding[0].display, "Insertion of intracardiac pacemaker (procedure)")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.text, "Implant Pacemaker")
        XCTAssertEqual(inst.focalDevice[0].action?.coding[0].code, "implanted")
        XCTAssertEqual(inst.focalDevice[0].action?.coding[0].system, "http://hl7.org/fhir/device-action")
        XCTAssertEqual(inst.focalDevice[0].manipulated?.reference, "Device/example-pacemaker")
        XCTAssertEqual(inst.followUp[0].text, "ROS 5 days  - 2013-04-10")
        XCTAssertEqual(inst.id, "example-implant")
        XCTAssertEqual(inst.notes[0].text, "Routine Appendectomy. Appendix was inflamed and in retro-caecal position")
        XCTAssertEqual(inst.performedDateTime?.description, "2015-04-05")
        XCTAssertEqual(inst.performer[0].actor?.display, "Dr Cecil Surgeon")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/example")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "Bradycardia")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testProcedure8() {   
        var instance: FireKit.Procedure?
        do {
            instance = try runProcedure8()
            try runProcedure8(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Procedure successfully, but threw: \(error)")
        }

        testProcedureRealm8(instance!)
    }

    func testProcedure8Copying() {
        do {
            let instance = try runProcedure8()
            let copy = instance.copy() as? FireKit.Procedure
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedure8(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedure8Populatability() {
        do {
            let instance = try runProcedure8()
            let copy = FireKit.Procedure()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedure8(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Procedure successfully, but threw: \(error)")
        }
    }

    func testProcedureRealm8(_ instance: FireKit.Procedure) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedure8(JSONEncoder().encode(realm.objects(FireKit.Procedure.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Procedure.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Procedure()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Procedure.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Procedure.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Procedure.self).count)
    }
    
    @discardableResult
    func runProcedure8(_ data: Data? = nil) throws -> FireKit.Procedure {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedure-example.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "80146002")
        XCTAssertEqual(inst.code?.coding[0].display, "Appendectomy (Procedure)")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.text, "Appendectomy")
        XCTAssertEqual(inst.followUp[0].text, "ROS 5 days  - 2013-04-10")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.notes[0].text, "Routine Appendectomy. Appendix was inflamed and in retro-caecal position")
        XCTAssertEqual(inst.performedDateTime?.description, "2013-04-05")
        XCTAssertEqual(inst.performer[0].actor?.display, "Dr Cecil Surgeon")
        XCTAssertEqual(inst.performer[0].actor?.reference, "Practitioner/example")
        XCTAssertEqual(inst.reasonCodeableConcept?.text, "Generalized abdominal pain 24 hours. Localized in RIF with rebound and guarding")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>Routine Appendectomy</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}