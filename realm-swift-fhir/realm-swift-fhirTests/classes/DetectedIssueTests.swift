//
//  DetectedIssueTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DetectedIssueTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DetectedIssue {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DetectedIssue {
		let instance = RealmSwiftFHIR.DetectedIssue(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDetectedIssue1() {		
		var instance: RealmSwiftFHIR.DetectedIssue?
		do {
			instance = try runDetectedIssue1()
			try runDetectedIssue1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DetectedIssue
			XCTAssertNotNil(copy)
			try runDetectedIssue1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDetectedIssue1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw")
		}

		testDetectedIssueRealm1(instance: instance!)
	}

    func testDetectedIssue1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DetectedIssue = try runDetectedIssue1()
            let copy = (instance.copy() as! RealmSwiftFHIR.DetectedIssue)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue's PKs, but threw: \(error)")
        }
    }

	func testDetectedIssueRealm1(instance: RealmSwiftFHIR.DetectedIssue) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDetectedIssue1(realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
	}
	
	@discardableResult
	func runDetectedIssue1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DetectedIssue {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "detectedissue-example-allergy.json")
		
		XCTAssertEqual(inst.id, "allergy")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDetectedIssue2() {		
		var instance: RealmSwiftFHIR.DetectedIssue?
		do {
			instance = try runDetectedIssue2()
			try runDetectedIssue2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DetectedIssue
			XCTAssertNotNil(copy)
			try runDetectedIssue2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDetectedIssue2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw")
		}

		testDetectedIssueRealm2(instance: instance!)
	}

    func testDetectedIssue2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DetectedIssue = try runDetectedIssue2()
            let copy = (instance.copy() as! RealmSwiftFHIR.DetectedIssue)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue's PKs, but threw: \(error)")
        }
    }

	func testDetectedIssueRealm2(instance: RealmSwiftFHIR.DetectedIssue) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDetectedIssue2(realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
	}
	
	@discardableResult
	func runDetectedIssue2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DetectedIssue {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "detectedissue-example-dup.json")
		
		XCTAssertEqual(inst.author?.reference, "Device/dsp")
		XCTAssertEqual(inst.category?.coding[0].code, "DUPTHPY")
		XCTAssertEqual(inst.category?.coding[0].display, "Duplicate Therapy Alert")
		XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.date?.description, "2013-05-08")
		XCTAssertEqual(inst.detail, "Similar test was performed within the past 14 days")
		XCTAssertEqual(inst.id, "duplicate")
		XCTAssertEqual(inst.implicated[0].display, "Chest CT - ordered May 8, 2013 by Dr. Adam Careful")
		XCTAssertEqual(inst.implicated[0].reference, "DiagnosticOrder/di")
		XCTAssertEqual(inst.implicated[1].display, "Image 1 from Series 3: CT Images on Patient MINT (MINT1234) taken at 1-Jan 2011 01:20 AM")
		XCTAssertEqual(inst.implicated[1].reference, "ImagingStudy/example")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDetectedIssue3() {		
		var instance: RealmSwiftFHIR.DetectedIssue?
		do {
			instance = try runDetectedIssue3()
			try runDetectedIssue3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DetectedIssue
			XCTAssertNotNil(copy)
			try runDetectedIssue3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDetectedIssue3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw")
		}

		testDetectedIssueRealm3(instance: instance!)
	}

    func testDetectedIssue3RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DetectedIssue = try runDetectedIssue3()
            let copy = (instance.copy() as! RealmSwiftFHIR.DetectedIssue)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue's PKs, but threw: \(error)")
        }
    }

	func testDetectedIssueRealm3(instance: RealmSwiftFHIR.DetectedIssue) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDetectedIssue3(realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
	}
	
	@discardableResult
	func runDetectedIssue3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DetectedIssue {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "detectedissue-example-lab.json")
		
		XCTAssertEqual(inst.id, "lab")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDetectedIssue4() {		
		var instance: RealmSwiftFHIR.DetectedIssue?
		do {
			instance = try runDetectedIssue4()
			try runDetectedIssue4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DetectedIssue
			XCTAssertNotNil(copy)
			try runDetectedIssue4(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDetectedIssue4(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DetectedIssue successfully, but threw")
		}

		testDetectedIssueRealm4(instance: instance!)
	}

    func testDetectedIssue4RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DetectedIssue = try runDetectedIssue4()
            let copy = (instance.copy() as! RealmSwiftFHIR.DetectedIssue)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DetectedIssue's PKs, but threw: \(error)")
        }
    }

	func testDetectedIssueRealm4(instance: RealmSwiftFHIR.DetectedIssue) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDetectedIssue4(realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DetectedIssue.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DetectedIssue()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DetectedIssue.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDetectedIssue4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DetectedIssue.self).count)
	}
	
	@discardableResult
	func runDetectedIssue4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DetectedIssue {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "detectedissue-example.json")
		
		XCTAssertEqual(inst.author?.reference, "Device/dsp")
		XCTAssertEqual(inst.category?.coding[0].code, "DRG")
		XCTAssertEqual(inst.category?.coding[0].display, "Drug Interaction Alert")
		XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.date?.description, "2014-01-05")
		XCTAssertEqual(inst.id, "ddi")
		XCTAssertEqual(inst.implicated[0].display, "500 mg Acetaminophen tablet 1/day, PRN since 2010")
		XCTAssertEqual(inst.implicated[0].reference, "MedicationStatement/tylenol")
		XCTAssertEqual(inst.implicated[1].display, "Warfarin 1 MG TAB prescribed Jan. 5, 2014")
		XCTAssertEqual(inst.implicated[1].reference, "MedicationOrder/warfarin")
		XCTAssertEqual(inst.mitigation[0].action?.coding[0].code, "13")
		XCTAssertEqual(inst.mitigation[0].action?.coding[0].display, "Stopped Concurrent Therapy")
		XCTAssertEqual(inst.mitigation[0].action?.coding[0].system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.mitigation[0].action?.text, "Asked patient to discontinue regular use of Tylenol and to consult with clinician if they need to resume to allow appropriate INR monitoring")
		XCTAssertEqual(inst.mitigation[0].author?.display, "Dr. Adam Careful")
		XCTAssertEqual(inst.mitigation[0].author?.reference, "Practitioner/example")
		XCTAssertEqual(inst.mitigation[0].date?.description, "2014-01-05")
		XCTAssertEqual(inst.severity, "high")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
