//
//  AppointmentResponseTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class AppointmentResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.AppointmentResponse {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.AppointmentResponse {
		let instance = RealmSwiftFHIR.AppointmentResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testAppointmentResponse1() {		
		var instance: RealmSwiftFHIR.AppointmentResponse?
		do {
			instance = try runAppointmentResponse1()
			try runAppointmentResponse1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AppointmentResponse successfully, but threw")
		}

		testAppointmentResponseRealm1(instance: instance!)
	}

	func testAppointmentResponseRealm1(instance: RealmSwiftFHIR.AppointmentResponse) {
		try! realm.write {
                realm.add(instance)
            }
        try! runAppointmentResponse1(realm.objects(RealmSwiftFHIR.AppointmentResponse.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AppointmentResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AppointmentResponse.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runAppointmentResponse1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AppointmentResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "appointmentresponse-example-req.json")
		
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
		var instance: RealmSwiftFHIR.AppointmentResponse?
		do {
			instance = try runAppointmentResponse2()
			try runAppointmentResponse2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AppointmentResponse successfully, but threw")
		}

		testAppointmentResponseRealm2(instance: instance!)
	}

	func testAppointmentResponseRealm2(instance: RealmSwiftFHIR.AppointmentResponse) {
		try! realm.write {
                realm.add(instance)
            }
        try! runAppointmentResponse2(realm.objects(RealmSwiftFHIR.AppointmentResponse.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AppointmentResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AppointmentResponse.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runAppointmentResponse2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AppointmentResponse {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "appointmentresponse-example.json")
		
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
