//
//  EncounterTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-19.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-19
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class EncounterTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Encounter {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Encounter {
      print("Inflating FireKit.Encounter from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.Encounter.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testEncounter1() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter1()
      try runEncounter1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm1(instance!)
  }

  func testEncounter1RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter1()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm1(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter1(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter1(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-f001-heart.json")
    
    XCTAssertEqual(inst.class_fhir, "outpatient")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].code, "305956004")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].display, "Referral by physician")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].code, "306689006")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].display, "Discharge to home")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.system, "http://www.amc.nl/zorgportal/identifiers/pre-admissions")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.use, "official")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.value, "93042")
    XCTAssertEqual(inst.id, "f001")
    XCTAssertEqual(inst.identifier[0].system, "http://www.amc.nl/zorgportal/identifiers/visits")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "v1451")
    XCTAssertEqual(inst.length?.code, "min")
    XCTAssertEqual(inst.length?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.length?.unit, "min")
    XCTAssertTrue(inst.length?.value! == RealmDecimal(string: "140"))
    XCTAssertEqual(inst.participant[0].individual?.display, "P. Voigt")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/f002")
    XCTAssertEqual(inst.patient?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f001")
    XCTAssertEqual(inst.priority?.coding[0].code, "310361003")
    XCTAssertEqual(inst.priority?.coding[0].display, "Non-urgent cardiological admission")
    XCTAssertEqual(inst.priority?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].coding[0].code, "34068001")
    XCTAssertEqual(inst.reason[0].coding[0].display, "Heart valve replacement")
    XCTAssertEqual(inst.reason[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.serviceProvider?.display, "Burgers University Medical Center")
    XCTAssertEqual(inst.serviceProvider?.reference, "Organization/f001")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type[0].coding[0].code, "270427003")
    XCTAssertEqual(inst.type[0].coding[0].display, "Patient-initiated encounter")
    XCTAssertEqual(inst.type[0].coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testEncounter2() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter2()
      try runEncounter2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm2(instance!)
  }

  func testEncounter2RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter2()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm2(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter2(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter2(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-f002-lung.json")
    
    XCTAssertEqual(inst.class_fhir, "outpatient")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].code, "305997006")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].display, "Referral by radiologist")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].code, "306689006")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].display, "Discharge to home")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.system, "http://www.bmc.nl/zorgportal/identifiers/pre-admissions")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.use, "official")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.value, "98682")
    XCTAssertEqual(inst.id, "f002")
    XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/encounters")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "v3251")
    XCTAssertEqual(inst.length?.code, "min")
    XCTAssertEqual(inst.length?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.length?.unit, "min")
    XCTAssertTrue(inst.length?.value! == RealmDecimal(string: "140"))
    XCTAssertEqual(inst.participant[0].individual?.display, "M.I.M Versteegh")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/f003")
    XCTAssertEqual(inst.patient?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f001")
    XCTAssertEqual(inst.priority?.coding[0].code, "103391001")
    XCTAssertEqual(inst.priority?.coding[0].display, "Urgent")
    XCTAssertEqual(inst.priority?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].coding[0].code, "34068001")
    XCTAssertEqual(inst.reason[0].coding[0].display, "Partial lobectomy of lung")
    XCTAssertEqual(inst.reason[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.serviceProvider?.display, "BMC")
    XCTAssertEqual(inst.serviceProvider?.reference, "Organization/f001")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type[0].coding[0].code, "270427003")
    XCTAssertEqual(inst.type[0].coding[0].display, "Patient-initiated encounter")
    XCTAssertEqual(inst.type[0].coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testEncounter3() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter3()
      try runEncounter3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter3(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm3(instance!)
  }

  func testEncounter3RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter3()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm3(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter3(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter3(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-f003-abscess.json")
    
    XCTAssertEqual(inst.class_fhir, "outpatient")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].code, "305956004")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].display, "Referral by physician")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].code, "306689006")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].display, "Discharge to home")
    XCTAssertEqual(inst.hospitalization?.dischargeDisposition?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.system, "http://www.bmc.nl/zorgportal/identifiers/pre-admissions")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.use, "official")
    XCTAssertEqual(inst.hospitalization?.preAdmissionIdentifier?.value, "93042")
    XCTAssertEqual(inst.id, "f003")
    XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/encounters")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "v6751")
    XCTAssertEqual(inst.length?.code, "min")
    XCTAssertEqual(inst.length?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.length?.unit, "min")
    XCTAssertTrue(inst.length?.value! == RealmDecimal(string: "90"))
    XCTAssertEqual(inst.participant[0].individual?.display, "E.M. van den Broek")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/f001")
    XCTAssertEqual(inst.patient?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f001")
    XCTAssertEqual(inst.priority?.coding[0].code, "103391001")
    XCTAssertEqual(inst.priority?.coding[0].display, "Non-urgent ear, nose and throat admission")
    XCTAssertEqual(inst.priority?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].coding[0].code, "18099001")
    XCTAssertEqual(inst.reason[0].coding[0].display, "Retropharyngeal abscess")
    XCTAssertEqual(inst.reason[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/encounter-primaryDiagnosis")
    XCTAssertEqual(inst.reason[0].extension_fhir[0].valueInteger.value, 1)
    XCTAssertEqual(inst.serviceProvider?.reference, "Organization/f001")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type[0].coding[0].code, "270427003")
    XCTAssertEqual(inst.type[0].coding[0].display, "Patient-initiated encounter")
    XCTAssertEqual(inst.type[0].coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testEncounter4() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter4()
      try runEncounter4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter4(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm4(instance!)
  }

  func testEncounter4RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter4()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm4(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter4(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter4(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-f201-20130404.json")
    
    XCTAssertEqual(inst.class_fhir, "outpatient")
    XCTAssertEqual(inst.id, "f201")
    XCTAssertEqual(inst.identifier[0].use, "temp")
    XCTAssertEqual(inst.identifier[0].value, "Encounter_Roel_20130404")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.priority?.coding[0].code, "17621005")
    XCTAssertEqual(inst.priority?.coding[0].display, "Normal")
    XCTAssertEqual(inst.priority?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].text, "The patient had fever peaks over the last couple of days. He is worried about these peaks.")
    XCTAssertEqual(inst.serviceProvider?.reference, "Organization/f201")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type[0].coding[0].code, "11429006")
    XCTAssertEqual(inst.type[0].coding[0].display, "Consultation")
    XCTAssertEqual(inst.type[0].coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testEncounter5() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter5()
      try runEncounter5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter5(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm5(instance!)
  }

  func testEncounter5RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter5()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm5(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter5(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter5(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-f202-20130128.json")
    
    XCTAssertEqual(inst.class_fhir, "outpatient")
    XCTAssertEqual(inst.id, "f202")
    XCTAssertEqual(inst.identifier[0].use, "temp")
    XCTAssertEqual(inst.identifier[0].value, "Encounter_Roel_20130128")
    XCTAssertEqual(inst.indication[0].display, "Roel's TPF chemotherapy on January 28th, 2013")
    XCTAssertEqual(inst.indication[0].extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/encounter-primaryDiagnosis")
    XCTAssertEqual(inst.indication[0].extension_fhir[0].valueInteger.value, 1)
    XCTAssertEqual(inst.indication[0].reference, "Procedure/f201")
    XCTAssertEqual(inst.length?.code, "258701004")
    XCTAssertEqual(inst.length?.system, "http://snomed.info/sct")
    XCTAssertEqual(inst.length?.unit, "minutes")
    XCTAssertTrue(inst.length?.value! == RealmDecimal(string: "56"))
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.priority?.coding[0].code, "103391001")
    XCTAssertEqual(inst.priority?.coding[0].display, "Urgent")
    XCTAssertEqual(inst.priority?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/encounter-primaryDiagnosis")
    XCTAssertEqual(inst.reason[0].extension_fhir[0].valueInteger.value, 2)
    XCTAssertEqual(inst.reason[0].text, "The patient is treated for a tumor.")
    XCTAssertEqual(inst.serviceProvider?.reference, "Organization/f201")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type[0].coding[0].code, "367336001")
    XCTAssertEqual(inst.type[0].coding[0].display, "Chemotherapy")
    XCTAssertEqual(inst.type[0].coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testEncounter6() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter6()
      try runEncounter6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter6(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm6(instance!)
  }

  func testEncounter6RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter6()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm6(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter6(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter6(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-f203-20130311.json")
    
    XCTAssertEqual(inst.class_fhir, "inpatient")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].code, "309902002")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].display, "Clinical Oncology Department")
    XCTAssertEqual(inst.hospitalization?.admitSource?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.dietPreference[0].coding[0].code, "276026009")
    XCTAssertEqual(inst.hospitalization?.dietPreference[0].coding[0].display, "Fluid balance regulation")
    XCTAssertEqual(inst.hospitalization?.dietPreference[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.hospitalization?.reAdmission?.coding[0].display, "readmitted")
    XCTAssertEqual(inst.id, "f203")
    XCTAssertEqual(inst.identifier[0].use, "temp")
    XCTAssertEqual(inst.identifier[0].value, "Encounter_Roel_20130311")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/f201")
    XCTAssertEqual(inst.patient?.display, "Roel")
    XCTAssertEqual(inst.patient?.reference, "Patient/f201")
    XCTAssertEqual(inst.period?.end?.description, "2013-03-20")
    XCTAssertEqual(inst.period?.start?.description, "2013-03-11")
    XCTAssertEqual(inst.priority?.coding[0].code, "394849002")
    XCTAssertEqual(inst.priority?.coding[0].display, "High priority")
    XCTAssertEqual(inst.priority?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.reason[0].text, "The patient seems to suffer from bilateral pneumonia and renal insufficiency, most likely due to chemotherapy.")
    XCTAssertEqual(inst.serviceProvider?.reference, "Organization/f201")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.type[0].coding[0].code, "183807002")
    XCTAssertEqual(inst.type[0].coding[0].display, "Inpatient stay for nine days")
    XCTAssertEqual(inst.type[0].coding[0].system, "http://snomed.info/sct")
    
    return inst
  }
  
  func testEncounter7() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter7()
      try runEncounter7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter7(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm7(instance!)
  }

  func testEncounter7RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter7()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm7(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter7(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter7(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-home.json")
    
    XCTAssertEqual(inst.class_fhir, "virtual")
    XCTAssertEqual(inst.contained[0].id, "home")
    XCTAssertEqual(inst.id, "home")
    XCTAssertEqual(inst.location[0].location?.display, "Client's home")
    XCTAssertEqual(inst.location[0].location?.reference, "#home")
    XCTAssertEqual(inst.location[0].period?.end?.description, "2015-01-17T16:30:00+10:00")
    XCTAssertEqual(inst.location[0].period?.start?.description, "2015-01-17T16:00:00+10:00")
    XCTAssertEqual(inst.location[0].status, "completed")
    XCTAssertEqual(inst.participant[0].individual?.display, "Dr Adam Careful")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/example")
    XCTAssertEqual(inst.participant[0].period?.end?.description, "2015-01-17T16:30:00+10:00")
    XCTAssertEqual(inst.participant[0].period?.start?.description, "2015-01-17T16:00:00+10:00")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.period?.end?.description, "2015-01-17T16:30:00+10:00")
    XCTAssertEqual(inst.period?.start?.description, "2015-01-17T16:00:00+10:00")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.div, "<div>Encounter with patient @example who is at home</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testEncounter8() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter8()
      try runEncounter8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter8(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm8(instance!)
  }

  func testEncounter8RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter8()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm8(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter8(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter8(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example-xcda.json")
    
    XCTAssertEqual(inst.class_fhir, "outpatient")
    XCTAssertEqual(inst.id, "xcda")
    XCTAssertEqual(inst.identifier[0].system, "http://healthcare.example.org/identifiers/enocunter")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "1234213.52345873")
    XCTAssertEqual(inst.participant[0].individual?.reference, "Practitioner/xcda1")
    XCTAssertEqual(inst.patient?.reference, "Patient/xcda")
    XCTAssertEqual(inst.reason[0].coding[0].code, "T-D8200")
    XCTAssertEqual(inst.reason[0].coding[0].display, "Arm")
    XCTAssertEqual(inst.reason[0].coding[0].system, "http://ihe.net/xds/connectathon/eventCodes")
    XCTAssertEqual(inst.status, "finished")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testEncounter9() {   
    var instance: FireKit.Encounter?
    do {
      instance = try runEncounter9()
      try runEncounter9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Encounter
      XCTAssertNotNil(copy)
      try runEncounter9(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runEncounter9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Encounter successfully, but threw: \(error)")
    }

    testEncounterRealm9(instance!)
  }

  func testEncounter9RealmPK() {    
    do {
        let instance: FireKit.Encounter = try runEncounter9()
        let copy = (instance.copy() as! FireKit.Encounter)

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
            XCTAssertTrue(false, "Must instantiate and test Encounter's PKs, but threw: \(error)")
        }
    }

  func testEncounterRealm9(_ instance: FireKit.Encounter) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runEncounter9(JSONEncoder().encode(realm.objects(FireKit.Encounter.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Encounter.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Encounter()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Encounter.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runEncounter9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Encounter.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Encounter.self).count)
  }
  
  @discardableResult
  func runEncounter9(_ data: Data? = nil) throws -> FireKit.Encounter {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "encounter-example.json")
    
    XCTAssertEqual(inst.class_fhir, "inpatient")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.patient?.reference, "Patient/example")
    XCTAssertEqual(inst.status, "in-progress")
    XCTAssertEqual(inst.text?.div, "<div>Encounter with patient @example</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
