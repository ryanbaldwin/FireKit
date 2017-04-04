//
//  PaymentNoticeTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-04-03.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class PaymentNoticeTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> FireKit.PaymentNotice {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> FireKit.PaymentNotice {
		let instance = FireKit.PaymentNotice(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testPaymentNotice1() {		
		var instance: FireKit.PaymentNotice?
		do {
			instance = try runPaymentNotice1()
			try runPaymentNotice1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.PaymentNotice
			XCTAssertNotNil(copy)
			try runPaymentNotice1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runPaymentNotice1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test PaymentNotice successfully, but threw")
		}

		testPaymentNoticeRealm1(instance: instance!)
	}

    func testPaymentNotice1RealmPK() {        
        do {
            let instance: FireKit.PaymentNotice = try runPaymentNotice1()
            let copy = (instance.copy() as! FireKit.PaymentNotice)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test PaymentNotice's PKs, but threw: \(error)")
        }
    }

	func testPaymentNoticeRealm1(instance: FireKit.PaymentNotice) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runPaymentNotice1(realm.objects(FireKit.PaymentNotice.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.PaymentNotice.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.PaymentNotice.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.PaymentNotice()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.PaymentNotice.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runPaymentNotice1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.PaymentNotice.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runPaymentNotice1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.PaymentNotice.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.PaymentNotice.self).count)
	}
	
	@discardableResult
	func runPaymentNotice1(_ json: FHIRJSON? = nil) throws -> FireKit.PaymentNotice {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "paymentnotice-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.id, "77654")
		XCTAssertEqual(inst.identifier[0].system, "http://benefitsinc.com/paymentnotice")
		XCTAssertEqual(inst.identifier[0].value, "776543")
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.paymentStatus?.code, "paid")
		XCTAssertEqual(inst.paymentStatus?.system, "http://hl7.org/fhir/paymentstatus")
		XCTAssertEqual(inst.request?.reference, "http://benefitsinc.com/fhir/oralhealthclaim/12345")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the PaymentNotice</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
