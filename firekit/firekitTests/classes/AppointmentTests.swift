//
//  AppointmentTests.swift
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


class AppointmentTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Appointment {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Appointment {
      print("Inflating FireKit.Appointment from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.Appointment.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testAppointment1() {   
    var instance: FireKit.Appointment?
    do {
      instance = try runAppointment1()
      try runAppointment1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Appointment
      XCTAssertNotNil(copy)
      try runAppointment1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runAppointment1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Appointment successfully, but threw: \(error)")
    }

    testAppointmentRealm1(instance!)
  }

  func testAppointment1RealmPK() {    
    do {
        let instance: FireKit.Appointment = try runAppointment1()
        let copy = (instance.copy() as! FireKit.Appointment)

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
            XCTAssertTrue(false, "Must instantiate and test Appointment's PKs, but threw: \(error)")
        }
    }

  func testAppointmentRealm1(_ instance: FireKit.Appointment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAppointment1(JSONEncoder().encode(realm.objects(FireKit.Appointment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Appointment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Appointment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Appointment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Appointment.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointment1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Appointment.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointment1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Appointment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Appointment.self).count)
  }
  
  @discardableResult
  func runAppointment1(_ data: Data? = nil) throws -> FireKit.Appointment {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "appointment-example-request.json")
    
    XCTAssertEqual(inst.comment, "Further expand on the results of the MRI and determine the next actions that may be appropriate.")
    XCTAssertEqual(inst.description_fhir, "Discussion on the results of your recent MRI")
    XCTAssertEqual(inst.id, "examplereq")
    XCTAssertEqual(inst.identifier[0].system, "http://example.org/sampleappointment-identifier")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.minutesDuration.value, 15)
    XCTAssertEqual(inst.participant[0].actor?.display, "Peter James Chalmers")
    XCTAssertEqual(inst.participant[0].actor?.reference, "Patient/example")
    XCTAssertEqual(inst.participant[0].required, "required")
    XCTAssertEqual(inst.participant[0].status, "needs-action")
    XCTAssertEqual(inst.participant[1].required, "required")
    XCTAssertEqual(inst.participant[1].status, "needs-action")
    XCTAssertEqual(inst.participant[1].type[0].coding[0].code, "attending")
    XCTAssertEqual(inst.participant[2].actor?.display, "South Wing, second floor")
    XCTAssertEqual(inst.participant[2].actor?.reference, "Location/1")
    XCTAssertEqual(inst.participant[2].required, "required")
    XCTAssertEqual(inst.participant[2].status, "accepted")
    XCTAssertEqual(inst.priority.value, 5)
    XCTAssertEqual(inst.reason?.text, "Clinical Review")
    XCTAssertEqual(inst.slot[0].reference, "Slot/example")
    XCTAssertEqual(inst.status, "proposed")
    XCTAssertEqual(inst.text?.div, "<div>Brian MRI results discussion</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type?.coding[0].code, "52")
    XCTAssertEqual(inst.type?.coding[0].display, "General Discussion")
    
    return inst
  }
  
  func testAppointment2() {   
    var instance: FireKit.Appointment?
    do {
      instance = try runAppointment2()
      try runAppointment2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Appointment
      XCTAssertNotNil(copy)
      try runAppointment2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runAppointment2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Appointment successfully, but threw: \(error)")
    }

    testAppointmentRealm2(instance!)
  }

  func testAppointment2RealmPK() {    
    do {
        let instance: FireKit.Appointment = try runAppointment2()
        let copy = (instance.copy() as! FireKit.Appointment)

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
            XCTAssertTrue(false, "Must instantiate and test Appointment's PKs, but threw: \(error)")
        }
    }

  func testAppointmentRealm2(_ instance: FireKit.Appointment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAppointment2(JSONEncoder().encode(realm.objects(FireKit.Appointment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Appointment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Appointment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Appointment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Appointment.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointment2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Appointment.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointment2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Appointment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Appointment.self).count)
  }
  
  @discardableResult
  func runAppointment2(_ data: Data? = nil) throws -> FireKit.Appointment {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "appointment-example.json")
    
    XCTAssertEqual(inst.comment, "Further expand on the results of the MRI and determine the next actions that may be appropriate.")
    XCTAssertEqual(inst.description_fhir, "Discussion on the results of your recent MRI")
    XCTAssertEqual(inst.end?.description, "2013-12-10T11:00:00Z")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.participant[0].actor?.display, "Peter James Chalmers")
    XCTAssertEqual(inst.participant[0].actor?.reference, "Patient/example")
    XCTAssertEqual(inst.participant[0].required, "required")
    XCTAssertEqual(inst.participant[0].status, "accepted")
    XCTAssertEqual(inst.participant[1].actor?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.participant[1].actor?.reference, "Practitioner/example")
    XCTAssertEqual(inst.participant[1].required, "required")
    XCTAssertEqual(inst.participant[1].status, "accepted")
    XCTAssertEqual(inst.participant[1].type[0].coding[0].code, "attending")
    XCTAssertEqual(inst.participant[2].actor?.display, "South Wing, second floor")
    XCTAssertEqual(inst.participant[2].actor?.reference, "Location/1")
    XCTAssertEqual(inst.participant[2].required, "required")
    XCTAssertEqual(inst.participant[2].status, "accepted")
    XCTAssertEqual(inst.priority.value, 5)
    XCTAssertEqual(inst.start?.description, "2013-12-10T09:00:00Z")
    XCTAssertEqual(inst.status, "booked")
    XCTAssertEqual(inst.text?.div, "<div>Brian MRI results discussion</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type?.coding[0].code, "52")
    XCTAssertEqual(inst.type?.coding[0].display, "General Discussion")
    
    return inst
  }
  
  func testAppointment3() {   
    var instance: FireKit.Appointment?
    do {
      instance = try runAppointment3()
      try runAppointment3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Appointment
      XCTAssertNotNil(copy)
      try runAppointment3(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runAppointment3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Appointment successfully, but threw: \(error)")
    }

    testAppointmentRealm3(instance!)
  }

  func testAppointment3RealmPK() {    
    do {
        let instance: FireKit.Appointment = try runAppointment3()
        let copy = (instance.copy() as! FireKit.Appointment)

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
            XCTAssertTrue(false, "Must instantiate and test Appointment's PKs, but threw: \(error)")
        }
    }

  func testAppointmentRealm3(_ instance: FireKit.Appointment) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runAppointment3(JSONEncoder().encode(realm.objects(FireKit.Appointment.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Appointment.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Appointment.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Appointment()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Appointment.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointment3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Appointment.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runAppointment3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Appointment.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Appointment.self).count)
  }
  
  @discardableResult
  func runAppointment3(_ data: Data? = nil) throws -> FireKit.Appointment {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "appointment-example2doctors.json")
    
    XCTAssertEqual(inst.comment, "Clarify the results of the MRI to ensure context of test was correct")
    XCTAssertEqual(inst.description_fhir, "Discussion about Peter Chalmers MRI results")
    XCTAssertEqual(inst.end?.description, "2013-12-09T11:00:00Z")
    XCTAssertEqual(inst.id, "2docs")
    XCTAssertEqual(inst.participant[0].actor?.display, "Peter James Chalmers")
    XCTAssertEqual(inst.participant[0].actor?.reference, "Patient/example")
    XCTAssertEqual(inst.participant[0].required, "information-only")
    XCTAssertEqual(inst.participant[0].status, "accepted")
    XCTAssertEqual(inst.participant[1].actor?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.participant[1].actor?.reference, "Practitioner/example")
    XCTAssertEqual(inst.participant[1].required, "required")
    XCTAssertEqual(inst.participant[1].status, "accepted")
    XCTAssertEqual(inst.participant[2].actor?.display, "Luigi Maas")
    XCTAssertEqual(inst.participant[2].actor?.reference, "Practitioner/f202")
    XCTAssertEqual(inst.participant[2].required, "required")
    XCTAssertEqual(inst.participant[2].status, "accepted")
    XCTAssertEqual(inst.participant[3].actor?.display, "Phone Call")
    XCTAssertEqual(inst.participant[3].required, "information-only")
    XCTAssertEqual(inst.participant[3].status, "accepted")
    XCTAssertEqual(inst.priority.value, 5)
    XCTAssertEqual(inst.start?.description, "2013-12-09T09:00:00Z")
    XCTAssertEqual(inst.status, "booked")
    XCTAssertEqual(inst.text?.div, "<div>Brian MRI results discussion</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type?.coding[0].code, "52")
    XCTAssertEqual(inst.type?.coding[0].display, "General Discussion")
    
    return inst
  }
}
