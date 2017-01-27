//
//  OrderTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class OrderTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Order {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Order {
		let instance = RealmSwiftFHIR.Order(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testOrder1() {		
		var instance: RealmSwiftFHIR.Order?
		do {
			instance = try runOrder1()
			try runOrder1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Order successfully, but threw")
		}

		testOrderRealm1(instance: instance!)
	}

	func testOrderRealm1(instance: RealmSwiftFHIR.Order) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrder1(realm.objects(RealmSwiftFHIR.Order.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Order.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Order.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrder1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Order {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "order-example-f201-physiotherapy.json")
		
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
		var instance: RealmSwiftFHIR.Order?
		do {
			instance = try runOrder2()
			try runOrder2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Order successfully, but threw")
		}

		testOrderRealm2(instance: instance!)
	}

	func testOrderRealm2(instance: RealmSwiftFHIR.Order) {
		try! realm.write {
                realm.add(instance)
            }
        try! runOrder2(realm.objects(RealmSwiftFHIR.Order.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Order.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Order.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runOrder2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Order {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "order-example.json")
		
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
