//
//  ObservationTests.swift
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


class ObservationTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Observation {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Observation {
      print("Inflating FireKit.Observation from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.Observation.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testObservation1() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation1()
      try runObservation1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm1(instance!)
  }

  func testObservation1RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation1()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm1(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation1(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation1(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example1-somatic.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "55233-1")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.comments, "The EGFR p.L858R mutation has been associated with response to anti-EGFR therapy")
    XCTAssertEqual(inst.contained[0].id, "c1")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomeBuild")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "GRCh 37")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsChromosome")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].code, "NC_000007")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].system, "http://www.ncbi.nlm.nih.gov/gene")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.text, "Homo sapiens chromosome 7")
    XCTAssertEqual(inst.extension_fhir[2].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomicStart")
    XCTAssertEqual(inst.extension_fhir[2].valueInteger.value, 55259515)
    XCTAssertEqual(inst.extension_fhir[3].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomicStop")
    XCTAssertEqual(inst.extension_fhir[3].valueInteger.value, 55259516)
    XCTAssertEqual(inst.extension_fhir[4].url, "http://hl7.org/fhir/StructureDefinition/geneticsSpecies")
    XCTAssertEqual(inst.extension_fhir[4].valueCodeableConcept?.coding[0].code, "337915000")
    XCTAssertEqual(inst.extension_fhir[4].valueCodeableConcept?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.extension_fhir[4].valueCodeableConcept?.text, "Homo sapiens")
    XCTAssertEqual(inst.extension_fhir[5].url, "http://hl7.org/fhir/StructureDefinition/geneticsCIGAR")
    XCTAssertEqual(inst.extension_fhir[5].valueString, "1M")
    XCTAssertEqual(inst.extension_fhir[6].url, "http://hl7.org/fhir/StructureDefinition/geneticsAssessedCondition")
    XCTAssertEqual(inst.extension_fhir[6].valueReference?.reference, "#c1")
    XCTAssertEqual(inst.extension_fhir[7].url, "http://hl7.org/fhir/StructureDefinition/geneticsReferenceAllele")
    XCTAssertEqual(inst.extension_fhir[7].valueString, "T")
    XCTAssertEqual(inst.extension_fhir[8].url, "http://hl7.org/fhir/StructureDefinition/geneticsObservedAllele")
    XCTAssertEqual(inst.extension_fhir[8].valueString, "G")
    XCTAssertEqual(inst.extension_fhir[9].url, "http://hl7.org/fhir/StructureDefinition/geneticsGene")
    XCTAssertEqual(inst.extension_fhir[9].valueCodeableConcept?.coding[0].code, "3236")
    XCTAssertEqual(inst.extension_fhir[9].valueCodeableConcept?.coding[0].display, "EGFR")
    XCTAssertEqual(inst.extension_fhir[9].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.id, "genetics-example1-somatic")
    XCTAssertEqual(inst.interpretation?.coding[0].code, "POS")
    XCTAssertEqual(inst.interpretation?.coding[0].system, "http://hl7.org/fhir/v2/0078")
    XCTAssertEqual(inst.interpretation?.text, "positive")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example1-somatic")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example1-somatic")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example1-somatic")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation2() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation2()
      try runObservation2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation2(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm2(instance!)
  }

  func testObservation2RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation2()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm2(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation2(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation2(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example2-germline.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "21636-6")
    XCTAssertEqual(inst.code?.coding[0].display, "BRCA1 gene mutation analysis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomeBuild")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "GRCh 37")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsChromosome")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].code, "NC_000017")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].system, "http://www.ncbi.nlm.nih.gov/gene")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.text, "Homo sapiens chromosome 17")
    XCTAssertEqual(inst.extension_fhir[2].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomicStart")
    XCTAssertEqual(inst.extension_fhir[2].valueInteger.value, 41258504)
    XCTAssertEqual(inst.extension_fhir[3].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomicStop")
    XCTAssertEqual(inst.extension_fhir[3].valueInteger.value, 41258505)
    XCTAssertEqual(inst.extension_fhir[4].url, "http://hl7.org/fhir/StructureDefinition/geneticsReferenceAllele")
    XCTAssertEqual(inst.extension_fhir[4].valueString, "A")
    XCTAssertEqual(inst.extension_fhir[5].url, "http://hl7.org/fhir/StructureDefinition/geneticsObservedAllele")
    XCTAssertEqual(inst.extension_fhir[5].valueString, "C")
    XCTAssertEqual(inst.extension_fhir[6].url, "http://hl7.org/fhir/StructureDefinition/geneticsGene")
    XCTAssertEqual(inst.extension_fhir[6].valueCodeableConcept?.coding[0].code, "1100")
    XCTAssertEqual(inst.extension_fhir[6].valueCodeableConcept?.coding[0].display, "BRCA1")
    XCTAssertEqual(inst.extension_fhir[6].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.extension_fhir[7].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNASequenceVariation")
    XCTAssertEqual(inst.extension_fhir[7].valueString, "c.181T>G")
    XCTAssertEqual(inst.extension_fhir[8].url, "http://hl7.org/fhir/StructureDefinition/geneticsVariationId")
    XCTAssertEqual(inst.extension_fhir[8].valueCodeableConcept?.coding[0].code, "17661")
    XCTAssertEqual(inst.extension_fhir[8].valueCodeableConcept?.coding[0].display, "c.181T>G")
    XCTAssertEqual(inst.extension_fhir[8].valueCodeableConcept?.coding[0].system, "http://www.ncbi.nlm.nih.gov/clinvar")
    XCTAssertEqual(inst.extension_fhir[9].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNARegionName")
    XCTAssertEqual(inst.extension_fhir[9].valueString, "Exon 4")
    XCTAssertEqual(inst.id, "genetics-example2-germline")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example2-germline")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example2-germline")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example2-germline")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation3() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation3()
      try runObservation3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation3(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm3(instance!)
  }

  func testObservation3RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation3()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm3(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation3(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation3(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example3-mutationlist-1.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "49874-1")
    XCTAssertEqual(inst.code?.coding[0].display, "ABCB4 gene mutation analysis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[0].code, "53037-8")
    XCTAssertEqual(inst.component[0].code?.coding[0].display, "Genetic disease sequence variation interpretation")
    XCTAssertEqual(inst.component[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].code, "LA6682-4")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].display, "Unknown significance")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNASequenceVariation")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "c.2708T>C")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNARegionName")
    XCTAssertEqual(inst.extension_fhir[1].valueString, "Exon 23")
    XCTAssertEqual(inst.extension_fhir[2].url, "http://hl7.org/fhir/StructureDefinition/geneticsAminoAcidChange")
    XCTAssertEqual(inst.extension_fhir[2].valueString, "p.R969H")
    XCTAssertEqual(inst.id, "genetics-example3-mutationlist-1")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example2")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example2")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example2")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation4() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation4()
      try runObservation4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation4(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm4(instance!)
  }

  func testObservation4RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation4()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm4(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation4(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation4(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example3-mutationlist-2.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "49874-1")
    XCTAssertEqual(inst.code?.coding[0].display, "ABCB4 gene mutation analysis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[0].code, "53037-8")
    XCTAssertEqual(inst.component[0].code?.coding[0].display, "Genetic disease sequence variation interpretation")
    XCTAssertEqual(inst.component[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].code, "LA6675-8")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].display, "Benign")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNARegionName")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "Exon 6")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsAminoAcidChange")
    XCTAssertEqual(inst.extension_fhir[1].valueString, "p.N168N")
    XCTAssertEqual(inst.extension_fhir[2].url, "http://hl7.org/fhir/StructureDefinition/geneticsVariationId")
    XCTAssertEqual(inst.extension_fhir[2].valueCodeableConcept?.coding[0].code, "1202283")
    XCTAssertEqual(inst.extension_fhir[2].valueCodeableConcept?.coding[0].display, "c.181T>G")
    XCTAssertEqual(inst.extension_fhir[2].valueCodeableConcept?.coding[0].system, "http://www.ncbi.nlm.nih.gov/projects/SNP")
    XCTAssertEqual(inst.id, "genetics-example3-mutationlist-2")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example2")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example2")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example2")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation5() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation5()
      try runObservation5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation5(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm5(instance!)
  }

  func testObservation5RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation5()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm5(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation5(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation5(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example3-mutationlist-3.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "49874-1")
    XCTAssertEqual(inst.code?.coding[0].display, "ABCB4 gene mutation analysis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[0].code, "53037-8")
    XCTAssertEqual(inst.component[0].code?.coding[0].display, "Genetic disease sequence variation interpretation")
    XCTAssertEqual(inst.component[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].code, "LA6675-8")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].display, "Benign")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNARegionName")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "intron 16")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsVariationId")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].code, "31668")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].display, "c.2211+16C>T")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].system, "http://www.ncbi.nlm.nih.gov/projects/SNP")
    XCTAssertEqual(inst.id, "genetics-example3-mutationlist-3")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example2")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example2")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example2")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation6() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation6()
      try runObservation6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation6(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm6(instance!)
  }

  func testObservation6RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation6()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm6(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation6(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation6(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example3-mutationlist-4.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "49874-1")
    XCTAssertEqual(inst.code?.coding[0].display, "ABCB4 gene mutation analysis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[0].code, "53037-8")
    XCTAssertEqual(inst.component[0].code?.coding[0].display, "Genetic disease sequence variation interpretation")
    XCTAssertEqual(inst.component[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].code, "LA6675-8")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].display, "Benign")
    XCTAssertEqual(inst.component[0].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsDNARegionName")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "intron 26")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsVariationId")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].code, "31653")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].display, "c.3487-16T>C")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].system, "http://www.ncbi.nlm.nih.gov/projects/SNP")
    XCTAssertEqual(inst.id, "genetics-example3-mutationlist-4")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example2")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example2")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example2")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation7() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation7()
      try runObservation7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation7(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm7(instance!)
  }

  func testObservation7RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation7()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm7(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation7(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation7(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "obs-genetics-example3-mutationlist.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "49874-1")
    XCTAssertEqual(inst.code?.coding[0].display, "ABCB4 gene mutation analysis")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/geneticsGenomeBuild")
    XCTAssertEqual(inst.extension_fhir[0].valueString, "GRCh 37")
    XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/geneticsGene")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].code, "5244")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].display, "ABCB4")
    XCTAssertEqual(inst.extension_fhir[1].valueCodeableConcept?.coding[0].system, "http://www.genenames.org")
    XCTAssertEqual(inst.extension_fhir[2].url, "http://hl7.org/fhir/StructureDefinition/geneticsSpecies")
    XCTAssertEqual(inst.extension_fhir[2].valueCodeableConcept?.coding[0].code, "337915000")
    XCTAssertEqual(inst.extension_fhir[2].valueCodeableConcept?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.extension_fhir[2].valueCodeableConcept?.text, "Homo sapiens")
    XCTAssertEqual(inst.extension_fhir[3].url, "http://hl7.org/fhir/StructureDefinition/geneticsResult")
    XCTAssertEqual(inst.extension_fhir[3].valueReference?.reference, "genetics-example3-mutationlist-1")
    XCTAssertEqual(inst.extension_fhir[4].url, "http://hl7.org/fhir/StructureDefinition/geneticsResult")
    XCTAssertEqual(inst.extension_fhir[4].valueReference?.reference, "genetics-example3-mutationlist-2")
    XCTAssertEqual(inst.extension_fhir[5].url, "http://hl7.org/fhir/StructureDefinition/geneticsResult")
    XCTAssertEqual(inst.extension_fhir[5].valueReference?.reference, "genetics-example3-mutationlist-3")
    XCTAssertEqual(inst.extension_fhir[6].url, "http://hl7.org/fhir/StructureDefinition/geneticsResult")
    XCTAssertEqual(inst.extension_fhir[6].valueReference?.reference, "genetics-example3-mutationlist-4")
    XCTAssertEqual(inst.id, "genetics-example3-mutationlist")
    XCTAssertEqual(inst.performer[0].display, "Molecular Diagnostic Laboratory")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/genetics-example2")
    XCTAssertEqual(inst.specimen?.display, "Molecular Specimen ID: MLD45-Z4-1234")
    XCTAssertEqual(inst.specimen?.reference, "Specimen/genetics-example2")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Molecular Lab Patient ID: HOSP-23456")
    XCTAssertEqual(inst.subject?.reference, "Patient/genetics-example2")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation8() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation8()
      try runObservation8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation8(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm8(instance!)
  }

  func testObservation8RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation8()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm8(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation8(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation8(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "observation-example-bloodpressure-cancel.json")
    
    XCTAssertEqual(inst.bodySite?.coding[0].code, "368209003")
    XCTAssertEqual(inst.bodySite?.coding[0].display, "Right arm")
    XCTAssertEqual(inst.bodySite?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.code?.coding[0].code, "55284-4")
    XCTAssertEqual(inst.code?.coding[0].display, "Blood pressure systolic & diastolic")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.comments, "In this example, the blood pressure measurements are not available due to cancellation of the order.  Data absent reason is present for each component")
    XCTAssertEqual(inst.component[0].code?.coding[0].code, "8480-6")
    XCTAssertEqual(inst.component[0].code?.coding[0].display, "Systolic blood pressure")
    XCTAssertEqual(inst.component[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[1].code, "271649006")
    XCTAssertEqual(inst.component[0].code?.coding[1].display, "Systolic blood pressure")
    XCTAssertEqual(inst.component[0].code?.coding[1].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.component[0].code?.coding[2].code, "bp-s")
    XCTAssertEqual(inst.component[0].code?.coding[2].display, "Systolic Blood pressure")
    XCTAssertEqual(inst.component[0].code?.coding[2].system, "http://acme.org/devices/clinical-codes")
    XCTAssertEqual(inst.component[0].dataAbsentReason?.coding[0].code, "not-asked")
    XCTAssertEqual(inst.component[0].dataAbsentReason?.coding[0].display, "Not Asked")
    XCTAssertEqual(inst.component[0].dataAbsentReason?.coding[0].system, "http://hl7.org/fhir/data-absent-reason")
    XCTAssertEqual(inst.component[1].code?.coding[0].code, "8462-4")
    XCTAssertEqual(inst.component[1].code?.coding[0].display, "Diastolic blood pressure")
    XCTAssertEqual(inst.component[1].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[1].dataAbsentReason?.coding[0].code, "not-asked")
    XCTAssertEqual(inst.component[1].dataAbsentReason?.coding[0].display, "Not Asked")
    XCTAssertEqual(inst.component[1].dataAbsentReason?.coding[0].system, "http://hl7.org/fhir/data-absent-reason")
    XCTAssertEqual(inst.effectiveDateTime?.description, "2012-09-17")
    XCTAssertEqual(inst.id, "blood-pressure-cancel")
    XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
    XCTAssertEqual(inst.identifier[0].value, "urn:uuid:187e0c12-8dd2-67e2-99b2-bf273c878281")
    XCTAssertEqual(inst.interpretation?.coding[0].code, "L")
    XCTAssertEqual(inst.interpretation?.coding[0].display, "Below low normal")
    XCTAssertEqual(inst.interpretation?.coding[0].system, "http://hl7.org/fhir/v2/0078")
    XCTAssertEqual(inst.interpretation?.text, "low")
    XCTAssertEqual(inst.meta?.lastUpdated?.description, "2014-01-30T22:35:23+11:00")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/example")
    XCTAssertEqual(inst.status, "cancelled")
    XCTAssertEqual(inst.subject?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation9() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation9()
      try runObservation9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation9(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm9(instance!)
  }

  func testObservation9RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation9()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm9(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation9(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation9(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "observation-example-bloodpressure.json")
    
    XCTAssertEqual(inst.bodySite?.coding[0].code, "368209003")
    XCTAssertEqual(inst.bodySite?.coding[0].display, "Right arm")
    XCTAssertEqual(inst.bodySite?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.code?.coding[0].code, "55284-4")
    XCTAssertEqual(inst.code?.coding[0].display, "Blood pressure systolic & diastolic")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[0].code, "8480-6")
    XCTAssertEqual(inst.component[0].code?.coding[0].display, "Systolic blood pressure")
    XCTAssertEqual(inst.component[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[0].code?.coding[1].code, "271649006")
    XCTAssertEqual(inst.component[0].code?.coding[1].display, "Systolic blood pressure")
    XCTAssertEqual(inst.component[0].code?.coding[1].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.component[0].code?.coding[2].code, "bp-s")
    XCTAssertEqual(inst.component[0].code?.coding[2].display, "Systolic Blood pressure")
    XCTAssertEqual(inst.component[0].code?.coding[2].system, "http://acme.org/devices/clinical-codes")
    XCTAssertEqual(inst.component[0].valueQuantity?.unit, "mm[Hg]")
    XCTAssertTrue(inst.component[0].valueQuantity?.value! == RealmDecimal(string: "107"))
    XCTAssertEqual(inst.component[1].code?.coding[0].code, "8462-4")
    XCTAssertEqual(inst.component[1].code?.coding[0].display, "Diastolic blood pressure")
    XCTAssertEqual(inst.component[1].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.component[1].valueQuantity?.unit, "mm[Hg]")
    XCTAssertTrue(inst.component[1].valueQuantity?.value! == RealmDecimal(string: "60"))
    XCTAssertEqual(inst.effectiveDateTime?.description, "2012-09-17")
    XCTAssertEqual(inst.id, "blood-pressure")
    XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
    XCTAssertEqual(inst.identifier[0].value, "urn:uuid:187e0c12-8dd2-67e2-99b2-bf273c878281")
    XCTAssertEqual(inst.interpretation?.coding[0].code, "L")
    XCTAssertEqual(inst.interpretation?.coding[0].display, "Below low normal")
    XCTAssertEqual(inst.interpretation?.coding[0].system, "http://hl7.org/fhir/v2/0078")
    XCTAssertEqual(inst.interpretation?.text, "low")
    XCTAssertEqual(inst.meta?.lastUpdated?.description, "2014-01-30T22:35:23+11:00")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/example")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.reference, "Patient/example")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testObservation10() {   
    var instance: FireKit.Observation?
    do {
      instance = try runObservation10()
      try runObservation10(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Observation
      XCTAssertNotNil(copy)
      try runObservation10(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runObservation10(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Observation successfully, but threw: \(error)")
    }

    testObservationRealm10(instance!)
  }

  func testObservation10RealmPK() {    
    do {
        let instance: FireKit.Observation = try runObservation10()
        let copy = (instance.copy() as! FireKit.Observation)

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
            XCTAssertTrue(false, "Must instantiate and test Observation's PKs, but threw: \(error)")
        }
    }

  func testObservationRealm10(_ instance: FireKit.Observation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runObservation10(JSONEncoder().encode(realm.objects(FireKit.Observation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Observation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Observation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation10(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Observation.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runObservation10(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Observation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Observation.self).count)
  }
  
  @discardableResult
  func runObservation10(_ data: Data? = nil) throws -> FireKit.Observation {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "observation-example-f001-glucose.json")
    
    XCTAssertEqual(inst.code?.coding[0].code, "15074-8")
    XCTAssertEqual(inst.code?.coding[0].display, "Glucose [Moles/volume] in Blood")
    XCTAssertEqual(inst.code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.effectivePeriod?.end?.description, "2013-04-05T09:30:10+01:00")
    XCTAssertEqual(inst.effectivePeriod?.start?.description, "2013-04-02T09:30:10+01:00")
    XCTAssertEqual(inst.id, "f001")
    XCTAssertEqual(inst.identifier[0].system, "http://www.bmc.nl/zorgportal/identifiers/observations")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "6323")
    XCTAssertEqual(inst.interpretation?.coding[0].code, "H")
    XCTAssertEqual(inst.interpretation?.coding[0].display, "Above high normal")
    XCTAssertEqual(inst.interpretation?.coding[0].system, "http://hl7.org/fhir/v2/0078")
    XCTAssertEqual(inst.issued?.description, "2013-04-03T15:30:10+01:00")
    XCTAssertEqual(inst.performer[0].display, "A. Langeveld")
    XCTAssertEqual(inst.performer[0].reference, "Practitioner/f005")
    XCTAssertEqual(inst.referenceRange[0].high?.code, "mmol/L")
    XCTAssertEqual(inst.referenceRange[0].high?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.referenceRange[0].high?.unit, "mmol/l")
    XCTAssertTrue(inst.referenceRange[0].high?.value! == RealmDecimal(string: "6.2"))
    XCTAssertEqual(inst.referenceRange[0].low?.code, "mmol/L")
    XCTAssertEqual(inst.referenceRange[0].low?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.referenceRange[0].low?.unit, "mmol/l")
    XCTAssertTrue(inst.referenceRange[0].low?.value! == RealmDecimal(string: "3.1"))
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "P. van de Heuvel")
    XCTAssertEqual(inst.subject?.reference, "Patient/f001")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.valueQuantity?.code, "mmol/L")
    XCTAssertEqual(inst.valueQuantity?.system, "http://unitsofmeasure.org")
    XCTAssertEqual(inst.valueQuantity?.unit, "mmol/l")
    XCTAssertTrue(inst.valueQuantity?.value! == RealmDecimal(string: "6.3"))
    
    return inst
  }
}
