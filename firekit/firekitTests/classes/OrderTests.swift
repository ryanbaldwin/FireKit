//
//  OrderTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class OrderTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func inflateFrom(filename: String) throws -> FireKit.Order {
		return try inflateFrom(data: try readJSONFile(filename))
	}
	
	func inflateFrom(data: Data) throws -> FireKit.Order {
      let data = NSKeyedArchiver.archivedData(withRootObject: data)
		  let instance = try JSONDecoder().decode(FireKit.Order.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testOrder1() {		
		var instance: FireKit.Order?
		do {
			instance = try runOrder1()
			try runOrder1(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Order
			XCTAssertNotNil(copy)
			try runOrder1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runOrder1(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test Order successfully, but threw: \(error)")
		}

		testOrderRealm1(instance!)
	}

    func testOrder1RealmPK() {        
        do {
            let instance: FireKit.Order = try runOrder1()
            let copy = (instance.copy() as! FireKit.Order)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Order's PKs, but threw: \(error)")
        }
    }

	func testOrderRealm1(_ instance: FireKit.Order) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runOrder1(JSONEncoder().encode(realm.objects(FireKit.Order.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Order.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Order()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Order.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOrder1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Order.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOrder1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Order.self).count)
	}
	
	@discardableResult
	func runOrder1(_ data: Data? = nil) throws -> FireKit.Order {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "order-example-f201-physiotherapy.json")
		
		XCTAssertEqual(inst.date?.description, "2013-03-05T12:00:00+01:00")
		XCTAssertEqual(inst.detail[0].display, "Consultation, not yet developed")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.reasonCodeableConcept?.text, "It concerns a one-off order for consultation in order to evaluate the stairs walking ability of Roel.")
		XCTAssertEqual(inst.source?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.subject?.display, "Roel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f201")
		XCTAssertEqual(inst.target?.display, "Juri van Gelder")
		XCTAssertEqual(inst.target?.reference, "Practitioner/f203")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.when?.code?.coding[0].code, "394848005")
		XCTAssertEqual(inst.when?.code?.coding[0].display, "Normal priority")
		XCTAssertEqual(inst.when?.code?.coding[0].system, "http://snomed.info/sct")
		
		return inst
	}
	
	func testOrder2() {		
		var instance: FireKit.Order?
		do {
			instance = try runOrder2()
			try runOrder2(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Order
			XCTAssertNotNil(copy)
			try runOrder2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runOrder2(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test Order successfully, but threw: \(error)")
		}

		testOrderRealm2(instance!)
	}

    func testOrder2RealmPK() {        
        do {
            let instance: FireKit.Order = try runOrder2()
            let copy = (instance.copy() as! FireKit.Order)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Order's PKs, but threw: \(error)")
        }
    }

	func testOrderRealm2(_ instance: FireKit.Order) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runOrder2(JSONEncoder().encode(realm.objects(FireKit.Order.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Order.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Order()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Order.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOrder2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Order.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOrder2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Order.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Order.self).count)
	}
	
	@discardableResult
	func runOrder2(_ data: Data? = nil) throws -> FireKit.Order {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "order-example.json")
		
		XCTAssertEqual(inst.date?.description, "2012-12-28T09:03:04+11:00")
		XCTAssertEqual(inst.detail[0].reference, "MedicationOrder/example")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.reasonCodeableConcept?.text, "Standard admission testing")
		XCTAssertEqual(inst.source?.reference, "Practitioner/example")
		XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
		XCTAssertEqual(inst.text?.div, "<div>Request for Prescription (on patient Donald DUCK @ Acme Healthcare, Inc. MR = 654321)</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.when?.code?.coding[0].code, "today")
		XCTAssertEqual(inst.when?.code?.coding[0].system, "http://acme.com/codes/request-priority")
		
		return inst
	}
}
