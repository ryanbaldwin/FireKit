//
//  CommunicationTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class CommunicationTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Communication {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Communication {
		let instance = RealmSwiftFHIR.Communication(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testCommunication1() {		
		var instance: RealmSwiftFHIR.Communication?
		do {
			instance = try runCommunication1()
			try runCommunication1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Communication successfully, but threw")
		}

		testCommunicationRealm1(instance: instance!)
	}

	func testCommunicationRealm1(instance: RealmSwiftFHIR.Communication) {
		try! realm.write {
                realm.add(instance)
            }
        try! runCommunication1(realm.objects(RealmSwiftFHIR.Communication.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Communication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Communication.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runCommunication1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Communication {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "communication-example.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "Alert")
		XCTAssertEqual(inst.category?.coding[0].system, "http://acme.org/messagetypes")
		XCTAssertEqual(inst.category?.text, "Alert")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.3.4.5.6.7")
		XCTAssertEqual(inst.identifier[0].type?.text, "Paging System")
		XCTAssertEqual(inst.identifier[0].value, "2345678901")
		XCTAssertEqual(inst.payload[0].contentString, "Patient 1 has a very high serum potassium value (7.2 mmol/L on 2014-Dec-12 at 5:55 pm)")
		XCTAssertEqual(inst.payload[1].contentReference?.reference, "Observation/643666aa12f")
		XCTAssertEqual(inst.recipient[0].reference, "Practitioner/21")
		XCTAssertEqual(inst.sender?.reference, "Device/f001")
		XCTAssertEqual(inst.sent?.description, "2014-12-12T18:01:10-08:00")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.subject?.reference, "Patient/1")
		XCTAssertEqual(inst.text?.div, "<div>Patient has very high serum potassium</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
