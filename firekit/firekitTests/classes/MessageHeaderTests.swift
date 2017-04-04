//
//  MessageHeaderTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-04-03.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class MessageHeaderTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> FireKit.MessageHeader {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> FireKit.MessageHeader {
		let instance = FireKit.MessageHeader(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testMessageHeader1() {		
		var instance: FireKit.MessageHeader?
		do {
			instance = try runMessageHeader1()
			try runMessageHeader1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.MessageHeader
			XCTAssertNotNil(copy)
			try runMessageHeader1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runMessageHeader1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test MessageHeader successfully, but threw")
		}

		testMessageHeaderRealm1(instance: instance!)
	}

    func testMessageHeader1RealmPK() {        
        do {
            let instance: FireKit.MessageHeader = try runMessageHeader1()
            let copy = (instance.copy() as! FireKit.MessageHeader)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MessageHeader's PKs, but threw: \(error)")
        }
    }

	func testMessageHeaderRealm1(instance: FireKit.MessageHeader) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runMessageHeader1(realm.objects(FireKit.MessageHeader.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MessageHeader.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MessageHeader.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MessageHeader()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MessageHeader.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMessageHeader1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MessageHeader.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runMessageHeader1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MessageHeader.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MessageHeader.self).count)
	}
	
	@discardableResult
	func runMessageHeader1(_ json: FHIRJSON? = nil) throws -> FireKit.MessageHeader {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "messageheader-example.json")
		
		XCTAssertEqual(inst.author?.reference, "Practitioner/example")
		XCTAssertEqual(inst.data[0].reference, "Patient/example")
		XCTAssertEqual(inst.destination[0].endpoint, "llp:10.11.12.14:5432")
		XCTAssertEqual(inst.destination[0].name, "Acme Message Gateway")
		XCTAssertEqual(inst.destination[0].target?.reference, "Device/example")
		XCTAssertEqual(inst.enterer?.reference, "Practitioner/example")
		XCTAssertEqual(inst.event?.code, "admin-update")
		XCTAssertEqual(inst.event?.system, "http://hl7.org/fhir/message-type")
		XCTAssertEqual(inst.id, "1cbdfb97-5859-48a4-8301-d54eab818d68")
		XCTAssertEqual(inst.reason?.coding[0].code, "admit")
		XCTAssertEqual(inst.reason?.coding[0].system, "http://hl7.org/fhir/message-reasons-encounter")
		XCTAssertEqual(inst.response?.code, "ok")
		XCTAssertEqual(inst.response?.identifier, "5015fe84-8e76-4526-89d8-44b322e8d4fb")
		XCTAssertEqual(inst.responsible?.reference, "Practitioner/example")
		XCTAssertEqual(inst.source?.contact?.system, "phone")
		XCTAssertEqual(inst.source?.contact?.value, "+1 (555) 123 4567")
		XCTAssertEqual(inst.source?.endpoint, "llp:10.11.12.13:5432")
		XCTAssertEqual(inst.source?.name, "Acme Central Patient Registry")
		XCTAssertEqual(inst.source?.software, "FooBar Patient Manager")
		XCTAssertEqual(inst.source?.version, "3.1.45.AABB")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>Update Person resource for Peter James CHALMERS (Jim), MRN: 12345 (Acme Healthcare)</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.timestamp?.description, "2012-01-04T09:10:14Z")
		
		return inst
	}
}
