//
//  DiagnosticOrderTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DiagnosticOrderTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DiagnosticOrder {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DiagnosticOrder {
		let instance = RealmSwiftFHIR.DiagnosticOrder(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDiagnosticOrder1() {		
		var instance: RealmSwiftFHIR.DiagnosticOrder?
		do {
			instance = try runDiagnosticOrder1()
			try runDiagnosticOrder1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticOrder successfully, but threw")
		}

		testDiagnosticOrderRealm1(instance: instance!)
	}

	func testDiagnosticOrderRealm1(instance: RealmSwiftFHIR.DiagnosticOrder) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticOrder1(realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDiagnosticOrder1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticOrder {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticorder-example-di.json")
		
		XCTAssertEqual(inst.event[0].dateTime?.description, "2013-05-08T09:33:27+07:00")
		XCTAssertEqual(inst.event[0].status, "requested")
		XCTAssertEqual(inst.id, "di")
		XCTAssertEqual(inst.item[0].bodySite?.coding[0].code, "51185008")
		XCTAssertEqual(inst.item[0].bodySite?.coding[0].display, "Thoracic structure")
		XCTAssertEqual(inst.item[0].bodySite?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.item[0].code?.coding[0].code, "24627-2")
		XCTAssertEqual(inst.item[0].code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.item[0].code?.text, "Chest CT")
		XCTAssertEqual(inst.orderer?.display, "Dr. Adam Careful")
		XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
		XCTAssertEqual(inst.reason[0].text, "Check for metastatic disease")
		XCTAssertEqual(inst.status, "requested")
		XCTAssertEqual(inst.subject?.reference, "Patient/dicom")
		XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p>Chest CT - ordered May 8, 2013 by Dr. Adam Careful</p>\n\t\t</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticOrder2() {		
		var instance: RealmSwiftFHIR.DiagnosticOrder?
		do {
			instance = try runDiagnosticOrder2()
			try runDiagnosticOrder2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticOrder successfully, but threw")
		}

		testDiagnosticOrderRealm2(instance: instance!)
	}

	func testDiagnosticOrderRealm2(instance: RealmSwiftFHIR.DiagnosticOrder) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticOrder2(realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDiagnosticOrder2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticOrder {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticorder-example-ft4.json")
		
		XCTAssertEqual(inst.contained[0].id, "rtt")
		XCTAssertEqual(inst.event[0].dateTime?.description, "2015-08-27T09:33:27+07:00")
		XCTAssertEqual(inst.event[0].status, "requested")
		XCTAssertEqual(inst.id, "ft4")
		XCTAssertEqual(inst.item[0].code?.coding[0].code, "3024-7")
		XCTAssertEqual(inst.item[0].code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.item[0].code?.text, "Free T4")
		XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
		XCTAssertEqual(inst.specimen[0].display, "Red Top Tube")
		XCTAssertEqual(inst.specimen[0].reference, "#rtt")
		XCTAssertEqual(inst.status, "requested")
		XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticOrder3() {		
		var instance: RealmSwiftFHIR.DiagnosticOrder?
		do {
			instance = try runDiagnosticOrder3()
			try runDiagnosticOrder3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticOrder successfully, but threw")
		}

		testDiagnosticOrderRealm3(instance: instance!)
	}

	func testDiagnosticOrderRealm3(instance: RealmSwiftFHIR.DiagnosticOrder) {
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticOrder3(realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticOrder.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runDiagnosticOrder3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticOrder {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticorder-example.json")
		
		XCTAssertEqual(inst.contained[0].id, "fasting")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
		XCTAssertEqual(inst.event[0].actor?.reference, "Practitioner/example")
		XCTAssertEqual(inst.event[0].dateTime?.description, "2013-05-02T16:16:00-07:00")
		XCTAssertEqual(inst.event[0].status, "requested")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.3.4.5.6.7")
		XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "PLAC")
		XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
		XCTAssertEqual(inst.identifier[0].type?.text, "Placer")
		XCTAssertEqual(inst.identifier[0].value, "2345234234234")
		XCTAssertEqual(inst.item[0].code?.coding[0].code, "LIPID")
		XCTAssertEqual(inst.item[0].code?.coding[0].system, "http://acme.org/tests")
		XCTAssertEqual(inst.item[0].code?.text, "Lipid Panel")
		XCTAssertEqual(inst.item[0].specimen[0].reference, "Specimen/101")
		XCTAssertEqual(inst.note[0].text, "patient is afraid of needles")
		XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
		XCTAssertEqual(inst.reason[0].coding[0].code, "V173")
		XCTAssertEqual(inst.reason[0].coding[0].display, "Fam hx-ischem heart dis")
		XCTAssertEqual(inst.reason[0].coding[0].system, "http://hl7.org/fhir/sid/icd-9")
		XCTAssertEqual(inst.status, "received")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.supportingInformation[0].reference, "#fasting")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
