//
//  DiagnosticReportTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-17.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DiagnosticReportTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DiagnosticReport {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DiagnosticReport {
		let instance = RealmSwiftFHIR.DiagnosticReport(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDiagnosticReport1() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport1()
			try runDiagnosticReport1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport1(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm1(instance: instance!)
	}

    func testDiagnosticReport1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport1()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm1(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport1(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-dxa.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "38269-7")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.code?.text, "DXA BONE DENSITOMETRY")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].code, "391040000")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].display, "At risk of osteoporotic fracture")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.contained[0].id, "r1")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2008-06-17")
		XCTAssertEqual(inst.id, "102")
		XCTAssertEqual(inst.issued?.description, "2008-06-18T09:23:00+10:00")
		XCTAssertEqual(inst.performer?.display, "Acme Imaging Diagnostics")
		XCTAssertEqual(inst.performer?.reference, "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f")
		XCTAssertEqual(inst.result[0].reference, "#r1")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport2() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport2()
			try runDiagnosticReport2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport2(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm2(instance: instance!)
	}

    func testDiagnosticReport2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport2()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm2(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport2(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-f001-bloodexam.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "252275004")
		XCTAssertEqual(inst.category?.coding[0].display, "Haematology test")
		XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.category?.coding[1].code, "HM")
		XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/v2/0074")
		XCTAssertEqual(inst.code?.coding[0].code, "58410-2")
		XCTAssertEqual(inst.code?.coding[0].display, "Complete blood count (hemogram) panel - Blood by Automated count")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.conclusion, "Core lab")
		XCTAssertEqual(inst.contained[0].id, "req")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2013-04-02")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/reports")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "nr1239044")
		XCTAssertEqual(inst.issued?.description, "2013-05-15T19:32:52+01:00")
		XCTAssertEqual(inst.performer?.display, "Burgers University Medical Centre")
		XCTAssertEqual(inst.performer?.reference, "Organization/f001")
		XCTAssertEqual(inst.request[0].reference, "#req")
		XCTAssertEqual(inst.result[0].reference, "Observation/f001")
		XCTAssertEqual(inst.result[1].reference, "Observation/f002")
		XCTAssertEqual(inst.result[2].reference, "Observation/f003")
		XCTAssertEqual(inst.result[3].reference, "Observation/f004")
		XCTAssertEqual(inst.result[4].reference, "Observation/f005")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.display, "P. van den Heuvel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f001")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport3() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport3()
			try runDiagnosticReport3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport3(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm3(instance: instance!)
	}

    func testDiagnosticReport3RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport3()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm3(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport3(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-f201-brainct.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "394914008")
		XCTAssertEqual(inst.category?.coding[0].display, "Radiology")
		XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.category?.coding[1].code, "RAD")
		XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/v2/0074")
		XCTAssertEqual(inst.code?.coding[0].code, "429858000")
		XCTAssertEqual(inst.code?.coding[0].display, "Computed tomography (CT) of head and neck")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.code?.text, "CT of head-neck")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].code, "188340000")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].display, "Malignant tumor of craniopharyngeal duct")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.conclusion, "CT brains: large tumor sphenoid/clivus.")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2012-12-01T12:00:00+01:00")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.imagingStudy[0].display, "HEAD and NECK CT DICOM imaging study")
		XCTAssertEqual(inst.issued?.description, "2012-12-01T12:00:00+01:00")
		XCTAssertEqual(inst.performer?.display, "Blijdorp MC")
		XCTAssertEqual(inst.performer?.reference, "Organization/f203")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.display, "Roel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport4() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport4()
			try runDiagnosticReport4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport4(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm4(instance: instance!)
	}

    func testDiagnosticReport4RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport4()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm4(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport4(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-f202-bloodculture.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "15220000")
		XCTAssertEqual(inst.category?.coding[0].display, "Laboratory test")
		XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.category?.coding[1].code, "LAB")
		XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/v2/0074")
		XCTAssertEqual(inst.code?.coding[0].code, "104177005")
		XCTAssertEqual(inst.code?.coding[0].display, "Blood culture for bacteria, including anaerobic screen")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].code, "428763004")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].display, "Bacteremia due to staphylococcus")
		XCTAssertEqual(inst.codedDiagnosis[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.conclusion, "Blood culture tested positive on staphylococcus aureus")
		XCTAssertEqual(inst.contained[0].id, "req")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2013-03-11T03:45:00+01:00")
		XCTAssertEqual(inst.id, "f202")
		XCTAssertEqual(inst.issued?.description, "2013-03-11T10:28:00+01:00")
		XCTAssertEqual(inst.performer?.display, "AUMC")
		XCTAssertEqual(inst.performer?.reference, "Organization/f201")
		XCTAssertEqual(inst.request[0].reference, "#req")
		XCTAssertEqual(inst.result[0].display, "Results for staphylococcus analysis on Roel's blood culture")
		XCTAssertEqual(inst.result[0].reference, "Observation/f206")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.display, "Roel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport5() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport5()
			try runDiagnosticReport5(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport5(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm5(instance: instance!)
	}

    func testDiagnosticReport5RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport5()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm5(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport5(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-ghp.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "GHP")
		XCTAssertEqual(inst.code?.coding[0].display, "General Health Profile")
		XCTAssertEqual(inst.code?.coding[0].system, "http://acme.com/labs/reports")
		XCTAssertEqual(inst.contained[0].id, "rtt")
		XCTAssertEqual(inst.contained[1].id, "ltt")
		XCTAssertEqual(inst.contained[2].id, "urine")
		XCTAssertEqual(inst.contained[3].id, "p2")
		XCTAssertEqual(inst.contained[4].id, "r1")
		XCTAssertEqual(inst.contained[5].id, "r2")
		XCTAssertEqual(inst.contained[6].id, "r3")
		XCTAssertEqual(inst.contained[7].id, "r4")
		XCTAssertEqual(inst.contained[8].id, "r5")
		XCTAssertEqual(inst.contained[9].id, "r6")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2015-08-16T06:40:17Z")
		XCTAssertEqual(inst.id, "ghp")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.com/lab/reports")
		XCTAssertEqual(inst.identifier[0].value, "ghp-example")
		XCTAssertEqual(inst.issued?.description, "2015-08-17T06:40:17Z")
		XCTAssertEqual(inst.meta?.lastUpdated?.description, "2015-08-16T10:35:23Z")
		XCTAssertEqual(inst.performer?.display, "Acme Laboratory, Inc")
		XCTAssertEqual(inst.performer?.reference, "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f")
		XCTAssertEqual(inst.result[0].display, "Chemistry Panel")
		XCTAssertEqual(inst.result[0].reference, "#p1")
		XCTAssertEqual(inst.result[1].display, "CBC")
		XCTAssertEqual(inst.result[1].reference, "#p2")
		XCTAssertEqual(inst.result[2].display, "Urinalysis")
		XCTAssertEqual(inst.result[2].reference, "#p3")
		XCTAssertEqual(inst.specimen[0].display, "Red Top Tube")
		XCTAssertEqual(inst.specimen[0].reference, "#rtt")
		XCTAssertEqual(inst.specimen[1].display, "Lavender Top Tube")
		XCTAssertEqual(inst.specimen[1].reference, "#ltt")
		XCTAssertEqual(inst.specimen[2].display, "Urine Sample")
		XCTAssertEqual(inst.specimen[2].reference, "#urine")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport6() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport6()
			try runDiagnosticReport6(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport6(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm6(instance: instance!)
	}

    func testDiagnosticReport6RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport6()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm6(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport6(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-lipids.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "HM")
		XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/v2/0074")
		XCTAssertEqual(inst.code?.coding[0].code, "57698-3")
		XCTAssertEqual(inst.code?.coding[0].display, "Lipid panel with direct LDL - Serum or Plasma")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.code?.text, "Lipid Panel")
		XCTAssertEqual(inst.contained[0].id, "cholesterol")
		XCTAssertEqual(inst.contained[1].id, "triglyceride")
		XCTAssertEqual(inst.contained[2].id, "hdlcholesterol")
		XCTAssertEqual(inst.contained[3].id, "ldlcholesterol")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2011-03-04T08:30:00+11:00")
		XCTAssertEqual(inst.id, "lipids")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.com/lab/reports")
		XCTAssertEqual(inst.identifier[0].value, "5234342")
		XCTAssertEqual(inst.issued?.description, "2013-01-27T11:45:33+11:00")
		XCTAssertEqual(inst.performer?.display, "Acme Laboratory, Inc")
		XCTAssertEqual(inst.performer?.reference, "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f")
		XCTAssertEqual(inst.result[0].reference, "#cholesterol")
		XCTAssertEqual(inst.result[1].reference, "#triglyceride")
		XCTAssertEqual(inst.result[2].reference, "#hdlcholesterol")
		XCTAssertEqual(inst.result[3].reference, "#ldlcholesterol")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport7() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport7()
			try runDiagnosticReport7(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport7(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm7(instance: instance!)
	}

    func testDiagnosticReport7RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport7()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm7(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport7(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport7(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example-ultrasound.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "394914008")
		XCTAssertEqual(inst.category?.coding[0].display, "Radiology")
		XCTAssertEqual(inst.category?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.category?.coding[1].code, "RAD")
		XCTAssertEqual(inst.category?.coding[1].system, "http://hl7.org/fhir/v2/0074")
		XCTAssertEqual(inst.code?.coding[0].code, "45036003")
		XCTAssertEqual(inst.code?.coding[0].display, "Ultrasonography of abdomen")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.code?.text, "Abdominal Ultrasound")
		XCTAssertEqual(inst.conclusion, "Unremarkable study")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2012-12-01T12:00:00+01:00")
		XCTAssertEqual(inst.id, "ultrasound")
		XCTAssertEqual(inst.image[0].comment, "A comment about the image")
		XCTAssertEqual(inst.image[0].link?.display, "WADO example image")
		XCTAssertEqual(inst.image[0].link?.reference, "Media/1.2.840.11361907579238403408700.3.0.14.19970327150033")
		XCTAssertEqual(inst.issued?.description, "2012-12-01T12:00:00+01:00")
		XCTAssertEqual(inst.performer?.reference, "Practitioner/example")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testDiagnosticReport8() {		
		var instance: RealmSwiftFHIR.DiagnosticReport?
		do {
			instance = try runDiagnosticReport8()
			try runDiagnosticReport8(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DiagnosticReport
			XCTAssertNotNil(copy)
			try runDiagnosticReport8(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DiagnosticReport successfully, but threw")
		}

		testDiagnosticReportRealm8(instance: instance!)
	}

    func testDiagnosticReport8RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DiagnosticReport = try runDiagnosticReport8()
            let copy = (instance.copy() as! RealmSwiftFHIR.DiagnosticReport)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DiagnosticReport's PKs, but threw: \(error)")
        }
    }

	func testDiagnosticReportRealm8(instance: RealmSwiftFHIR.DiagnosticReport) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDiagnosticReport8(realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DiagnosticReport.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DiagnosticReport()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DiagnosticReport.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDiagnosticReport8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DiagnosticReport.self).count)
	}
	
	@discardableResult
	func runDiagnosticReport8(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DiagnosticReport {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "diagnosticreport-example.json")
		
		XCTAssertEqual(inst.category?.coding[0].code, "HM")
		XCTAssertEqual(inst.category?.coding[0].system, "http://hl7.org/fhir/v2/0074")
		XCTAssertEqual(inst.code?.coding[0].code, "58410-2")
		XCTAssertEqual(inst.code?.coding[0].display, "Complete blood count (hemogram) panel - Blood by Automated count")
		XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
		XCTAssertEqual(inst.code?.coding[1].code, "CBC")
		XCTAssertEqual(inst.code?.coding[1].display, "MASTER FULL BLOOD COUNT")
		XCTAssertEqual(inst.code?.text, "Complete Blood Count")
		XCTAssertEqual(inst.contained[0].id, "r1")
		XCTAssertEqual(inst.contained[1].id, "r2")
		XCTAssertEqual(inst.contained[2].id, "r3")
		XCTAssertEqual(inst.contained[3].id, "r4")
		XCTAssertEqual(inst.contained[4].id, "r5")
		XCTAssertEqual(inst.contained[5].id, "r6")
		XCTAssertEqual(inst.contained[6].id, "r7")
		XCTAssertEqual(inst.contained[7].id, "r8")
		XCTAssertEqual(inst.contained[8].id, "r9")
		XCTAssertEqual(inst.contained[9].id, "r10")
		XCTAssertEqual(inst.effectiveDateTime?.description, "2011-03-04T08:30:00+11:00")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
		XCTAssertEqual(inst.id, "101")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.com/lab/reports")
		XCTAssertEqual(inst.identifier[0].value, "5234342")
		XCTAssertEqual(inst.issued?.description, "2011-03-04T11:45:33+11:00")
		XCTAssertEqual(inst.performer?.display, "Acme Laboratory, Inc")
		XCTAssertEqual(inst.performer?.reference, "Organization/1832473e-2fe0-452d-abe9-3cdb9879522f")
		XCTAssertEqual(inst.presentedForm[0].contentType, "application/pdf")
		XCTAssertEqual(inst.presentedForm[0].language, "en-AU")
		XCTAssertEqual(inst.presentedForm[0].title, "HTML Report")
		XCTAssertEqual(inst.result[0].reference, "#r1")
		XCTAssertEqual(inst.result[1].reference, "#r2")
		XCTAssertEqual(inst.result[2].reference, "#r3")
		XCTAssertEqual(inst.result[3].reference, "#r4")
		XCTAssertEqual(inst.result[4].reference, "#r5")
		XCTAssertEqual(inst.result[5].reference, "#r6")
		XCTAssertEqual(inst.result[6].reference, "#r7")
		XCTAssertEqual(inst.result[7].reference, "#r8")
		XCTAssertEqual(inst.result[8].reference, "#r9")
		XCTAssertEqual(inst.result[9].reference, "#r10")
		XCTAssertEqual(inst.status, "final")
		XCTAssertEqual(inst.subject?.reference, "Patient/pat2")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
