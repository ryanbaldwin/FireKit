//
//  PaymentReconciliationTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class PaymentReconciliationTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.PaymentReconciliation {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.PaymentReconciliation {
      let instance = try JSONDecoder().decode(FireKit.PaymentReconciliation.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testPaymentReconciliation1() {   
    var instance: FireKit.PaymentReconciliation?
    do {
      instance = try runPaymentReconciliation1()
      try runPaymentReconciliation1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.PaymentReconciliation
      XCTAssertNotNil(copy)
      try runPaymentReconciliation1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPaymentReconciliation1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test PaymentReconciliation successfully, but threw: \(error)")
    }

    testPaymentReconciliationRealm1(instance!)
  }

    func testPaymentReconciliation1RealmPK() {        
        do {
            let instance: FireKit.PaymentReconciliation = try runPaymentReconciliation1()
            let copy = (instance.copy() as! FireKit.PaymentReconciliation)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test PaymentReconciliation's PKs, but threw: \(error)")
        }
    }

  func testPaymentReconciliationRealm1(_ instance: FireKit.PaymentReconciliation) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPaymentReconciliation1(JSONEncoder().encode(realm.objects(FireKit.PaymentReconciliation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.PaymentReconciliation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.PaymentReconciliation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.PaymentReconciliation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.PaymentReconciliation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPaymentReconciliation1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.PaymentReconciliation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPaymentReconciliation1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.PaymentReconciliation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.PaymentReconciliation.self).count)
  }
  
  @discardableResult
  func runPaymentReconciliation1(_ data: Data? = nil) throws -> FireKit.PaymentReconciliation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "paymentreconciliation-example.json")
    
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.detail[0].amount?.code, "USD")
    XCTAssertEqual(inst.detail[0].amount?.system, "urn:iso:std:iso:4217")
    XCTAssertTrue(inst.detail[0].amount?.value! == RealmDecimal(string: "1000.0"))
    XCTAssertEqual(inst.detail[0].date?.description, "2014-08-16")
    XCTAssertEqual(inst.detail[0].request?.reference, "http://www.BenefitsInc.com/fhir/oralhealthclaim/225476332402")
    XCTAssertEqual(inst.detail[0].type?.code, "payment")
    XCTAssertEqual(inst.detail[0].type?.system, "http://hl7.org/fhir/paymenttype")
    XCTAssertEqual(inst.detail[1].amount?.code, "USD")
    XCTAssertEqual(inst.detail[1].amount?.system, "urn:iso:std:iso:4217")
    XCTAssertTrue(inst.detail[1].amount?.value! == RealmDecimal(string: "4000.0"))
    XCTAssertEqual(inst.detail[1].date?.description, "2014-08-12")
    XCTAssertEqual(inst.detail[1].request?.reference, "http://www.BenefitsInc.com/fhir/oralhealthclaim/225476332699")
    XCTAssertEqual(inst.detail[1].type?.code, "payment")
    XCTAssertEqual(inst.detail[1].type?.system, "http://hl7.org/fhir/paymenttype")
    XCTAssertEqual(inst.detail[2].amount?.code, "USD")
    XCTAssertEqual(inst.detail[2].amount?.system, "urn:iso:std:iso:4217")
    XCTAssertTrue(inst.detail[2].amount?.value! == RealmDecimal(string: "-1500.0"))
    XCTAssertEqual(inst.detail[2].date?.description, "2014-08-16")
    XCTAssertEqual(inst.detail[2].type?.code, "advance")
    XCTAssertEqual(inst.detail[2].type?.system, "http://hl7.org/fhir/paymenttype")
    XCTAssertEqual(inst.disposition, "2014 August mid-month settlement.")
    XCTAssertEqual(inst.id, "ER2500")
    XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/enrollmentresponse")
    XCTAssertEqual(inst.identifier[0].value, "781234")
    XCTAssertEqual(inst.organization?.reference, "Organization/2")
    XCTAssertEqual(inst.outcome, "complete")
    XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/eligibility/225476332402")
    XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the PaymentReconciliation</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.total?.code, "USD")
    XCTAssertEqual(inst.total?.system, "urn:iso:std:iso:4217")
    XCTAssertTrue(inst.total?.value! == RealmDecimal(string: "3500.0"))
    
    return inst
  }
}
