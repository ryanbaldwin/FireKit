//
//  GoalTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class GoalTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Goal {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Goal {
		let instance = RealmSwiftFHIR.Goal(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testGoal1() {		
		var instance: RealmSwiftFHIR.Goal?
		do {
			instance = try runGoal1()
			try runGoal1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Goal successfully, but threw")
		}

		testGoalRealm1(instance: instance!)
	}

	func testGoalRealm1(instance: RealmSwiftFHIR.Goal) {
		try! realm.write {
                realm.add(instance)
            }
        try! runGoal1(realm.objects(RealmSwiftFHIR.Goal.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Goal.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Goal.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runGoal1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Goal {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "goal-example.json")
		
		XCTAssertEqual(inst.addresses[0].display, "obesity")
		XCTAssertEqual(inst.addresses[0].reference, "Condition/12345")
		XCTAssertEqual(inst.description_fhir, "Target weight is 160 to 180 lbs.")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].url, "measure")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueCodeableConcept?.coding[0].code, "3141-9")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueCodeableConcept?.coding[0].display, "Weight Measured")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[0].valueCodeableConcept?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].url, "detail")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.code, "[lb_av]")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.unit, "lbs")
		XCTAssertTrue(inst.extension_fhir[0].extension_fhir[1].valueRange?.high?.value! == RealmDecimal(string: "180"))
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.code, "[lb_av]")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.unit, "lbs")
		XCTAssertTrue(inst.extension_fhir[0].extension_fhir[1].valueRange?.low?.value! == RealmDecimal(string: "160"))
		XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/goal-target")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.status, "in-progress")
		XCTAssertEqual(inst.subject?.display, "Peter James Chalmers")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p> A simple care goal for a patient to lose weight due to obesity.</p>\n\t\t</div>")
		XCTAssertEqual(inst.text?.status, "additional")
		
		return inst
	}
}
