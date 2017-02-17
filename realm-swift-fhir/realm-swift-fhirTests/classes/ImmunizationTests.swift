//
//  ImmunizationTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-17.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ImmunizationTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Immunization {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Immunization {
		let instance = RealmSwiftFHIR.Immunization(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testImmunization1() {		
		var instance: RealmSwiftFHIR.Immunization?
		do {
			instance = try runImmunization1()
			try runImmunization1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Immunization
			XCTAssertNotNil(copy)
			try runImmunization1(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Immunization successfully, but threw")
		}

		testImmunizationRealm1(instance: instance!)
	}

    func testImmunization1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Immunization = try runImmunization1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Immunization)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Immunization's PKs, but threw: \(error)")
        }
    }

	func testImmunizationRealm1(instance: RealmSwiftFHIR.Immunization) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runImmunization1(realm.objects(RealmSwiftFHIR.Immunization.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Immunization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Immunization.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Immunization()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Immunization.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runImmunization1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Immunization.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runImmunization1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Immunization.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Immunization.self).count)
	}
	
	@discardableResult
	func runImmunization1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Immunization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "immunization-example-refused.json")
		
		XCTAssertEqual(inst.date?.description, "2013-01-10")
		XCTAssertEqual(inst.explanation?.reasonNotGiven[0].coding[0].code, "MEDPREC")
		XCTAssertEqual(inst.explanation?.reasonNotGiven[0].coding[0].display, "medical precaution")
		XCTAssertEqual(inst.explanation?.reasonNotGiven[0].coding[0].system, "http://hl7.org/fhir/v3/ActReason")
		XCTAssertEqual(inst.id, "notGiven")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertFalse(inst.reported.value ?? true)
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.vaccineCode?.coding[0].code, "01")
		XCTAssertEqual(inst.vaccineCode?.coding[0].display, "DTP")
		XCTAssertEqual(inst.vaccineCode?.coding[0].system, "http://hl7.org/fhir/sid/cvx")
		XCTAssertTrue(inst.wasNotGiven.value ?? false)
		
		return inst
	}
	
	func testImmunization2() {		
		var instance: RealmSwiftFHIR.Immunization?
		do {
			instance = try runImmunization2()
			try runImmunization2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Immunization
			XCTAssertNotNil(copy)
			try runImmunization2(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Immunization successfully, but threw")
		}

		testImmunizationRealm2(instance: instance!)
	}

    func testImmunization2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Immunization = try runImmunization2()
            let copy = (instance.copy() as! RealmSwiftFHIR.Immunization)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Immunization's PKs, but threw: \(error)")
        }
    }

	func testImmunizationRealm2(instance: RealmSwiftFHIR.Immunization) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runImmunization2(realm.objects(RealmSwiftFHIR.Immunization.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Immunization.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Immunization.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Immunization()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Immunization.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runImmunization2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Immunization.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runImmunization2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Immunization.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Immunization.self).count)
	}
	
	@discardableResult
	func runImmunization2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Immunization {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "immunization-example.json")
		
		XCTAssertEqual(inst.date?.description, "2013-01-10")
		XCTAssertEqual(inst.doseQuantity?.code, "mg")
		XCTAssertEqual(inst.doseQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertTrue(inst.doseQuantity?.value! == RealmDecimal(string: "5"))
		XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
		XCTAssertEqual(inst.expirationDate?.description, "2015-02-15")
		XCTAssertEqual(inst.explanation?.reason[0].coding[0].code, "429060002")
		XCTAssertEqual(inst.explanation?.reason[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[0].value, "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234")
		XCTAssertEqual(inst.location?.reference, "Location/1")
		XCTAssertEqual(inst.lotNumber, "AAJN11K")
		XCTAssertEqual(inst.manufacturer?.reference, "Organization/hl7")
		XCTAssertEqual(inst.note[0].text, "Notes on adminstration of vaccine")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.performer?.reference, "Practitioner/example")
		XCTAssertEqual(inst.reaction[0].date?.description, "2013-01-10")
		XCTAssertEqual(inst.reaction[0].detail?.reference, "Observation/example")
		XCTAssertTrue(inst.reaction[0].reported.value ?? false)
		XCTAssertFalse(inst.reported.value ?? true)
		XCTAssertEqual(inst.requester?.reference, "Practitioner/example")
		XCTAssertEqual(inst.route?.coding[0].code, "IM")
		XCTAssertEqual(inst.route?.coding[0].display, "Injection, intramuscular")
		XCTAssertEqual(inst.route?.coding[0].system, "http://hl7.org/fhir/v3/RouteOfAdministration")
		XCTAssertEqual(inst.site?.coding[0].code, "LA")
		XCTAssertEqual(inst.site?.coding[0].display, "left arm")
		XCTAssertEqual(inst.site?.coding[0].system, "http://hl7.org/fhir/v3/ActSite")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.vaccinationProtocol[0].authority?.reference, "Organization/hl7")
		XCTAssertEqual(inst.vaccinationProtocol[0].description_fhir, "Vaccination Protocol Sequence 1")
		XCTAssertEqual(inst.vaccinationProtocol[0].doseSequence.value, 1)
		XCTAssertEqual(inst.vaccinationProtocol[0].doseStatus?.coding[0].code, "count")
		XCTAssertEqual(inst.vaccinationProtocol[0].doseStatus?.coding[0].display, "Counts")
		XCTAssertEqual(inst.vaccinationProtocol[0].doseStatus?.coding[0].system, "http://hl7.org/fhir/vaccination-protocol-dose-status")
		XCTAssertEqual(inst.vaccinationProtocol[0].doseStatusReason?.coding[0].code, "coldchbrk")
		XCTAssertEqual(inst.vaccinationProtocol[0].doseStatusReason?.coding[0].display, "Cold chain break")
		XCTAssertEqual(inst.vaccinationProtocol[0].doseStatusReason?.coding[0].system, "http://hl7.org/fhir/vaccination-protocol-dose-status-reason")
		XCTAssertEqual(inst.vaccinationProtocol[0].series, "Vaccination Series 1")
		XCTAssertEqual(inst.vaccinationProtocol[0].seriesDoses.value, 2)
		XCTAssertEqual(inst.vaccinationProtocol[0].targetDisease[0].coding[0].code, "1857005")
		XCTAssertEqual(inst.vaccinationProtocol[0].targetDisease[0].coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.vaccineCode?.coding[0].code, "FLUVAX")
		XCTAssertEqual(inst.vaccineCode?.coding[0].system, "urn:oid:1.2.36.1.2001.1005.17")
		XCTAssertEqual(inst.vaccineCode?.text, "Fluvax (Influenza)")
		XCTAssertFalse(inst.wasNotGiven.value ?? true)
		
		return inst
	}
}
