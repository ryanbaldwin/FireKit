//
//  SubstanceTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class SubstanceTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Substance {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Substance {
		let instance = RealmSwiftFHIR.Substance(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSubstance1() {		
		var instance: RealmSwiftFHIR.Substance?
		do {
			instance = try runSubstance1()
			try runSubstance1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm1(instance: instance!)
	}

	func testSubstanceRealm1(instance: RealmSwiftFHIR.Substance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubstance1(realm.objects(RealmSwiftFHIR.Substance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Substance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubstance1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Substance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "substance-example-amoxicillin-clavulanate.json")
		
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
		var instance: RealmSwiftFHIR.Substance?
		do {
			instance = try runSubstance2()
			try runSubstance2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm2(instance: instance!)
	}

	func testSubstanceRealm2(instance: RealmSwiftFHIR.Substance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubstance2(realm.objects(RealmSwiftFHIR.Substance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Substance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubstance2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Substance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "substance-example-f201-dust.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "406466009")
		XCTAssertEqual(inst.code?.coding[0].display, "House dust allergen")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance3() {		
		var instance: RealmSwiftFHIR.Substance?
		do {
			instance = try runSubstance3()
			try runSubstance3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm3(instance: instance!)
	}

	func testSubstanceRealm3(instance: RealmSwiftFHIR.Substance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubstance3(realm.objects(RealmSwiftFHIR.Substance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Substance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubstance3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Substance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "substance-example-f202-staphylococcus.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "3092008")
		XCTAssertEqual(inst.code?.coding[0].display, "Staphylococcus Aureus")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f202")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubstance4() {		
		var instance: RealmSwiftFHIR.Substance?
		do {
			instance = try runSubstance4()
			try runSubstance4(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm4(instance: instance!)
	}

	func testSubstanceRealm4(instance: RealmSwiftFHIR.Substance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubstance4(realm.objects(RealmSwiftFHIR.Substance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Substance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubstance4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Substance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "substance-example-f203-potassium.json")
		
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
		var instance: RealmSwiftFHIR.Substance?
		do {
			instance = try runSubstance5()
			try runSubstance5(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm5(instance: instance!)
	}

	func testSubstanceRealm5(instance: RealmSwiftFHIR.Substance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubstance5(realm.objects(RealmSwiftFHIR.Substance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Substance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubstance5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Substance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "substance-example-silver-nitrate-product.json")
		
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
		var instance: RealmSwiftFHIR.Substance?
		do {
			instance = try runSubstance6()
			try runSubstance6(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Substance successfully, but threw")
		}

		testSubstanceRealm6(instance: instance!)
	}

	func testSubstanceRealm6(instance: RealmSwiftFHIR.Substance) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubstance6(realm.objects(RealmSwiftFHIR.Substance.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Substance.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Substance.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubstance6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Substance {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "substance-example.json")
		
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
