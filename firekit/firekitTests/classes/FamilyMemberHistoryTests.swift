//
//  FamilyMemberHistoryTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-04-03.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class FamilyMemberHistoryTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> FireKit.FamilyMemberHistory {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> FireKit.FamilyMemberHistory {
		let instance = FireKit.FamilyMemberHistory(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testFamilyMemberHistory1() {		
		var instance: FireKit.FamilyMemberHistory?
		do {
			instance = try runFamilyMemberHistory1()
			try runFamilyMemberHistory1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.FamilyMemberHistory
			XCTAssertNotNil(copy)
			try runFamilyMemberHistory1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runFamilyMemberHistory1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory successfully, but threw")
		}

		testFamilyMemberHistoryRealm1(instance: instance!)
	}

    func testFamilyMemberHistory1RealmPK() {        
        do {
            let instance: FireKit.FamilyMemberHistory = try runFamilyMemberHistory1()
            let copy = (instance.copy() as! FireKit.FamilyMemberHistory)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory's PKs, but threw: \(error)")
        }
    }

	func testFamilyMemberHistoryRealm1(instance: FireKit.FamilyMemberHistory) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runFamilyMemberHistory1(realm.objects(FireKit.FamilyMemberHistory.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.FamilyMemberHistory.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.FamilyMemberHistory()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.FamilyMemberHistory.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFamilyMemberHistory1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.FamilyMemberHistory.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFamilyMemberHistory1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.FamilyMemberHistory.self).count)
	}
	
	@discardableResult
	func runFamilyMemberHistory1(_ json: FHIRJSON? = nil) throws -> FireKit.FamilyMemberHistory {
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
		var instance: FireKit.FamilyMemberHistory?
		do {
			instance = try runFamilyMemberHistory2()
			try runFamilyMemberHistory2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.FamilyMemberHistory
			XCTAssertNotNil(copy)
			try runFamilyMemberHistory2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runFamilyMemberHistory2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory successfully, but threw")
		}

		testFamilyMemberHistoryRealm2(instance: instance!)
	}

    func testFamilyMemberHistory2RealmPK() {        
        do {
            let instance: FireKit.FamilyMemberHistory = try runFamilyMemberHistory2()
            let copy = (instance.copy() as! FireKit.FamilyMemberHistory)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test FamilyMemberHistory's PKs, but threw: \(error)")
        }
    }

	func testFamilyMemberHistoryRealm2(instance: FireKit.FamilyMemberHistory) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runFamilyMemberHistory2(realm.objects(FireKit.FamilyMemberHistory.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.FamilyMemberHistory.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.FamilyMemberHistory()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.FamilyMemberHistory.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFamilyMemberHistory2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.FamilyMemberHistory.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runFamilyMemberHistory2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.FamilyMemberHistory.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.FamilyMemberHistory.self).count)
	}
	
	@discardableResult
	func runFamilyMemberHistory2(_ json: FHIRJSON? = nil) throws -> FireKit.FamilyMemberHistory {
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
