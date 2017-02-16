//
//  ReferralRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ReferralRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ReferralRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ReferralRequest {
		let instance = RealmSwiftFHIR.ReferralRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testReferralRequest1() {		
		var instance: RealmSwiftFHIR.ReferralRequest?
		do {
			instance = try runReferralRequest1()
			try runReferralRequest1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.ReferralRequest
			XCTAssertNotNil(copy)
			try runReferralRequest1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ReferralRequest successfully, but threw")
		}

		testReferralRequestRealm1(instance: instance!)
	}

	func testReferralRequestRealm1(instance: RealmSwiftFHIR.ReferralRequest) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runReferralRequest1(realm.objects(RealmSwiftFHIR.ReferralRequest.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ReferralRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ReferralRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.ReferralRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.ReferralRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runReferralRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.ReferralRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runReferralRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ReferralRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.ReferralRequest.self).count)
	}
	
	@discardableResult
	func runReferralRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ReferralRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "referralrequest-example.json")
		
		XCTAssertEqual(inst.dateSent?.description, "2014-02-14")
		XCTAssertEqual(inst.description_fhir, "In the past 2 years Beverly has had 6 instances of r) sided Otitis media. She is     falling behind her peers at school, and displaying some learning difficulties.")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://orionhealth.com/fhir/apps/referralids")
		XCTAssertEqual(inst.identifier[0].value, "ret4421")
		XCTAssertEqual(inst.patient?.display, "Beverly Weaver")
		XCTAssertEqual(inst.patient?.reference, "https://fhir.orionhealth.com/blaze/fhir/Patient/77662")
		XCTAssertEqual(inst.priority?.coding[0].code, "med")
		XCTAssertEqual(inst.priority?.coding[0].display, "Medium")
		XCTAssertEqual(inst.priority?.coding[0].system, "http://orionhealth.com/fhir/apps/prioritycodes")
		XCTAssertEqual(inst.reason?.text, "For consideration of Grommets")
		XCTAssertEqual(inst.recipient[0].display, "Dr Dave")
		XCTAssertEqual(inst.recipient[0].reference, "https://fhir.orionhealth.com/blaze/fhir/Practitioner/76597")
		XCTAssertEqual(inst.requester?.display, "Serena Shrink")
		XCTAssertEqual(inst.requester?.reference, "https://fhir.orionhealth.com/blaze/fhir/Practitioner/77272")
		XCTAssertEqual(inst.serviceRequested[0].coding[0].code, "172676009")
		XCTAssertEqual(inst.serviceRequested[0].coding[0].display, "Myringotomy and insertion of tympanic ventilation tube")
		XCTAssertEqual(inst.serviceRequested[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.serviceRequested[0].text, "Insertion of grommets")
		XCTAssertEqual(inst.specialty?.coding[0].code, "ent")
		XCTAssertEqual(inst.specialty?.coding[0].display, "ENT")
		XCTAssertEqual(inst.specialty?.coding[0].system, "http://orionhealth.com/fhir/apps/specialties")
		XCTAssertEqual(inst.status, "requested")
		XCTAssertEqual(inst.text?.div, "<div>Referral to Dr Dave for Beverly weaver to have grommets inserted in her r) ear</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "rfs")
		XCTAssertEqual(inst.type?.coding[0].display, "Referral for service")
		XCTAssertEqual(inst.type?.coding[0].system, "http://orionhealth.com/fhir/apps/referraltypes")
		
		return inst
	}
}
