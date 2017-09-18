//
//  AppointmentResponseTests.swift
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


class AppointmentResponseTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.AppointmentResponse {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.AppointmentResponse {
      print("Inflating FireKit.AppointmentResponse from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.AppointmentResponse.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testAppointmentResponse1() {   
    var instance: FireKit.AppointmentResponse?
    do {
      instance = try runAppointmentResponse1()
      try runAppointmentResponse1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.AppointmentResponse
      XCTAssertNotNil(copy)
      try runAppointmentResponse1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runAppointmentResponse1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test AppointmentResponse successfully, but threw: \(error)")
    }

    testAppointmentResponseRealm1(instance!)
  }

  func testAppointmentResponse1RealmPK() {    
    do {
        let instance: FireKit.AppointmentResponse = try runAppointmentResponse1()
        let copy = (instance.copy() as! FireKit.AppointmentResponse)

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
            XCTAssertTrue(false, "Must instantiate and test AppointmentResponse's PKs, but threw: \(error)")
        }
    }

  func testAppointmentResponseRealm1(_ instance: FireKit.AppointmentResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAppointmentResponse1(JSONEncoder().encode(realm.objects(FireKit.AppointmentResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.AppointmentResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.AppointmentResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.AppointmentResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.AppointmentResponse.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointmentResponse1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.AppointmentResponse.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointmentResponse1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.AppointmentResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.AppointmentResponse.self).count)
  }
  
  @discardableResult
  func runAppointmentResponse1(_ data: Data? = nil) throws -> FireKit.AppointmentResponse {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "appointmentresponse-example-req.json")
    
    XCTAssertEqual(inst.actor?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.actor?.reference, "Practitioner/example")
    XCTAssertEqual(inst.appointment?.display, "Brian MRI results discussion")
    XCTAssertEqual(inst.appointment?.reference, "Appointment/examplereq")
    XCTAssertEqual(inst.comment, "can't we try for this time, can't do mornings")
    XCTAssertEqual(inst.end?.description, "2013-12-25T13:30:00Z")
    XCTAssertEqual(inst.id, "exampleresp")
    XCTAssertEqual(inst.identifier[0].system, "http://example.org/sampleappointmentresponse-identifier")
    XCTAssertEqual(inst.identifier[0].value, "response123")
    XCTAssertEqual(inst.participantStatus, "tentative")
    XCTAssertEqual(inst.participantType[0].coding[0].code, "attending")
    XCTAssertEqual(inst.start?.description, "2013-12-25T13:15:00Z")
    XCTAssertEqual(inst.text?.div, "<div>Accept Brian MRI results discussion</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testAppointmentResponse2() {   
    var instance: FireKit.AppointmentResponse?
    do {
      instance = try runAppointmentResponse2()
      try runAppointmentResponse2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.AppointmentResponse
      XCTAssertNotNil(copy)
      try runAppointmentResponse2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runAppointmentResponse2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test AppointmentResponse successfully, but threw: \(error)")
    }

    testAppointmentResponseRealm2(instance!)
  }

  func testAppointmentResponse2RealmPK() {    
    do {
        let instance: FireKit.AppointmentResponse = try runAppointmentResponse2()
        let copy = (instance.copy() as! FireKit.AppointmentResponse)

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
            XCTAssertTrue(false, "Must instantiate and test AppointmentResponse's PKs, but threw: \(error)")
        }
    }

  func testAppointmentResponseRealm2(_ instance: FireKit.AppointmentResponse) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAppointmentResponse2(JSONEncoder().encode(realm.objects(FireKit.AppointmentResponse.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.AppointmentResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.AppointmentResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.AppointmentResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.AppointmentResponse.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointmentResponse2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.AppointmentResponse.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointmentResponse2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.AppointmentResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.AppointmentResponse.self).count)
  }
  
  @discardableResult
  func runAppointmentResponse2(_ data: Data? = nil) throws -> FireKit.AppointmentResponse {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "appointmentresponse-example.json")
    
    XCTAssertEqual(inst.actor?.display, "Peter James Chalmers")
    XCTAssertEqual(inst.actor?.reference, "Patient/example")
    XCTAssertEqual(inst.appointment?.display, "Brian MRI results discussion")
    XCTAssertEqual(inst.appointment?.reference, "Appointment/example")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.participantStatus, "accepted")
    XCTAssertEqual(inst.text?.div, "<div>Accept Brian MRI results discussion</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
