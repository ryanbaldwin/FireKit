//
//  DataElementTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-04-06.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class DataElementTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.DataElement {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.DataElement {
		let instance = FireKit.DataElement(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDataElement1() {		
		var instance: FireKit.DataElement?
		do {
			instance = try runDataElement1()
			try runDataElement1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.DataElement
			XCTAssertNotNil(copy)
			try runDataElement1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDataElement1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DataElement successfully, but threw")
		}

		testDataElementRealm1(instance!)
	}

    func testDataElement1RealmPK() {        
        do {
            let instance: FireKit.DataElement = try runDataElement1()
            let copy = (instance.copy() as! FireKit.DataElement)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DataElement's PKs, but threw: \(error)")
        }
    }

	func testDataElementRealm1(_ instance: FireKit.DataElement) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDataElement1(realm.objects(FireKit.DataElement.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DataElement.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DataElement.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DataElement()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DataElement.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDataElement1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DataElement.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDataElement1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DataElement.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DataElement.self).count)
	}
	
	@discardableResult
	func runDataElement1(_ json: FHIRJSON? = nil) throws -> FireKit.DataElement {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("dataelement-example.json")
		
		XCTAssertEqual(inst.contained[0].id, "2179414")
		XCTAssertEqual(inst.contained[1].id, "2179414-permitted")
		XCTAssertEqual(inst.contained[2].id, "2179414-cm")
		XCTAssertEqual(inst.element[0].binding?.strength, "required")
		XCTAssertEqual(inst.element[0].binding?.valueSetReference?.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-valueset")
		XCTAssertEqual(inst.element[0].binding?.valueSetReference?.extension_fhir[0].valueReference?.reference, "#2179414-permitted")
		XCTAssertEqual(inst.element[0].binding?.valueSetReference?.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/11179-permitted-value-conceptmap")
		XCTAssertEqual(inst.element[0].binding?.valueSetReference?.extension_fhir[1].valueReference?.reference, "#2179414-cm")
		XCTAssertEqual(inst.element[0].binding?.valueSetReference?.reference, "#2179414")
		XCTAssertEqual(inst.element[0].definition, "The code representing the gender of a person.")
		XCTAssertEqual(inst.element[0].extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/minLength")
		XCTAssertEqual(inst.element[0].extension_fhir[0].valueInteger.value, 1)
		XCTAssertEqual(inst.element[0].extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/elementdefinition-question")
		XCTAssertEqual(inst.element[0].extension_fhir[1].valueString, "Gender")
		XCTAssertEqual(inst.element[0].maxLength.value, 13)
		XCTAssertEqual(inst.element[0].path, "Gender")
		XCTAssertEqual(inst.element[0].type[0].code, "CodeableConcept")
		XCTAssertEqual(inst.id, "gender")
		XCTAssertEqual(inst.identifier[0].value, "2179650")
		XCTAssertEqual(inst.name, "Gender Code")
		XCTAssertEqual(inst.publisher, "DCP")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.useContext[0].coding[0].display, "FBPP Pooled Database")
		XCTAssertEqual(inst.useContext[0].coding[0].system, "http://example.org/FBPP")
		XCTAssertEqual(inst.useContext[0].coding[1].display, "Demographics")
		XCTAssertEqual(inst.useContext[0].coding[1].system, "http://example.org/PhenX")
		XCTAssertEqual(inst.useContext[0].coding[2].display, "Pt. Administrative")
		XCTAssertEqual(inst.useContext[0].coding[2].system, "http://example.org/EligibilityCriteria")
		XCTAssertEqual(inst.useContext[0].coding[3].display, "UAMS New CDEs")
		XCTAssertEqual(inst.useContext[0].coding[3].system, "http://example.org/UAMSClinicalResearch")
		XCTAssertEqual(inst.useContext[0].coding[4].display, "Substance Abuse and ")
		XCTAssertEqual(inst.useContext[0].coding[4].system, "http://example.org/PhenX")
		XCTAssertEqual(inst.useContext[0].coding[5].display, "CSAERS Adverse Event")
		XCTAssertEqual(inst.useContext[0].coding[5].system, "http://example.org/Category")
		XCTAssertEqual(inst.useContext[0].coding[6].display, "Core: Tier 1")
		XCTAssertEqual(inst.useContext[0].coding[6].system, "http://example.org/PhenX")
		XCTAssertEqual(inst.useContext[0].coding[7].display, "Case Report Forms")
		XCTAssertEqual(inst.useContext[0].coding[7].system, "http://example.org/Category")
		XCTAssertEqual(inst.useContext[0].coding[8].display, "CSAERS Review Set")
		XCTAssertEqual(inst.useContext[0].coding[8].system, "http://example.org/Category")
		XCTAssertEqual(inst.useContext[0].coding[9].display, "CIAF")
		XCTAssertEqual(inst.useContext[0].coding[9].system, "http://example.org/Demonstration%20Applications")
		XCTAssertEqual(inst.version, "1.0")
		
		return inst
	}
	
	func testDataElement2() {		
		var instance: FireKit.DataElement?
		do {
			instance = try runDataElement2()
			try runDataElement2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.DataElement
			XCTAssertNotNil(copy)
			try runDataElement2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDataElement2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DataElement successfully, but threw")
		}

		testDataElementRealm2(instance!)
	}

    func testDataElement2RealmPK() {        
        do {
            let instance: FireKit.DataElement = try runDataElement2()
            let copy = (instance.copy() as! FireKit.DataElement)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DataElement's PKs, but threw: \(error)")
        }
    }

	func testDataElementRealm2(_ instance: FireKit.DataElement) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDataElement2(realm.objects(FireKit.DataElement.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.DataElement.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.DataElement.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.DataElement()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.DataElement.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDataElement2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.DataElement.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDataElement2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.DataElement.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.DataElement.self).count)
	}
	
	@discardableResult
	func runDataElement2(_ json: FHIRJSON? = nil) throws -> FireKit.DataElement {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("dataelement-labtestmaster-example.json")
		
		XCTAssertEqual(inst.element[0].alias[0].value, "Protime, PT")
		XCTAssertEqual(inst.element[0].comments, "Used to screen the integrity of the extrinsic and common pathways of coagulation and to monitor warfarin anticoagulation. ")
		XCTAssertEqual(inst.element[0].definition, "The PT test evaluates the extrinsic and common pathways of the coagulation cascade.")
		XCTAssertTrue(inst.element[0].exampleDecimal! == RealmDecimal(string: "10.0"))
		XCTAssertEqual(inst.element[0].extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/elementdefinition-allowedUnits")
		XCTAssertEqual(inst.element[0].extension_fhir[0].valueCodeableConcept?.coding[0].code, "s")
		XCTAssertEqual(inst.element[0].extension_fhir[0].valueCodeableConcept?.coding[0].display, "second")
		XCTAssertEqual(inst.element[0].extension_fhir[0].valueCodeableConcept?.coding[0].system, "http://unitsofmeasure.org")
		XCTAssertTrue(inst.element[0].extension_fhir[0].valueCodeableConcept?.coding[0].userSelected.value ?? false)
		XCTAssertEqual(inst.element[0].extension_fhir[0].valueCodeableConcept?.coding[0].version, "1.9")
		XCTAssertEqual(inst.element[0].extension_fhir[0].valueCodeableConcept?.text, "second")
		XCTAssertEqual(inst.element[0].mapping[0].identity, "loinc")
		XCTAssertEqual(inst.element[0].mapping[0].map, "5964-2")
		XCTAssertEqual(inst.element[0].path, "prothrombin")
		XCTAssertEqual(inst.element[0].requirements, "This test is orderable. A plasma specimen in a 3.2% sodium citrate blue top tube is required.")
		XCTAssertEqual(inst.element[0].type[0].code, "decimal")
		XCTAssertEqual(inst.id, "prothrombin")
		XCTAssertEqual(inst.identifier[0].assigner?.display, "Century Hospital Laboratory")
		XCTAssertEqual(inst.identifier[0].period?.start?.description, "2011-05-19")
		XCTAssertEqual(inst.identifier[0].system, "http://www.CenturyHospital/Laboratory/DirectoryofServices")
		XCTAssertEqual(inst.identifier[0].type?.text, "Prothrombin Time, PT")
		XCTAssertEqual(inst.identifier[0].value, "11")
		XCTAssertEqual(inst.mapping[0].comments, "Version 2.48 or later")
		XCTAssertEqual(inst.mapping[0].identity, "loinc")
		XCTAssertEqual(inst.mapping[0].name, "LOINC")
		XCTAssertEqual(inst.mapping[0].uri, "http://loinc.org/")
		XCTAssertEqual(inst.name, "Prothrombin Time")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
