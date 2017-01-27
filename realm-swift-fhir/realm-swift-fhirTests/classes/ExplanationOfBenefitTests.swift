//
//  ExplanationOfBenefitTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ExplanationOfBenefitTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ExplanationOfBenefit {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ExplanationOfBenefit {
		let instance = RealmSwiftFHIR.ExplanationOfBenefit(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testExplanationOfBenefit1() {		
		var instance: RealmSwiftFHIR.ExplanationOfBenefit?
		do {
			instance = try runExplanationOfBenefit1()
			try runExplanationOfBenefit1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ExplanationOfBenefit successfully, but threw")
		}

		testExplanationOfBenefitRealm1(instance: instance!)
	}

	func testExplanationOfBenefitRealm1(instance: RealmSwiftFHIR.ExplanationOfBenefit) {
		try! realm.write {
                realm.add(instance)
            }
        try! runExplanationOfBenefit1(realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runExplanationOfBenefit1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ExplanationOfBenefit {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "explanationofbenefit-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.disposition, "Claim settled as per contract.")
		XCTAssertEqual(inst.id, "R3500")
		XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/eob")
		XCTAssertEqual(inst.identifier[0].value, "987654321")
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.outcome, "complete")
		XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/oralhealthclaim/15476332402")
		XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ExplanationOfBenefit</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
