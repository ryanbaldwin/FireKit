//
//  ClinicalImpressionTests.swift
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


class ClinicalImpressionTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.ClinicalImpression {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.ClinicalImpression {
      print("Inflating FireKit.ClinicalImpression from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.ClinicalImpression.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testClinicalImpression1() {   
    var instance: FireKit.ClinicalImpression?
    do {
      instance = try runClinicalImpression1()
      try runClinicalImpression1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ClinicalImpression
      XCTAssertNotNil(copy)
      try runClinicalImpression1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runClinicalImpression1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ClinicalImpression successfully, but threw: \(error)")
    }

    testClinicalImpressionRealm1(instance!)
  }

  func testClinicalImpression1RealmPK() {    
    do {
        let instance: FireKit.ClinicalImpression = try runClinicalImpression1()
        let copy = (instance.copy() as! FireKit.ClinicalImpression)

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
            XCTAssertTrue(false, "Must instantiate and test ClinicalImpression's PKs, but threw: \(error)")
        }
    }

  func testClinicalImpressionRealm1(_ instance: FireKit.ClinicalImpression) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClinicalImpression1(JSONEncoder().encode(realm.objects(FireKit.ClinicalImpression.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ClinicalImpression.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ClinicalImpression.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ClinicalImpression()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ClinicalImpression.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runClinicalImpression1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ClinicalImpression.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runClinicalImpression1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ClinicalImpression.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ClinicalImpression.self).count)
  }
  
  @discardableResult
  func runClinicalImpression1(_ data: Data? = nil) throws -> FireKit.ClinicalImpression {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "clinicalimpression-example.json")
    
    XCTAssertEqual(inst.assessor?.reference, "Practitioner/example")
    XCTAssertEqual(inst.date?.description, "2014-12-06T22:33:00+11:00")
    XCTAssertEqual(inst.description_fhir, "This 26 yo male patient is brought into ER by ambulance after being involved in a motor vehicle accident")
    XCTAssertEqual(inst.finding[0].item?.coding[0].code, "850.0")
    XCTAssertEqual(inst.finding[0].item?.coding[0].system, "http://hl7.org/fhir/sid/icd-9")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.investigations[0].code?.text, "Initial Examination")
    XCTAssertEqual(inst.investigations[0].item[0].display, "deep laceration of the scalp (left temporo-occipital)")
    XCTAssertEqual(inst.investigations[0].item[1].display, "decreased level of consciousness")
    XCTAssertEqual(inst.investigations[0].item[2].display, "disoriented to time and place")
    XCTAssertEqual(inst.investigations[0].item[3].display, "restless")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.plan[0].display, "hospital standard closed head injury management protocol ")
    XCTAssertEqual(inst.problem[0].display, "MVA")
    XCTAssertEqual(inst.status, "completed")
    XCTAssertEqual(inst.summary, "provisional diagnoses of laceration of head and traumatic brain injury (TBI)")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
