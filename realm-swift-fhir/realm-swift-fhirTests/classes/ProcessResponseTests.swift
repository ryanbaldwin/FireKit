//
//  ProcessResponseTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ProcessResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ProcessResponse {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ProcessResponse {
		let instance = RealmSwiftFHIR.ProcessResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testProcessResponse1() {		
		var instance: RealmSwiftFHIR.ProcessResponse?
		do {
			instance = try runProcessResponse1()
			try runProcessResponse1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.ProcessResponse
			XCTAssertNotNil(copy)
			try runProcessResponse1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ProcessResponse successfully, but threw")
		}

		testProcessResponseRealm1(instance: instance!)
	}

	func testProcessResponseRealm1(instance: RealmSwiftFHIR.ProcessResponse) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runProcessResponse1(realm.objects(RealmSwiftFHIR.ProcessResponse.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ProcessResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ProcessResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.ProcessResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.ProcessResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runProcessResponse1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.ProcessResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runProcessResponse1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ProcessResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.ProcessResponse.self).count)
	}
	
	@discardableResult
	func runProcessResponse1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ProcessResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "processresponse-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.disposition, "Specified coverage is currently in-force.")
		XCTAssertEqual(inst.id, "SR2500")
		XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/processresponse")
		XCTAssertEqual(inst.identifier[0].value, "881234")
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.outcome?.code, "complete")
		XCTAssertEqual(inst.outcome?.system, "http://hl7.org/fhir/processoutcomecodes")
		XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
		XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ProcessResponse</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
