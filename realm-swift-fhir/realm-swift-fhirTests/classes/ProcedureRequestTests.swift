//
//  ProcedureRequestTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ProcedureRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ProcedureRequest {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ProcedureRequest {
		let instance = RealmSwiftFHIR.ProcedureRequest(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testProcedureRequest1() {		
		var instance: RealmSwiftFHIR.ProcedureRequest?
		do {
			instance = try runProcedureRequest1()
			try runProcedureRequest1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ProcedureRequest successfully, but threw")
		}

		testProcedureRequestRealm1(instance: instance!)
	}

	func testProcedureRequestRealm1(instance: RealmSwiftFHIR.ProcedureRequest) {
		try! realm.write {
                realm.add(instance)
            }
        try! runProcedureRequest1(realm.objects(RealmSwiftFHIR.ProcedureRequest.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ProcedureRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ProcedureRequest.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runProcedureRequest1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ProcedureRequest {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "procedurerequest-example.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "323418000")
		XCTAssertEqual(inst.code?.coding[0].display, "Fix me up")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be added</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
