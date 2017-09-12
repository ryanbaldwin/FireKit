//
//  PatientTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-11.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class PatientTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Patient {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Patient {
      let instance = try JSONDecoder().decode(FireKit.Patient.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testPatient1() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient1()
      try runPatient1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm1(instance!)
  }

  func testPatient1RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient1()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm1(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient1(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient1(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-a.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.contact[0].organization?.display, "Walt Disney Corporation")
    XCTAssertEqual(inst.contact[0].organization?.reference, "Organization/1")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].code, "owner")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "pat1")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:0.1.2.3.4.5.6.7")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "MR")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
    XCTAssertEqual(inst.identifier[0].use, "usual")
    XCTAssertEqual(inst.identifier[0].value, "654321")
    XCTAssertEqual(inst.link[0].other?.reference, "Patient/pat2")
    XCTAssertEqual(inst.link[0].type, "seealso")
    XCTAssertEqual(inst.managingOrganization?.display, "ACME Healthcare, Inc")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/1")
    XCTAssertEqual(inst.name[0].family[0].value, "Donald")
    XCTAssertEqual(inst.name[0].given[0].value, "Duck")
    XCTAssertEqual(inst.name[0].use, "official")
    XCTAssertEqual(inst.photo[0].contentType, "image/gif")
    XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Patient Donald DUCK @ Acme Healthcare, Inc. MR = 654321</p>\n    \n    </div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient2() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient2()
      try runPatient2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm2(instance!)
  }

  func testPatient2RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient2()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm2(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient2(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient2(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-animal.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.animal?.breed?.coding[0].code, "58108001")
    XCTAssertEqual(inst.animal?.breed?.coding[0].display, "Golden retriever")
    XCTAssertEqual(inst.animal?.breed?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.animal?.breed?.coding[1].code, "gret")
    XCTAssertEqual(inst.animal?.breed?.coding[1].display, "Golden Retriever")
    XCTAssertEqual(inst.animal?.breed?.coding[1].system, "http://hl7.org/fhir/animal-breed")
    XCTAssertEqual(inst.animal?.genderStatus?.coding[0].code, "neutered")
    XCTAssertEqual(inst.animal?.genderStatus?.coding[0].system, "http://hl7.org/fhir/animal-genderstatus")
    XCTAssertEqual(inst.animal?.species?.coding[0].code, "canislf")
    XCTAssertEqual(inst.animal?.species?.coding[0].display, "Dog")
    XCTAssertEqual(inst.animal?.species?.coding[0].system, "http://hl7.org/fhir/animal-species")
    XCTAssertEqual(inst.birthDate?.description, "2010-03-23")
    XCTAssertEqual(inst.contact[0].name?.family[0].value, "Chalmers")
    XCTAssertEqual(inst.contact[0].name?.given[0].value, "Peter")
    XCTAssertEqual(inst.contact[0].name?.given[1].value, "James")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].code, "owner")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
    XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
    XCTAssertEqual(inst.contact[0].telecom[0].use, "work")
    XCTAssertEqual(inst.contact[0].telecom[0].value, "(03) 5555 6473")
    XCTAssertEqual(inst.gender, "female")
    XCTAssertEqual(inst.id, "animal")
    XCTAssertEqual(inst.identifier[0].assigner?.display, "Maroondah City Council")
    XCTAssertEqual(inst.identifier[0].period?.start?.description, "2010-05-31")
    XCTAssertEqual(inst.identifier[0].system, "http://www.maroondah.vic.gov.au/AnimalRegFees.aspx")
    XCTAssertEqual(inst.identifier[0].type?.text, "Dog Tag")
    XCTAssertEqual(inst.identifier[0].value, "1234123")
    XCTAssertEqual(inst.managingOrganization?.display, "Pete's Vetinary Services")
    XCTAssertEqual(inst.name[0].given[0].value, "Kenzi")
    XCTAssertEqual(inst.name[0].use, "usual")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient3() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient3()
      try runPatient3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm3(instance!)
  }

  func testPatient3RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient3()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm3(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient3(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient3(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-b.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.gender, "other")
    XCTAssertEqual(inst.id, "pat2")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:0.1.2.3.4.5.6.7")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "MR")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
    XCTAssertEqual(inst.identifier[0].use, "usual")
    XCTAssertEqual(inst.identifier[0].value, "123456")
    XCTAssertEqual(inst.link[0].other?.reference, "Patient/pat1")
    XCTAssertEqual(inst.link[0].type, "seealso")
    XCTAssertEqual(inst.managingOrganization?.display, "ACME Healthcare, Inc")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/1")
    XCTAssertEqual(inst.name[0].family[0].value, "Donald")
    XCTAssertEqual(inst.name[0].given[0].value, "Duck")
    XCTAssertEqual(inst.name[0].given[1].value, "D")
    XCTAssertEqual(inst.name[0].use, "official")
    XCTAssertEqual(inst.photo[0].contentType, "image/gif")
    XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Patient Donald D DUCK @ Acme Healthcare, Inc. MR = 123456</p>\n    \n    </div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient4() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient4()
      try runPatient4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm4(instance!)
  }

  func testPatient4RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient4()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm4(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient4(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient4(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-c.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.birthDate?.description, "1982-01-23")
    XCTAssertEqual(inst.deceasedDateTime?.description, "2015-02-14T13:42:00+10:00")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "pat3")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:0.1.2.3.4.5.6.7")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "MR")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
    XCTAssertEqual(inst.identifier[0].use, "usual")
    XCTAssertEqual(inst.identifier[0].value, "123457")
    XCTAssertEqual(inst.managingOrganization?.display, "ACME Healthcare, Inc")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/1")
    XCTAssertEqual(inst.name[0].family[0].value, "Notsowell")
    XCTAssertEqual(inst.name[0].given[0].value, "Simon")
    XCTAssertEqual(inst.name[0].use, "official")
    XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Patient Simon Notsowell @ Acme Healthcare, Inc. MR = 123457, DECEASED</p>\n    \n    </div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient5() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient5()
      try runPatient5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm5(instance!)
  }

  func testPatient5RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient5()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm5(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient5(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient5(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-d.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.birthDate?.description, "1982-08-02")
    XCTAssertTrue(inst.deceasedBoolean.value ?? false)
    XCTAssertEqual(inst.gender, "female")
    XCTAssertEqual(inst.id, "pat4")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:0.1.2.3.4.5.6.7")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "MR")
    XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
    XCTAssertEqual(inst.identifier[0].use, "usual")
    XCTAssertEqual(inst.identifier[0].value, "123458")
    XCTAssertEqual(inst.managingOrganization?.display, "ACME Healthcare, Inc")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/1")
    XCTAssertEqual(inst.name[0].family[0].value, "Notsowell")
    XCTAssertEqual(inst.name[0].given[0].value, "Sandy")
    XCTAssertEqual(inst.name[0].use, "official")
    XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>Patient Sandy Notsowell @ Acme Healthcare, Inc. MR = 123458, DECEASED</p>\n    \n    </div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient6() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient6()
      try runPatient6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm6(instance!)
  }

  func testPatient6RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient6()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm6(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient6(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient6(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-dicom.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.extension_fhir[0].url, "http://nema.org/fhir/extensions#0010:1010")
    XCTAssertEqual(inst.extension_fhir[0].valueQuantity?.unit, "Y")
    XCTAssertTrue(inst.extension_fhir[0].valueQuantity?.value! == RealmDecimal(string: "56"))
    XCTAssertEqual(inst.extension_fhir[1].url, "http://nema.org/fhir/extensions#0010:1020")
    XCTAssertEqual(inst.extension_fhir[1].valueQuantity?.unit, "m")
    XCTAssertTrue(inst.extension_fhir[1].valueQuantity?.value! == RealmDecimal(string: "1.83"))
    XCTAssertEqual(inst.extension_fhir[2].url, "http://nema.org/fhir/extensions#0010:1030")
    XCTAssertEqual(inst.extension_fhir[2].valueQuantity?.unit, "kg")
    XCTAssertTrue(inst.extension_fhir[2].valueQuantity?.value! == RealmDecimal(string: "72.58"))
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "dicom")
    XCTAssertEqual(inst.identifier[0].system, "http://nema.org/examples/patients")
    XCTAssertEqual(inst.identifier[0].value, "MINT1234")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/1")
    XCTAssertEqual(inst.name[0].family[0].value, "MINT_TEST")
    XCTAssertEqual(inst.text?.div, "<div> Patient MINT_TEST, ID = MINT1234. Age = 56y, Size =\n      1.83m, Weight = 72.58kg </div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient7() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient7()
      try runPatient7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient7(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm7(instance!)
  }

  func testPatient7RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient7()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm7(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient7(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient7(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-f001-pieter.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.address[0].city, "Amsterdam")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Van Egmondkade 23")
    XCTAssertEqual(inst.address[0].postalCode, "1024 RJ")
    XCTAssertEqual(inst.address[0].use, "home")
    XCTAssertEqual(inst.birthDate?.description, "1944-11-17")
    XCTAssertEqual(inst.communication[0].language?.coding[0].code, "nl")
    XCTAssertEqual(inst.communication[0].language?.coding[0].display, "Dutch")
    XCTAssertEqual(inst.communication[0].language?.coding[0].system, "urn:ietf:bcp:47")
    XCTAssertEqual(inst.communication[0].language?.text, "Nederlands")
    XCTAssertTrue(inst.communication[0].preferred.value ?? false)
    XCTAssertEqual(inst.contact[0].name?.family[0].value, "Abels")
    XCTAssertEqual(inst.contact[0].name?.given[0].value, "Sarah")
    XCTAssertEqual(inst.contact[0].name?.use, "usual")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].code, "partner")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
    XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
    XCTAssertEqual(inst.contact[0].telecom[0].use, "mobile")
    XCTAssertEqual(inst.contact[0].telecom[0].value, "0690383372")
    XCTAssertFalse(inst.deceasedBoolean.value ?? true)
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f001")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[0].use, "usual")
    XCTAssertEqual(inst.identifier[0].value, "738472983")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.managingOrganization?.display, "Burgers University Medical Centre")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.maritalStatus?.coding[0].code, "M")
    XCTAssertEqual(inst.maritalStatus?.coding[0].display, "Married")
    XCTAssertEqual(inst.maritalStatus?.coding[0].system, "http://hl7.org/fhir/v3/MaritalStatus")
    XCTAssertEqual(inst.maritalStatus?.text, "Getrouwd")
    XCTAssertTrue(inst.multipleBirthBoolean.value ?? false)
    XCTAssertEqual(inst.name[0].family[0].value, "van de Heuvel")
    XCTAssertEqual(inst.name[0].given[0].value, "Pieter")
    XCTAssertEqual(inst.name[0].suffix[0].value, "MSc")
    XCTAssertEqual(inst.name[0].use, "usual")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "mobile")
    XCTAssertEqual(inst.telecom[0].value, "0648352638")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "home")
    XCTAssertEqual(inst.telecom[1].value, "p.heuvel@gmail.com")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient8() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient8()
      try runPatient8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient8(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm8(instance!)
  }

  func testPatient8RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient8()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm8(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient8(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient8(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-f201-roel.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.address[0].city, "Amsterdam")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Bos en Lommerplein 280")
    XCTAssertEqual(inst.address[0].postalCode, "1055RW")
    XCTAssertEqual(inst.address[0].use, "home")
    XCTAssertEqual(inst.birthDate?.description, "1960-03-13")
    XCTAssertEqual(inst.communication[0].language?.coding[0].code, "nl-NL")
    XCTAssertEqual(inst.communication[0].language?.coding[0].display, "Dutch")
    XCTAssertEqual(inst.communication[0].language?.coding[0].system, "urn:ietf:bcp:47")
    XCTAssertTrue(inst.communication[0].preferred.value ?? false)
    XCTAssertEqual(inst.contact[0].name?.text, "Ariadne Bor-Jansma")
    XCTAssertEqual(inst.contact[0].name?.use, "usual")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].code, "127850001")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].display, "Wife")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[1].code, "partner")
    XCTAssertEqual(inst.contact[0].relationship[0].coding[1].system, "http://hl7.org/fhir/patient-contact-relationship")
    XCTAssertEqual(inst.contact[0].telecom[0].system, "phone")
    XCTAssertEqual(inst.contact[0].telecom[0].use, "home")
    XCTAssertEqual(inst.contact[0].telecom[0].value, "+31201234567")
    XCTAssertFalse(inst.deceasedBoolean.value ?? true)
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f201")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[0].type?.text, "BSN")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "123456789")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].type?.text, "BSN")
    XCTAssertEqual(inst.identifier[1].use, "official")
    XCTAssertEqual(inst.identifier[1].value, "123456789")
    XCTAssertEqual(inst.managingOrganization?.display, "AUMC")
    XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f201")
    XCTAssertEqual(inst.maritalStatus?.coding[0].code, "36629006")
    XCTAssertEqual(inst.maritalStatus?.coding[0].display, "Legally married")
    XCTAssertEqual(inst.maritalStatus?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.maritalStatus?.coding[1].code, "M")
    XCTAssertEqual(inst.maritalStatus?.coding[1].system, "http://hl7.org/fhir/v3/MaritalStatus")
    XCTAssertFalse(inst.multipleBirthBoolean.value ?? true)
    XCTAssertEqual(inst.name[0].family[0].value, "Bor")
    XCTAssertEqual(inst.name[0].given[0].value, "Roelof Olaf")
    XCTAssertEqual(inst.name[0].prefix[0].value, "Drs.")
    XCTAssertEqual(inst.name[0].suffix[0].value, "PDEng.")
    XCTAssertEqual(inst.name[0].text, "Roel")
    XCTAssertEqual(inst.name[0].use, "official")
    XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
    XCTAssertEqual(inst.photo[0].url, "Binary/f006")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "mobile")
    XCTAssertEqual(inst.telecom[0].value, "+31612345678")
    XCTAssertEqual(inst.telecom[1].system, "phone")
    XCTAssertEqual(inst.telecom[1].use, "home")
    XCTAssertEqual(inst.telecom[1].value, "+31201234567")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient9() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient9()
      try runPatient9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient9(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm9(instance!)
  }

  func testPatient9RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient9()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm9(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient9(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient9(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-ihe-pcd.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.id, "ihe-pcd")
    XCTAssertEqual(inst.identifier[0].type?.text, "Internal Identifier")
    XCTAssertEqual(inst.identifier[0].value, "AB60001")
    XCTAssertEqual(inst.name[0].family[0].value, "BROOKS")
    XCTAssertEqual(inst.name[0].given[0].value, "ALBERT")
    XCTAssertEqual(inst.text?.div, "<div>Albert Brooks, Id: AB60001</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPatient10() {   
    var instance: FireKit.Patient?
    do {
      instance = try runPatient10()
      try runPatient10(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Patient
      XCTAssertNotNil(copy)
      try runPatient10(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPatient10(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Patient successfully, but threw: \(error)")
    }

    testPatientRealm10(instance!)
  }

  func testPatient10RealmPK() { 
      do {
        let instance: FireKit.Patient = try runPatient10()
        let copy = (instance.copy() as! FireKit.Patient)

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
            XCTAssertTrue(false, "Must instantiate and test Patient's PKs, but threw: \(error)")
        }
    }

  func testPatientRealm10(_ instance: FireKit.Patient) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runPatient10(JSONEncoder().encode(realm.objects(FireKit.Patient.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Patient.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Patient()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient10(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Patient.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPatient10(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Patient.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Patient.self).count)
  }
  
  @discardableResult
  func runPatient10(_ data: Data? = nil) throws -> FireKit.Patient {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-example-proband.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.birthDate?.description, "1966-04-04")
    XCTAssertFalse(inst.deceasedBoolean.value ?? true)
    XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/us-core-race")
    XCTAssertEqual(inst.extension_fhir[0].valueCodeableConcept?.coding[0].code, "2106-3")
    XCTAssertEqual(inst.extension_fhir[0].valueCodeableConcept?.coding[0].display, "white")
    XCTAssertEqual(inst.extension_fhir[0].valueCodeableConcept?.coding[0].system, "urn:oid:2.16.840.1.113883.6.238")
    XCTAssertEqual(inst.gender, "female")
    XCTAssertEqual(inst.id, "proband")
    XCTAssertEqual(inst.identifier[0].assigner?.display, "Boston Massachesetts General Hospital")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.840.1.113883.6.117")
    XCTAssertEqual(inst.identifier[0].type?.text, "Computer-Stored Abulatory Records (COSTAR)")
    XCTAssertEqual(inst.identifier[0].use, "usual")
    XCTAssertEqual(inst.identifier[0].value, "999999999")
    XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        \n        <b>Annie Proband</b>: Female, born 1966-04-04\n      </p>\n    \n    </div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
