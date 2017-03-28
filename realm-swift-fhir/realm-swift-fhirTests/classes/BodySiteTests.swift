//
//  BodySiteTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-03-28.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class BodySiteTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.BodySite {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.BodySite {
		let instance = RealmSwiftFHIR.BodySite(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testBodySite1() {		
		var instance: RealmSwiftFHIR.BodySite?
		do {
			instance = try runBodySite1()
			try runBodySite1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.BodySite
			XCTAssertNotNil(copy)
			try runBodySite1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runBodySite1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test BodySite successfully, but threw")
		}

		testBodySiteRealm1(instance: instance!)
	}

    func testBodySite1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.BodySite = try runBodySite1()
            let copy = (instance.copy() as! RealmSwiftFHIR.BodySite)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test BodySite's PKs, but threw: \(error)")
        }
    }

	func testBodySiteRealm1(instance: RealmSwiftFHIR.BodySite) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runBodySite1(realm.objects(RealmSwiftFHIR.BodySite.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.BodySite.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.BodySite.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.BodySite()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.BodySite.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBodySite1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.BodySite.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runBodySite1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.BodySite.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.BodySite.self).count)
	}
	
	@discardableResult
	func runBodySite1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.BodySite {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "bodysite-example.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "53120007")
		XCTAssertEqual(inst.code?.coding[0].display, "Arm")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.code?.text, "Arm")
		XCTAssertEqual(inst.description_fhir, "front of upper left arm directly below the tattoo")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://www.acmehosp.com/bodysites")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "12345")
		XCTAssertEqual(inst.image[0].contentType, "image/png;base64")
		XCTAssertEqual(inst.image[0].title, "ARM")
		XCTAssertEqual(inst.modifier[0].coding[0].code, "419161000")
		XCTAssertEqual(inst.modifier[0].coding[0].display, "Unilateral left")
		XCTAssertEqual(inst.modifier[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifier[0].text, "Left")
		XCTAssertEqual(inst.modifier[1].coding[0].code, "261183002")
		XCTAssertEqual(inst.modifier[1].coding[0].display, "Upper")
		XCTAssertEqual(inst.modifier[1].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifier[1].text, "Upper")
		XCTAssertEqual(inst.modifier[2].coding[0].code, "255549009")
		XCTAssertEqual(inst.modifier[2].coding[0].display, "Anterior")
		XCTAssertEqual(inst.modifier[2].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.modifier[2].text, "Anterior")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
