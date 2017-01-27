//
//  AllergyIntoleranceTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
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
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AllergyIntolerance successfully, but threw")
		}

		testAllergyIntoleranceRealm1(instance: instance!)
	}

	func testAllergyIntoleranceRealm1(instance: RealmSwiftFHIR.AllergyIntolerance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runAllergyIntolerance1(realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AllergyIntolerance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
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
