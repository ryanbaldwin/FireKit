//
//  MedicationTests.swift
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


class MedicationTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Medication {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Medication {
        // print("Inflating FireKit.Medication from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Medication.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testMedication1() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication1()
            try runMedication1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm1(instance!)
    }

    func testMedication1Copying() {
        do {
            let instance = try runMedication1()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication1Populatability() {
        do {
            let instance = try runMedication1()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm1(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication1(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication1(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f001-combivent.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "320442002")
        XCTAssertEqual(inst.code?.coding[0].display, "Salbutamol+ipratropium bromide 100micrograms/20micrograms inhaler")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f001")
        XCTAssertTrue(inst.isBrand.value ?? false)
        XCTAssertEqual(inst.product?.form?.coding[0].code, "420317006")
        XCTAssertEqual(inst.product?.form?.coding[0].display, "Inhaler (qualifier value)")
        XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
        XCTAssertTrue(inst.product?.ingredient[0].amount?.denominator?.value! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.code, "ml")
        XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.system, "http://unitsofmeasure.org")
        XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.unit, "ml")
        XCTAssertTrue(inst.product?.ingredient[0].amount?.numerator?.value! == RealmDecimal(string: "100"))
        XCTAssertEqual(inst.product?.ingredient[0].item?.display, "Combivent")
        XCTAssertEqual(inst.product?.ingredient[0].item?.reference, "Medication/f001")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication2() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication2()
            try runMedication2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm2(instance!)
    }

    func testMedication2Copying() {
        do {
            let instance = try runMedication2()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication2Populatability() {
        do {
            let instance = try runMedication2()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm2(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication2(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication2(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f002-crestor.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "408036003")
        XCTAssertEqual(inst.code?.coding[0].display, "Rosuvastatin 10mg tablet")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f002")
        XCTAssertTrue(inst.isBrand.value ?? false)
        XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
        XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
        XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication3() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication3()
            try runMedication3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm3(instance!)
    }

    func testMedication3Copying() {
        do {
            let instance = try runMedication3()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication3Populatability() {
        do {
            let instance = try runMedication3()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm3(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication3(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication3(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f003-tolbutamide.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "325267004")
        XCTAssertEqual(inst.code?.coding[0].display, "Tolbutamide 500mg tablet")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f003")
        XCTAssertTrue(inst.isBrand.value ?? false)
        XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
        XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
        XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication4() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication4()
            try runMedication4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm4(instance!)
    }

    func testMedication4Copying() {
        do {
            let instance = try runMedication4()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication4Populatability() {
        do {
            let instance = try runMedication4()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm4(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication4(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication4(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f004-metoprolol.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "318475005")
        XCTAssertEqual(inst.code?.coding[0].display, "Metoprolol tartrate 50mg tablet")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f004")
        XCTAssertTrue(inst.isBrand.value ?? false)
        XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
        XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
        XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication5() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication5()
            try runMedication5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm5(instance!)
    }

    func testMedication5Copying() {
        do {
            let instance = try runMedication5()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication5Populatability() {
        do {
            let instance = try runMedication5()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm5(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication5(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication5(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f005-enalapril.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "318851002")
        XCTAssertEqual(inst.code?.coding[0].display, "Enalapril maleate 5mg tablet")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f005")
        XCTAssertTrue(inst.isBrand.value ?? false)
        XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
        XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
        XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication6() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication6()
            try runMedication6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm6(instance!)
    }

    func testMedication6Copying() {
        do {
            let instance = try runMedication6()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication6Populatability() {
        do {
            let instance = try runMedication6()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm6(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication6(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication6(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f201-salmeterol.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "411106009")
        XCTAssertEqual(inst.code?.coding[0].display, "25ug Flutacisone + 250ug Salmeterol")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f201")
        XCTAssertFalse(inst.isBrand.value ?? true)
        XCTAssertEqual(inst.product?.form?.coding[0].code, "421606006")
        XCTAssertEqual(inst.product?.form?.coding[0].display, "Aerosol spray")
        XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.product?.ingredient[0].amount?.denominator?.code, "PUFF")
        XCTAssertEqual(inst.product?.ingredient[0].amount?.denominator?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
        XCTAssertTrue(inst.product?.ingredient[0].amount?.denominator?.value! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.code, "ug")
        XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.system, "http://unitsofmeasure.org")
        XCTAssertTrue(inst.product?.ingredient[0].amount?.numerator?.value! == RealmDecimal(string: "25"))
        XCTAssertEqual(inst.product?.ingredient[0].item?.display, "flutacisone")
        XCTAssertEqual(inst.product?.ingredient[1].amount?.denominator?.code, "PUFF")
        XCTAssertEqual(inst.product?.ingredient[1].amount?.denominator?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
        XCTAssertTrue(inst.product?.ingredient[1].amount?.denominator?.value! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.product?.ingredient[1].amount?.numerator?.code, "ug")
        XCTAssertEqual(inst.product?.ingredient[1].amount?.numerator?.system, "http://unitsofmeasure.org")
        XCTAssertTrue(inst.product?.ingredient[1].amount?.numerator?.value! == RealmDecimal(string: "250"))
        XCTAssertEqual(inst.product?.ingredient[1].item?.display, "salmeterol")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication7() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication7()
            try runMedication7(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm7(instance!)
    }

    func testMedication7Copying() {
        do {
            let instance = try runMedication7()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication7Populatability() {
        do {
            let instance = try runMedication7()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm7(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication7(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication7(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f202-flucloxacilline.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "387544009")
        XCTAssertEqual(inst.code?.coding[0].display, "Flucloxacillin")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f202")
        XCTAssertFalse(inst.isBrand.value ?? true)
        XCTAssertEqual(inst.product?.form?.coding[0].code, "385218009")
        XCTAssertEqual(inst.product?.form?.coding[0].display, "Injection")
        XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testMedication8() {   
        var instance: FireKit.Medication?
        do {
            instance = try runMedication8()
            try runMedication8(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw: \(error)")
        }

        testMedicationRealm8(instance!)
    }

    func testMedication8Copying() {
        do {
            let instance = try runMedication8()
            let copy = instance.copy() as? FireKit.Medication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMedication8(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Medication successfully, but threw: \(error)")
        }
    }

    func testMedication8Populatability() {
        do {
            let instance = try runMedication8()
            let copy = FireKit.Medication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMedication8(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Medication successfully, but threw: \(error)")
        }
    }

    func testMedicationRealm8(_ instance: FireKit.Medication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMedication8(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
    }
    
    @discardableResult
    func runMedication8(_ data: Data? = nil) throws -> FireKit.Medication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f203-paracetamol.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "387517004")
        XCTAssertEqual(inst.code?.coding[0].display, "Paracetamol")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "f203")
        XCTAssertFalse(inst.isBrand.value ?? true)
        XCTAssertEqual(inst.product?.form?.coding[0].code, "385055001")
        XCTAssertEqual(inst.product?.form?.coding[0].display, "Tablet")
        XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}