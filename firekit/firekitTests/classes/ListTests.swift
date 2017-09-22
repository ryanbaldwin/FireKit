//
//  ListTests.swift
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


class ListTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.List {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.List {
        // print("Inflating FireKit.List from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.List.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testList1() {   
        var instance: FireKit.List?
        do {
            instance = try runList1()
            try runList1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm1(instance!)
    }

    func testList1Copying() {
        do {
            let instance = try runList1()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList1Populatability() {
        do {
            let instance = try runList1()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm1(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList1(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList1(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example-allergies.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "52472-8")
        XCTAssertEqual(inst.code?.coding[0].display, "Allergies and Adverse Drug Reactions")
        XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.code?.text, "Current Allergy List")
        XCTAssertEqual(inst.date?.description, "2015-07-14T23:10:23+11:00")
        XCTAssertEqual(inst.entry[0].item?.reference, "AllergyIntolerance/example")
        XCTAssertEqual(inst.entry[1].item?.reference, "AllergyIntolerance/medication")
        XCTAssertEqual(inst.id, "current-allergies")
        XCTAssertEqual(inst.mode, "working")
        XCTAssertEqual(inst.orderedBy?.coding[0].code, "entry-date")
        XCTAssertEqual(inst.orderedBy?.coding[0].system, "http://hl7.org/fhir/list-order")
        XCTAssertEqual(inst.source?.reference, "Patient/example")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.title, "Current Allergy List")

        return inst
    }
    
    func testList2() {   
        var instance: FireKit.List?
        do {
            instance = try runList2()
            try runList2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm2(instance!)
    }

    func testList2Copying() {
        do {
            let instance = try runList2()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList2Populatability() {
        do {
            let instance = try runList2()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm2(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList2(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList2(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example-empty.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "182836005")
        XCTAssertEqual(inst.code?.coding[0].display, "Review of medication")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.text, "Medication Review")
        XCTAssertEqual(inst.date?.description, "2012-11-26T07:30:23+11:00")
        XCTAssertEqual(inst.emptyReason?.coding[0].code, "nilknown")
        XCTAssertEqual(inst.emptyReason?.coding[0].display, "Nil Known")
        XCTAssertEqual(inst.emptyReason?.coding[0].system, "http://hl7.org/fhir/list-empty-reason")
        XCTAssertEqual(inst.emptyReason?.text, "The patient is not on any medications")
        XCTAssertEqual(inst.id, "example-empty")
        XCTAssertEqual(inst.mode, "snapshot")
        XCTAssertEqual(inst.source?.reference, "Patient/example")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>The patient is not on any medications</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testList3() {   
        var instance: FireKit.List?
        do {
            instance = try runList3()
            try runList3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm3(instance!)
    }

    func testList3Copying() {
        do {
            let instance = try runList3()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList3Populatability() {
        do {
            let instance = try runList3()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm3(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList3(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList3(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example-familyhistory-f201-roel.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "8670-2")
        XCTAssertEqual(inst.code?.coding[0].display, "History of family member diseases")
        XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.contained[0].id, "fmh-1")
        XCTAssertEqual(inst.contained[1].id, "fmh-2")
        XCTAssertEqual(inst.entry[0].item?.reference, "#fmh-1")
        XCTAssertEqual(inst.entry[1].item?.reference, "#fmh-2")
        XCTAssertEqual(inst.id, "f201")
        XCTAssertEqual(inst.mode, "snapshot")
        XCTAssertEqual(inst.note, "Both parents, both brothers and both children (twin) are still alive.")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.subject?.display, "Roel")
        XCTAssertEqual(inst.subject?.reference, "Patient/f201")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testList4() {   
        var instance: FireKit.List?
        do {
            instance = try runList4()
            try runList4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm4(instance!)
    }

    func testList4Copying() {
        do {
            let instance = try runList4()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList4Populatability() {
        do {
            let instance = try runList4()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm4(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList4(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList4(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example-familyhistory-genetics-profile-annie.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "8670-2")
        XCTAssertEqual(inst.code?.coding[0].display, "History of family member diseases")
        XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.contained[0].id, "image")
        XCTAssertEqual(inst.contained[1].id, "2")
        XCTAssertEqual(inst.contained[2].id, "3")
        XCTAssertEqual(inst.contained[3].id, "4")
        XCTAssertEqual(inst.contained[4].id, "5")
        XCTAssertEqual(inst.contained[5].id, "6")
        XCTAssertEqual(inst.contained[6].id, "7")
        XCTAssertEqual(inst.contained[7].id, "8")
        XCTAssertEqual(inst.contained[8].id, "9")
        XCTAssertEqual(inst.contained[9].id, "10")
        XCTAssertEqual(inst.entry[0].item?.reference, "#2")
        XCTAssertEqual(inst.entry[1].item?.reference, "#3")
        XCTAssertEqual(inst.entry[2].item?.reference, "#4")
        XCTAssertEqual(inst.entry[3].item?.reference, "#5")
        XCTAssertEqual(inst.entry[4].item?.reference, "#6")
        XCTAssertEqual(inst.entry[5].item?.reference, "#7")
        XCTAssertEqual(inst.entry[6].item?.reference, "#8")
        XCTAssertEqual(inst.entry[7].item?.reference, "#9")
        XCTAssertEqual(inst.entry[8].item?.reference, "#10")
        XCTAssertEqual(inst.entry[9].item?.reference, "#11")
        XCTAssertEqual(inst.id, "prognosis")
        XCTAssertEqual(inst.mode, "snapshot")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.subject?.display, "Annie Proband, female, born 1966")
        XCTAssertEqual(inst.subject?.reference, "Patient/proband")
        XCTAssertEqual(inst.text?.div, "<div>\n      <img alt=\"Family history diagram for Annie Proband\" src=\"#image\"/>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testList5() {   
        var instance: FireKit.List?
        do {
            instance = try runList5()
            try runList5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm5(instance!)
    }

    func testList5Copying() {
        do {
            let instance = try runList5()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList5Populatability() {
        do {
            let instance = try runList5()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm5(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList5(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList5(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example-familyhistory-genetics-profile.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "8670-2")
        XCTAssertEqual(inst.code?.coding[0].display, "History of family member diseases")
        XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
        XCTAssertEqual(inst.contained[0].id, "1")
        XCTAssertEqual(inst.contained[1].id, "2")
        XCTAssertEqual(inst.contained[2].id, "3")
        XCTAssertEqual(inst.contained[3].id, "4")
        XCTAssertEqual(inst.contained[4].id, "5")
        XCTAssertEqual(inst.contained[5].id, "6")
        XCTAssertEqual(inst.contained[6].id, "7")
        XCTAssertEqual(inst.contained[7].id, "8")
        XCTAssertEqual(inst.entry[0].item?.reference, "#1")
        XCTAssertEqual(inst.entry[1].item?.reference, "#2")
        XCTAssertEqual(inst.entry[2].item?.reference, "#3")
        XCTAssertEqual(inst.entry[3].item?.reference, "#4")
        XCTAssertEqual(inst.entry[4].item?.reference, "#5")
        XCTAssertEqual(inst.entry[5].item?.reference, "#6")
        XCTAssertEqual(inst.entry[6].item?.reference, "#7")
        XCTAssertEqual(inst.entry[7].item?.reference, "#8")
        XCTAssertEqual(inst.id, "genetic")
        XCTAssertEqual(inst.mode, "snapshot")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.subject?.display, "Peter Patient")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>To do</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testList6() {   
        var instance: FireKit.List?
        do {
            instance = try runList6()
            try runList6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm6(instance!)
    }

    func testList6Copying() {
        do {
            let instance = try runList6()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList6Populatability() {
        do {
            let instance = try runList6()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm6(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList6(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList6(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example-medlist.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "182836005")
        XCTAssertEqual(inst.code?.coding[0].display, "Review of medication")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.text, "Medication Review")
        XCTAssertEqual(inst.date?.description, "2013-11-20T23:10:23+11:00")
        XCTAssertEqual(inst.entry[0].flag?.coding[0].code, "01")
        XCTAssertEqual(inst.entry[0].flag?.coding[0].display, "Prescribed")
        XCTAssertEqual(inst.entry[0].flag?.coding[0].system, "http://nehta.gov.au/codes/medications/changetype")
        XCTAssertEqual(inst.entry[0].item?.display, "hydroxocobalamin")
        XCTAssertTrue(inst.entry[1].deleted.value ?? false)
        XCTAssertEqual(inst.entry[1].flag?.coding[0].code, "02")
        XCTAssertEqual(inst.entry[1].flag?.coding[0].display, "Cancelled")
        XCTAssertEqual(inst.entry[1].flag?.coding[0].system, "http://nehta.gov.au/codes/medications/changetype")
        XCTAssertEqual(inst.entry[1].item?.display, "Morphine Sulfate")
        XCTAssertEqual(inst.id, "med-list")
        XCTAssertEqual(inst.mode, "changes")
        XCTAssertEqual(inst.source?.reference, "Patient/example")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Add hydroxocobalamin</p>\n      <p>Cancel Morphine Sulphate</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testList7() {   
        var instance: FireKit.List?
        do {
            instance = try runList7()
            try runList7(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test List successfully, but threw: \(error)")
        }

        testListRealm7(instance!)
    }

    func testList7Copying() {
        do {
            let instance = try runList7()
            let copy = instance.copy() as? FireKit.List
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runList7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test List successfully, but threw: \(error)")
        }
    }

    func testList7Populatability() {
        do {
            let instance = try runList7()
            let copy = FireKit.List()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runList7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test List successfully, but threw: \(error)")
        }
    }

    func testListRealm7(_ instance: FireKit.List) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runList7(JSONEncoder().encode(realm.objects(FireKit.List.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
    }
    
    @discardableResult
    func runList7(_ data: Data? = nil) throws -> FireKit.List {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "list-example.json")
        
        XCTAssertEqual(inst.date?.description, "2012-11-25T22:17:00+11:00")
        XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
        XCTAssertTrue(inst.entry[0].deleted.value ?? false)
        XCTAssertEqual(inst.entry[0].flag?.text, "Deleted due to error")
        XCTAssertEqual(inst.entry[0].item?.reference, "Condition/example")
        XCTAssertEqual(inst.entry[1].date?.description, "2012-11-21")
        XCTAssertEqual(inst.entry[1].flag?.text, "Added")
        XCTAssertEqual(inst.entry[1].item?.reference, "Condition/example2")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "urn:uuid:a9fcea7c-fcdf-4d17-a5e0-f26dda030b59")
        XCTAssertEqual(inst.identifier[0].value, "23974652")
        XCTAssertEqual(inst.mode, "changes")
        XCTAssertEqual(inst.source?.reference, "Patient/example")
        XCTAssertEqual(inst.status, "current")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}