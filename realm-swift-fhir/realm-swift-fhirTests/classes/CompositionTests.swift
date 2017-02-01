//
//  CompositionTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class CompositionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Composition {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Composition {
		let instance = RealmSwiftFHIR.Composition(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testComposition1() {		
		var instance: RealmSwiftFHIR.Composition?
		do {
			instance = try runComposition1()
			try runComposition1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Composition successfully, but threw")
		}

		testCompositionRealm1(instance: instance!)
	}

	func testCompositionRealm1(instance: RealmSwiftFHIR.Composition) {
		try! realm.write {
                realm.add(instance)
            }
        try! runComposition1(realm.objects(RealmSwiftFHIR.Composition.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Composition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Composition.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runComposition1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Composition {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "composition-example.json")
		
		XCTAssertEqual(inst.attester[0].mode[0].value, "legal")
		XCTAssertEqual(inst.attester[0].party?.display, "Harold Hippocrates, MD")
		XCTAssertEqual(inst.attester[0].party?.reference, "Practitioner/xcda-author")
		XCTAssertEqual(inst.attester[0].time?.description, "2012-01-04T09:10:14Z")
		XCTAssertEqual(inst.author[0].display, "Harold Hippocrates, MD")
		XCTAssertEqual(inst.author[0].reference, "Practitioner/xcda-author")
		XCTAssertEqual(inst.class_fhir?.coding[0].code, "LP173421-1")
		XCTAssertEqual(inst.class_fhir?.coding[0].display, "Report")
		XCTAssertEqual(inst.class_fhir?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.confidentiality, "N")
		XCTAssertEqual(inst.custodian?.display, "Good Health Clinic")
		XCTAssertEqual(inst.custodian?.reference, "Organization/2.16.840.1.113883.19.5")
		XCTAssertEqual(inst.date?.description, "2012-01-04T09:10:14Z")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/xcda")
		XCTAssertEqual(inst.event[0].code[0].coding[0].code, "HEALTHREC")
		XCTAssertEqual(inst.event[0].code[0].coding[0].display, "health record")
		XCTAssertEqual(inst.event[0].code[0].coding[0].system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.event[0].detail[0].reference, "Observation/example")
		XCTAssertEqual(inst.event[0].period?.end?.description, "2012-11-12")
		XCTAssertEqual(inst.event[0].period?.start?.description, "2010-07-18")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier?.system, "http://healthintersections.com.au/test")
		XCTAssertEqual(inst.identifier?.value, "1")
		XCTAssertEqual(inst.section[0].code?.coding[0].code, "11348-0")
		XCTAssertEqual(inst.section[0].code?.coding[0].display, "History of past illness Narrative")
		XCTAssertEqual(inst.section[0].code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.section[0].entry[0].reference, "Condition/stroke")
		XCTAssertEqual(inst.section[0].entry[1].reference, "Condition/example")
		XCTAssertEqual(inst.section[0].entry[2].reference, "Condition/example2")
		XCTAssertEqual(inst.section[0].mode, "snapshot")
		XCTAssertEqual(inst.section[0].orderedBy?.coding[0].code, "event-date")
		XCTAssertEqual(inst.section[0].orderedBy?.coding[0].display, "Sorted by Event Date")
		XCTAssertEqual(inst.section[0].orderedBy?.coding[0].system, "http://hl7.org/fhir/list-order")
		XCTAssertEqual(inst.section[0].text?.status, "generated")
		XCTAssertEqual(inst.section[0].title, "History of present illness")
		XCTAssertEqual(inst.section[1].code?.coding[0].code, "10157-6")
		XCTAssertEqual(inst.section[1].code?.coding[0].display, "History of family member diseases Narrative")
		XCTAssertEqual(inst.section[1].code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.section[1].emptyReason?.coding[0].code, "withheld")
		XCTAssertEqual(inst.section[1].emptyReason?.coding[0].display, "Information Withheld")
		XCTAssertEqual(inst.section[1].emptyReason?.coding[0].system, "http://hl7.org/fhir/list-empty-reason")
		XCTAssertEqual(inst.section[1].mode, "snapshot")
		XCTAssertEqual(inst.section[1].text?.div, "<div>\n\t\t\t<p>History of family member diseases - not available</p>\n\t\t\t</div>")
		XCTAssertEqual(inst.section[1].text?.status, "generated")
		XCTAssertEqual(inst.section[1].title, "History of family member diseases")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.display, "Henry Levin the 7th")
		XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
		XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p>Consultation note for Henry Levin the 7th</p>\n\t\t\t<p>Managed by Good Health Clinic</p>\n\t\t</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.title, "Consultation Note")
		XCTAssertEqual(inst.type?.coding[0].code, "11488-4")
		XCTAssertEqual(inst.type?.coding[0].display, "Consult note")
		XCTAssertEqual(inst.type?.coding[0].system, "http://loinc.org")
		
		return inst
	}
}
