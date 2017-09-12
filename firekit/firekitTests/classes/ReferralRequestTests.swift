//
//  ReferralRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-12.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ReferralRequestTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.ReferralRequest {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.ReferralRequest {
      print("Inflating FireKit.ReferralRequest from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.ReferralRequest.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testReferralRequest1() {   
    var instance: FireKit.ReferralRequest?
    do {
      instance = try runReferralRequest1()
      try runReferralRequest1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ReferralRequest
      XCTAssertNotNil(copy)
      try runReferralRequest1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runReferralRequest1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ReferralRequest successfully, but threw: \(error)")
    }

    testReferralRequestRealm1(instance!)
  }

  func testReferralRequest1RealmPK() {    
    do {
        let instance: FireKit.ReferralRequest = try runReferralRequest1()
        let copy = (instance.copy() as! FireKit.ReferralRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ReferralRequest's PKs, but threw: \(error)")
        }
    }

  func testReferralRequestRealm1(_ instance: FireKit.ReferralRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runReferralRequest1(JSONEncoder().encode(realm.objects(FireKit.ReferralRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ReferralRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ReferralRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ReferralRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ReferralRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runReferralRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ReferralRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runReferralRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ReferralRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ReferralRequest.self).count)
  }
  
  @discardableResult
  func runReferralRequest1(_ data: Data? = nil) throws -> FireKit.ReferralRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "referralrequest-example.json")
    
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
