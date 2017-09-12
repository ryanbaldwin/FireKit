//
//  ParametersTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-11.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ParametersTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Parameters {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Parameters {
      let instance = try JSONDecoder().decode(FireKit.Parameters.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testParameters1() {   
    var instance: FireKit.Parameters?
    do {
      instance = try runParameters1()
      try runParameters1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Parameters
      XCTAssertNotNil(copy)
      try runParameters1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runParameters1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Parameters successfully, but threw: \(error)")
    }

    testParametersRealm1(instance!)
  }

  func testParameters1RealmPK() { 
      do {
        let instance: FireKit.Parameters = try runParameters1()
        let copy = (instance.copy() as! FireKit.Parameters)

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
            XCTAssertTrue(false, "Must instantiate and test Parameters's PKs, but threw: \(error)")
        }
    }

  func testParametersRealm1(_ instance: FireKit.Parameters) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runParameters1(JSONEncoder().encode(realm.objects(FireKit.Parameters.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Parameters.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Parameters.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Parameters()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Parameters.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runParameters1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Parameters.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runParameters1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Parameters.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Parameters.self).count)
  }
  
  @discardableResult
  func runParameters1(_ data: Data? = nil) throws -> FireKit.Parameters {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "parameters-example.json")
    
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.parameter[0].name, "start")
    XCTAssertEqual(inst.parameter[0].valueDate?.description, "2010-01-01")
    XCTAssertEqual(inst.parameter[1].name, "end")
    
    return inst
  }
}
