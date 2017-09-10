//
//  SubstanceTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class SubstanceTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func inflateFrom(filename: String) throws -> FireKit.Substance {
		return try inflateFrom(data: try readJSONFile(filename))
	}
	
	func inflateFrom(data: Data) throws -> FireKit.Substance {
      let data = NSKeyedArchiver.archivedData(withRootObject: data)
		  let instance = try JSONDecoder().decode(FireKit.Substance.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testSubstance1() {		
		var instance: FireKit.Substance?
		do {
			instance = try runSubstance1()
			try runSubstance1(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Substance
			XCTAssertNotNil(copy)
			try runSubstance1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubstance1(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm1(instance!)
	}

    func testSubstance1RealmPK() {        
        do {
            let instance: FireKit.Substance = try runSubstance1()
            let copy = (instance.copy() as! FireKit.Substance)

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
            XCTAssertTrue(false, "Must instantiate and test Substance's PKs, but threw: \(error)")
        }
    }

	func testSubstanceRealm1(_ instance: FireKit.Substance) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runSubstance1(JSONEncoder().encode(realm.objects(FireKit.Substance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Substance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Substance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Substance.self).count)
	}
	
	@discardableResult
	func runSubstance1(_ data: Data? = nil) throws -> FireKit.Substance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "substance-example-amoxicillin-clavulanate.json")
		
		XCTAssertEqual(inst.category[0].coding[0].code, "drug")
		XCTAssertEqual(inst.category[0].coding[0].display, "Drug or Medicament")
		XCTAssertEqual(inst.category[0].coding[0].system, "http://hl7.org.fhir/substance-category")
		XCTAssertEqual(inst.code?.coding[0].code, "392259005")
		XCTAssertEqual(inst.code?.coding[0].display, "Amoxicillin + clavulanate potassium 875mg/125mg tablet (product)")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.contained[0].id, "ingr1")
		XCTAssertEqual(inst.contained[1].id, "ingr2")
		XCTAssertEqual(inst.description_fhir, "Augmentin 875")
		XCTAssertEqual(inst.id, "f205")
		XCTAssertEqual(inst.ingredient[0].quantity?.denominator?.code, "mg")
		XCTAssertEqual(inst.ingredient[0].quantity?.denominator?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.ingredient[0].quantity?.denominator?.unit, "mg")
		XCTAssertTrue(inst.ingredient[0].quantity?.denominator?.value! == RealmDecimal(string: "1000"))
		XCTAssertEqual(inst.ingredient[0].quantity?.numerator?.code, "mg")
		XCTAssertEqual(inst.ingredient[0].quantity?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.ingredient[0].quantity?.numerator?.unit, "mg")
		XCTAssertTrue(inst.ingredient[0].quantity?.numerator?.value! == RealmDecimal(string: "875"))
		XCTAssertEqual(inst.ingredient[0].substance?.reference, "#ingr1")
		XCTAssertEqual(inst.ingredient[1].quantity?.denominator?.code, "mg")
		XCTAssertEqual(inst.ingredient[1].quantity?.denominator?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.ingredient[1].quantity?.denominator?.unit, "mg")
		XCTAssertTrue(inst.ingredient[1].quantity?.denominator?.value! == RealmDecimal(string: "1000"))
		XCTAssertEqual(inst.ingredient[1].quantity?.numerator?.code, "mg")
		XCTAssertEqual(inst.ingredient[1].quantity?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.ingredient[1].quantity?.numerator?.unit, "mg")
		XCTAssertTrue(inst.ingredient[1].quantity?.numerator?.value! == RealmDecimal(string: "125"))
		XCTAssertEqual(inst.ingredient[1].substance?.reference, "#ingr2")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance2() {		
		var instance: FireKit.Substance?
		do {
			instance = try runSubstance2()
			try runSubstance2(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Substance
			XCTAssertNotNil(copy)
			try runSubstance2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubstance2(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm2(instance!)
	}

    func testSubstance2RealmPK() {        
        do {
            let instance: FireKit.Substance = try runSubstance2()
            let copy = (instance.copy() as! FireKit.Substance)

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
            XCTAssertTrue(false, "Must instantiate and test Substance's PKs, but threw: \(error)")
        }
    }

	func testSubstanceRealm2(_ instance: FireKit.Substance) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runSubstance2(JSONEncoder().encode(realm.objects(FireKit.Substance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Substance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Substance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Substance.self).count)
	}
	
	@discardableResult
	func runSubstance2(_ data: Data? = nil) throws -> FireKit.Substance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "substance-example-f201-dust.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "406466009")
		XCTAssertEqual(inst.code?.coding[0].display, "House dust allergen")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance3() {		
		var instance: FireKit.Substance?
		do {
			instance = try runSubstance3()
			try runSubstance3(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Substance
			XCTAssertNotNil(copy)
			try runSubstance3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubstance3(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm3(instance!)
	}

    func testSubstance3RealmPK() {        
        do {
            let instance: FireKit.Substance = try runSubstance3()
            let copy = (instance.copy() as! FireKit.Substance)

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
            XCTAssertTrue(false, "Must instantiate and test Substance's PKs, but threw: \(error)")
        }
    }

	func testSubstanceRealm3(_ instance: FireKit.Substance) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runSubstance3(JSONEncoder().encode(realm.objects(FireKit.Substance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Substance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Substance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Substance.self).count)
	}
	
	@discardableResult
	func runSubstance3(_ data: Data? = nil) throws -> FireKit.Substance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "substance-example-f202-staphylococcus.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "3092008")
		XCTAssertEqual(inst.code?.coding[0].display, "Staphylococcus Aureus")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f202")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance4() {		
		var instance: FireKit.Substance?
		do {
			instance = try runSubstance4()
			try runSubstance4(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Substance
			XCTAssertNotNil(copy)
			try runSubstance4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubstance4(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm4(instance!)
	}

    func testSubstance4RealmPK() {        
        do {
            let instance: FireKit.Substance = try runSubstance4()
            let copy = (instance.copy() as! FireKit.Substance)

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
            XCTAssertTrue(false, "Must instantiate and test Substance's PKs, but threw: \(error)")
        }
    }

	func testSubstanceRealm4(_ instance: FireKit.Substance) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runSubstance4(JSONEncoder().encode(realm.objects(FireKit.Substance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Substance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Substance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Substance.self).count)
	}
	
	@discardableResult
	func runSubstance4(_ data: Data? = nil) throws -> FireKit.Substance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "substance-example-f203-potassium.json")
		
		XCTAssertEqual(inst.category[0].coding[0].code, "chemical")
		XCTAssertEqual(inst.category[0].coding[0].display, "Chemical")
		XCTAssertEqual(inst.category[0].coding[0].system, "http://hl7.org.fhir/substance-category")
		XCTAssertEqual(inst.code?.coding[0].code, "88480006")
		XCTAssertEqual(inst.code?.coding[0].display, "Potassium")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f203")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.org/indentifiers/substances")
		XCTAssertEqual(inst.identifier[0].value, "1234")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance5() {		
		var instance: FireKit.Substance?
		do {
			instance = try runSubstance5()
			try runSubstance5(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Substance
			XCTAssertNotNil(copy)
			try runSubstance5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubstance5(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm5(instance!)
	}

    func testSubstance5RealmPK() {        
        do {
            let instance: FireKit.Substance = try runSubstance5()
            let copy = (instance.copy() as! FireKit.Substance)

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
            XCTAssertTrue(false, "Must instantiate and test Substance's PKs, but threw: \(error)")
        }
    }

	func testSubstanceRealm5(_ instance: FireKit.Substance) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runSubstance5(JSONEncoder().encode(realm.objects(FireKit.Substance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Substance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Substance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Substance.self).count)
	}
	
	@discardableResult
	func runSubstance5(_ data: Data? = nil) throws -> FireKit.Substance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "substance-example-silver-nitrate-product.json")
		
		XCTAssertEqual(inst.category[0].coding[0].code, "chemical")
		XCTAssertEqual(inst.category[0].coding[0].display, "Chemical")
		XCTAssertEqual(inst.category[0].coding[0].system, "http://hl7.org.fhir/substance-category")
		XCTAssertEqual(inst.code?.coding[0].code, "333346007")
		XCTAssertEqual(inst.code?.coding[0].display, "Silver nitrate 20% solution (product)")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.description_fhir, "Solution for silver nitrate stain")
		XCTAssertEqual(inst.id, "f204")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.org/indentifiers/substances")
		XCTAssertEqual(inst.identifier[0].value, "15970")
		XCTAssertEqual(inst.instance[0].expiry?.description, "2018-01-01")
		XCTAssertEqual(inst.instance[0].identifier?.system, "http://acme.org/indentifiers/substances/lot")
		XCTAssertEqual(inst.instance[0].identifier?.value, "AB94687")
		XCTAssertEqual(inst.instance[0].quantity?.code, "mL")
		XCTAssertEqual(inst.instance[0].quantity?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.instance[0].quantity?.unit, "mL")
		XCTAssertTrue(inst.instance[0].quantity?.value! == RealmDecimal(string: "100"))
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance6() {		
		var instance: FireKit.Substance?
		do {
			instance = try runSubstance6()
			try runSubstance6(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Substance
			XCTAssertNotNil(copy)
			try runSubstance6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubstance6(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm6(instance!)
	}

    func testSubstance6RealmPK() {        
        do {
            let instance: FireKit.Substance = try runSubstance6()
            let copy = (instance.copy() as! FireKit.Substance)

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
            XCTAssertTrue(false, "Must instantiate and test Substance's PKs, but threw: \(error)")
        }
    }

	func testSubstanceRealm6(_ instance: FireKit.Substance) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runSubstance6(JSONEncoder().encode(realm.objects(FireKit.Substance.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Substance.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Substance()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Substance.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubstance6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Substance.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Substance.self).count)
	}
	
	@discardableResult
	func runSubstance6(_ data: Data? = nil) throws -> FireKit.Substance {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "substance-example.json")
		
		XCTAssertEqual(inst.category[0].coding[0].code, "allergen")
		XCTAssertEqual(inst.category[0].coding[0].display, "Allergen")
		XCTAssertEqual(inst.category[0].coding[0].system, "http://hl7.org.fhir/substance-category")
		XCTAssertEqual(inst.code?.text, "apitoxin (Honey Bee Venom)")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.org/indentifiers/substances")
		XCTAssertEqual(inst.identifier[0].value, "1463")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
