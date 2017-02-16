//
//  DocumentManifestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DocumentManifestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DocumentManifest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DocumentManifest {
		let instance = RealmSwiftFHIR.DocumentManifest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDocumentManifest1() {		
		var instance: RealmSwiftFHIR.DocumentManifest?
		do {
			instance = try runDocumentManifest1()
			try runDocumentManifest1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DocumentManifest
			XCTAssertNotNil(copy)
			try runDocumentManifest1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DocumentManifest successfully, but threw")
		}

		testDocumentManifestRealm1(instance: instance!)
	}

	func testDocumentManifestRealm1(instance: RealmSwiftFHIR.DocumentManifest) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDocumentManifest1(realm.objects(RealmSwiftFHIR.DocumentManifest.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DocumentManifest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DocumentManifest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DocumentManifest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DocumentManifest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDocumentManifest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DocumentManifest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDocumentManifest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DocumentManifest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DocumentManifest.self).count)
	}
	
	@discardableResult
	func runDocumentManifest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DocumentManifest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "documentmanifest-example.json")
		
		XCTAssertEqual(inst.author[0].reference, "#a1")
		XCTAssertEqual(inst.contained[0].id, "a1")
		XCTAssertEqual(inst.content[0].pReference?.reference, "DocumentReference/example")
		XCTAssertEqual(inst.created?.description, "2004-12-25T23:50:50-05:00")
		XCTAssertEqual(inst.description_fhir, "Physical")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://example.org/documents")
		XCTAssertEqual(inst.identifier[0].value, "23425234234-2347")
		XCTAssertEqual(inst.masterIdentifier?.system, "http://example.org/documents")
		XCTAssertEqual(inst.masterIdentifier?.value, "23425234234-2346")
		XCTAssertEqual(inst.recipient[0].reference, "Practitioner/xcda1")
		XCTAssertEqual(inst.related[0].identifier?.system, "http://example.org/documents")
		XCTAssertEqual(inst.related[0].identifier?.value, "23425234234-9999")
		XCTAssertEqual(inst.related[0].ref?.reference, "DocumentReference/example")
		XCTAssertEqual(inst.source, "urn:oid:1.3.6.1.4.1.21367.2009.1.2.1")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
		XCTAssertEqual(inst.text?.div, "<div>Text</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.text, "History and Physical")
		
		return inst
	}
}
