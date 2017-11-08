//
//  DiagnosticOrderTests.swift
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


class DiagnosticOrderTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.DiagnosticOrder {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.DiagnosticOrder {
        // print("Inflating FireKit.DiagnosticOrder from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.DiagnosticOrder.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testDiagnosticOrder1() {   
        var instance: FireKit.DiagnosticOrder?
        do {
            instance = try runDiagnosticOrder1()
            try runDiagnosticOrder1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticOrder successfully, but threw: \(error)")
        }

        testDiagnosticOrderRealm1(instance!)
    }

    func testDiagnosticOrder1Copying() {
        do {
            let instance = try runDiagnosticOrder1()
            let copy = instance.copy() as? FireKit.DiagnosticOrder
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDiagnosticOrder1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrder1Populatability() {
        do {
            let instance = try runDiagnosticOrder1()
            let copy = FireKit.DiagnosticOrder()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDiagnosticOrder1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrder1NillingPopulatability() {
        do {
            let instance = try runDiagnosticOrder1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.DiagnosticOrder()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrderRealm1(_ instance: FireKit.DiagnosticOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDiagnosticOrder1(JSONEncoder().encode(realm.objects(FireKit.DiagnosticOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DiagnosticOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DiagnosticOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DiagnosticOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.DiagnosticOrder.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DiagnosticOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DiagnosticOrder.self).count)
    }
    
    @discardableResult
    func runDiagnosticOrder1(_ data: Data? = nil) throws -> FireKit.DiagnosticOrder {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "diagnosticorder-example-di.json")
        
        XCTAssertEqual(inst.event[0].dateTime?.description, "2013-05-08T09:33:27+07:00")
        XCTAssertEqual(inst.event[0].status, "requested")
        XCTAssertEqual(inst.id, "di")
        XCTAssertEqual(inst.item[0].bodySite?.coding[0].code, "51185008")
        XCTAssertEqual(inst.item[0].bodySite?.coding[0].display, "Thoracic structure")
        XCTAssertEqual(inst.item[0].bodySite?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.item[0].code?.coding[0].code, "24627-2")
        XCTAssertEqual(inst.item[0].code?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.item[0].code?.text, "Chest CT")
        XCTAssertEqual(inst.orderer?.display, "Dr. Adam Careful")
        XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
        XCTAssertEqual(inst.reason[0].text, "Check for metastatic disease")
        XCTAssertEqual(inst.status, "requested")
        XCTAssertEqual(inst.subject?.reference, "Patient/dicom")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p>Chest CT - ordered May 8, 2013 by Dr. Adam Careful</p>\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testDiagnosticOrder2() {   
        var instance: FireKit.DiagnosticOrder?
        do {
            instance = try runDiagnosticOrder2()
            try runDiagnosticOrder2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticOrder successfully, but threw: \(error)")
        }

        testDiagnosticOrderRealm2(instance!)
    }

    func testDiagnosticOrder2Copying() {
        do {
            let instance = try runDiagnosticOrder2()
            let copy = instance.copy() as? FireKit.DiagnosticOrder
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDiagnosticOrder2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrder2Populatability() {
        do {
            let instance = try runDiagnosticOrder2()
            let copy = FireKit.DiagnosticOrder()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDiagnosticOrder2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrder2NillingPopulatability() {
        do {
            let instance = try runDiagnosticOrder2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.DiagnosticOrder()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrderRealm2(_ instance: FireKit.DiagnosticOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDiagnosticOrder2(JSONEncoder().encode(realm.objects(FireKit.DiagnosticOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DiagnosticOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DiagnosticOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DiagnosticOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.DiagnosticOrder.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DiagnosticOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DiagnosticOrder.self).count)
    }
    
    @discardableResult
    func runDiagnosticOrder2(_ data: Data? = nil) throws -> FireKit.DiagnosticOrder {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "diagnosticorder-example-ft4.json")
        
        XCTAssertEqual(inst.contained[0].id, "rtt")
        XCTAssertEqual(inst.event[0].dateTime?.description, "2015-08-27T09:33:27+07:00")
        XCTAssertEqual(inst.event[0].status, "requested")
        XCTAssertEqual(inst.id, "ft4")
        XCTAssertEqual(inst.item[0].code?.coding[0].code, "3024-7")
        XCTAssertEqual(inst.item[0].code?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.item[0].code?.text, "Free T4")
        XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
        XCTAssertEqual(inst.specimen[0].display, "Red Top Tube")
        XCTAssertEqual(inst.specimen[0].reference, "#rtt")
        XCTAssertEqual(inst.status, "requested")
        XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testDiagnosticOrder3() {   
        var instance: FireKit.DiagnosticOrder?
        do {
            instance = try runDiagnosticOrder3()
            try runDiagnosticOrder3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticOrder successfully, but threw: \(error)")
        }

        testDiagnosticOrderRealm3(instance!)
    }

    func testDiagnosticOrder3Copying() {
        do {
            let instance = try runDiagnosticOrder3()
            let copy = instance.copy() as? FireKit.DiagnosticOrder
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runDiagnosticOrder3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrder3Populatability() {
        do {
            let instance = try runDiagnosticOrder3()
            let copy = FireKit.DiagnosticOrder()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runDiagnosticOrder3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrder3NillingPopulatability() {
        do {
            let instance = try runDiagnosticOrder3()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.DiagnosticOrder()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test DiagnosticOrder successfully, but threw: \(error)")
        }
    }

    func testDiagnosticOrderRealm3(_ instance: FireKit.DiagnosticOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDiagnosticOrder3(JSONEncoder().encode(realm.objects(FireKit.DiagnosticOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DiagnosticOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DiagnosticOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DiagnosticOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.DiagnosticOrder.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DiagnosticOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DiagnosticOrder.self).count)
    }
    
    @discardableResult
    func runDiagnosticOrder3(_ data: Data? = nil) throws -> FireKit.DiagnosticOrder {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "diagnosticorder-example.json")
        
        XCTAssertEqual(inst.contained[0].id, "fasting")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
        XCTAssertEqual(inst.event[0].actor?.reference, "Practitioner/example")
        XCTAssertEqual(inst.event[0].dateTime?.description, "2013-05-02T16:16:00-07:00")
        XCTAssertEqual(inst.event[0].status, "requested")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.3.4.5.6.7")
        XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "PLAC")
        XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
        XCTAssertEqual(inst.identifier[0].type?.text, "Placer")
        XCTAssertEqual(inst.identifier[0].value, "2345234234234")
        XCTAssertEqual(inst.item[0].code?.coding[0].code, "LIPID")
        XCTAssertEqual(inst.item[0].code?.coding[0].system, "http://acme.org/tests")
        XCTAssertEqual(inst.item[0].code?.text, "Lipid Panel")
        XCTAssertEqual(inst.item[0].specimen[0].reference, "Specimen/101")
        XCTAssertEqual(inst.note[0].text, "patient is afraid of needles")
        XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
        XCTAssertEqual(inst.reason[0].coding[0].code, "V173")
        XCTAssertEqual(inst.reason[0].coding[0].display, "Fam hx-ischem heart dis")
        XCTAssertEqual(inst.reason[0].coding[0].system, "http://hl7.org/fhir/sid/icd-9")
        XCTAssertEqual(inst.status, "received")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.supportingInformation[0].reference, "#fasting")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}