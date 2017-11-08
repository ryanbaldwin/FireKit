//
//  HealthcareServiceTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-11-07.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-11-07
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class HealthcareServiceTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.HealthcareService {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.HealthcareService {
        // print("Inflating FireKit.HealthcareService from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.HealthcareService.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testHealthcareService1() {   
        var instance: FireKit.HealthcareService?
        do {
            instance = try runHealthcareService1()
            try runHealthcareService1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test HealthcareService successfully, but threw: \(error)")
        }

        testHealthcareServiceRealm1(instance!)
    }

    func testHealthcareService1Copying() {
        do {
            let instance = try runHealthcareService1()
            let copy = instance.copy() as? FireKit.HealthcareService
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runHealthcareService1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test HealthcareService successfully, but threw: \(error)")
        }
    }

    func testHealthcareService1Populatability() {
        do {
            let instance = try runHealthcareService1()
            let copy = FireKit.HealthcareService()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runHealthcareService1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test HealthcareService successfully, but threw: \(error)")
        }
    }

    func testHealthcareService1NillingPopulatability() {
        do {
            let instance = try runHealthcareService1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.HealthcareService()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test HealthcareService successfully, but threw: \(error)")
        }
    }

    func testHealthcareServiceRealm1(_ instance: FireKit.HealthcareService) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runHealthcareService1(JSONEncoder().encode(realm.objects(FireKit.HealthcareService.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.HealthcareService.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.HealthcareService.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.HealthcareService()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.HealthcareService.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.HealthcareService.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.HealthcareService.self).count)
    }
    
    @discardableResult
    func runHealthcareService1(_ data: Data? = nil) throws -> FireKit.HealthcareService {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "healthcareservice-example.json")
        
        XCTAssertFalse(inst.appointmentRequired.value ?? true)
        XCTAssertEqual(inst.availabilityExceptions, "Reduced capacity is available during the Christmas period")
        XCTAssertEqual(inst.availableTime[0].availableEndTime?.description, "05:30:00")
        XCTAssertEqual(inst.availableTime[0].availableStartTime?.description, "08:30:00")
        XCTAssertEqual(inst.availableTime[0].daysOfWeek[0].value, "mon")
        XCTAssertEqual(inst.availableTime[0].daysOfWeek[1].value, "tue")
        XCTAssertEqual(inst.availableTime[0].daysOfWeek[2].value, "wed")
        XCTAssertEqual(inst.availableTime[0].daysOfWeek[3].value, "thu")
        XCTAssertEqual(inst.availableTime[0].daysOfWeek[4].value, "fri")
        XCTAssertEqual(inst.availableTime[1].availableEndTime?.description, "04:30:00")
        XCTAssertEqual(inst.availableTime[1].availableStartTime?.description, "09:30:00")
        XCTAssertEqual(inst.availableTime[1].daysOfWeek[0].value, "sat")
        XCTAssertEqual(inst.availableTime[1].daysOfWeek[1].value, "fri")
        XCTAssertEqual(inst.characteristic[0].coding[0].display, "Wheelchair access")
        XCTAssertEqual(inst.comment, "Providing Specialist psychology services to the greater Den Burg area, many years of experience dealing with PTSD issues")
        XCTAssertEqual(inst.contained[0].id, "DenBurg")
        XCTAssertEqual(inst.coverageArea[0].display, "Greater Denburg area")
        XCTAssertEqual(inst.coverageArea[0].reference, "#DenBurg")
        XCTAssertEqual(inst.eligibility?.coding[0].display, "DVA Required")
        XCTAssertEqual(inst.eligibilityNote, "Evidence of application for DVA status may be sufficient for commencing assessment")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.location?.reference, "Location/1")
        XCTAssertEqual(inst.notAvailable[0].description_fhir, "Christmas/Boxing Day")
        XCTAssertEqual(inst.notAvailable[0].during?.end?.description, "2015-12-26")
        XCTAssertEqual(inst.notAvailable[0].during?.start?.description, "2015-12-25")
        XCTAssertEqual(inst.notAvailable[1].description_fhir, "New Years Day")
        XCTAssertEqual(inst.notAvailable[1].during?.end?.description, "2016-01-01")
        XCTAssertEqual(inst.notAvailable[1].during?.start?.description, "2016-01-01")
        XCTAssertEqual(inst.programName[0].value, "PTSD outreach")
        XCTAssertEqual(inst.publicKey, "*** Base64 public key goes here to be used for secure messaging ***")
        XCTAssertEqual(inst.referralMethod[0].coding[0].code, "phone")
        XCTAssertEqual(inst.referralMethod[0].coding[0].display, "Phone")
        XCTAssertEqual(inst.referralMethod[1].coding[0].code, "fax")
        XCTAssertEqual(inst.referralMethod[1].coding[0].display, "Fax")
        XCTAssertEqual(inst.referralMethod[2].coding[0].code, "elec")
        XCTAssertEqual(inst.referralMethod[2].coding[0].display, "Secure Messaging")
        XCTAssertEqual(inst.referralMethod[3].coding[0].code, "semail")
        XCTAssertEqual(inst.referralMethod[3].coding[0].display, "Secure Email")
        XCTAssertEqual(inst.serviceName, "Consulting psychologists and/or psychology services")
        XCTAssertEqual(inst.serviceType[0].type?.coding[0].code, "394913002")
        XCTAssertEqual(inst.serviceType[0].type?.coding[0].display, "Psychotherapy")
        XCTAssertEqual(inst.serviceType[0].type?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.serviceType[1].specialty[0].coding[0].code, "47505003")
        XCTAssertEqual(inst.serviceType[1].specialty[0].coding[0].display, "Posttraumatic stress disorder")
        XCTAssertEqual(inst.serviceType[1].specialty[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.serviceType[1].type?.coding[0].code, "394587001")
        XCTAssertEqual(inst.serviceType[1].type?.coding[0].display, "Psychiatry")
        XCTAssertEqual(inst.serviceType[1].type?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].use, "work")
        XCTAssertEqual(inst.telecom[0].value, "(555) silent")
        XCTAssertEqual(inst.telecom[1].system, "email")
        XCTAssertEqual(inst.telecom[1].use, "work")
        XCTAssertEqual(inst.telecom[1].value, "directaddress@example.com")
        XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t25 Dec 2013 9:15am - 9:30am: <b>Busy</b> Physiotherapy\n\t\t</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}