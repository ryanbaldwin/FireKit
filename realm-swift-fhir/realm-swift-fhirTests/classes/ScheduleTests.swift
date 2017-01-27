//
//  ScheduleTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ScheduleTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Schedule {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Schedule {
		let instance = RealmSwiftFHIR.Schedule(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSchedule1() {		
		var instance: RealmSwiftFHIR.Schedule?
		do {
			instance = try runSchedule1()
			try runSchedule1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Schedule successfully, but threw")
		}

		testScheduleRealm1(instance: instance!)
	}

	func testScheduleRealm1(instance: RealmSwiftFHIR.Schedule) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSchedule1(realm.objects(RealmSwiftFHIR.Schedule.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Schedule.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Schedule.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSchedule1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Schedule {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "schedule-example.json")
		
		XCTAssertEqual(inst.actor?.display, "Burgers UMC, South Wing, second floor")
		XCTAssertEqual(inst.actor?.reference, "Location/1")
		XCTAssertEqual(inst.comment, "Assessments should be performed before requesting appointments in this slot.")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://example.org/scheduleid")
		XCTAssertEqual(inst.identifier[0].use, "usual")
		XCTAssertEqual(inst.identifier[0].value, "45")
		XCTAssertEqual(inst.planningHorizon?.end?.description, "2013-12-25T09:30:00Z")
		XCTAssertEqual(inst.planningHorizon?.start?.description, "2013-12-25T09:15:00Z")
		XCTAssertEqual(inst.text?.div, "<div>\n      Burgers UMC, South Wing, second floor Physiotherapy Schedule\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type[0].coding[0].code, "45")
		XCTAssertEqual(inst.type[0].coding[0].display, "Physiotherapy")
		
		return inst
	}
}
