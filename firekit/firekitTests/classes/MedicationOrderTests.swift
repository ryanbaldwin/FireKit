//
//  MedicationOrderTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class MedicationOrderTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func inflateFrom(filename: String) throws -> FireKit.MedicationOrder {
		return try inflateFrom(data: try readJSONFile(filename))
	}
	
	func inflateFrom(data: Data) throws -> FireKit.MedicationOrder {
      let data = NSKeyedArchiver.archivedData(withRootObject: data)
		  let instance = try JSONDecoder().decode(FireKit.MedicationOrder.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testMedicationOrder1() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder1()
			try runMedicationOrder1(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder1(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm1(instance!)
	}

    func testMedicationOrder1RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder1()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm1(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder1(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder1(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f001-combivent.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2013-05-25T19:32:52+01:00")
		XCTAssertEqual(inst.dispenseRequest?.expectedSupplyDuration?.code, "d")
		XCTAssertEqual(inst.dispenseRequest?.expectedSupplyDuration?.system, "urn:oid:2.16.840.1.113883.6.8")
		XCTAssertEqual(inst.dispenseRequest?.expectedSupplyDuration?.unit, "days")
		XCTAssertTrue(inst.dispenseRequest?.expectedSupplyDuration?.value! == RealmDecimal(string: "40"))
		XCTAssertEqual(inst.dispenseRequest?.numberOfRepeatsAllowed.value, 20)
		XCTAssertEqual(inst.dispenseRequest?.quantity?.code, "ug")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.system, "urn:oid:2.16.840.1.113883.6.8")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.unit, "mcg")
		XCTAssertTrue(inst.dispenseRequest?.quantity?.value! == RealmDecimal(string: "100"))
		XCTAssertEqual(inst.dispenseRequest?.validityPeriod?.end?.description, "2013-05-30")
		XCTAssertEqual(inst.dispenseRequest?.validityPeriod?.start?.description, "2013-04-08")
		XCTAssertEqual(inst.dosageInstruction[0].additionalInstructions?.text, "for use during pregnancy, contact physician")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.code, "ml")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.unit, "ml")
		XCTAssertTrue(inst.dosageInstruction[0].doseQuantity?.value! == RealmDecimal(string: "10"))
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "394899003")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "oral administration of treatment")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].code, "181220002")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].display, "Entire oral cavity")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].text, "3 tot 4 maal daags 1 flacon")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.end?.description, "2013-11-05")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2013-08-04")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.frequency.value, 3)
		XCTAssertTrue(inst.dosageInstruction[0].timing?.repeat_fhir?.period! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.periodUnits, "d")
		XCTAssertEqual(inst.encounter?.display, "visit who leads to this priscription")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f001")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertEqual(inst.identifier[0].system, "http://www.bmc/portal/prescriptions")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "order9837293")
		XCTAssertEqual(inst.medicationReference?.display, "prescribed medication")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f001")
		XCTAssertEqual(inst.patient?.display, "P. van den Heuvel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f001")
		XCTAssertEqual(inst.prescriber?.display, "R.A. van den Berk")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f006")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].code, "13645005")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].display, "Chronic obstructive pulmonary disease")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder2() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder2()
			try runMedicationOrder2(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder2(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm2(instance!)
	}

    func testMedicationOrder2RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder2()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm2(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder2(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder2(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f002-crestor.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2013-04-08")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.code, "46992007")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.system, "http://snomed.info/sct")
		XCTAssertTrue(inst.dispenseRequest?.quantity?.value! == RealmDecimal(string: "90"))
		XCTAssertEqual(inst.dispenseRequest?.validityPeriod?.start?.description, "2013-04-08")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.code, "mg")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.unit, "mg")
		XCTAssertTrue(inst.dosageInstruction[0].doseQuantity?.value! == RealmDecimal(string: "10"))
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "386359008")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "Administration of drug or medicament via oral route")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].code, "181220002")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].display, "Entire oral cavity")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2013-08-04")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.frequency.value, 1)
		XCTAssertTrue(inst.dosageInstruction[0].timing?.repeat_fhir?.period! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.periodUnits, "d")
		XCTAssertEqual(inst.encounter?.display, "encounter who leads to this priscription")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f001")
		XCTAssertEqual(inst.id, "f002")
		XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/portal/prescriptions")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "order9837343")
		XCTAssertEqual(inst.medicationReference?.display, "prescribed medication")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f002")
		XCTAssertEqual(inst.patient?.display, "P. van den Heuvel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f001")
		XCTAssertEqual(inst.prescriber?.display, "R.A. van den Berk")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f006")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].code, "28036006")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].display, "High density lipoprotein cholesterol level")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder3() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder3()
			try runMedicationOrder3(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder3(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm3(instance!)
	}

    func testMedicationOrder3RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder3()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm3(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder3(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder3(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f003-tolbutamide.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2011-05-01")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.code, "46992007")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.system, "http://snomed.info/sct")
		XCTAssertTrue(inst.dispenseRequest?.quantity?.value! == RealmDecimal(string: "90"))
		XCTAssertEqual(inst.dispenseRequest?.validityPeriod?.start?.description, "2011-05-01")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.code, "mg")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.unit, "mg")
		XCTAssertTrue(inst.dosageInstruction[0].doseQuantity?.value! == RealmDecimal(string: "500"))
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "386359008")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "Administration of drug or medicament via oral route")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].code, "181220002")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].display, "Entire oral cavity")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2011-05-01")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.frequency.value, 3)
		XCTAssertTrue(inst.dosageInstruction[0].timing?.repeat_fhir?.period! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.periodUnits, "d")
		XCTAssertEqual(inst.encounter?.display, "encounter who leads to this priscription")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f002")
		XCTAssertEqual(inst.id, "f003")
		XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/portal/prescriptions")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "order9845343")
		XCTAssertEqual(inst.medicationReference?.display, "prescribed medication")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f003")
		XCTAssertEqual(inst.patient?.display, "P. van den Heuvel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f001")
		XCTAssertEqual(inst.prescriber?.display, "S.M. Heps")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f007")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].code, "444780001")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].display, "High glucose level in blood")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder4() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder4()
			try runMedicationOrder4(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder4(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm4(instance!)
	}

    func testMedicationOrder4RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder4()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm4(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder4(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder4(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f004-metoprolol.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2011-05-01")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.code, "46992007")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.system, "http://snomed.info/sct")
		XCTAssertTrue(inst.dispenseRequest?.quantity?.value! == RealmDecimal(string: "90"))
		XCTAssertEqual(inst.dispenseRequest?.validityPeriod?.start?.description, "2011-05-01")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.code, "mg")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.unit, "mg")
		XCTAssertTrue(inst.dosageInstruction[0].doseQuantity?.value! == RealmDecimal(string: "50"))
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "386359008")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "Administration of drug or medicament via oral route")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].code, "181220002")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].display, "Entire oral cavity")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2011-05-01")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.frequency.value, 1)
		XCTAssertTrue(inst.dosageInstruction[0].timing?.repeat_fhir?.period! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.periodUnits, "d")
		XCTAssertEqual(inst.encounter?.display, "encounter who leads to this priscription")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f001")
		XCTAssertEqual(inst.id, "f004")
		XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/portal/prescriptions")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "order9845343")
		XCTAssertEqual(inst.medicationReference?.display, "prescribed medication")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f004")
		XCTAssertEqual(inst.patient?.display, "P. van den Heuvel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f001")
		XCTAssertEqual(inst.prescriber?.display, "S.M. Heps")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f007")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].code, "38341003")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].display, "High blood pressure")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder5() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder5()
			try runMedicationOrder5(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder5(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm5(instance!)
	}

    func testMedicationOrder5RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder5()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm5(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder5(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder5(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f005-enalapril.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2011-05-01")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.code, "46992007")
		XCTAssertEqual(inst.dispenseRequest?.quantity?.system, "http://snomed.info/sct")
		XCTAssertTrue(inst.dispenseRequest?.quantity?.value! == RealmDecimal(string: "28"))
		XCTAssertEqual(inst.dispenseRequest?.validityPeriod?.start?.description, "2011-05-01")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.code, "mg")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.unit, "mg")
		XCTAssertTrue(inst.dosageInstruction[0].doseQuantity?.value! == RealmDecimal(string: "5"))
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "386359008")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "Administration of drug or medicament via oral route")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].code, "181220002")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].display, "Entire oral cavity")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2011-05-01")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.frequency.value, 1)
		XCTAssertTrue(inst.dosageInstruction[0].timing?.repeat_fhir?.period! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.periodUnits, "d")
		XCTAssertEqual(inst.encounter?.display, "encounter who leads to this priscription")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f001")
		XCTAssertEqual(inst.id, "f005")
		XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/portal/prescriptions")
		XCTAssertEqual(inst.identifier[0].use, "official")
		XCTAssertEqual(inst.identifier[0].value, "order9823343")
		XCTAssertEqual(inst.medicationReference?.display, "prescribed medication")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f005")
		XCTAssertEqual(inst.patient?.display, "P. van den Heuvel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f001")
		XCTAssertEqual(inst.prescriber?.display, "S.M. Heps")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f007")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].code, "38341003")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].display, "High blood pressure")
		XCTAssertEqual(inst.reasonCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder6() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder6()
			try runMedicationOrder6(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder6(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm6(instance!)
	}

    func testMedicationOrder6RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder6()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm6(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder6(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder6(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f201-salmeterol.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2013-03-11")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.code, "PUFF")
		XCTAssertEqual(inst.dosageInstruction[0].doseQuantity?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
		XCTAssertTrue(inst.dosageInstruction[0].doseQuantity?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.code, "259032004")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.unit, "daily")
		XCTAssertTrue(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.code, "415215001")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.unit, "puffs")
		XCTAssertTrue(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.value! == RealmDecimal(string: "2"))
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].code, "320276009")
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].display, "Salmeterol+fluticasone 25/250ug inhaler")
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "321667001")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "Respiratory tract")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].code, "74262004")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].display, "Oral cavity")
		XCTAssertEqual(inst.dosageInstruction[0].siteCodeableConcept?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].text, "aerosol 25/250ug/do 120do 2x - 1 dose - daily")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.end?.description, "2013-05-11")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2013-03-11")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.frequency.value, 2)
		XCTAssertTrue(inst.dosageInstruction[0].timing?.repeat_fhir?.period! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.periodUnits, "d")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.medicationReference?.display, "25ug Salmeterol + 250ug Fluticasone")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f201")
		XCTAssertEqual(inst.patient?.display, "Roel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f201")
		XCTAssertEqual(inst.prescriber?.display, "Dokter Bonsig")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.reasonReference?.display, "fever")
		XCTAssertEqual(inst.reasonReference?.reference, "Condition/f201")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder7() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder7()
			try runMedicationOrder7(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder7(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder7(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm7(instance!)
	}

    func testMedicationOrder7RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder7()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm7(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder7(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder7(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f202-flucloxacilline.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2013-03-11")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.code, "258702006")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.unit, "hours")
		XCTAssertTrue(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.value! == RealmDecimal(string: "24"))
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.code, "258682000")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.unit, "gram")
		XCTAssertTrue(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.value! == RealmDecimal(string: "12"))
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].code, "323493005")
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].display, "Injected floxacillin")
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].code, "47625008")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].display, "Intravenous route")
		XCTAssertEqual(inst.dosageInstruction[0].route?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].text, "Flucloxacilline 12g/24h")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.end?.description, "2013-03-21")
		XCTAssertEqual(inst.dosageInstruction[0].timing?.repeat_fhir?.boundsPeriod?.start?.description, "2013-03-11")
		XCTAssertEqual(inst.encounter?.display, "Roel's encounter on March eleventh 2013")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f203")
		XCTAssertEqual(inst.id, "f202")
		XCTAssertEqual(inst.medicationReference?.display, "Flucloxacilline")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f202")
		XCTAssertEqual(inst.patient?.display, "Roel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f201")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.reasonReference?.display, "sepsis")
		XCTAssertEqual(inst.reasonReference?.reference, "Condition/f203")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedicationOrder8() {		
		var instance: FireKit.MedicationOrder?
		do {
			instance = try runMedicationOrder8()
			try runMedicationOrder8(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.MedicationOrder
			XCTAssertNotNil(copy)
			try runMedicationOrder8(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedicationOrder8(JSONEncoder().encode(copy!))  
		}
		catch let error {
			XCTAssertTrue(false, "Must instantiate and test MedicationOrder successfully, but threw: \(error)")
		}

		testMedicationOrderRealm8(instance!)
	}

    func testMedicationOrder8RealmPK() {        
        do {
            let instance: FireKit.MedicationOrder = try runMedicationOrder8()
            let copy = (instance.copy() as! FireKit.MedicationOrder)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test MedicationOrder's PKs, but threw: \(error)")
        }
    }

	func testMedicationOrderRealm8(_ instance: FireKit.MedicationOrder) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedicationOrder8(JSONEncoder().encode(realm.objects(FireKit.MedicationOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MedicationOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MedicationOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MedicationOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedicationOrder8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MedicationOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MedicationOrder.self).count)
	}
	
	@discardableResult
	func runMedicationOrder8(_ data: Data? = nil) throws -> FireKit.MedicationOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medicationorder-example-f203-paracetamol.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2013-04-04")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.code, "258702006")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.unit, "hours")
		XCTAssertTrue(inst.dosageInstruction[0].maxDosePerPeriod?.denominator?.value! == RealmDecimal(string: "24"))
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.code, "258684004")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.unit, "milligram")
		XCTAssertTrue(inst.dosageInstruction[0].maxDosePerPeriod?.numerator?.value! == RealmDecimal(string: "3000"))
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].code, "322236009")
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].display, "Paracetamol 500mg tablet")
		XCTAssertEqual(inst.dosageInstruction[0].method?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.dosageInstruction[0].text, "Paracetamol 3xdaags 1000mg")
		XCTAssertEqual(inst.encounter?.display, "Roel's encounter on April fourth 2013")
		XCTAssertEqual(inst.encounter?.reference, "Encounter/f201")
		XCTAssertEqual(inst.id, "f203")
		XCTAssertEqual(inst.medicationReference?.display, "Paracetamol")
		XCTAssertEqual(inst.medicationReference?.reference, "Medication/f203")
		XCTAssertEqual(inst.patient?.display, "Roel")
		XCTAssertEqual(inst.patient?.reference, "Patient/f201")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.reasonReference?.display, "fever")
		XCTAssertEqual(inst.reasonReference?.reference, "Condition/f201")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
