//
//  ParametersTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ParametersTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Parameters {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Parameters {
		let instance = RealmSwiftFHIR.Parameters(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testParameters1() {		
		var instance: RealmSwiftFHIR.Parameters?
		do {
			instance = try runParameters1()
			try runParameters1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Parameters successfully, but threw")
		}

		testParametersRealm1(instance: instance!)
	}

	func testParametersRealm1(instance: RealmSwiftFHIR.Parameters) {
		try! realm.write {
                realm.add(instance)
            }
        try! runParameters1(realm.objects(RealmSwiftFHIR.Parameters.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Parameters.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Parameters.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runParameters1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Parameters {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "parameters-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.parameter[0].name, "start")
		XCTAssertEqual(inst.parameter[0].valueDate?.description, "2010-01-01")
		XCTAssertEqual(inst.parameter[1].name, "end")
		
		return inst
	}
}
