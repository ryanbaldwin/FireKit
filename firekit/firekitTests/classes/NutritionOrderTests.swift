//
//  NutritionOrderTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-18.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-18
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class NutritionOrderTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.NutritionOrder {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.NutritionOrder {
      print("Inflating FireKit.NutritionOrder from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.NutritionOrder.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testNutritionOrder1() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder1()
      try runNutritionOrder1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm1(instance!)
  }

  func testNutritionOrder1RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder1()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm1(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder1(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder1(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-cardiacdiet.json")
    
    XCTAssertEqual(inst.allergyIntolerance[0].display, "Cashew Nuts")
    XCTAssertEqual(inst.allergyIntolerance[0].reference, "AllergyIntolerance/example")
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].code, "227493005")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].display, "Cashew Nut")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].version, "20140730")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].code, "dairy-free")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].system, "http://hl7.org/fhir/diet")
    XCTAssertEqual(inst.id, "cardiacdiet")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.oralDiet?.instruction, "Starting on 2/10 breakfast, maximum 400 ml fluids per meal")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.code, "g")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.unit, "grams")
    XCTAssertTrue(inst.oralDiet?.nutrient[0].amount?.value! == RealmDecimal(string: "2"))
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].code, "39972003")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].display, "Sodium")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.nutrient[1].amount?.code, "mL")
    XCTAssertEqual(inst.oralDiet?.nutrient[1].amount?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.oralDiet?.nutrient[1].amount?.unit, "milliliter")
    XCTAssertTrue(inst.oralDiet?.nutrient[1].amount?.value! == RealmDecimal(string: "1500"))
    XCTAssertEqual(inst.oralDiet?.nutrient[1].modifier?.coding[0].code, "33463005")
    XCTAssertEqual(inst.oralDiet?.nutrient[1].modifier?.coding[0].display, "Fluid")
    XCTAssertEqual(inst.oralDiet?.nutrient[1].modifier?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].code, "386619000")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].display, "Low sodium diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].code, "1040")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].display, "Low Sodium Diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].system, "http://goodhealthhospital.org/diet-type-codes")
    XCTAssertEqual(inst.oralDiet?.type[0].text, "Low sodium diet")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[0].code, "226208002")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[0].display, "Fluid restricted diet")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[1].code, "1040")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[1].display, "Fluid restricted diet")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[1].system, "http://goodhealthhospital.org/diet-type-codes")
    XCTAssertEqual(inst.oralDiet?.type[1].text, "Fluid restricted diet")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder2() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder2()
      try runNutritionOrder2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm2(instance!)
  }

  func testNutritionOrder2RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder2()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm2(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder2(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder2(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-diabeticdiet.json")
    
    XCTAssertEqual(inst.allergyIntolerance[0].display, "Cashew Nuts")
    XCTAssertEqual(inst.allergyIntolerance[0].reference, "AllergyIntolerance/example")
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].code, "227493005")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].display, "Cashew Nut")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].version, "20140730")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].code, "dairy-free")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].system, "http://hl7.org/fhir/diet")
    XCTAssertEqual(inst.id, "diabeticdiet")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.code, "g")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.unit, "grams")
    XCTAssertTrue(inst.oralDiet?.nutrient[0].amount?.value! == RealmDecimal(string: "75"))
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].code, "2331003")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].display, "Carbohydrate")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.boundsPeriod?.start?.description, "2015-02-10")
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.frequency.value, 3)
    XCTAssertTrue(inst.oralDiet?.schedule[0].repeat_fhir?.period! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.periodUnits, "d")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].code, "160670007")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].display, "Diabetic diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].code, "1030")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].display, "DD - Diabetic diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].system, "http://goodhealthhospital.org/diet-type-codes")
    XCTAssertEqual(inst.oralDiet?.type[0].text, "DD - Diabetic diet")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder3() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder3()
      try runNutritionOrder3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder3(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm3(instance!)
  }

  func testNutritionOrder3RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder3()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm3(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder3(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder3(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-diabeticsupplement.json")
    
    XCTAssertEqual(inst.allergyIntolerance[0].display, "Cashew Nuts")
    XCTAssertEqual(inst.allergyIntolerance[0].reference, "AllergyIntolerance/example")
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].code, "227493005")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].display, "Cashew Nut")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].version, "20140730")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].code, "kosher")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].system, "http://hl7.org/fhir/diet")
    XCTAssertEqual(inst.id, "diabeticsupplement")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.supplement[0].productName, "Glucerna")
    XCTAssertEqual(inst.supplement[0].quantity?.unit, "8 oz bottle")
    XCTAssertTrue(inst.supplement[0].quantity?.value! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.boundsPeriod?.start?.description, "2015-02-10T15:00:00Z")
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.frequency.value, 1)
    XCTAssertTrue(inst.supplement[0].schedule[0].repeat_fhir?.period! == RealmDecimal(string: "24"))
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.periodUnits, "h")
    XCTAssertTrue(inst.supplement[0].schedule[1].repeat_fhir?.duration! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.supplement[0].schedule[1].repeat_fhir?.durationUnits, "h")
    XCTAssertEqual(inst.supplement[0].schedule[1].repeat_fhir?.when, "HS")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].code, "443051000124104")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].display, "Adult diabetes specialty formula")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].code, "1010")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].display, "Adult diabetic formula")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].system, "http://goodhealthhospital.org/supplement-type-codes")
    XCTAssertEqual(inst.supplement[0].type?.text, "Adult diabetic formula")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder4() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder4()
      try runNutritionOrder4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder4(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm4(instance!)
  }

  func testNutritionOrder4RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder4()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm4(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder4(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder4(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-energysupplement.json")
    
    XCTAssertEqual(inst.allergyIntolerance[0].display, "Cashew Nuts")
    XCTAssertEqual(inst.allergyIntolerance[0].reference, "AllergyIntolerance/example")
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].code, "227493005")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].display, "Cashew Nut")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].version, "20140730")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].code, "kosher")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].system, "http://hl7.org/fhir/diet")
    XCTAssertEqual(inst.id, "energysupplement")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.supplement[0].productName, "Ensure")
    XCTAssertEqual(inst.supplement[0].quantity?.unit, "8 oz can")
    XCTAssertTrue(inst.supplement[0].quantity?.value! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.boundsPeriod?.start?.description, "2015-02-10")
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.frequency.value, 3)
    XCTAssertTrue(inst.supplement[0].schedule[0].repeat_fhir?.period! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.periodUnits, "d")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].code, "442971000124100")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].display, "Adult high energy formula")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].code, "1010")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].display, "Adult high energy drink")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].system, "http://goodhealthhospital.org/supplement-type-codes")
    XCTAssertEqual(inst.supplement[0].type?.text, "Adult high energy drink")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder5() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder5()
      try runNutritionOrder5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder5(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm5(instance!)
  }

  func testNutritionOrder5RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder5()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm5(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder5(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder5(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-enteralbolus.json")
    
    XCTAssertEqual(inst.allergyIntolerance[0].display, "Cashew Nuts")
    XCTAssertEqual(inst.allergyIntolerance[0].reference, "AllergyIntolerance/example")
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.enteralFormula?.additiveProductName, "Acme Lipid Additive")
    XCTAssertEqual(inst.enteralFormula?.additiveType?.coding[0].code, "lipid")
    XCTAssertEqual(inst.enteralFormula?.additiveType?.coding[0].display, "Modular lipid enteral formula component")
    XCTAssertEqual(inst.enteralFormula?.additiveType?.coding[0].system, "http://hl7.org/fhir/entformula-additive")
    XCTAssertEqual(inst.enteralFormula?.administrationInstruction, "240 mls every 4hrs ")
    XCTAssertEqual(inst.enteralFormula?.administration[0].quantity?.code, "mL")
    XCTAssertEqual(inst.enteralFormula?.administration[0].quantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.administration[0].quantity?.unit, "milliliters")
    XCTAssertTrue(inst.enteralFormula?.administration[0].quantity?.value! == RealmDecimal(string: "240"))
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.boundsPeriod?.start?.description, "2014-09-17T16:00:00Z")
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.frequency.value, 1)
    XCTAssertTrue(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.period! == RealmDecimal(string: "4"))
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.periodUnits, "h")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaProductName, "Acme High Protein Formula")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].code, "659311000124118")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].display, "Adult high protein formula")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].system, "http://usextension/snomed.info/sct")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.code, "cal/mL")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.unit, "calories per milliliter")
    XCTAssertTrue(inst.enteralFormula?.caloricDensity?.value! == RealmDecimal(string: "1.5"))
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.code, "mL/d")
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.unit, "milliliter/day")
    XCTAssertTrue(inst.enteralFormula?.maxVolumeToDeliver?.value! == RealmDecimal(string: "1440"))
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].code, "GT")
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].display, "Instillation, gastrostomy tube")
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].system, "http://hl7.org/fhir/v3/RouteOfAdministration")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].code, "227493005")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].display, "Cashew Nut")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].version, "20140730")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].code, "dairy-free")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].system, "http://hl7.org/fhir/diet")
    XCTAssertEqual(inst.id, "enteralbolus")
    XCTAssertEqual(inst.identifier[0].system, "http://www.acme.org/nutritionorders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder6() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder6()
      try runNutritionOrder6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder6(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm6(instance!)
  }

  func testNutritionOrder6RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder6()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm6(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder6(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder6(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-enteralcontinuous.json")
    
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.enteralFormula?.administrationInstruction, "Hold feedings from 7 pm to 7 am. Add MCT oil to increase calories from 1.0 cal/mL to 1.5 cal/mL")
    XCTAssertEqual(inst.enteralFormula?.administration[0].rateQuantity?.code, "mL/h")
    XCTAssertEqual(inst.enteralFormula?.administration[0].rateQuantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.administration[0].rateQuantity?.unit, "ml/hr")
    XCTAssertTrue(inst.enteralFormula?.administration[0].rateQuantity?.value! == RealmDecimal(string: "60"))
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.boundsPeriod?.start?.description, "2014-09-17T07:00:00Z")
    XCTAssertEqual(inst.enteralFormula?.administration[1].rateQuantity?.code, "mL/h")
    XCTAssertEqual(inst.enteralFormula?.administration[1].rateQuantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.administration[1].rateQuantity?.unit, "ml/hr")
    XCTAssertTrue(inst.enteralFormula?.administration[1].rateQuantity?.value! == RealmDecimal(string: "80"))
    XCTAssertEqual(inst.enteralFormula?.administration[1].schedule?.repeat_fhir?.boundsPeriod?.start?.description, "2014-09-17T11:00:00Z")
    XCTAssertEqual(inst.enteralFormula?.administration[2].rateQuantity?.code, "mL/h")
    XCTAssertEqual(inst.enteralFormula?.administration[2].rateQuantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.administration[2].rateQuantity?.unit, "ml/hr")
    XCTAssertTrue(inst.enteralFormula?.administration[2].rateQuantity?.value! == RealmDecimal(string: "100"))
    XCTAssertEqual(inst.enteralFormula?.administration[2].schedule?.repeat_fhir?.boundsPeriod?.start?.description, "2014-09-17T15:00:00Z")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaProductName, " Acme Diabetes Formula")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].code, "6547210000124112")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].display, "Diabetic specialty enteral formula")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].system, "http://snomed/sct")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.code, "cal/mL")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.unit, "calories per milliliter")
    XCTAssertTrue(inst.enteralFormula?.caloricDensity?.value! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.code, "mL/d")
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.unit, "milliliter/day")
    XCTAssertTrue(inst.enteralFormula?.maxVolumeToDeliver?.value! == RealmDecimal(string: "880"))
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].code, "NGT")
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].display, "Instillation, nasogastric tube")
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].system, "http://hl7.org/fhir/v3/RouteOfAdministration")
    XCTAssertEqual(inst.id, "enteralcontinuous")
    XCTAssertEqual(inst.identifier[0].system, "http://www.acme.org/nutritionorders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder7() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder7()
      try runNutritionOrder7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder7(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm7(instance!)
  }

  func testNutritionOrder7RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder7()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm7(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder7(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder7(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-fiberrestricteddiet.json")
    
    XCTAssertEqual(inst.allergyIntolerance[0].display, "Cashew Nuts")
    XCTAssertEqual(inst.allergyIntolerance[0].reference, "AllergyIntolerance/example")
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].code, "227493005")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].display, "Cashew Nut")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.excludeFoodModifier[0].coding[0].version, "20140730")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].code, "dairy-free")
    XCTAssertEqual(inst.foodPreferenceModifier[0].coding[0].system, "http://hl7.org/fhir/diet")
    XCTAssertEqual(inst.id, "fiberrestricteddiet")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.code, "g")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].amount?.unit, "grams")
    XCTAssertTrue(inst.oralDiet?.nutrient[0].amount?.value! == RealmDecimal(string: "50"))
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].code, "256674009")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].display, "Fat")
    XCTAssertEqual(inst.oralDiet?.nutrient[0].modifier?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.boundsPeriod?.start?.description, "2015-02-10")
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.frequency.value, 3)
    XCTAssertTrue(inst.oralDiet?.schedule[0].repeat_fhir?.period! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.periodUnits, "d")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].code, "15108003")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].display, "Restricted fiber diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].code, "1000")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].display, "Fiber restricted")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].system, "http://goodhealthhospital.org/diet-type-codes")
    XCTAssertEqual(inst.oralDiet?.type[0].text, "Fiber restricted diet")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[0].code, "16208003")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[0].display, "Low fat diet")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[1].code, "1100")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[1].display, "Low Fat")
    XCTAssertEqual(inst.oralDiet?.type[1].coding[1].system, "http://goodhealthhospital.org/diet-type-codes")
    XCTAssertEqual(inst.oralDiet?.type[1].text, "Low fat diet")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder8() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder8()
      try runNutritionOrder8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder8(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm8(instance!)
  }

  func testNutritionOrder8RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder8()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm8(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder8(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder8(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-infantenteral.json")
    
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.enteralFormula?.additiveProductName, "Acme High Carbohydrate Additive")
    XCTAssertEqual(inst.enteralFormula?.additiveType?.coding[0].code, "carbohydrate")
    XCTAssertEqual(inst.enteralFormula?.additiveType?.coding[0].display, "Modular carbohydrate enteral formula component")
    XCTAssertEqual(inst.enteralFormula?.additiveType?.coding[0].system, "http://hl7.org/fhir/entformula-additive")
    XCTAssertEqual(inst.enteralFormula?.administrationInstruction, "Add high calorie high carbohydrate additive to increase cal/oz from 24 cal/oz to 27 cal/oz.")
    XCTAssertEqual(inst.enteralFormula?.administration[0].quantity?.code, "[foz_us]")
    XCTAssertEqual(inst.enteralFormula?.administration[0].quantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.administration[0].quantity?.unit, "ounces")
    XCTAssertTrue(inst.enteralFormula?.administration[0].quantity?.value! == RealmDecimal(string: "4"))
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.boundsPeriod?.start?.description, "2014-09-17")
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.frequency.value, 1)
    XCTAssertTrue(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.period! == RealmDecimal(string: "3"))
    XCTAssertEqual(inst.enteralFormula?.administration[0].schedule?.repeat_fhir?.periodUnits, "h")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaProductName, "Acme Infant Formula + Iron")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].code, "412414007")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].display, "infant formula + iron")
    XCTAssertEqual(inst.enteralFormula?.baseFormulaType?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.code, "cal/[foz_us]")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.caloricDensity?.unit, "calories per ounce")
    XCTAssertTrue(inst.enteralFormula?.caloricDensity?.value! == RealmDecimal(string: "20"))
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.code, "[foz_us]")
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.enteralFormula?.maxVolumeToDeliver?.unit, "ounces")
    XCTAssertTrue(inst.enteralFormula?.maxVolumeToDeliver?.value! == RealmDecimal(string: "32"))
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].code, "PO")
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].display, "Swallow, oral")
    XCTAssertEqual(inst.enteralFormula?.routeofAdministration?.coding[0].system, "http://hl7.org/fhir/v3/RouteOfAdministration")
    XCTAssertTrue(inst.enteralFormula?.routeofAdministration?.coding[0].userSelected.value ?? false)
    XCTAssertEqual(inst.id, "infantenteral")
    XCTAssertEqual(inst.identifier[0].system, "http://www.acme.org/nutritionorders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder9() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder9()
      try runNutritionOrder9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder9(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm9(instance!)
  }

  func testNutritionOrder9RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder9()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm9(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder9(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder9(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-proteinsupplement.json")
    
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.encounter?.display, "Inpatient")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/example")
    XCTAssertEqual(inst.id, "proteinsupplement")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.supplement[0].instruction, "Beneprotein 1 scoop TID with meal.starting on  2015-02-10")
    XCTAssertEqual(inst.supplement[0].productName, "Beneprotein")
    XCTAssertEqual(inst.supplement[0].quantity?.code, "{scoop}")
    XCTAssertEqual(inst.supplement[0].quantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.supplement[0].quantity?.unit, "scoop")
    XCTAssertTrue(inst.supplement[0].quantity?.value! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.boundsPeriod?.start?.description, "2015-02-10")
    XCTAssertEqual(inst.supplement[0].schedule[0].repeat_fhir?.when, "C")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].code, "442991000124104")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].display, "Adult high protein formula")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].code, "1000")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].display, "High Protein Powder")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].system, "http://goodhealthhospital.org/supplement-type-codes")
    XCTAssertEqual(inst.supplement[0].type?.text, "High Protein Powder")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testNutritionOrder10() {   
    var instance: FireKit.NutritionOrder?
    do {
      instance = try runNutritionOrder10()
      try runNutritionOrder10(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.NutritionOrder
      XCTAssertNotNil(copy)
      try runNutritionOrder10(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runNutritionOrder10(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test NutritionOrder successfully, but threw: \(error)")
    }

    testNutritionOrderRealm10(instance!)
  }

  func testNutritionOrder10RealmPK() {    
    do {
        let instance: FireKit.NutritionOrder = try runNutritionOrder10()
        let copy = (instance.copy() as! FireKit.NutritionOrder)

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
            XCTAssertTrue(false, "Must instantiate and test NutritionOrder's PKs, but threw: \(error)")
        }
    }

  func testNutritionOrderRealm10(_ instance: FireKit.NutritionOrder) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runNutritionOrder10(JSONEncoder().encode(realm.objects(FireKit.NutritionOrder.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NutritionOrder.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NutritionOrder()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder10(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NutritionOrder.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runNutritionOrder10(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NutritionOrder.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NutritionOrder.self).count)
  }
  
  @discardableResult
  func runNutritionOrder10(_ data: Data? = nil) throws -> FireKit.NutritionOrder {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "nutritionorder-example-pureeddiet-simple.json")
    
    XCTAssertEqual(inst.dateTime?.description, "2014-09-17")
    XCTAssertEqual(inst.id, "pureeddiet-simple")
    XCTAssertEqual(inst.identifier[0].system, "http://goodhealthhospital.org/nutrition-orders")
    XCTAssertEqual(inst.identifier[0].value, "123")
    XCTAssertEqual(inst.oralDiet?.fluidConsistencyType[0].coding[0].code, "439021000124105")
    XCTAssertEqual(inst.oralDiet?.fluidConsistencyType[0].coding[0].display, "Dietary liquid consistency - nectar thick liquid")
    XCTAssertEqual(inst.oralDiet?.fluidConsistencyType[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.fluidConsistencyType[0].text, "Nectar thick liquids")
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.boundsPeriod?.start?.description, "2015-02-10")
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.frequency.value, 3)
    XCTAssertTrue(inst.oralDiet?.schedule[0].repeat_fhir?.period! == RealmDecimal(string: "1"))
    XCTAssertEqual(inst.oralDiet?.schedule[0].repeat_fhir?.periodUnits, "d")
    XCTAssertEqual(inst.oralDiet?.texture[0].modifier?.coding[0].code, "228055009")
    XCTAssertEqual(inst.oralDiet?.texture[0].modifier?.coding[0].display, "Liquidized food")
    XCTAssertEqual(inst.oralDiet?.texture[0].modifier?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.texture[0].modifier?.text, "Pureed")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].code, "226211001")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].display, "Pureed diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].code, "1010")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].display, "Pureed diet")
    XCTAssertEqual(inst.oralDiet?.type[0].coding[1].system, "http://goodhealthhospital.org/diet-type-codes")
    XCTAssertEqual(inst.oralDiet?.type[0].text, "Pureed diet")
    XCTAssertEqual(inst.orderer?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.orderer?.reference, "Practitioner/example")
    XCTAssertEqual(inst.patient?.display, "Peter Chalmers")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "active")
    XCTAssertEqual(inst.supplement[0].instruction, "Ensure Pudding at breakfast, lunch, supper")
    XCTAssertEqual(inst.supplement[0].productName, "Ensure Pudding 4 oz container")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].code, "442971000124100")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].display, "Adult high energy formula")
    XCTAssertEqual(inst.supplement[0].type?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].code, "1040")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].display, "Adult high energy pudding")
    XCTAssertEqual(inst.supplement[0].type?.coding[1].system, "http://goodhealthhospital.org/supplement-type-codes")
    XCTAssertEqual(inst.supplement[0].type?.text, "Adult high energy pudding")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
