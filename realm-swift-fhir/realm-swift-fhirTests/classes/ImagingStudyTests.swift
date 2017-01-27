//
//  ImagingStudyTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-01-27.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ImagingStudyTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ImagingStudy {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ImagingStudy {
		let instance = RealmSwiftFHIR.ImagingStudy(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testImagingStudy1() {		
		var instance: RealmSwiftFHIR.ImagingStudy?
		do {
			instance = try runImagingStudy1()
			try runImagingStudy1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ImagingStudy successfully, but threw")
		}

		testImagingStudyRealm1(instance: instance!)
	}

	func testImagingStudyRealm1(instance: RealmSwiftFHIR.ImagingStudy) {
		try! realm.write {
                realm.add(instance)
            }
        try! runImagingStudy1(realm.objects(RealmSwiftFHIR.ImagingStudy.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ImagingStudy.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ImagingStudy.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runImagingStudy1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ImagingStudy {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "imagingstudy-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.numberOfInstances.value, 1)
		XCTAssertEqual(inst.numberOfSeries.value, 1)
		XCTAssertEqual(inst.patient?.reference, "Patient/dicom")
		XCTAssertEqual(inst.series[0].bodySite?.code, "67734004")
		XCTAssertEqual(inst.series[0].bodySite?.display, "Upper Trunk Structure")
		XCTAssertEqual(inst.series[0].bodySite?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.series[0].description_fhir, "CT Surview 180")
		XCTAssertEqual(inst.series[0].instance[0].content[0].url, "http://localhost/fhir/Binary/1.2.840.11361907579238403408700.3.0.14.19970327150033")
		XCTAssertEqual(inst.series[0].instance[0].number.value, 1)
		XCTAssertEqual(inst.series[0].instance[0].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.2")
		XCTAssertEqual(inst.series[0].instance[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092903")
		XCTAssertEqual(inst.series[0].modality?.code, "CT")
		XCTAssertEqual(inst.series[0].modality?.system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.series[0].number.value, 3)
		XCTAssertEqual(inst.series[0].numberOfInstances.value, 1)
		XCTAssertEqual(inst.series[0].uid, "urn:oid:2.16.124.113543.6003.2588828330.45298.17418.2723805630")
		XCTAssertEqual(inst.started?.description, "2011-01-01T11:01:20+03:00")
		XCTAssertEqual(inst.text?.div, "<div>Image 1 from Series 3: CT Images on Patient MINT (MINT1234) taken at 1-Jan 2011 01:20 AM</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.uid, "urn:oid:2.16.124.113543.6003.1154777499.30246.19789.3503430045")
		
		return inst
	}
}
