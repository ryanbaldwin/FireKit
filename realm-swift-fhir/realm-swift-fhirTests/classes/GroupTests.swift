//
//  GroupTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class GroupTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Group {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Group {
		let instance = RealmSwiftFHIR.Group(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testGroup1() {		
		var instance: RealmSwiftFHIR.Group?
		do {
			instance = try runGroup1()
			try runGroup1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Group successfully, but threw")
		}

		testGroupRealm1(instance: instance!)
	}

	func testGroupRealm1(instance: RealmSwiftFHIR.Group) {
		try! realm.write {
                realm.add(instance)
            }
        try! runGroup1(realm.objects(RealmSwiftFHIR.Group.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Group.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Group.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runGroup1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Group {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "group-example-member.json")
		
		XCTAssertTrue(inst.actual.value ?? false)
		XCTAssertEqual(inst.id, "102")
		XCTAssertEqual(inst.member[0].entity?.reference, "Patient/pat1")
		XCTAssertEqual(inst.member[0].period?.start?.description, "2014-10-08")
		XCTAssertEqual(inst.member[1].entity?.reference, "Patient/pat2")
		XCTAssertTrue(inst.member[1].inactive.value ?? false)
		XCTAssertEqual(inst.member[1].period?.start?.description, "2015-04-02")
		XCTAssertEqual(inst.member[2].entity?.reference, "Patient/pat3")
		XCTAssertEqual(inst.member[2].period?.start?.description, "2015-08-06")
		XCTAssertEqual(inst.member[3].entity?.reference, "Patient/pat4")
		XCTAssertEqual(inst.member[3].period?.start?.description, "2015-08-06")
		XCTAssertEqual(inst.text?.status, "additional")
		XCTAssertEqual(inst.type, "person")
		
		return inst
	}
	
	func testGroup2() {		
		var instance: RealmSwiftFHIR.Group?
		do {
			instance = try runGroup2()
			try runGroup2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Group successfully, but threw")
		}

		testGroupRealm2(instance: instance!)
	}

	func testGroupRealm2(instance: RealmSwiftFHIR.Group) {
		try! realm.write {
                realm.add(instance)
            }
        try! runGroup2(realm.objects(RealmSwiftFHIR.Group.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Group.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Group.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runGroup2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Group {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "group-example.json")
		
		XCTAssertTrue(inst.actual.value ?? false)
		XCTAssertEqual(inst.characteristic[0].code?.text, "gender")
		XCTAssertFalse(inst.characteristic[0].exclude.value ?? true)
		XCTAssertEqual(inst.characteristic[0].valueCodeableConcept?.text, "mixed")
		XCTAssertEqual(inst.characteristic[1].code?.text, "owner")
		XCTAssertFalse(inst.characteristic[1].exclude.value ?? true)
		XCTAssertEqual(inst.characteristic[1].valueCodeableConcept?.text, "John Smith")
		XCTAssertEqual(inst.code?.text, "Horse")
		XCTAssertEqual(inst.id, "101")
		XCTAssertEqual(inst.name, "John's herd")
		XCTAssertEqual(inst.quantity.value, 25)
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>Herd of 25 horses</p>\n      <p>Gender: mixed</p>\n      <p>Owner: John Smith</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "additional")
		XCTAssertEqual(inst.type, "animal")
		
		return inst
	}
}
