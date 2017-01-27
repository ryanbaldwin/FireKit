//
//  ClaimResponseTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ClaimResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ClaimResponse {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ClaimResponse {
		let instance = RealmSwiftFHIR.ClaimResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testClaimResponse1() {		
		var instance: RealmSwiftFHIR.ClaimResponse?
		do {
			instance = try runClaimResponse1()
			try runClaimResponse1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ClaimResponse successfully, but threw")
		}

		testClaimResponseRealm1(instance: instance!)
	}

	func testClaimResponseRealm1(instance: RealmSwiftFHIR.ClaimResponse) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaimResponse1(realm.objects(RealmSwiftFHIR.ClaimResponse.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ClaimResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ClaimResponse.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaimResponse1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ClaimResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claimresponse-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.disposition, "Claim settled as per contract.")
		XCTAssertEqual(inst.id, "R3500")
		XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/remittance")
		XCTAssertEqual(inst.identifier[0].value, "R3500")
		XCTAssertEqual(inst.item[0].adjudication[0].amount?.code, "USD")
		XCTAssertEqual(inst.item[0].adjudication[0].amount?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].adjudication[0].amount?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.item[0].adjudication[0].code?.code, "eligible")
		XCTAssertEqual(inst.item[0].adjudication[1].amount?.code, "USD")
		XCTAssertEqual(inst.item[0].adjudication[1].amount?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].adjudication[1].amount?.value! == RealmDecimal(string: "10.0"))
		XCTAssertEqual(inst.item[0].adjudication[1].code?.code, "copay")
		XCTAssertEqual(inst.item[0].adjudication[2].code?.code, "eligpercent")
		XCTAssertTrue(inst.item[0].adjudication[2].value! == RealmDecimal(string: "80.0"))
		XCTAssertEqual(inst.item[0].adjudication[3].amount?.code, "USD")
		XCTAssertEqual(inst.item[0].adjudication[3].amount?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].adjudication[3].amount?.value! == RealmDecimal(string: "100.47"))
		XCTAssertEqual(inst.item[0].adjudication[3].code?.code, "benefit")
		XCTAssertEqual(inst.item[0].sequenceLinkId.value, 1)
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.outcome, "complete")
		XCTAssertEqual(inst.payeeType?.code, "provider")
		XCTAssertEqual(inst.payeeType?.system, "http://hl7.org/fhir/payeetype")
		XCTAssertEqual(inst.paymentAmount?.code, "USD")
		XCTAssertEqual(inst.paymentAmount?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.paymentAmount?.value! == RealmDecimal(string: "100.47"))
		XCTAssertEqual(inst.paymentDate?.description, "2014-08-31")
		XCTAssertEqual(inst.paymentRef?.system, "http://www.BenefitsInc.com/fhir/paymentRef")
		XCTAssertEqual(inst.paymentRef?.value, "201408-2-1569478")
		XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/oralhealthclaim/15476332402")
		XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ClaimResponse</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.totalBenefit?.code, "USD")
		XCTAssertEqual(inst.totalBenefit?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.totalBenefit?.value! == RealmDecimal(string: "100.47"))
		XCTAssertEqual(inst.totalCost?.code, "USD")
		XCTAssertEqual(inst.totalCost?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.totalCost?.value! == RealmDecimal(string: "135.57"))
		
		return inst
	}
}
