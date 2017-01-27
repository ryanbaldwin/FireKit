//
//  SearchParameterTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class SearchParameterTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.SearchParameter {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.SearchParameter {
		let instance = RealmSwiftFHIR.SearchParameter(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSearchParameter1() {		
		var instance: RealmSwiftFHIR.SearchParameter?
		do {
			instance = try runSearchParameter1()
			try runSearchParameter1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test SearchParameter successfully, but threw")
		}

		testSearchParameterRealm1(instance: instance!)
	}

	func testSearchParameterRealm1(instance: RealmSwiftFHIR.SearchParameter) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSearchParameter1(realm.objects(RealmSwiftFHIR.SearchParameter.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.SearchParameter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.SearchParameter.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSearchParameter1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.SearchParameter {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "searchparameter-example-extension.json")
		
		XCTAssertEqual(inst.base, "Patient")
		XCTAssertEqual(inst.code, "part-agree")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
		XCTAssertEqual(inst.description_fhir, "Search by url for a participation agreement, which is stored in a DocumentReference")
		XCTAssertEqual(inst.id, "example-extension")
		XCTAssertEqual(inst.name, "Example Search Parameter on an extension")
		XCTAssertEqual(inst.publisher, "Health Level Seven International (FHIR Infrastructure)")
		XCTAssertEqual(inst.target[0].value, "DocumentReference")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "reference")
		XCTAssertEqual(inst.url, "http://hl7.org/fhir/SearchParameter/example-extension")
		XCTAssertEqual(inst.xpath, "f:DocumentReference/f:extension[@url='http://example.org/fhir/StructureDefinition/participation-agreement']")
		XCTAssertEqual(inst.xpathUsage, "normal")
		
		return inst
	}
	
	func testSearchParameter2() {		
		var instance: RealmSwiftFHIR.SearchParameter?
		do {
			instance = try runSearchParameter2()
			try runSearchParameter2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test SearchParameter successfully, but threw")
		}

		testSearchParameterRealm2(instance: instance!)
	}

	func testSearchParameterRealm2(instance: RealmSwiftFHIR.SearchParameter) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSearchParameter2(realm.objects(RealmSwiftFHIR.SearchParameter.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.SearchParameter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.SearchParameter.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSearchParameter2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.SearchParameter {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "searchparameter-example.json")
		
		XCTAssertEqual(inst.base, "Resource")
		XCTAssertEqual(inst.code, "_id")
		XCTAssertEqual(inst.contact[0].name, "[string]")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
		XCTAssertEqual(inst.date?.description, "2013-10-23")
		XCTAssertEqual(inst.description_fhir, "Search by resource identifier - e.g. same as the read interaction, but can return included resources")
		XCTAssertFalse(inst.experimental.value ?? true)
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.name, "Example Search Parameter")
		XCTAssertEqual(inst.publisher, "Health Level Seven International (FHIR Infrastructure)")
		XCTAssertEqual(inst.requirements, "Need to search by identifier for various infrastructural cases - mainly retrieving packages, and matching as part of a chain")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "token")
		XCTAssertEqual(inst.url, "http://hl7.org/fhir/SearchParameter/example")
		XCTAssertEqual(inst.xpath, "f:*/f:id")
		XCTAssertEqual(inst.xpathUsage, "normal")
		
		return inst
	}
}
