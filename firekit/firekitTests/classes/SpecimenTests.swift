//
//  SpecimenTests.swift
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


class SpecimenTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Specimen {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Specimen {
      print("Inflating FireKit.Specimen from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.Specimen.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testSpecimen1() {   
    var instance: FireKit.Specimen?
    do {
      instance = try runSpecimen1()
      try runSpecimen1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Specimen
      XCTAssertNotNil(copy)
      try runSpecimen1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runSpecimen1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Specimen successfully, but threw: \(error)")
    }

    testSpecimenRealm1(instance!)
  }

  func testSpecimen1RealmPK() {    
    do {
        let instance: FireKit.Specimen = try runSpecimen1()
        let copy = (instance.copy() as! FireKit.Specimen)

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
            XCTAssertTrue(false, "Must instantiate and test Specimen's PKs, but threw: \(error)")
        }
    }

  func testSpecimenRealm1(_ instance: FireKit.Specimen) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSpecimen1(JSONEncoder().encode(realm.objects(FireKit.Specimen.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Specimen.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Specimen.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Specimen()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Specimen.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSpecimen1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Specimen.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSpecimen1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Specimen.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Specimen.self).count)
  }
  
  @discardableResult
  func runSpecimen1(_ data: Data? = nil) throws -> FireKit.Specimen {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "specimen-example-isolate.json")
    
    XCTAssertEqual(inst.accessionIdentifier?.system, "http://lab.acme.org/specimens/2011")
    XCTAssertEqual(inst.accessionIdentifier?.value, "X352356-ISO1")
    XCTAssertEqual(inst.collection?.collectedDateTime?.description, "2015-08-16T07:03:00Z")
    XCTAssertEqual(inst.collection?.collector?.reference, "Practitioner/f202")
    XCTAssertEqual(inst.collection?.method?.coding[0].code, "BAP")
    XCTAssertEqual(inst.collection?.method?.coding[0].system, "http://hl7.org/fhir/v2/0488")
    XCTAssertEqual(inst.contained[0].id, "stool")
    XCTAssertEqual(inst.id, "isolate")
    XCTAssertEqual(inst.parent[0].reference, "#stool")
    XCTAssertEqual(inst.receivedTime?.description, "2015-08-18T07:03:00Z")
    XCTAssertEqual(inst.status, "available")
    XCTAssertEqual(inst.subject?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type?.coding[0].code, "429951000124103")
    XCTAssertEqual(inst.type?.coding[0].display, "Bacterial isolate specimen")
    XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testSpecimen2() {   
    var instance: FireKit.Specimen?
    do {
      instance = try runSpecimen2()
      try runSpecimen2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Specimen
      XCTAssertNotNil(copy)
      try runSpecimen2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runSpecimen2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Specimen successfully, but threw: \(error)")
    }

    testSpecimenRealm2(instance!)
  }

  func testSpecimen2RealmPK() {    
    do {
        let instance: FireKit.Specimen = try runSpecimen2()
        let copy = (instance.copy() as! FireKit.Specimen)

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
            XCTAssertTrue(false, "Must instantiate and test Specimen's PKs, but threw: \(error)")
        }
    }

  func testSpecimenRealm2(_ instance: FireKit.Specimen) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSpecimen2(JSONEncoder().encode(realm.objects(FireKit.Specimen.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Specimen.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Specimen.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Specimen()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Specimen.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSpecimen2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Specimen.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSpecimen2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Specimen.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Specimen.self).count)
  }
  
  @discardableResult
  func runSpecimen2(_ data: Data? = nil) throws -> FireKit.Specimen {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "specimen-example-urine.json")
    
    XCTAssertEqual(inst.accessionIdentifier?.system, "http://lab.acme.org/specimens/2015")
    XCTAssertEqual(inst.accessionIdentifier?.value, "X352356")
    XCTAssertEqual(inst.collection?.collectedDateTime?.description, "2015-08-18T07:03:00Z")
    XCTAssertEqual(inst.collection?.collector?.reference, "Practitioner/f202")
    XCTAssertEqual(inst.container[0].capacity?.unit, "mls")
    XCTAssertTrue(inst.container[0].capacity?.value! == RealmDecimal(string: "50"))
    XCTAssertEqual(inst.container[0].specimenQuantity?.unit, "mls")
    XCTAssertTrue(inst.container[0].specimenQuantity?.value! == RealmDecimal(string: "10"))
    XCTAssertEqual(inst.container[0].type?.text, "Non-sterile specimen container")
    XCTAssertEqual(inst.id, "vma-urine")
    XCTAssertEqual(inst.receivedTime?.description, "2015-08-18T07:03:00Z")
    XCTAssertEqual(inst.status, "available")
    XCTAssertEqual(inst.subject?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.treatment[0].description_fhir, "Acidify to pH < 3.0 with 6 N HCl.")
    XCTAssertEqual(inst.treatment[0].procedure?.coding[0].code, "ACID")
    XCTAssertEqual(inst.treatment[0].procedure?.coding[0].system, "http://hl7.org/fhir/v2/0373")
    XCTAssertEqual(inst.type?.coding[0].code, "RANDU")
    XCTAssertEqual(inst.type?.coding[0].display, "Urine, Random")
    XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v2/0487")
    
    return inst
  }
  
  func testSpecimen3() {   
    var instance: FireKit.Specimen?
    do {
      instance = try runSpecimen3()
      try runSpecimen3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Specimen
      XCTAssertNotNil(copy)
      try runSpecimen3(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runSpecimen3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Specimen successfully, but threw: \(error)")
    }

    testSpecimenRealm3(instance!)
  }

  func testSpecimen3RealmPK() {    
    do {
        let instance: FireKit.Specimen = try runSpecimen3()
        let copy = (instance.copy() as! FireKit.Specimen)

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
            XCTAssertTrue(false, "Must instantiate and test Specimen's PKs, but threw: \(error)")
        }
    }

  func testSpecimenRealm3(_ instance: FireKit.Specimen) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSpecimen3(JSONEncoder().encode(realm.objects(FireKit.Specimen.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Specimen.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Specimen.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Specimen()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Specimen.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSpecimen3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Specimen.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSpecimen3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Specimen.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Specimen.self).count)
  }
  
  @discardableResult
  func runSpecimen3(_ data: Data? = nil) throws -> FireKit.Specimen {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "specimen-example.json")
    
    XCTAssertEqual(inst.accessionIdentifier?.system, "http://lab.acme.org/specimens/2011")
    XCTAssertEqual(inst.accessionIdentifier?.value, "X352356")
    XCTAssertEqual(inst.collection?.collectedDateTime?.description, "2011-05-30T06:15:00Z")
    XCTAssertEqual(inst.collection?.collector?.reference, "Practitioner/example")
    XCTAssertEqual(inst.collection?.comment[0].value, "Specimen is grossly lipemic")
    XCTAssertEqual(inst.collection?.method?.coding[0].code, "LNV")
    XCTAssertEqual(inst.collection?.method?.coding[0].system, "http://hl7.org/fhir/v2/0488")
    XCTAssertEqual(inst.collection?.quantity?.unit, "mL")
    XCTAssertTrue(inst.collection?.quantity?.value! == RealmDecimal(string: "6"))
    XCTAssertEqual(inst.contained[0].id, "hep")
    XCTAssertEqual(inst.container[0].additiveReference?.reference, "#hep")
    XCTAssertEqual(inst.container[0].capacity?.unit, "mL")
    XCTAssertTrue(inst.container[0].capacity?.value! == RealmDecimal(string: "10"))
    XCTAssertEqual(inst.container[0].description_fhir, "Green Gel tube")
    XCTAssertEqual(inst.container[0].identifier[0].value, "48736-15394-75465")
    XCTAssertEqual(inst.container[0].specimenQuantity?.unit, "mL")
    XCTAssertTrue(inst.container[0].specimenQuantity?.value! == RealmDecimal(string: "6"))
    XCTAssertEqual(inst.container[0].type?.text, "Vacutainer")
    XCTAssertEqual(inst.id, "101")
    XCTAssertEqual(inst.identifier[0].system, "http://ehr.acme.org/identifiers/collections")
    XCTAssertEqual(inst.identifier[0].value, "23234352356")
    XCTAssertEqual(inst.receivedTime?.description, "2011-03-04T07:03:00Z")
    XCTAssertEqual(inst.status, "available")
    XCTAssertEqual(inst.subject?.display, "Peter Patient")
    XCTAssertEqual(inst.subject?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type?.coding[0].code, "122555007")
    XCTAssertEqual(inst.type?.coding[0].display, "Venous blood specimen")
    XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
}
