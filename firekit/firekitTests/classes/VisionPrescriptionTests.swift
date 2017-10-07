//
//  VisionPrescriptionTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-06.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-06
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class VisionPrescriptionTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.VisionPrescription {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.VisionPrescription {
        // print("Inflating FireKit.VisionPrescription from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.VisionPrescription.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testVisionPrescription1() {   
        var instance: FireKit.VisionPrescription?
        do {
            instance = try runVisionPrescription1()
            try runVisionPrescription1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test VisionPrescription successfully, but threw: \(error)")
        }

        testVisionPrescriptionRealm1(instance!)
    }

    func testVisionPrescription1Copying() {
        do {
            let instance = try runVisionPrescription1()
            let copy = instance.copy() as? FireKit.VisionPrescription
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runVisionPrescription1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test VisionPrescription successfully, but threw: \(error)")
        }
    }

    func testVisionPrescription1Populatability() {
        do {
            let instance = try runVisionPrescription1()
            let copy = FireKit.VisionPrescription()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runVisionPrescription1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test VisionPrescription successfully, but threw: \(error)")
        }
    }

    func testVisionPrescriptionRealm1(_ instance: FireKit.VisionPrescription) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runVisionPrescription1(JSONEncoder().encode(realm.objects(FireKit.VisionPrescription.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.VisionPrescription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.VisionPrescription.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.VisionPrescription()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.VisionPrescription.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.VisionPrescription.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.VisionPrescription.self).count)
    }
    
    @discardableResult
    func runVisionPrescription1(_ data: Data? = nil) throws -> FireKit.VisionPrescription {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "visionprescription-example-1.json")
        
        XCTAssertEqual(inst.dateWritten?.description, "2014-06-15")
        XCTAssertTrue(inst.dispense[0].add! == RealmDecimal(string: "1.75"))
        XCTAssertEqual(inst.dispense[0].axis.value, 160)
        XCTAssertTrue(inst.dispense[0].backCurve! == RealmDecimal(string: "8.7"))
        XCTAssertEqual(inst.dispense[0].brand, "OphthaGuard")
        XCTAssertEqual(inst.dispense[0].color, "green")
        XCTAssertTrue(inst.dispense[0].cylinder! == RealmDecimal(string: "-2.25"))
        XCTAssertTrue(inst.dispense[0].diameter! == RealmDecimal(string: "14.0"))
        XCTAssertEqual(inst.dispense[0].duration?.code, "month")
        XCTAssertEqual(inst.dispense[0].duration?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.dispense[0].duration?.unit, "month")
        XCTAssertTrue(inst.dispense[0].duration?.value! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.dispense[0].eye, "right")
        XCTAssertTrue(inst.dispense[0].power! == RealmDecimal(string: "-2.75"))
        XCTAssertEqual(inst.dispense[0].product?.code, "contact")
        XCTAssertEqual(inst.dispense[0].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
        XCTAssertTrue(inst.dispense[1].add! == RealmDecimal(string: "1.75"))
        XCTAssertEqual(inst.dispense[1].axis.value, 160)
        XCTAssertTrue(inst.dispense[1].backCurve! == RealmDecimal(string: "8.7"))
        XCTAssertEqual(inst.dispense[1].brand, "OphthaGuard")
        XCTAssertEqual(inst.dispense[1].color, "green")
        XCTAssertTrue(inst.dispense[1].cylinder! == RealmDecimal(string: "-3.5"))
        XCTAssertTrue(inst.dispense[1].diameter! == RealmDecimal(string: "14.0"))
        XCTAssertEqual(inst.dispense[1].duration?.code, "month")
        XCTAssertEqual(inst.dispense[1].duration?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.dispense[1].duration?.unit, "month")
        XCTAssertTrue(inst.dispense[1].duration?.value! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.dispense[1].eye, "left")
        XCTAssertTrue(inst.dispense[1].power! == RealmDecimal(string: "-2.75"))
        XCTAssertEqual(inst.dispense[1].product?.code, "contact")
        XCTAssertEqual(inst.dispense[1].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
        XCTAssertEqual(inst.id, "33124")
        XCTAssertEqual(inst.identifier[0].system, "http://www.happysight.com/prescription")
        XCTAssertEqual(inst.identifier[0].value, "15014")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.prescriber?.reference, "Practitioner/example")
        XCTAssertEqual(inst.text?.div, "<div>Sample Contract Lens prescription</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testVisionPrescription2() {   
        var instance: FireKit.VisionPrescription?
        do {
            instance = try runVisionPrescription2()
            try runVisionPrescription2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test VisionPrescription successfully, but threw: \(error)")
        }

        testVisionPrescriptionRealm2(instance!)
    }

    func testVisionPrescription2Copying() {
        do {
            let instance = try runVisionPrescription2()
            let copy = instance.copy() as? FireKit.VisionPrescription
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runVisionPrescription2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test VisionPrescription successfully, but threw: \(error)")
        }
    }

    func testVisionPrescription2Populatability() {
        do {
            let instance = try runVisionPrescription2()
            let copy = FireKit.VisionPrescription()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runVisionPrescription2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test VisionPrescription successfully, but threw: \(error)")
        }
    }

    func testVisionPrescriptionRealm2(_ instance: FireKit.VisionPrescription) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runVisionPrescription2(JSONEncoder().encode(realm.objects(FireKit.VisionPrescription.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.VisionPrescription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.VisionPrescription.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.VisionPrescription()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.VisionPrescription.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.VisionPrescription.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.VisionPrescription.self).count)
    }
    
    @discardableResult
    func runVisionPrescription2(_ data: Data? = nil) throws -> FireKit.VisionPrescription {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "visionprescription-example.json")
        
        XCTAssertEqual(inst.dateWritten?.description, "2014-06-15")
        XCTAssertTrue(inst.dispense[0].add! == RealmDecimal(string: "2.0"))
        XCTAssertEqual(inst.dispense[0].base, "down")
        XCTAssertEqual(inst.dispense[0].eye, "right")
        XCTAssertTrue(inst.dispense[0].prism! == RealmDecimal(string: "0.5"))
        XCTAssertEqual(inst.dispense[0].product?.code, "lens")
        XCTAssertEqual(inst.dispense[0].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
        XCTAssertTrue(inst.dispense[0].sphere! == RealmDecimal(string: "-2.0"))
        XCTAssertTrue(inst.dispense[1].add! == RealmDecimal(string: "2.0"))
        XCTAssertEqual(inst.dispense[1].axis.value, 180)
        XCTAssertEqual(inst.dispense[1].base, "up")
        XCTAssertTrue(inst.dispense[1].cylinder! == RealmDecimal(string: "-0.5"))
        XCTAssertEqual(inst.dispense[1].eye, "left")
        XCTAssertTrue(inst.dispense[1].prism! == RealmDecimal(string: "0.5"))
        XCTAssertEqual(inst.dispense[1].product?.code, "lens")
        XCTAssertEqual(inst.dispense[1].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
        XCTAssertTrue(inst.dispense[1].sphere! == RealmDecimal(string: "-1.0"))
        XCTAssertEqual(inst.id, "33123")
        XCTAssertEqual(inst.identifier[0].system, "http://www.happysight.com/prescription")
        XCTAssertEqual(inst.identifier[0].value, "15013")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.prescriber?.reference, "Practitioner/example")
        XCTAssertEqual(inst.text?.div, "<div>\n\t  <p>OD -2.00 SPH         +2.00 add    0.5 p.d. BD</p>\n      <p>OS -1.00 -0.50 x 180 +2.00 add    0.5 p.d. BU</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}