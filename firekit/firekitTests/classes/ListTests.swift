//
//  ListTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ListTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.List {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.List {
		let instance = FireKit.List(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testList1() {		
		var instance: FireKit.List?
		do {
			instance = try runList1()
			try runList1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm1(instance!)
	}

    func testList1RealmPK() {        
        do {
            let instance: FireKit.List = try runList1()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm1(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList1(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList1(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example-allergies.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "52472-8")
		XCTAssertEqual(inst.code?.coding[0].display, "Allergies and Adverse Drug Reactions")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.code?.text, "Current Allergy List")
		XCTAssertEqual(inst.date?.description, "2015-07-14T23:10:23+11:00")
		XCTAssertEqual(inst.entry[0].item?.reference, "AllergyIntolerance/example")
		XCTAssertEqual(inst.entry[1].item?.reference, "AllergyIntolerance/medication")
		XCTAssertEqual(inst.id, "current-allergies")
		XCTAssertEqual(inst.mode, "working")
		XCTAssertEqual(inst.orderedBy?.coding[0].code, "entry-date")
		XCTAssertEqual(inst.orderedBy?.coding[0].system, "http://hl7.org/fhir/list-order")
		XCTAssertEqual(inst.source?.reference, "Patient/example")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.title, "Current Allergy List")
		
		return inst
	}
	
	func testList2() {		
		var instance: FireKit.List?
		do {
			instance = try runList2()
			try runList2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm2(instance!)
	}

    func testList2RealmPK() {        
        do {
            let instance: FireKit.List = try runList2()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm2(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList2(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList2(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example-empty.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "182836005")
		XCTAssertEqual(inst.code?.coding[0].display, "Review of medication")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.code?.text, "Medication Review")
		XCTAssertEqual(inst.date?.description, "2012-11-26T07:30:23+11:00")
		XCTAssertEqual(inst.emptyReason?.coding[0].code, "nilknown")
		XCTAssertEqual(inst.emptyReason?.coding[0].display, "Nil Known")
		XCTAssertEqual(inst.emptyReason?.coding[0].system, "http://hl7.org/fhir/list-empty-reason")
		XCTAssertEqual(inst.emptyReason?.text, "The patient is not on any medications")
		XCTAssertEqual(inst.id, "example-empty")
		XCTAssertEqual(inst.mode, "snapshot")
		XCTAssertEqual(inst.source?.reference, "Patient/example")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>The patient is not on any medications</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testList3() {		
		var instance: FireKit.List?
		do {
			instance = try runList3()
			try runList3(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm3(instance!)
	}

    func testList3RealmPK() {        
        do {
            let instance: FireKit.List = try runList3()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm3(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList3(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList3(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example-familyhistory-f201-roel.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "8670-2")
		XCTAssertEqual(inst.code?.coding[0].display, "History of family member diseases")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.contained[0].id, "fmh-1")
		XCTAssertEqual(inst.contained[1].id, "fmh-2")
		XCTAssertEqual(inst.entry[0].item?.reference, "#fmh-1")
		XCTAssertEqual(inst.entry[1].item?.reference, "#fmh-2")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.mode, "snapshot")
		XCTAssertEqual(inst.note, "Both parents, both brothers and both children (twin) are still alive.")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.subject?.display, "Roel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testList4() {		
		var instance: FireKit.List?
		do {
			instance = try runList4()
			try runList4(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList4(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList4(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm4(instance!)
	}

    func testList4RealmPK() {        
        do {
            let instance: FireKit.List = try runList4()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm4(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList4(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList4(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example-familyhistory-genetics-profile-annie.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "8670-2")
		XCTAssertEqual(inst.code?.coding[0].display, "History of family member diseases")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.contained[0].id, "image")
		XCTAssertEqual(inst.contained[1].id, "2")
		XCTAssertEqual(inst.contained[2].id, "3")
		XCTAssertEqual(inst.contained[3].id, "4")
		XCTAssertEqual(inst.contained[4].id, "5")
		XCTAssertEqual(inst.contained[5].id, "6")
		XCTAssertEqual(inst.contained[6].id, "7")
		XCTAssertEqual(inst.contained[7].id, "8")
		XCTAssertEqual(inst.contained[8].id, "9")
		XCTAssertEqual(inst.contained[9].id, "10")
		XCTAssertEqual(inst.entry[0].item?.reference, "#2")
		XCTAssertEqual(inst.entry[1].item?.reference, "#3")
		XCTAssertEqual(inst.entry[2].item?.reference, "#4")
		XCTAssertEqual(inst.entry[3].item?.reference, "#5")
		XCTAssertEqual(inst.entry[4].item?.reference, "#6")
		XCTAssertEqual(inst.entry[5].item?.reference, "#7")
		XCTAssertEqual(inst.entry[6].item?.reference, "#8")
		XCTAssertEqual(inst.entry[7].item?.reference, "#9")
		XCTAssertEqual(inst.entry[8].item?.reference, "#10")
		XCTAssertEqual(inst.entry[9].item?.reference, "#11")
		XCTAssertEqual(inst.id, "prognosis")
		XCTAssertEqual(inst.mode, "snapshot")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.subject?.display, "Annie Proband, female, born 1966")
		XCTAssertEqual(inst.subject?.reference, "Patient/proband")
		XCTAssertEqual(inst.text?.div, "<div>\n      <img alt=\"Family history diagram for Annie Proband\" src=\"#image\"/>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testList5() {		
		var instance: FireKit.List?
		do {
			instance = try runList5()
			try runList5(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList5(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList5(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm5(instance!)
	}

    func testList5RealmPK() {        
        do {
            let instance: FireKit.List = try runList5()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm5(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList5(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList5(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example-familyhistory-genetics-profile.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "8670-2")
		XCTAssertEqual(inst.code?.coding[0].display, "History of family member diseases")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.contained[0].id, "1")
		XCTAssertEqual(inst.contained[1].id, "2")
		XCTAssertEqual(inst.contained[2].id, "3")
		XCTAssertEqual(inst.contained[3].id, "4")
		XCTAssertEqual(inst.contained[4].id, "5")
		XCTAssertEqual(inst.contained[5].id, "6")
		XCTAssertEqual(inst.contained[6].id, "7")
		XCTAssertEqual(inst.contained[7].id, "8")
		XCTAssertEqual(inst.entry[0].item?.reference, "#1")
		XCTAssertEqual(inst.entry[1].item?.reference, "#2")
		XCTAssertEqual(inst.entry[2].item?.reference, "#3")
		XCTAssertEqual(inst.entry[3].item?.reference, "#4")
		XCTAssertEqual(inst.entry[4].item?.reference, "#5")
		XCTAssertEqual(inst.entry[5].item?.reference, "#6")
		XCTAssertEqual(inst.entry[6].item?.reference, "#7")
		XCTAssertEqual(inst.entry[7].item?.reference, "#8")
		XCTAssertEqual(inst.id, "genetic")
		XCTAssertEqual(inst.mode, "snapshot")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.subject?.display, "Peter Patient")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To do</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testList6() {		
		var instance: FireKit.List?
		do {
			instance = try runList6()
			try runList6(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList6(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList6(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm6(instance!)
	}

    func testList6RealmPK() {        
        do {
            let instance: FireKit.List = try runList6()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm6(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList6(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList6(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example-medlist.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "182836005")
		XCTAssertEqual(inst.code?.coding[0].display, "Review of medication")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.code?.text, "Medication Review")
		XCTAssertEqual(inst.date?.description, "2013-11-20T23:10:23+11:00")
		XCTAssertEqual(inst.entry[0].flag?.coding[0].code, "01")
		XCTAssertEqual(inst.entry[0].flag?.coding[0].display, "Prescribed")
		XCTAssertEqual(inst.entry[0].flag?.coding[0].system, "http://nehta.gov.au/codes/medications/changetype")
		XCTAssertEqual(inst.entry[0].item?.display, "hydroxocobalamin")
		XCTAssertTrue(inst.entry[1].deleted.value ?? false)
		XCTAssertEqual(inst.entry[1].flag?.coding[0].code, "02")
		XCTAssertEqual(inst.entry[1].flag?.coding[0].display, "Cancelled")
		XCTAssertEqual(inst.entry[1].flag?.coding[0].system, "http://nehta.gov.au/codes/medications/changetype")
		XCTAssertEqual(inst.entry[1].item?.display, "Morphine Sulfate")
		XCTAssertEqual(inst.id, "med-list")
		XCTAssertEqual(inst.mode, "changes")
		XCTAssertEqual(inst.source?.reference, "Patient/example")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>Add hydroxocobalamin</p>\n      <p>Cancel Morphine Sulphate</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testList7() {		
		var instance: FireKit.List?
		do {
			instance = try runList7()
			try runList7(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.List
			XCTAssertNotNil(copy)
			try runList7(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runList7(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test List successfully, but threw")
		}

		testListRealm7(instance!)
	}

    func testList7RealmPK() {        
        do {
            let instance: FireKit.List = try runList7()
            let copy = (instance.copy() as! FireKit.List)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test List's PKs, but threw: \(error)")
        }
    }

	func testListRealm7(_ instance: FireKit.List) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runList7(realm.objects(FireKit.List.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.List.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.List()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.List.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runList7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.List.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.List.self).count)
	}
	
	@discardableResult
	func runList7(_ json: FHIRJSON? = nil) throws -> FireKit.List {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("list-example.json")
		
		XCTAssertEqual(inst.date?.description, "2012-11-25T22:17:00+11:00")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
		XCTAssertTrue(inst.entry[0].deleted.value ?? false)
		XCTAssertEqual(inst.entry[0].flag?.text, "Deleted due to error")
		XCTAssertEqual(inst.entry[0].item?.reference, "Condition/example")
		XCTAssertEqual(inst.entry[1].date?.description, "2012-11-21")
		XCTAssertEqual(inst.entry[1].flag?.text, "Added")
		XCTAssertEqual(inst.entry[1].item?.reference, "Condition/example2")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "urn:uuid:a9fcea7c-fcdf-4d17-a5e0-f26dda030b59")
		XCTAssertEqual(inst.identifier[0].value, "23974652")
		XCTAssertEqual(inst.mode, "changes")
		XCTAssertEqual(inst.source?.reference, "Patient/example")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
