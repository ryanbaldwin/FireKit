//
//  ConditionTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-12.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ConditionTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Condition {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Condition {
      print("Inflating FireKit.Condition from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.Condition.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testCondition1() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition1()
      try runCondition1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm1(instance!)
  }

  func testCondition1RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition1()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm1(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition1(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition1(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f001-heart.json")
    
    XCTAssertEqual(inst.asserter?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.asserter?.reference, "Patient/f001")
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "40768004")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Left thorax")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.bodySite[0].text, "heart structure")
    XCTAssertEqual(inst.category?.coding[0].code, "439401001")
    XCTAssertEqual(inst.category?.coding[0].display, "diagnosis")
    XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "368009")
    XCTAssertEqual(inst.code?.coding[0].display, "Heart valve disorder")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2011-10-05")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/f001")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].code, "426396005")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].display, "Cardiac chest pain")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.id, "f001")
    XCTAssertEqual(inst.onsetDateTime?.description, "2011-08-05")
    XCTAssertEqual(inst.patient?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f001")
    XCTAssertEqual(inst.severity?.coding[0].code, "6736007")
    XCTAssertEqual(inst.severity?.coding[0].display, "Moderate")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition2() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition2()
      try runCondition2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm2(instance!)
  }

  func testCondition2RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition2()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm2(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition2(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition2(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f002-lung.json")
    
    XCTAssertEqual(inst.asserter?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.asserter?.reference, "Patient/f001")
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "51185008")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Thorax")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[0].code, "439401001")
    XCTAssertEqual(inst.category?.coding[0].display, "diagnosis")
    XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "254637007")
    XCTAssertEqual(inst.code?.coding[0].display, "NSCLC - Non-small cell lung cancer")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2012-06-03")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/f002")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].code, "169069000")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].display, "CT of thorax")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.id, "f002")
    XCTAssertEqual(inst.onsetDateTime?.description, "2011-05-05")
    XCTAssertEqual(inst.patient?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f001")
    XCTAssertEqual(inst.severity?.coding[0].code, "24484000")
    XCTAssertEqual(inst.severity?.coding[0].display, "Severe")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.stage?.summary?.coding[0].code, "258219007")
    XCTAssertEqual(inst.stage?.summary?.coding[0].display, "stage II")
    XCTAssertEqual(inst.stage?.summary?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition3() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition3()
      try runCondition3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm3(instance!)
  }

  func testCondition3RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition3()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm3(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition3(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition3(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f003-abscess.json")
    
    XCTAssertEqual(inst.asserter?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.asserter?.reference, "Patient/f001")
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "280193007")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Entire retropharyngeal area")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[0].code, "439401001")
    XCTAssertEqual(inst.category?.coding[0].display, "diagnosis")
    XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "18099001")
    XCTAssertEqual(inst.code?.coding[0].display, "Retropharyngeal abscess")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2012-02-20")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/f003")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].code, "169068008")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].display, "CT of neck")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.id, "f003")
    XCTAssertEqual(inst.onsetDateTime?.description, "2012-02-27")
    XCTAssertEqual(inst.patient?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f001")
    XCTAssertEqual(inst.severity?.coding[0].code, "371923003")
    XCTAssertEqual(inst.severity?.coding[0].display, "Mild to moderate")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition4() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition4()
      try runCondition4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm4(instance!)
  }

  func testCondition4RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition4()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm4(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition4(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition4(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f201-fever.json")
    
    XCTAssertEqual(inst.asserter?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "38266002")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Entire body as a whole")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[0].code, "55607006")
    XCTAssertEqual(inst.category?.coding[0].display, "Problem")
    XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[1].code, "finding")
    XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/condition-category")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "386661006")
    XCTAssertEqual(inst.code?.coding[0].display, "Fever")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2013-04-04")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/f201")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].code, "258710007")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].display, "degrees C")
    XCTAssertEqual(inst.evidence[0].code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.evidence[0].detail[0].display, "Temperature")
    XCTAssertEqual(inst.evidence[0].detail[0].reference, "Observation/f202")
    XCTAssertEqual(inst.id, "f201")
    XCTAssertEqual(inst.onsetDateTime?.description, "2013-04-02")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.severity?.coding[0].code, "255604002")
    XCTAssertEqual(inst.severity?.coding[0].display, "Mild")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition5() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition5()
      try runCondition5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm5(instance!)
  }

  func testCondition5RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition5()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm5(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition5(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition5(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f202-malignancy.json")
    
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "361355005")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Entire head and neck")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[0].code, "diagnosis")
    XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/condition-category")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "363346000")
    XCTAssertEqual(inst.code?.coding[0].display, "Malignant neoplastic disease")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2012-12-01")
    XCTAssertEqual(inst.evidence[0].detail[0].display, "Erasmus' diagnostic report of Roel's tumor")
    XCTAssertEqual(inst.evidence[0].detail[0].reference, "DiagnosticReport/f201")
    XCTAssertEqual(inst.id, "f202")
    XCTAssertEqual(inst.onsetQuantity?.code, "258707000")
    XCTAssertEqual(inst.onsetQuantity?.system, "http://snomed.info/sct")
    XCTAssertEqual(inst.onsetQuantity?.unit, "years")
    XCTAssertTrue(inst.onsetQuantity?.value! == RealmDecimal(string: "52"))
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.severity?.coding[0].code, "24484000")
    XCTAssertEqual(inst.severity?.coding[0].display, "Severe")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition6() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition6()
      try runCondition6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm6(instance!)
  }

  func testCondition6RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition6()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm6(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition6(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition6(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f203-sepsis.json")
    
    XCTAssertEqual(inst.asserter?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "281158006")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Pulmonary vascular structure")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[0].code, "55607006")
    XCTAssertEqual(inst.category?.coding[0].display, "Problem")
    XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[1].code, "finding")
    XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/condition-category")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "10001005")
    XCTAssertEqual(inst.code?.coding[0].display, "Bacterial sepsis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2013-03-11")
    XCTAssertEqual(inst.encounter?.display, "Roel's encounter on March eleventh")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/f203")
    XCTAssertEqual(inst.evidence[0].detail[0].display, "Diagnostic report for Roel's sepsis")
    XCTAssertEqual(inst.evidence[0].detail[0].reference, "DiagnosticReport/f202")
    XCTAssertEqual(inst.id, "f203")
    XCTAssertEqual(inst.onsetDateTime?.description, "2013-03-08")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.severity?.coding[0].code, "371924009")
    XCTAssertEqual(inst.severity?.coding[0].display, "Moderate to severe")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition7() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition7()
      try runCondition7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition7(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm7(instance!)
  }

  func testCondition7RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition7()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm7(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition7(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition7(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f204-renal.json")
    
    XCTAssertEqual(inst.abatementDateTime?.description, "2013-03-20")
    XCTAssertEqual(inst.asserter?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "181414000")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Kidney")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[0].code, "55607006")
    XCTAssertEqual(inst.category?.coding[0].display, "Problem")
    XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.category?.coding[1].code, "finding")
    XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/condition-category")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "36225005")
    XCTAssertEqual(inst.code?.coding[0].display, "Acute renal insufficiency specified as due to procedure")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2013-03-11")
    XCTAssertEqual(inst.encounter?.display, "Roel's encounter on March eleventh")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/f203")
    XCTAssertEqual(inst.id, "f204")
    XCTAssertEqual(inst.onsetDateTime?.description, "2013-03-11")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.severity?.coding[0].code, "24484000")
    XCTAssertEqual(inst.severity?.coding[0].display, "Severe")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.stage?.summary?.coding[0].code, "14803004")
    XCTAssertEqual(inst.stage?.summary?.coding[0].display, "Temporary")
    XCTAssertEqual(inst.stage?.summary?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "differential")
    
    return inst
  }
  
  func testCondition8() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition8()
      try runCondition8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition8(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm8(instance!)
  }

  func testCondition8RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition8()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm8(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition8(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition8(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-f205-infection.json")
    
    XCTAssertEqual(inst.asserter?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "87628006")
    XCTAssertEqual(inst.code?.coding[0].display, "Bacterial infectious disease")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.dateRecorded?.description, "2013-04-04")
    XCTAssertEqual(inst.id, "f205")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "differential")
    
    return inst
  }
  
  func testCondition9() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition9()
      try runCondition9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition9(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm9(instance!)
  }

  func testCondition9RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition9()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm9(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition9(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition9(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example-stroke.json")
    
    XCTAssertEqual(inst.category?.coding[0].code, "diagnosis")
    XCTAssertEqual(inst.category?.coding[0].display, "Diagnosis")
    XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/condition-category")
    XCTAssertEqual(inst.clinicalStatus, "active")
    XCTAssertEqual(inst.code?.coding[0].code, "422504002")
    XCTAssertEqual(inst.code?.coding[0].display, "Ischemic stroke (disorder)")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.code?.text, "Stroke")
    XCTAssertEqual(inst.id, "stroke")
    XCTAssertEqual(inst.onsetDateTime?.description, "2010-07-18")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.div, "<div>Ischemic stroke, July 18, 2010</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
  
  func testCondition10() {   
    var instance: FireKit.Condition?
    do {
      instance = try runCondition10()
      try runCondition10(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Condition
      XCTAssertNotNil(copy)
      try runCondition10(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runCondition10(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Condition successfully, but threw: \(error)")
    }

    testConditionRealm10(instance!)
  }

  func testCondition10RealmPK() { 
      do {
        let instance: FireKit.Condition = try runCondition10()
        let copy = (instance.copy() as! FireKit.Condition)

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
            XCTAssertTrue(false, "Must instantiate and test Condition's PKs, but threw: \(error)")
        }
    }

  func testConditionRealm10(_ instance: FireKit.Condition) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCondition10(JSONEncoder().encode(realm.objects(FireKit.Condition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Condition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Condition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition10(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Condition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCondition10(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Condition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Condition.self).count)
  }
  
  @discardableResult
  func runCondition10(_ data: Data? = nil) throws -> FireKit.Condition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "condition-example.json")
    
    XCTAssertEqual(inst.bodySite[0].coding[0].code, "49521004")
    XCTAssertEqual(inst.bodySite[0].coding[0].display, "Left external ear structure")
    XCTAssertEqual(inst.bodySite[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.bodySite[0].text, "Left Ear")
    XCTAssertEqual(inst.category?.coding[0].code, "diagnosis")
    XCTAssertEqual(inst.category?.coding[0].display, "Diagnosis")
    XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/condition-category")
    XCTAssertEqual(inst.category?.coding[1].code, "439401001")
    XCTAssertEqual(inst.category?.coding[1].display, "Diagnosis")
    XCTAssertEqual(inst.category?.coding[1].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.code?.coding[0].code, "39065001")
    XCTAssertEqual(inst.code?.coding[0].display, "Burn of ear")
    XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.code?.text, "Burnt Ear")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.onsetDateTime?.description, "2012-05-24")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.severity?.coding[0].code, "24484000")
    XCTAssertEqual(inst.severity?.coding[0].display, "Severe")
    XCTAssertEqual(inst.severity?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.text?.div, "<div>Severe burn of left ear (Date: 24-May 2012)</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.verificationStatus, "confirmed")
    
    return inst
  }
}
