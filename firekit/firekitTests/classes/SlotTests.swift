//
//  SlotTests.swift
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


class SlotTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Slot {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Slot {
        // print("Inflating FireKit.Slot from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Slot.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testSlot1() {   
        var instance: FireKit.Slot?
        do {
            instance = try runSlot1()
            try runSlot1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw: \(error)")
        }

        testSlotRealm1(instance!)
    }

    func testSlot1Copying() {
        do {
            let instance = try runSlot1()
            let copy = instance.copy() as? FireKit.Slot
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runSlot1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Slot successfully, but threw: \(error)")
        }
    }

    func testSlot1Populatability() {
        do {
            let instance = try runSlot1()
            let copy = FireKit.Slot()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runSlot1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Slot successfully, but threw: \(error)")
        }
    }

    func testSlotRealm1(_ instance: FireKit.Slot) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSlot1(JSONEncoder().encode(realm.objects(FireKit.Slot.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
    }
    
    @discardableResult
    func runSlot1(_ data: Data? = nil) throws -> FireKit.Slot {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "slot-example-busy.json")
        
        XCTAssertEqual(inst.comment, "Assessments should be performed before requesting appointments in this slot.")
        XCTAssertEqual(inst.end?.description, "2013-12-25T09:15:00Z")
        XCTAssertEqual(inst.freeBusyType, "busy")
        XCTAssertEqual(inst.id, "1")
        XCTAssertEqual(inst.identifier[0].system, "http://example.org/identifiers/slots")
        XCTAssertEqual(inst.identifier[0].value, "123132")
        XCTAssertTrue(inst.overbooked.value ?? false)
        XCTAssertEqual(inst.schedule?.reference, "Schedule/example")
        XCTAssertEqual(inst.start?.description, "2013-12-25T09:00:00Z")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t25 Dec 2013 9:00am - 9:15am: <b>Busy</b> Physiotherapy\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "45")
        XCTAssertEqual(inst.type?.coding[0].display, "Physiotherapy")

        return inst
    }
    
    func testSlot2() {   
        var instance: FireKit.Slot?
        do {
            instance = try runSlot2()
            try runSlot2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw: \(error)")
        }

        testSlotRealm2(instance!)
    }

    func testSlot2Copying() {
        do {
            let instance = try runSlot2()
            let copy = instance.copy() as? FireKit.Slot
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runSlot2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Slot successfully, but threw: \(error)")
        }
    }

    func testSlot2Populatability() {
        do {
            let instance = try runSlot2()
            let copy = FireKit.Slot()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runSlot2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Slot successfully, but threw: \(error)")
        }
    }

    func testSlotRealm2(_ instance: FireKit.Slot) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSlot2(JSONEncoder().encode(realm.objects(FireKit.Slot.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
    }
    
    @discardableResult
    func runSlot2(_ data: Data? = nil) throws -> FireKit.Slot {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "slot-example-tentative.json")
        
        XCTAssertEqual(inst.comment, "Dr Careful is out of the office")
        XCTAssertEqual(inst.end?.description, "2013-12-25T10:00:00Z")
        XCTAssertEqual(inst.freeBusyType, "busy-tentative")
        XCTAssertEqual(inst.id, "2")
        XCTAssertEqual(inst.schedule?.reference, "Schedule/example")
        XCTAssertEqual(inst.start?.description, "2013-12-25T09:45:00Z")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t25 Dec 2013 9:45am - 10:00am: <b>Tentative</b> Physiotherapy\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "45")
        XCTAssertEqual(inst.type?.coding[0].display, "Physiotherapy")

        return inst
    }
    
    func testSlot3() {   
        var instance: FireKit.Slot?
        do {
            instance = try runSlot3()
            try runSlot3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw: \(error)")
        }

        testSlotRealm3(instance!)
    }

    func testSlot3Copying() {
        do {
            let instance = try runSlot3()
            let copy = instance.copy() as? FireKit.Slot
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runSlot3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Slot successfully, but threw: \(error)")
        }
    }

    func testSlot3Populatability() {
        do {
            let instance = try runSlot3()
            let copy = FireKit.Slot()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runSlot3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Slot successfully, but threw: \(error)")
        }
    }

    func testSlotRealm3(_ instance: FireKit.Slot) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSlot3(JSONEncoder().encode(realm.objects(FireKit.Slot.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
    }
    
    @discardableResult
    func runSlot3(_ data: Data? = nil) throws -> FireKit.Slot {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "slot-example-unavailable.json")
        
        XCTAssertEqual(inst.comment, "Dr Careful is out of the office")
        XCTAssertEqual(inst.end?.description, "2013-12-25T09:45:00Z")
        XCTAssertEqual(inst.freeBusyType, "busy-unavailable")
        XCTAssertEqual(inst.id, "3")
        XCTAssertEqual(inst.schedule?.reference, "Schedule/example")
        XCTAssertEqual(inst.start?.description, "2013-12-25T09:30:00Z")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t25 Dec 2013 9:30am - 9:45am: <b>Unavailable</b> Physiotherapy<br/>\n\t\t\tDr Careful is out of the office\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "45")
        XCTAssertEqual(inst.type?.coding[0].display, "Physiotherapy")

        return inst
    }
    
    func testSlot4() {   
        var instance: FireKit.Slot?
        do {
            instance = try runSlot4()
            try runSlot4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw: \(error)")
        }

        testSlotRealm4(instance!)
    }

    func testSlot4Copying() {
        do {
            let instance = try runSlot4()
            let copy = instance.copy() as? FireKit.Slot
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runSlot4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Slot successfully, but threw: \(error)")
        }
    }

    func testSlot4Populatability() {
        do {
            let instance = try runSlot4()
            let copy = FireKit.Slot()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runSlot4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Slot successfully, but threw: \(error)")
        }
    }

    func testSlotRealm4(_ instance: FireKit.Slot) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSlot4(JSONEncoder().encode(realm.objects(FireKit.Slot.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
    }
    
    @discardableResult
    func runSlot4(_ data: Data? = nil) throws -> FireKit.Slot {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "slot-example.json")
        
        XCTAssertEqual(inst.comment, "Assessments should be performed before requesting appointments in this slot.")
        XCTAssertEqual(inst.end?.description, "2013-12-25T09:30:00Z")
        XCTAssertEqual(inst.freeBusyType, "free")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.schedule?.reference, "Schedule/example")
        XCTAssertEqual(inst.start?.description, "2013-12-25T09:15:00Z")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t25 Dec 2013 9:15am - 9:30am: <b>Busy</b> Physiotherapy\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "45")
        XCTAssertEqual(inst.type?.coding[0].display, "Physiotherapy")

        return inst
    }
}