//
//  AppointmentResponseTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-06.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-06
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
        // print("Inflating FireKit.AppointmentResponse from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.AppointmentResponse.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testAppointmentResponse1() {   
        var instance: FireKit.AppointmentResponse?
        do {
            instance = try runAppointmentResponse1()
            try runAppointmentResponse1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test AppointmentResponse successfully, but threw: \(error)")
        }

        testAppointmentResponseRealm1(instance!)
    }

    func testAppointmentResponse1Copying() {
        do {
            let instance = try runAppointmentResponse1()
            let copy = instance.copy() as? FireKit.AppointmentResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runAppointmentResponse1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test AppointmentResponse successfully, but threw: \(error)")
        }
    }

    func testAppointmentResponse1Populatability() {
        do {
            let instance = try runAppointmentResponse1()
            let copy = FireKit.AppointmentResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runAppointmentResponse1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test AppointmentResponse successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.AppointmentResponse.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test AppointmentResponse successfully, but threw: \(error)")
        }

        testAppointmentResponseRealm2(instance!)
    }

    func testAppointmentResponse2Copying() {
        do {
            let instance = try runAppointmentResponse2()
            let copy = instance.copy() as? FireKit.AppointmentResponse
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runAppointmentResponse2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test AppointmentResponse successfully, but threw: \(error)")
        }
    }

    func testAppointmentResponse2Populatability() {
        do {
            let instance = try runAppointmentResponse2()
            let copy = FireKit.AppointmentResponse()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runAppointmentResponse2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test AppointmentResponse successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.AppointmentResponse.self, forPrimaryKey: newInst.pk)!
        
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