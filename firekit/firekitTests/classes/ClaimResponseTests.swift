//
//  ClaimResponseTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-19.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-19
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class ClaimResponseTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ClaimResponse {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ClaimResponse {
        // print("Inflating FireKit.ClaimResponse from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ClaimResponse.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testClaimResponse1() {   
        var instance: FireKit.ClaimResponse?
        do {
            instance = try runClaimResponse1()
            try runClaimResponse1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ClaimResponse successfully, but threw: \(error)")
        }

        testClaimResponseRealm1(instance!)
    }

    func testClaimResponse1Copying() {
        do {
            let instance = try runClaimResponse1()
            let copy = instance.copy() as? FireKit.ClaimResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaimResponse1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ClaimResponse successfully, but threw: \(error)")
        }
    }

    func testClaimResponse1Populatability() {
        do {
            let instance = try runClaimResponse1()
            let copy = FireKit.ClaimResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaimResponse1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ClaimResponse successfully, but threw: \(error)")
        }
    }

    func testClaimResponseRealm1(_ instance: FireKit.ClaimResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaimResponse1(JSONEncoder().encode(realm.objects(FireKit.ClaimResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ClaimResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ClaimResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ClaimResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ClaimResponse.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ClaimResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ClaimResponse.self).count)
    }
    
    @discardableResult
    func runClaimResponse1(_ data: Data? = nil) throws -> FireKit.ClaimResponse {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claimresponse-example.json")
        
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