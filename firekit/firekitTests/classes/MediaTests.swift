//
//  MediaTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class MediaTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.Media {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.Media {
		let instance = FireKit.Media(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testMedia1() {		
		var instance: FireKit.Media?
		do {
			instance = try runMedia1()
			try runMedia1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Media
			XCTAssertNotNil(copy)
			try runMedia1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedia1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Media successfully, but threw")
		}

		testMediaRealm1(instance!)
	}

    func testMedia1RealmPK() {        
        do {
            let instance: FireKit.Media = try runMedia1()
            let copy = (instance.copy() as! FireKit.Media)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Media's PKs, but threw: \(error)")
        }
    }

	func testMediaRealm1(_ instance: FireKit.Media) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runMedia1(realm.objects(FireKit.Media.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Media.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Media()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMedia1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMedia1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Media.self).count)
	}
	
	@discardableResult
	func runMedia1(_ json: FHIRJSON? = nil) throws -> FireKit.Media {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("media-example-dicom.json")
		
		XCTAssertEqual(inst.content?.contentType, "application/dicom")
		XCTAssertEqual(inst.deviceName, "G.E. Medical Systems")
		XCTAssertEqual(inst.extension_fhir[0].url, "http://nema.org/fhir/extensions#0002-0010")
		XCTAssertEqual(inst.extension_fhir[0].valueUri, "urn:oid:1.2.840.10008.1.2.1")
		XCTAssertEqual(inst.height.value, 480)
		XCTAssertEqual(inst.id, "1.2.840.11361907579238403408700.3.0.14.19970327150033")
		XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[0].type?.text, "InstanceUID")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "urn:oid:1.2.840.11361907579238403408700.3.0.14.19970327150033")
		XCTAssertEqual(inst.identifier[1].system, "http://acme-imaging.com/accession/2012")
		XCTAssertEqual(inst.identifier[1].type?.text, "accessionNo")
		XCTAssertEqual(inst.identifier[1].value, "1234567")
		XCTAssertEqual(inst.identifier[2].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[2].type?.text, "studyId")
		XCTAssertEqual(inst.identifier[2].value, "urn:oid:1.2.840.113619.2.21.848.34082.0.538976288.3")
		XCTAssertEqual(inst.identifier[3].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[3].type?.text, "seriesId")
		XCTAssertEqual(inst.identifier[3].value, "urn:oid:1.2.840.113619.2.21.3408.700.0.757923840.3.0")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.subtype?.coding[0].code, "US")
		XCTAssertEqual(inst.subtype?.coding[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "photo")
		XCTAssertEqual(inst.view?.coding[0].code, "399067008")
		XCTAssertEqual(inst.view?.coding[0].display, "Lateral projection")
		XCTAssertEqual(inst.view?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.width.value, 640)
		
		return inst
	}
	
	func testMedia2() {		
		var instance: FireKit.Media?
		do {
			instance = try runMedia2()
			try runMedia2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Media
			XCTAssertNotNil(copy)
			try runMedia2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedia2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Media successfully, but threw")
		}

		testMediaRealm2(instance!)
	}

    func testMedia2RealmPK() {        
        do {
            let instance: FireKit.Media = try runMedia2()
            let copy = (instance.copy() as! FireKit.Media)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Media's PKs, but threw: \(error)")
        }
    }

	func testMediaRealm2(_ instance: FireKit.Media) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runMedia2(realm.objects(FireKit.Media.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Media.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Media()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMedia2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMedia2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Media.self).count)
	}
	
	@discardableResult
	func runMedia2(_ json: FHIRJSON? = nil) throws -> FireKit.Media {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("media-example-sound.json")
		
		XCTAssertEqual(inst.content?.contentType, "audio/mpeg")
		XCTAssertTrue(inst.content?.data! == Base64Binary(val: "dG9vIGJpZyB0b28gaW5jbHVkZSB0aGUgd2hvbGU="))
		XCTAssertEqual(inst.content?.id, "a1")
		XCTAssertEqual(inst.duration.value, 65)
		XCTAssertEqual(inst.id, "sound")
		XCTAssertEqual(inst.operator_fhir?.reference, "Practitioner/xcda-author")
		XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
		XCTAssertEqual(inst.text?.div, "<div>Sound recording of speech example for Patient Henry Levin (MRN 12345):<br/><img alt=\"diagram\" src=\"#11\"/></div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "video")
		
		return inst
	}
	
	func testMedia3() {		
		var instance: FireKit.Media?
		do {
			instance = try runMedia3()
			try runMedia3(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.Media
			XCTAssertNotNil(copy)
			try runMedia3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedia3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Media successfully, but threw")
		}

		testMediaRealm3(instance!)
	}

    func testMedia3RealmPK() {        
        do {
            let instance: FireKit.Media = try runMedia3()
            let copy = (instance.copy() as! FireKit.Media)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Media's PKs, but threw: \(error)")
        }
    }

	func testMediaRealm3(_ instance: FireKit.Media) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runMedia3(realm.objects(FireKit.Media.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Media.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Media()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMedia3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Media.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMedia3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Media.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Media.self).count)
	}
	
	@discardableResult
	func runMedia3(_ json: FHIRJSON? = nil) throws -> FireKit.Media {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("media-example.json")
		
		XCTAssertEqual(inst.content?.contentType, "image/gif")
		XCTAssertEqual(inst.content?.creation?.description, "2009-09-03")
		XCTAssertEqual(inst.content?.id, "a1")
		XCTAssertEqual(inst.deviceName, "Acme Camera")
		XCTAssertEqual(inst.frames.value, 1)
		XCTAssertEqual(inst.height.value, 145)
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.operator_fhir?.reference, "Practitioner/xcda-author")
		XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
		XCTAssertEqual(inst.subtype?.coding[0].code, "diagram")
		XCTAssertEqual(inst.subtype?.coding[0].system, "http://hl7.org/fhir/media-method")
		XCTAssertEqual(inst.text?.div, "<div>Diagram for Patient Henry Levin (MRN 12345):<br/><img alt=\"diagram\" src=\"#11\"/></div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "photo")
		XCTAssertEqual(inst.width.value, 126)
		
		return inst
	}
}
