//
//  SlotTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class SlotTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.Slot {
		return try instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) throws -> FireKit.Slot {
      let data = NSKeyedArchiver.archivedData(withRootObject: json)
		  let instance = try JSONDecoder().decode(FireKit.Slot.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testSlot1() {		
		var instance: FireKit.Slot?
		do {
			instance = try runSlot1()
			try runSlot1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Slot
			XCTAssertNotNil(copy)
			try runSlot1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runSlot1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm1(instance!)
	}

    func testSlot1RealmPK() {        
        do {
            let instance: FireKit.Slot = try runSlot1()
            let copy = (instance.copy() as! FireKit.Slot)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot's PKs, but threw: \(error)")
        }
    }

	func testSlotRealm1(_ instance: FireKit.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot1(realm.objects(FireKit.Slot.self).first!.asJSON())
        
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
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
	}
	
	@discardableResult
	func runSlot1(_ data: Data? = nil) throws -> FireKit.Slot {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("slot-example-busy.json")
		
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
			try runSlot2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Slot
			XCTAssertNotNil(copy)
			try runSlot2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runSlot2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm2(instance!)
	}

    func testSlot2RealmPK() {        
        do {
            let instance: FireKit.Slot = try runSlot2()
            let copy = (instance.copy() as! FireKit.Slot)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot's PKs, but threw: \(error)")
        }
    }

	func testSlotRealm2(_ instance: FireKit.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot2(realm.objects(FireKit.Slot.self).first!.asJSON())
        
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
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
	}
	
	@discardableResult
	func runSlot2(_ data: Data? = nil) throws -> FireKit.Slot {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("slot-example-tentative.json")
		
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
			try runSlot3(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Slot
			XCTAssertNotNil(copy)
			try runSlot3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runSlot3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm3(instance!)
	}

    func testSlot3RealmPK() {        
        do {
            let instance: FireKit.Slot = try runSlot3()
            let copy = (instance.copy() as! FireKit.Slot)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot's PKs, but threw: \(error)")
        }
    }

	func testSlotRealm3(_ instance: FireKit.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot3(realm.objects(FireKit.Slot.self).first!.asJSON())
        
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
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
	}
	
	@discardableResult
	func runSlot3(_ data: Data? = nil) throws -> FireKit.Slot {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("slot-example-unavailable.json")
		
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
			try runSlot4(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Slot
			XCTAssertNotNil(copy)
			try runSlot4(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runSlot4(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Slot successfully, but threw")
		}

		testSlotRealm4(instance!)
	}

    func testSlot4RealmPK() {        
        do {
            let instance: FireKit.Slot = try runSlot4()
            let copy = (instance.copy() as! FireKit.Slot)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Slot's PKs, but threw: \(error)")
        }
    }

	func testSlotRealm4(_ instance: FireKit.Slot) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runSlot4(realm.objects(FireKit.Slot.self).first!.asJSON())
        
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
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Slot.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runSlot4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Slot.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Slot.self).count)
	}
	
	@discardableResult
	func runSlot4(_ data: Data? = nil) throws -> FireKit.Slot {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("slot-example.json")
		
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
