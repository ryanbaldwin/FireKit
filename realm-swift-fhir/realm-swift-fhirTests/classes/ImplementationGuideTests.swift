//
//  ImplementationGuideTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ImplementationGuideTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ImplementationGuide {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ImplementationGuide {
		let instance = RealmSwiftFHIR.ImplementationGuide(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testImplementationGuide1() {		
		var instance: RealmSwiftFHIR.ImplementationGuide?
		do {
			instance = try runImplementationGuide1()
			try runImplementationGuide1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ImplementationGuide successfully, but threw")
		}

		testImplementationGuideRealm1(instance: instance!)
	}

	func testImplementationGuideRealm1(instance: RealmSwiftFHIR.ImplementationGuide) {
		try! realm.write {
                realm.add(instance)
            }
        try! runImplementationGuide1(realm.objects(RealmSwiftFHIR.ImplementationGuide.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ImplementationGuide.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ImplementationGuide.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runImplementationGuide1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ImplementationGuide {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "implementationguide-example.json")
		
		XCTAssertEqual(inst.binary[0].value, "http://h7.org/fhir/fhir.css")
		XCTAssertEqual(inst.contact[0].name, "ONC")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://www.healthit.gov")
		XCTAssertEqual(inst.contact[1].name, "HL7")
		XCTAssertEqual(inst.contact[1].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[1].telecom[0].value, "http://hl7.org/fhir")
		XCTAssertEqual(inst.copyright, "Published by ONC under the standard FHIR license (CC0)")
		XCTAssertEqual(inst.date?.description, "2015-01-01")
		XCTAssertEqual(inst.dependency[0].type, "reference")
		XCTAssertEqual(inst.dependency[0].uri, "http://hl7.org/fhir/ImplementationGuide/uscore")
		XCTAssertFalse(inst.experimental.value ?? true)
		XCTAssertEqual(inst.fhirVersion, "1.0.0")
		XCTAssertEqual(inst.global[0].profile?.reference, "StructureDefinition/daf-patient")
		XCTAssertEqual(inst.global[0].type, "Patient")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.name, "Data Access Framework (DAF)")
		XCTAssertEqual(inst.package[0].description_fhir, "Base package (not broken up into multiple packages)")
		XCTAssertEqual(inst.package[0].name, "test")
		XCTAssertEqual(inst.package[0].resource[0].acronym, "daf-tst")
		XCTAssertEqual(inst.package[0].resource[0].description_fhir, "A test example to show how a package works")
		XCTAssertEqual(inst.package[0].resource[0].exampleFor?.reference, "StructureDefinition/daf-patient")
		XCTAssertEqual(inst.package[0].resource[0].name, "Test Example")
		XCTAssertEqual(inst.package[0].resource[0].purpose, "example")
		XCTAssertEqual(inst.package[0].resource[0].sourceUri, "test.html")
		XCTAssertEqual(inst.page?.kind, "page")
		XCTAssertEqual(inst.page?.name, "Example Patient Page")
		XCTAssertEqual(inst.page?.page[0].format, "text/html")
		XCTAssertEqual(inst.page?.page[0].kind, "list")
		XCTAssertEqual(inst.page?.page[0].name, "Value Set Page")
		XCTAssertEqual(inst.page?.page[0].package[0].value, "test")
		XCTAssertEqual(inst.page?.page[0].source, "list.html")
		XCTAssertEqual(inst.page?.page[0].type[0].value, "ValueSet")
		XCTAssertEqual(inst.page?.source, "patient-example.html")
		XCTAssertEqual(inst.publisher, "ONC / HL7 Joint project")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.url, "http://hl7.org/fhir/daf")
		XCTAssertEqual(inst.useContext[0].coding[0].code, "US")
		XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")
		XCTAssertEqual(inst.version, "0")
		
		return inst
	}
}
