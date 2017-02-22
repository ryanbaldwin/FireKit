//
//  AuditEventTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class AuditEventTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.AuditEvent {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.AuditEvent {
		let instance = RealmSwiftFHIR.AuditEvent(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testAuditEvent1() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent1()
			try runAuditEvent1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm1(instance: instance!)
	}

    func testAuditEvent1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent1()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm1(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent1(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "audit-event-example-login.json")
		
		XCTAssertEqual(inst.event?.action, "E")
		XCTAssertEqual(inst.event?.dateTime?.description, "2013-06-20T23:41:23Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "110122")
		XCTAssertEqual(inst.event?.subtype[0].display, "Login")
		XCTAssertEqual(inst.event?.subtype[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.event?.type?.code, "110114")
		XCTAssertEqual(inst.event?.type?.display, "User Authentication")
		XCTAssertEqual(inst.event?.type?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.id, "example-login")
		XCTAssertEqual(inst.participant[0].altId, "601847123")
		XCTAssertEqual(inst.participant[0].name, "Grahame Grieve")
		XCTAssertEqual(inst.participant[0].network?.address, "127.0.0.1")
		XCTAssertEqual(inst.participant[0].network?.type, "2")
		XCTAssertTrue(inst.participant[0].requestor.value ?? false)
		XCTAssertEqual(inst.participant[0].userId?.value, "95")
		XCTAssertEqual(inst.source?.identifier?.value, "hl7connect.healthintersections.com.au")
		XCTAssertEqual(inst.source?.site, "Cloud")
		XCTAssertEqual(inst.source?.type[0].code, "3")
		XCTAssertEqual(inst.source?.type[0].display, "Web Server")
		XCTAssertEqual(inst.source?.type[0].system, "http://hl7.org/fhir/security-source-type")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent2() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent2()
			try runAuditEvent2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm2(instance: instance!)
	}

    func testAuditEvent2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent2()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm2(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent2(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "audit-event-example-logout.json")
		
		XCTAssertEqual(inst.event?.action, "E")
		XCTAssertEqual(inst.event?.dateTime?.description, "2013-06-20T23:46:41Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "110123")
		XCTAssertEqual(inst.event?.subtype[0].display, "Logout")
		XCTAssertEqual(inst.event?.subtype[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.event?.type?.code, "110114")
		XCTAssertEqual(inst.event?.type?.display, "User Authentication")
		XCTAssertEqual(inst.event?.type?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.id, "example-logout")
		XCTAssertEqual(inst.participant[0].altId, "601847123")
		XCTAssertEqual(inst.participant[0].name, "Grahame Grieve")
		XCTAssertEqual(inst.participant[0].network?.address, "127.0.0.1")
		XCTAssertEqual(inst.participant[0].network?.type, "2")
		XCTAssertTrue(inst.participant[0].requestor.value ?? false)
		XCTAssertEqual(inst.participant[0].userId?.value, "95")
		XCTAssertEqual(inst.source?.identifier?.value, "hl7connect.healthintersections.com.au")
		XCTAssertEqual(inst.source?.site, "Cloud")
		XCTAssertEqual(inst.source?.type[0].code, "3")
		XCTAssertEqual(inst.source?.type[0].display, "Web Server")
		XCTAssertEqual(inst.source?.type[0].system, "http://hl7.org/fhir/security-source-type")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent3() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent3()
			try runAuditEvent3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm3(instance: instance!)
	}

    func testAuditEvent3RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent3()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm3(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent3(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "audit-event-example-media.json")
		
		XCTAssertEqual(inst.event?.action, "R")
		XCTAssertEqual(inst.event?.dateTime?.description, "2015-08-27T23:42:24Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "ITI-32")
		XCTAssertEqual(inst.event?.subtype[0].display, "Distribute Document Set on Media")
		XCTAssertEqual(inst.event?.subtype[0].system, "urn:oid:1.3.6.1.4.1.19376.1.2")
		XCTAssertEqual(inst.event?.type?.code, "110106")
		XCTAssertEqual(inst.event?.type?.display, "Export")
		XCTAssertEqual(inst.event?.type?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.id, "example-media")
		XCTAssertEqual(inst.object[0].identifier?.value, "e3cdfc81a0d24bd^^^&2.16.840.1.113883.4.2&ISO")
		XCTAssertEqual(inst.object[0].role?.code, "1")
		XCTAssertEqual(inst.object[0].role?.display, "Patient")
		XCTAssertEqual(inst.object[0].role?.system, "http://hl7.org/fhir/object-role")
		XCTAssertEqual(inst.object[0].type?.code, "1")
		XCTAssertEqual(inst.object[0].type?.display, "Person")
		XCTAssertEqual(inst.object[0].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.object[1].identifier?.type?.coding[0].code, "IHE XDS Metadata")
		XCTAssertEqual(inst.object[1].identifier?.type?.coding[0].display, "submission set classificationNode")
		XCTAssertEqual(inst.object[1].identifier?.type?.coding[0].system, "urn:uuid:a54d6aa5-d40d-43f9-88c5-b4633d873bdd")
		XCTAssertEqual(inst.object[1].identifier?.value, "e3cdfc81a0d24bd^^^&2.16.840.1.113883.4.2&ISO")
		XCTAssertEqual(inst.object[1].role?.code, "20")
		XCTAssertEqual(inst.object[1].role?.display, "Job")
		XCTAssertEqual(inst.object[1].role?.system, "http://hl7.org/fhir/object-role")
		XCTAssertEqual(inst.object[1].type?.code, "2")
		XCTAssertEqual(inst.object[1].type?.display, "System Object")
		XCTAssertEqual(inst.object[1].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.object[2].reference?.reference, "DocumentManifest/example")
		XCTAssertEqual(inst.object[2].type?.code, "2")
		XCTAssertEqual(inst.object[2].type?.display, "System Object")
		XCTAssertEqual(inst.object[2].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertFalse(inst.participant[0].requestor.value ?? true)
		XCTAssertEqual(inst.participant[0].role[0].coding[0].code, "110153")
		XCTAssertEqual(inst.participant[0].role[0].coding[0].display, "Source Role ID")
		XCTAssertEqual(inst.participant[0].role[0].coding[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.participant[0].userId?.value, "ExportToMedia.app")
		XCTAssertEqual(inst.participant[1].altId, "601847123")
		XCTAssertEqual(inst.participant[1].name, "Grahame Grieve")
		XCTAssertTrue(inst.participant[1].requestor.value ?? false)
		XCTAssertEqual(inst.participant[1].userId?.value, "95")
		XCTAssertEqual(inst.participant[2].media?.code, "110033")
		XCTAssertEqual(inst.participant[2].media?.display, "DVD")
		XCTAssertEqual(inst.participant[2].media?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.participant[2].name, "Media title: Hello World")
		XCTAssertFalse(inst.participant[2].requestor.value ?? true)
		XCTAssertEqual(inst.source?.identifier?.value, "hl7connect.healthintersections.com.au")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent4() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent4()
			try runAuditEvent4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent4(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent4(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm4(instance: instance!)
	}

    func testAuditEvent4RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent4()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm4(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent4(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "audit-event-example-pixQuery.json")
		
		XCTAssertEqual(inst.event?.action, "E")
		XCTAssertEqual(inst.event?.dateTime?.description, "2015-08-26T23:42:24Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "ITI-9")
		XCTAssertEqual(inst.event?.subtype[0].display, "PIX Query")
		XCTAssertEqual(inst.event?.subtype[0].system, "urn:oid:1.3.6.1.4.1.19376.1.2")
		XCTAssertEqual(inst.event?.type?.code, "110112")
		XCTAssertEqual(inst.event?.type?.display, "Query")
		XCTAssertEqual(inst.event?.type?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.id, "example-pixQuery")
		XCTAssertEqual(inst.object[0].identifier?.value, "e3cdfc81a0d24bd^^^&2.16.840.1.113883.4.2&ISO")
		XCTAssertEqual(inst.object[0].role?.code, "1")
		XCTAssertEqual(inst.object[0].role?.display, "Patient")
		XCTAssertEqual(inst.object[0].role?.system, "http://hl7.org/fhir/object-role")
		XCTAssertEqual(inst.object[0].type?.code, "1")
		XCTAssertEqual(inst.object[0].type?.display, "Person")
		XCTAssertEqual(inst.object[0].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.object[1].detail[0].type, "MSH-10")
		XCTAssertTrue(inst.object[1].detail[0].value! == Base64Binary(val: "MS4yLjg0MC4xMTQzNTAuMS4xMy4wLjEuNy4xLjE="))
		XCTAssertEqual(inst.object[1].role?.code, "24")
		XCTAssertEqual(inst.object[1].role?.display, "Query")
		XCTAssertEqual(inst.object[1].role?.system, "http://hl7.org/fhir/object-role")
		XCTAssertEqual(inst.object[1].type?.code, "2")
		XCTAssertEqual(inst.object[1].type?.display, "System Object")
		XCTAssertEqual(inst.object[1].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.participant[0].altId, "6580")
		XCTAssertEqual(inst.participant[0].network?.address, "Workstation1.ehr.familyclinic.com")
		XCTAssertEqual(inst.participant[0].network?.type, "1")
		XCTAssertFalse(inst.participant[0].requestor.value ?? true)
		XCTAssertEqual(inst.participant[0].role[0].coding[0].code, "110153")
		XCTAssertEqual(inst.participant[0].role[0].coding[0].display, "Source Role ID")
		XCTAssertEqual(inst.participant[0].role[0].coding[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.participant[0].userId?.value, "2.16.840.1.113883.4.2|2.16.840.1.113883.4.2")
		XCTAssertEqual(inst.participant[1].altId, "601847123")
		XCTAssertEqual(inst.participant[1].name, "Grahame Grieve")
		XCTAssertTrue(inst.participant[1].requestor.value ?? false)
		XCTAssertEqual(inst.participant[1].userId?.value, "95")
		XCTAssertEqual(inst.source?.identifier?.value, "hl7connect.healthintersections.com.au")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent5() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent5()
			try runAuditEvent5(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent5(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent5(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm5(instance: instance!)
	}

    func testAuditEvent5RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent5()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm5(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent5(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "audit-event-example-search.json")
		
		XCTAssertEqual(inst.event?.action, "E")
		XCTAssertEqual(inst.event?.dateTime?.description, "2015-08-22T23:42:24Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "search")
		XCTAssertEqual(inst.event?.subtype[0].display, "search")
		XCTAssertEqual(inst.event?.subtype[0].system, "http://hl7.org/fhir/restful-interaction")
		XCTAssertEqual(inst.event?.type?.code, "rest")
		XCTAssertEqual(inst.event?.type?.display, "Restful Operation")
		XCTAssertEqual(inst.event?.type?.system, "http://hl7.org/fhir/audit-event-type")
		XCTAssertEqual(inst.id, "example-search")
		XCTAssertTrue(inst.object[0].query! == Base64Binary(val: "aHR0cDovL2ZoaXItZGV2LmhlYWx0aGludGVyc2VjdGlvbnMuY29tLmF1L29wZW4vRW5jb3VudGVyP3BhcnRpY2lwYW50PTEz"))
		XCTAssertEqual(inst.object[0].role?.code, "24")
		XCTAssertEqual(inst.object[0].role?.display, "Query")
		XCTAssertEqual(inst.object[0].role?.system, "http://hl7.org/fhir/object-role")
		XCTAssertEqual(inst.object[0].type?.code, "2")
		XCTAssertEqual(inst.object[0].type?.display, "System Object")
		XCTAssertEqual(inst.object[0].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.participant[0].altId, "601847123")
		XCTAssertEqual(inst.participant[0].name, "Grahame Grieve")
		XCTAssertTrue(inst.participant[0].requestor.value ?? false)
		XCTAssertEqual(inst.participant[0].userId?.value, "95")
		XCTAssertEqual(inst.source?.identifier?.value, "hl7connect.healthintersections.com.au")
		XCTAssertEqual(inst.source?.site, "Cloud")
		XCTAssertEqual(inst.source?.type[0].code, "3")
		XCTAssertEqual(inst.source?.type[0].display, "Web Server")
		XCTAssertEqual(inst.source?.type[0].system, "http://hl7.org/fhir/security-source-type")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent6() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent6()
			try runAuditEvent6(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent6(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent6(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm6(instance: instance!)
	}

    func testAuditEvent6RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent6()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm6(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent6(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "audit-event-example-vread.json")
		
		XCTAssertEqual(inst.event?.action, "R")
		XCTAssertEqual(inst.event?.dateTime?.description, "2013-06-20T23:42:24Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "vread")
		XCTAssertEqual(inst.event?.subtype[0].display, "vread")
		XCTAssertEqual(inst.event?.subtype[0].system, "http://hl7.org/fhir/restful-interaction")
		XCTAssertEqual(inst.event?.type?.code, "rest")
		XCTAssertEqual(inst.event?.type?.display, "Restful Operation")
		XCTAssertEqual(inst.event?.type?.system, "http://hl7.org/fhir/audit-event-type")
		XCTAssertEqual(inst.id, "example-rest")
		XCTAssertEqual(inst.object[0].lifecycle?.code, "6")
		XCTAssertEqual(inst.object[0].lifecycle?.display, "Access / Use")
		XCTAssertEqual(inst.object[0].lifecycle?.system, "http://hl7.org/fhir/object-lifecycle")
		XCTAssertEqual(inst.object[0].reference?.reference, "Patient/example/_history/1")
		XCTAssertEqual(inst.object[0].type?.code, "2")
		XCTAssertEqual(inst.object[0].type?.display, "System Object")
		XCTAssertEqual(inst.object[0].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.participant[0].altId, "601847123")
		XCTAssertEqual(inst.participant[0].name, "Grahame Grieve")
		XCTAssertTrue(inst.participant[0].requestor.value ?? false)
		XCTAssertEqual(inst.participant[0].userId?.value, "95")
		XCTAssertEqual(inst.source?.identifier?.value, "hl7connect.healthintersections.com.au")
		XCTAssertEqual(inst.source?.site, "Cloud")
		XCTAssertEqual(inst.source?.type[0].code, "3")
		XCTAssertEqual(inst.source?.type[0].display, "Web Server")
		XCTAssertEqual(inst.source?.type[0].system, "http://hl7.org/fhir/security-source-type")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent7() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent7()
			try runAuditEvent7(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent7(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent7(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm7(instance: instance!)
	}

    func testAuditEvent7RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent7()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm7(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent7(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent7(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "auditevent-example-disclosure.json")
		
		XCTAssertEqual(inst.event?.action, "R")
		XCTAssertEqual(inst.event?.dateTime?.description, "2013-09-22T00:08:00Z")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.outcomeDesc, "Successful  Disclosure")
		XCTAssertEqual(inst.event?.purposeOfEvent[0].code, "HMARKT")
		XCTAssertEqual(inst.event?.purposeOfEvent[0].display, "healthcare marketing")
		XCTAssertEqual(inst.event?.purposeOfEvent[0].system, "http://hl7.org/fhir/v3/ActReason")
		XCTAssertEqual(inst.event?.subtype[0].code, "Disclosure")
		XCTAssertEqual(inst.event?.subtype[0].display, "HIPAA disclosure")
		XCTAssertEqual(inst.event?.type?.code, "110106")
		XCTAssertEqual(inst.event?.type?.display, "Export")
		XCTAssertEqual(inst.event?.type?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.id, "example-disclosure")
		XCTAssertEqual(inst.object[0].reference?.reference, "Patient/example")
		XCTAssertEqual(inst.object[0].role?.code, "1")
		XCTAssertEqual(inst.object[0].role?.display, "Patient")
		XCTAssertEqual(inst.object[0].role?.system, "http://hl7.org/fhir/valueset-object-role")
		XCTAssertEqual(inst.object[0].type?.code, "1")
		XCTAssertEqual(inst.object[0].type?.display, "Person")
		XCTAssertEqual(inst.object[0].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.object[1].description_fhir, "data about Everthing important")
		XCTAssertEqual(inst.object[1].identifier?.value, "What.id")
		XCTAssertEqual(inst.object[1].lifecycle?.code, "11")
		XCTAssertEqual(inst.object[1].lifecycle?.display, "Disclosure")
		XCTAssertEqual(inst.object[1].lifecycle?.system, "http://hl7.org/fhir/object-lifecycle")
		XCTAssertEqual(inst.object[1].name, "Namne of What")
		XCTAssertEqual(inst.object[1].reference?.reference, "Patient/example/_history/1")
		XCTAssertEqual(inst.object[1].role?.code, "4")
		XCTAssertEqual(inst.object[1].role?.display, "DomainResource")
		XCTAssertEqual(inst.object[1].role?.system, "http://hl7.org/fhir/valueset-object-role")
		XCTAssertEqual(inst.object[1].securityLabel[0].code, "V")
		XCTAssertEqual(inst.object[1].securityLabel[0].display, "very restricted")
		XCTAssertEqual(inst.object[1].securityLabel[0].system, "http://hl7.org/fhir/v3/Confidentiality")
		XCTAssertEqual(inst.object[1].securityLabel[1].code, "STD")
		XCTAssertEqual(inst.object[1].securityLabel[1].display, "sexually transmitted disease information sensitivity")
		XCTAssertEqual(inst.object[1].securityLabel[1].system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.object[1].securityLabel[2].code, "DELAU")
		XCTAssertEqual(inst.object[1].securityLabel[2].display, "delete after use")
		XCTAssertEqual(inst.object[1].securityLabel[2].system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.object[1].type?.code, "2")
		XCTAssertEqual(inst.object[1].type?.display, "System Object")
		XCTAssertEqual(inst.object[1].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.participant[0].altId, "notMe")
		XCTAssertEqual(inst.participant[0].location?.reference, "Location/1")
		XCTAssertEqual(inst.participant[0].name, "That guy everyone wishes would be caught")
		XCTAssertEqual(inst.participant[0].network?.address, "custodian.net")
		XCTAssertEqual(inst.participant[0].network?.type, "1")
		XCTAssertEqual(inst.participant[0].policy[0].value, "http://consent.com/yes")
		XCTAssertTrue(inst.participant[0].requestor.value ?? false)
		XCTAssertEqual(inst.participant[0].role[0].coding[0].code, "110153")
		XCTAssertEqual(inst.participant[0].role[0].coding[0].display, "Source Role ID")
		XCTAssertEqual(inst.participant[0].role[0].coding[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.participant[0].userId?.value, "SomeIdiot@nowhere.com")
		XCTAssertEqual(inst.participant[1].network?.address, "marketing.land")
		XCTAssertEqual(inst.participant[1].network?.type, "1")
		XCTAssertEqual(inst.participant[1].purposeOfUse[0].code, "HMARKT")
		XCTAssertEqual(inst.participant[1].purposeOfUse[0].display, "healthcare marketing")
		XCTAssertEqual(inst.participant[1].purposeOfUse[0].system, "http://hl7.org/fhir/v3/ActReason")
		XCTAssertEqual(inst.participant[1].reference?.reference, "Practitioner/example")
		XCTAssertFalse(inst.participant[1].requestor.value ?? true)
		XCTAssertEqual(inst.participant[1].role[0].coding[0].code, "110152")
		XCTAssertEqual(inst.participant[1].role[0].coding[0].display, "Destination Role ID")
		XCTAssertEqual(inst.participant[1].role[0].coding[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.participant[1].userId?.value, "Where")
		XCTAssertEqual(inst.source?.identifier?.value, "Watchers Accounting of Disclosures Application")
		XCTAssertEqual(inst.source?.site, "Watcher")
		XCTAssertEqual(inst.source?.type[0].code, "4")
		XCTAssertEqual(inst.source?.type[0].display, "Application Server")
		XCTAssertEqual(inst.source?.type[0].system, "http://hl7.org/fhir/security-source-type")
		XCTAssertEqual(inst.text?.div, "<div>Disclosure by some idiot, for marketing reasons, to places unknown, of a Poor Sap, data about Everthing important.</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testAuditEvent8() {		
		var instance: RealmSwiftFHIR.AuditEvent?
		do {
			instance = try runAuditEvent8()
			try runAuditEvent8(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.AuditEvent
			XCTAssertNotNil(copy)
			try runAuditEvent8(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runAuditEvent8(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test AuditEvent successfully, but threw")
		}

		testAuditEventRealm8(instance: instance!)
	}

    func testAuditEvent8RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.AuditEvent = try runAuditEvent8()
            let copy = (instance.copy() as! RealmSwiftFHIR.AuditEvent)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test AuditEvent's PKs, but threw: \(error)")
        }
    }

	func testAuditEventRealm8(instance: RealmSwiftFHIR.AuditEvent) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runAuditEvent8(realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.AuditEvent.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.AuditEvent()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.AuditEvent.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runAuditEvent8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.AuditEvent.self).count)
	}
	
	@discardableResult
	func runAuditEvent8(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.AuditEvent {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "auditevent-example.json")
		
		XCTAssertEqual(inst.event?.action, "E")
		XCTAssertEqual(inst.event?.dateTime?.description, "2012-10-25T22:04:27+11:00")
		XCTAssertEqual(inst.event?.outcome, "0")
		XCTAssertEqual(inst.event?.subtype[0].code, "110120")
		XCTAssertEqual(inst.event?.subtype[0].display, "Application Start")
		XCTAssertEqual(inst.event?.subtype[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.event?.type?.code, "110100")
		XCTAssertEqual(inst.event?.type?.display, "Application Activity")
		XCTAssertEqual(inst.event?.type?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.object[0].identifier?.type?.coding[0].code, "SNO")
		XCTAssertEqual(inst.object[0].identifier?.type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
		XCTAssertEqual(inst.object[0].identifier?.type?.text, "Dell Serial Number")
		XCTAssertEqual(inst.object[0].identifier?.value, "ABCDEF")
		XCTAssertEqual(inst.object[0].lifecycle?.code, "6")
		XCTAssertEqual(inst.object[0].lifecycle?.display, "Access / Use")
		XCTAssertEqual(inst.object[0].lifecycle?.system, "http://hl7.org/fhir/object-lifecycle")
		XCTAssertEqual(inst.object[0].name, "Grahame's Laptop")
		XCTAssertEqual(inst.object[0].role?.code, "4")
		XCTAssertEqual(inst.object[0].role?.display, "DomainResource")
		XCTAssertEqual(inst.object[0].role?.system, "http://hl7.org/fhir/object-role")
		XCTAssertEqual(inst.object[0].type?.code, "4")
		XCTAssertEqual(inst.object[0].type?.display, "Other")
		XCTAssertEqual(inst.object[0].type?.system, "http://hl7.org/fhir/object-type")
		XCTAssertEqual(inst.participant[0].network?.address, "127.0.0.1")
		XCTAssertEqual(inst.participant[0].network?.type, "2")
		XCTAssertFalse(inst.participant[0].requestor.value ?? true)
		XCTAssertEqual(inst.participant[0].role[0].text, "Service User (Logon)")
		XCTAssertEqual(inst.participant[0].userId?.value, "Grahame")
		XCTAssertEqual(inst.source?.identifier?.value, "Grahame's Laptop")
		XCTAssertEqual(inst.source?.site, "Development")
		XCTAssertEqual(inst.source?.type[0].code, "1")
		XCTAssertEqual(inst.source?.type[0].system, "http://hl7.org/fhir/audit-event-sub-type")
		XCTAssertEqual(inst.text?.div, "<div>Application Start for under service login &quot;Grahame&quot; (id: Grahame's Test HL7Connect)</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
