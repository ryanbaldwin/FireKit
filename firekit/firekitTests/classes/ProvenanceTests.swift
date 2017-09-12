//
//  ProvenanceTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-12.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ProvenanceTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Provenance {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Provenance {
      print("Inflating FireKit.Provenance from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.Provenance.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testProvenance1() {   
    var instance: FireKit.Provenance?
    do {
      instance = try runProvenance1()
      try runProvenance1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Provenance
      XCTAssertNotNil(copy)
      try runProvenance1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProvenance1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Provenance successfully, but threw: \(error)")
    }

    testProvenanceRealm1(instance!)
  }

  func testProvenance1RealmPK() { 
      do {
        let instance: FireKit.Provenance = try runProvenance1()
        let copy = (instance.copy() as! FireKit.Provenance)

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
            XCTAssertTrue(false, "Must instantiate and test Provenance's PKs, but threw: \(error)")
        }
    }

  func testProvenanceRealm1(_ instance: FireKit.Provenance) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProvenance1(JSONEncoder().encode(realm.objects(FireKit.Provenance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Provenance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Provenance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Provenance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Provenance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProvenance1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Provenance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProvenance1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Provenance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Provenance.self).count)
  }
  
  @discardableResult
  func runProvenance1(_ data: Data? = nil) throws -> FireKit.Provenance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "provenance-example-sig.json")
    
    XCTAssertEqual(inst.activity?.coding[0].code, "AU")
    XCTAssertEqual(inst.activity?.coding[0].display, "authenticated")
    XCTAssertEqual(inst.activity?.coding[0].system, "http://hl7.org/fhir/v3/DocumentCompletion")
    XCTAssertEqual(inst.agent[0].actor?.reference, "Practitioner/xcda-author")
    XCTAssertEqual(inst.agent[0].role?.code, "verifier")
    XCTAssertEqual(inst.agent[0].role?.system, "http://hl7.org/fhir/provenance-participant-role")
    XCTAssertEqual(inst.agent[0].userId?.system, "http://acme.com/fhir/users/sso")
    XCTAssertEqual(inst.agent[0].userId?.value, "hhd")
    XCTAssertEqual(inst.id, "signature")
    XCTAssertEqual(inst.reason[0].coding[0].code, "TREAT")
    XCTAssertEqual(inst.reason[0].coding[0].display, "treatment")
    XCTAssertEqual(inst.reason[0].coding[0].system, "http://hl7.org/fhir/v3/ActReason")
    XCTAssertEqual(inst.recorded?.description, "2015-08-27T08:39:24+10:00")
    XCTAssertTrue(inst.signature[0].blob! == Base64Binary(val: "Li4u"))
    XCTAssertEqual(inst.signature[0].contentType, "application/signature+xml")
    XCTAssertEqual(inst.signature[0].type[0].code, "1.2.840.10065.1.12.1.5")
    XCTAssertEqual(inst.signature[0].type[0].display, "Verification")
    XCTAssertEqual(inst.signature[0].type[0].system, "http://hl7.org/fhir/valueset-signature-type")
    XCTAssertEqual(inst.signature[0].when?.description, "2015-08-27T08:39:24+10:00")
    XCTAssertEqual(inst.signature[0].whoReference?.reference, "Practitioner/xcda-author")
    XCTAssertEqual(inst.target[0].reference, "DocumentReference/example")
    XCTAssertEqual(inst.text?.div, "<div>procedure record authored on 27-June 2015 by Harold Hippocrates, MD Content extracted from Referral received 26-June</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProvenance2() {   
    var instance: FireKit.Provenance?
    do {
      instance = try runProvenance2()
      try runProvenance2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Provenance
      XCTAssertNotNil(copy)
      try runProvenance2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProvenance2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Provenance successfully, but threw: \(error)")
    }

    testProvenanceRealm2(instance!)
  }

  func testProvenance2RealmPK() { 
      do {
        let instance: FireKit.Provenance = try runProvenance2()
        let copy = (instance.copy() as! FireKit.Provenance)

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
            XCTAssertTrue(false, "Must instantiate and test Provenance's PKs, but threw: \(error)")
        }
    }

  func testProvenanceRealm2(_ instance: FireKit.Provenance) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProvenance2(JSONEncoder().encode(realm.objects(FireKit.Provenance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Provenance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Provenance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Provenance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Provenance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProvenance2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Provenance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProvenance2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Provenance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Provenance.self).count)
  }
  
  @discardableResult
  func runProvenance2(_ data: Data? = nil) throws -> FireKit.Provenance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "provenance-example.json")
    
    XCTAssertEqual(inst.agent[0].actor?.reference, "Practitioner/xcda-author")
    XCTAssertEqual(inst.agent[0].relatedAgent[0].target, "#a1")
    XCTAssertEqual(inst.agent[0].relatedAgent[0].type?.text, "used")
    XCTAssertEqual(inst.agent[0].role?.code, "author")
    XCTAssertEqual(inst.agent[0].role?.system, "http://hl7.org/fhir/provenance-participant-role")
    XCTAssertEqual(inst.agent[0].userId?.system, "http://acme.com/fhir/users/sso")
    XCTAssertEqual(inst.agent[0].userId?.value, "hhd")
    XCTAssertEqual(inst.agent[1].actor?.reference, "Device/software")
    XCTAssertEqual(inst.agent[1].id, "a1")
    XCTAssertEqual(inst.agent[1].role?.code, "DEV")
    XCTAssertEqual(inst.agent[1].role?.system, "http://hl7.org/fhir/v3/ParticipationType")
    XCTAssertEqual(inst.entity[0].display, "CDA Document in XDS repository")
    XCTAssertEqual(inst.entity[0].reference, "DocumentReference/90f55916-9d15-4b8f-87a9-2d7ade8670c8")
    XCTAssertEqual(inst.entity[0].role, "source")
    XCTAssertEqual(inst.entity[0].type?.code, "57133-1")
    XCTAssertEqual(inst.entity[0].type?.display, "Referral note")
    XCTAssertEqual(inst.entity[0].type?.system, "http://loinc.org")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.location?.reference, "Location/1")
    XCTAssertEqual(inst.period?.start?.description, "2015-06-27")
    XCTAssertEqual(inst.policy[0].value, "http://acme.com/fhir/Consent/25")
    XCTAssertEqual(inst.reason[0].coding[0].code, "3457005")
    XCTAssertEqual(inst.reason[0].coding[0].display, "Referral")
    XCTAssertEqual(inst.reason[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].text, "Accepting a referral")
    XCTAssertEqual(inst.recorded?.description, "2015-06-27T08:39:24+10:00")
    XCTAssertEqual(inst.target[0].reference, "Procedure/example/_history/1")
    XCTAssertEqual(inst.text?.div, "<div>procedure record authored on 27-June 2015 by Harold Hippocrates, MD Content extracted from Referral received 26-June</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
