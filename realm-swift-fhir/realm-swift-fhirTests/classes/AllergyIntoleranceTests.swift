//
//  AllergyIntoleranceTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class AllergyIntoleranceTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.AllergyIntolerance {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.AllergyIntolerance {
		let instance = RealmSwiftFHIR.AllergyIntolerance(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testAllergyIntolerance1() {		
		var instance: RealmSwiftFHIR.AllergyIntolerance?
		do {
			instance = try runAllergyIntolerance1()
			try runAllergyIntolerance1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AllergyIntolerance
			XCTAssertNotNil(copy)
			try runAllergyIntolerance1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAllergyIntolerance1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AllergyIntolerance successfully, but threw")
		}

		testAllergyIntoleranceRealm1(instance: instance!)
	}

    func testAllergyIntolerance1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AllergyIntolerance = try runAllergyIntolerance1()
            let copy = (instance.copy() as! RealmSwiftFHIR.AllergyIntolerance)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AllergyIntolerance's PKs, but threw: \(error)")
        }
    }

	func testAllergyIntoleranceRealm1(instance: RealmSwiftFHIR.AllergyIntolerance) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAllergyIntolerance1(realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AllergyIntolerance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AllergyIntolerance.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAllergyIntolerance1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AllergyIntolerance.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAllergyIntolerance1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).count)
	}
	
	@discardableResult
	func runAllergyIntolerance1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AllergyIntolerance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "allergyintolerance-example.json")
		
		XCTAssertEqual(inst.category, "food")
		XCTAssertEqual(inst.criticality, "CRITH")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.com/ids/patients/risks")
		XCTAssertEqual(inst.identifier[0].value, "49476534")
		XCTAssertEqual(inst.lastOccurence?.description, "2012-06")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.reaction[0].description_fhir, "Challenge Protocol. Severe Reaction to 1/8 cashew. Epinephrine administered")
		XCTAssertEqual(inst.reaction[0].manifestation[0].coding[0].code, "39579001")
		XCTAssertEqual(inst.reaction[0].manifestation[0].coding[0].display, "Anaphylactic reaction")
		XCTAssertEqual(inst.reaction[0].manifestation[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.reaction[0].onset?.description, "2012-06-12")
		XCTAssertEqual(inst.reaction[0].severity, "severe")
		XCTAssertEqual(inst.reaction[0].substance?.coding[0].code, "C3214954")
		XCTAssertEqual(inst.reaction[0].substance?.coding[0].display, "cashew nut allergenic extract Injectable Product")
		XCTAssertEqual(inst.reaction[0].substance?.coding[0].system, "http://www.nlm.nih.gov/research/umls/rxnorm")
		XCTAssertEqual(inst.reaction[1].certainty, "likely")
		XCTAssertEqual(inst.reaction[1].manifestation[0].coding[0].code, "64305001")
		XCTAssertEqual(inst.reaction[1].manifestation[0].coding[0].display, "Urticaria")
		XCTAssertEqual(inst.reaction[1].manifestation[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.reaction[1].onset?.description, "2004")
		XCTAssertEqual(inst.reaction[1].severity, "moderate")
		XCTAssertEqual(inst.recordedDate?.description, "2014-10-09T14:58:00+11:00")
		XCTAssertEqual(inst.recorder?.reference, "Practitioner/example")
		XCTAssertEqual(inst.status, "confirmed")
		XCTAssertEqual(inst.substance?.coding[0].code, "227493005")
		XCTAssertEqual(inst.substance?.coding[0].display, "Cashew nuts")
		XCTAssertEqual(inst.substance?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "allergy")
		
		return inst
	}
}
