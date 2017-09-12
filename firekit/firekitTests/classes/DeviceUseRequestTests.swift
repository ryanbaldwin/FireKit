//
//  DeviceUseRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-12.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class DeviceUseRequestTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.DeviceUseRequest {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.DeviceUseRequest {
      print("Inflating FireKit.DeviceUseRequest from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.DeviceUseRequest.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testDeviceUseRequest1() {   
    var instance: FireKit.DeviceUseRequest?
    do {
      instance = try runDeviceUseRequest1()
      try runDeviceUseRequest1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.DeviceUseRequest
      XCTAssertNotNil(copy)
      try runDeviceUseRequest1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runDeviceUseRequest1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest successfully, but threw: \(error)")
    }

    testDeviceUseRequestRealm1(instance!)
  }

  func testDeviceUseRequest1RealmPK() {    
    do {
        let instance: FireKit.DeviceUseRequest = try runDeviceUseRequest1()
        let copy = (instance.copy() as! FireKit.DeviceUseRequest)

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
            XCTAssertTrue(false, "Must instantiate and test DeviceUseRequest's PKs, but threw: \(error)")
        }
    }

  func testDeviceUseRequestRealm1(_ instance: FireKit.DeviceUseRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runDeviceUseRequest1(JSONEncoder().encode(realm.objects(FireKit.DeviceUseRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DeviceUseRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DeviceUseRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDeviceUseRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DeviceUseRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runDeviceUseRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DeviceUseRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DeviceUseRequest.self).count)
  }
  
  @discardableResult
  func runDeviceUseRequest1(_ data: Data? = nil) throws -> FireKit.DeviceUseRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "deviceuserequest-example.json")
    
    XCTAssertEqual(inst.device?.reference, "Device/example")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.subject?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
