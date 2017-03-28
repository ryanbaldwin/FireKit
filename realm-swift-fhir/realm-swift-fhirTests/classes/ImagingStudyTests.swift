//
//  ImagingStudyTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-03-28.
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
			let copy = instance!.copy() as? RealmSwiftFHIR.ImagingStudy
			XCTAssertNotNil(copy)
			try runImagingStudy1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runImagingStudy1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ImagingStudy successfully, but threw")
		}

		testImagingStudyRealm1(instance: instance!)
	}

    func testImagingStudy1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.ImagingStudy = try runImagingStudy1()
            let copy = (instance.copy() as! RealmSwiftFHIR.ImagingStudy)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test ImagingStudy's PKs, but threw: \(error)")
        }
    }

	func testImagingStudyRealm1(instance: RealmSwiftFHIR.ImagingStudy) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runImagingStudy1(realm.objects(RealmSwiftFHIR.ImagingStudy.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ImagingStudy.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.ImagingStudy.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.ImagingStudy()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.ImagingStudy.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runImagingStudy1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.ImagingStudy.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runImagingStudy1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.ImagingStudy.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.ImagingStudy.self).count)
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
