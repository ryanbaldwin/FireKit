//
//  MessageHeaderTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class MessageHeaderTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.MessageHeader {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.MessageHeader {
		let instance = RealmSwiftFHIR.MessageHeader(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testMessageHeader1() {		
		var instance: RealmSwiftFHIR.MessageHeader?
		do {
			instance = try runMessageHeader1()
			try runMessageHeader1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test MessageHeader successfully, but threw")
		}

		testMessageHeaderRealm1(instance: instance!)
	}

	func testMessageHeaderRealm1(instance: RealmSwiftFHIR.MessageHeader) {
		try! realm.write {
                realm.add(instance)
            }
        try! runMessageHeader1(realm.objects(RealmSwiftFHIR.MessageHeader.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.MessageHeader.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.MessageHeader.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runMessageHeader1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.MessageHeader {
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
