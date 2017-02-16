//
//  SlotTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class SlotTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Slot {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Slot {
		let instance = RealmSwiftFHIR.Slot(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSlot1() {		
		var instance: RealmSwiftFHIR.Slot?
		do {
			instance = try runSlot1()
			try runSlot1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Slot
			XCTAssertNotNil(copy)
			try runSlot1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm1(instance: instance!)
	}

	func testSlotRealm1(instance: RealmSwiftFHIR.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot1(realm.objects(RealmSwiftFHIR.Slot.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Slot.self).count)
	}
	
	@discardableResult
	func runSlot1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Slot {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "slot-example-busy.json")
		
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
		var instance: RealmSwiftFHIR.Slot?
		do {
			instance = try runSlot2()
			try runSlot2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Slot
			XCTAssertNotNil(copy)
			try runSlot2(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm2(instance: instance!)
	}

	func testSlotRealm2(instance: RealmSwiftFHIR.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot2(realm.objects(RealmSwiftFHIR.Slot.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Slot.self).count)
	}
	
	@discardableResult
	func runSlot2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Slot {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "slot-example-tentative.json")
		
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
		var instance: RealmSwiftFHIR.Slot?
		do {
			instance = try runSlot3()
			try runSlot3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Slot
			XCTAssertNotNil(copy)
			try runSlot3(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm3(instance: instance!)
	}

	func testSlotRealm3(instance: RealmSwiftFHIR.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot3(realm.objects(RealmSwiftFHIR.Slot.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Slot.self).count)
	}
	
	@discardableResult
	func runSlot3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Slot {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "slot-example-unavailable.json")
		
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
		var instance: RealmSwiftFHIR.Slot?
		do {
			instance = try runSlot4()
			try runSlot4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Slot
			XCTAssertNotNil(copy)
			try runSlot4(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm4(instance: instance!)
	}

	func testSlotRealm4(instance: RealmSwiftFHIR.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot4(realm.objects(RealmSwiftFHIR.Slot.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Slot.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Slot()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Slot.self).count)
	}
	
	@discardableResult
	func runSlot4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Slot {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "slot-example.json")
		
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
