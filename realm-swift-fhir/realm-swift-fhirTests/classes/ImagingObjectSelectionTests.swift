//
//  ImagingObjectSelectionTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ImagingObjectSelectionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.ImagingObjectSelection {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.ImagingObjectSelection {
		let instance = RealmSwiftFHIR.ImagingObjectSelection(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testImagingObjectSelection1() {		
		var instance: RealmSwiftFHIR.ImagingObjectSelection?
		do {
			instance = try runImagingObjectSelection1()
			try runImagingObjectSelection1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ImagingObjectSelection successfully, but threw")
		}

		testImagingObjectSelectionRealm1(instance: instance!)
	}

	func testImagingObjectSelectionRealm1(instance: RealmSwiftFHIR.ImagingObjectSelection) {
		try! realm.write {
                realm.add(instance)
            }
        try! runImagingObjectSelection1(realm.objects(RealmSwiftFHIR.ImagingObjectSelection.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ImagingObjectSelection.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ImagingObjectSelection.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runImagingObjectSelection1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.ImagingObjectSelection {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "imagingobjectselection-example.json")
		
		XCTAssertEqual(inst.authoringTime?.description, "2014-11-20T11:01:20-08:00")
		XCTAssertEqual(inst.description_fhir, "1 SC image (screen snapshot) and 2 CT images to share a chest CT exam")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.patient?.reference, "Patient/dicom")
		XCTAssertEqual(inst.study[0].series[0].instance[0].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.7")
		XCTAssertEqual(inst.study[0].series[0].instance[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092902")
		XCTAssertEqual(inst.study[0].series[0].instance[0].url, "http://localhost/wado/SCP/2.16.124.113543.6003.189642796.63084.16749.2599092904")
		XCTAssertEqual(inst.study[0].series[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16750.2599092901")
		XCTAssertEqual(inst.study[0].series[1].instance[0].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.2")
		XCTAssertEqual(inst.study[0].series[1].instance[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092903")
		XCTAssertEqual(inst.study[0].series[1].instance[0].url, "http://localhost/wado/SCP/2.16.124.113543.6003.189642796.63084.16748.2599092903")
		XCTAssertEqual(inst.study[0].series[1].instance[1].sopClass, "urn:oid:1.2.840.10008.5.1.4.1.1.2")
		XCTAssertEqual(inst.study[0].series[1].instance[1].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092904")
		XCTAssertEqual(inst.study[0].series[1].instance[1].url, "http://localhost/wado/SCP/2.16.124.113543.6003.189642796.63084.16750.2599092902")
		XCTAssertEqual(inst.study[0].series[1].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16750.2599092902")
		XCTAssertEqual(inst.study[0].uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16749.2599092904")
		XCTAssertEqual(inst.text?.div, "<div>A set of images accompanying to an exam document, including one SC image and two CT images, to publish the exam sharing</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.title?.coding[0].code, "113030")
		XCTAssertEqual(inst.title?.coding[0].display, "Manifest")
		XCTAssertEqual(inst.title?.coding[0].system, "http://nema.org/dicom/dicm")
		XCTAssertEqual(inst.title?.text, "A set of objects that have been exported for sharing")
		XCTAssertEqual(inst.uid, "urn:oid:2.16.124.113543.6003.189642796.63084.16748.2599092901")
		
		return inst
	}
}
