//
//  PaymentNoticeTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class PaymentNoticeTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.PaymentNotice {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.PaymentNotice {
		let instance = RealmSwiftFHIR.PaymentNotice(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testPaymentNotice1() {		
		var instance: RealmSwiftFHIR.PaymentNotice?
		do {
			instance = try runPaymentNotice1()
			try runPaymentNotice1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test PaymentNotice successfully, but threw")
		}

		testPaymentNoticeRealm1(instance: instance!)
	}

	func testPaymentNoticeRealm1(instance: RealmSwiftFHIR.PaymentNotice) {
		try! realm.write {
                realm.add(instance)
            }
        try! runPaymentNotice1(realm.objects(RealmSwiftFHIR.PaymentNotice.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.PaymentNotice.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.PaymentNotice.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runPaymentNotice1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.PaymentNotice {
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
