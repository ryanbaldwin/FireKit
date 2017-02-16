//
//  ExplanationOfBenefitTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
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
			let copy = instance!.copy() as? RealmSwiftFHIR.ExplanationOfBenefit
			XCTAssertNotNil(copy)
			try runExplanationOfBenefit1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ExplanationOfBenefit successfully, but threw")
		}

		testExplanationOfBenefitRealm1(instance: instance!)
	}

	func testExplanationOfBenefitRealm1(instance: RealmSwiftFHIR.ExplanationOfBenefit) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runExplanationOfBenefit1(realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.ExplanationOfBenefit()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.ExplanationOfBenefit.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runExplanationOfBenefit1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.ExplanationOfBenefit.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runExplanationOfBenefit1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.ExplanationOfBenefit.self).count)
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
