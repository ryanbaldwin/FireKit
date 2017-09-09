//
//  GoalTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class GoalTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.Goal {
		return try instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) throws -> FireKit.Goal {
      let data = NSKeyedArchiver.archivedData(withRootObject: json)
		  let instance = try JSONDecoder().decode(FireKit.Goal.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testGoal1() {		
		var instance: FireKit.Goal?
		do {
			instance = try runGoal1()
			try runGoal1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Goal
			XCTAssertNotNil(copy)
			try runGoal1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runGoal1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Goal successfully, but threw")
		}

		testGoalRealm1(instance!)
	}

    func testGoal1RealmPK() {        
        do {
            let instance: FireKit.Goal = try runGoal1()
            let copy = (instance.copy() as! FireKit.Goal)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Goal's PKs, but threw: \(error)")
        }
    }

	func testGoalRealm1(_ instance: FireKit.Goal) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runGoal1(realm.objects(FireKit.Goal.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Goal.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Goal.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Goal()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Goal.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runGoal1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Goal.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runGoal1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Goal.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Goal.self).count)
	}
	
	@discardableResult
	func runGoal1(_ data: Data? = nil) throws -> FireKit.Goal {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("goal-example.json")
		
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
