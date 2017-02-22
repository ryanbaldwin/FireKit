//
//  EligibilityResponseTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class EligibilityResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.EligibilityResponse {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.EligibilityResponse {
		let instance = RealmSwiftFHIR.EligibilityResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testEligibilityResponse1() {		
		var instance: RealmSwiftFHIR.EligibilityResponse?
		do {
			instance = try runEligibilityResponse1()
			try runEligibilityResponse1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.EligibilityResponse
			XCTAssertNotNil(copy)
			try runEligibilityResponse1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runEligibilityResponse1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test EligibilityResponse successfully, but threw")
		}

		testEligibilityResponseRealm1(instance: instance!)
	}

    func testEligibilityResponse1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.EligibilityResponse = try runEligibilityResponse1()
            let copy = (instance.copy() as! RealmSwiftFHIR.EligibilityResponse)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test EligibilityResponse's PKs, but threw: \(error)")
        }
    }

	func testEligibilityResponseRealm1(instance: RealmSwiftFHIR.EligibilityResponse) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runEligibilityResponse1(realm.objects(RealmSwiftFHIR.EligibilityResponse.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EligibilityResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.EligibilityResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.EligibilityResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.EligibilityResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runEligibilityResponse1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.EligibilityResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runEligibilityResponse1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.EligibilityResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.EligibilityResponse.self).count)
	}
	
	@discardableResult
	func runEligibilityResponse1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.EligibilityResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "eligibilityresponse-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.disposition, "Policy is currently in-force.")
		XCTAssertEqual(inst.id, "E2500")
		XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/eligibilityresponse")
		XCTAssertEqual(inst.identifier[0].value, "881234")
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.outcome, "complete")
		XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
		XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the EligibilityResponse.</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
