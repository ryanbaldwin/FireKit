//
//  FamilyMemberHistoryTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class FamilyMemberHistoryTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.FamilyMemberHistory {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.FamilyMemberHistory {
		let instance = RealmSwiftFHIR.FamilyMemberHistory(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testFamilyMemberHistory1() {		
		var instance: RealmSwiftFHIR.FamilyMemberHistory?
		do {
			instance = try runFamilyMemberHistory1()
			try runFamilyMemberHistory1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory successfully, but threw")
		}

		testFamilyMemberHistoryRealm1(instance: instance!)
	}

	func testFamilyMemberHistoryRealm1(instance: RealmSwiftFHIR.FamilyMemberHistory) {
		try! realm.write {
                realm.add(instance)
            }
        try! runFamilyMemberHistory1(realm.objects(RealmSwiftFHIR.FamilyMemberHistory.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.FamilyMemberHistory.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.FamilyMemberHistory.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runFamilyMemberHistory1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.FamilyMemberHistory {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "familymemberhistory-example-mother.json")
		
		XCTAssertEqual(inst.condition[0].code?.coding[0].code, "371041009")
		XCTAssertEqual(inst.condition[0].code?.coding[0].display, "Embolic Stroke")
		XCTAssertEqual(inst.condition[0].code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.condition[0].code?.text, "Stroke")
		XCTAssertEqual(inst.condition[0].onsetQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.condition[0].onsetQuantity?.unit, "a")
		XCTAssertTrue(inst.condition[0].onsetQuantity?.value! == RealmDecimal(string: "56"))
		XCTAssertEqual(inst.id, "mother")
		XCTAssertEqual(inst.patient?.display, "Peter Patient")
		XCTAssertEqual(inst.patient?.reference, "Patient/100")
		XCTAssertEqual(inst.relationship?.coding[0].code, "mother")
		XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/familial-relationship")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.text?.div, "<div>Mother died of a stroke aged 56</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testFamilyMemberHistory2() {		
		var instance: RealmSwiftFHIR.FamilyMemberHistory?
		do {
			instance = try runFamilyMemberHistory2()
			try runFamilyMemberHistory2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory successfully, but threw")
		}

		testFamilyMemberHistoryRealm2(instance: instance!)
	}

	func testFamilyMemberHistoryRealm2(instance: RealmSwiftFHIR.FamilyMemberHistory) {
		try! realm.write {
                realm.add(instance)
            }
        try! runFamilyMemberHistory2(realm.objects(RealmSwiftFHIR.FamilyMemberHistory.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.FamilyMemberHistory.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.FamilyMemberHistory.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runFamilyMemberHistory2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.FamilyMemberHistory {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "familymemberhistory-example.json")
		
		XCTAssertEqual(inst.condition[0].code?.coding[0].code, "315619001")
		XCTAssertEqual(inst.condition[0].code?.coding[0].display, "Myocardial Infarction")
		XCTAssertEqual(inst.condition[0].code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.condition[0].code?.text, "Heart Attack")
		XCTAssertEqual(inst.condition[0].note?.text, "Was fishing at the time. At least he went doing someting he loved.")
		XCTAssertEqual(inst.condition[0].onsetQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.condition[0].onsetQuantity?.unit, "a")
		XCTAssertTrue(inst.condition[0].onsetQuantity?.value! == RealmDecimal(string: "74"))
		XCTAssertEqual(inst.date?.description, "2011-03-18")
		XCTAssertEqual(inst.id, "father")
		XCTAssertEqual(inst.patient?.display, "Peter Patient")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.relationship?.coding[0].code, "father")
		XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/familial-relationship")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.text?.div, "<div>Father died of a heart attack aged 74</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
