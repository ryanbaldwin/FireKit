//
//  SearchParameterTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-18.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-18
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class SearchParameterTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.SearchParameter {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.SearchParameter {
      print("Inflating FireKit.SearchParameter from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.SearchParameter.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testSearchParameter1() {   
    var instance: FireKit.SearchParameter?
    do {
      instance = try runSearchParameter1()
      try runSearchParameter1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.SearchParameter
      XCTAssertNotNil(copy)
      try runSearchParameter1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runSearchParameter1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test SearchParameter successfully, but threw: \(error)")
    }

    testSearchParameterRealm1(instance!)
  }

  func testSearchParameter1RealmPK() {    
    do {
        let instance: FireKit.SearchParameter = try runSearchParameter1()
        let copy = (instance.copy() as! FireKit.SearchParameter)

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
            XCTAssertTrue(false, "Must instantiate and test SearchParameter's PKs, but threw: \(error)")
        }
    }

  func testSearchParameterRealm1(_ instance: FireKit.SearchParameter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSearchParameter1(JSONEncoder().encode(realm.objects(FireKit.SearchParameter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.SearchParameter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.SearchParameter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.SearchParameter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.SearchParameter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSearchParameter1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.SearchParameter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSearchParameter1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.SearchParameter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.SearchParameter.self).count)
  }
  
  @discardableResult
  func runSearchParameter1(_ data: Data? = nil) throws -> FireKit.SearchParameter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "searchparameter-example-extension.json")
    
    XCTAssertEqual(inst.base, "Patient")
    XCTAssertEqual(inst.code, "part-agree")
    XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
    XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
    XCTAssertEqual(inst.description_fhir, "Search by url for a participation agreement, which is stored in a DocumentReference")
    XCTAssertEqual(inst.id, "example-extension")
    XCTAssertEqual(inst.name, "Example Search Parameter on an extension")
    XCTAssertEqual(inst.publisher, "Health Level Seven International (FHIR Infrastructure)")
    XCTAssertEqual(inst.target[0].value, "DocumentReference")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type, "reference")
    XCTAssertEqual(inst.url, "http://hl7.org/fhir/SearchParameter/example-extension")
    XCTAssertEqual(inst.xpath, "f:DocumentReference/f:extension[@url='http://example.org/fhir/StructureDefinition/participation-agreement']")
    XCTAssertEqual(inst.xpathUsage, "normal")
    
    return inst
  }
  
  func testSearchParameter2() {   
    var instance: FireKit.SearchParameter?
    do {
      instance = try runSearchParameter2()
      try runSearchParameter2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.SearchParameter
      XCTAssertNotNil(copy)
      try runSearchParameter2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runSearchParameter2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test SearchParameter successfully, but threw: \(error)")
    }

    testSearchParameterRealm2(instance!)
  }

  func testSearchParameter2RealmPK() {    
    do {
        let instance: FireKit.SearchParameter = try runSearchParameter2()
        let copy = (instance.copy() as! FireKit.SearchParameter)

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
            XCTAssertTrue(false, "Must instantiate and test SearchParameter's PKs, but threw: \(error)")
        }
    }

  func testSearchParameterRealm2(_ instance: FireKit.SearchParameter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSearchParameter2(JSONEncoder().encode(realm.objects(FireKit.SearchParameter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.SearchParameter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.SearchParameter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.SearchParameter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.SearchParameter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSearchParameter2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.SearchParameter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSearchParameter2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.SearchParameter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.SearchParameter.self).count)
  }
  
  @discardableResult
  func runSearchParameter2(_ data: Data? = nil) throws -> FireKit.SearchParameter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "searchparameter-example.json")
    
    XCTAssertEqual(inst.base, "Resource")
    XCTAssertEqual(inst.code, "_id")
    XCTAssertEqual(inst.contact[0].name, "[string]")
    XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
    XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
    XCTAssertEqual(inst.date?.description, "2013-10-23")
    XCTAssertEqual(inst.description_fhir, "Search by resource identifier - e.g. same as the read interaction, but can return included resources")
    XCTAssertFalse(inst.experimental.value ?? true)
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.name, "Example Search Parameter")
    XCTAssertEqual(inst.publisher, "Health Level Seven International (FHIR Infrastructure)")
    XCTAssertEqual(inst.requirements, "Need to search by identifier for various infrastructural cases - mainly retrieving packages, and matching as part of a chain")
    XCTAssertEqual(inst.status, "draft")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type, "token")
    XCTAssertEqual(inst.url, "http://hl7.org/fhir/SearchParameter/example")
    XCTAssertEqual(inst.xpath, "f:*/f:id")
    XCTAssertEqual(inst.xpathUsage, "normal")
    
    return inst
  }
}
