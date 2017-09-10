//
//  PractitionerTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class PractitionerTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Practitioner {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Practitioner {
      let instance = try JSONDecoder().decode(FireKit.Practitioner.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testPractitioner1() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner1()
      try runPractitioner1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm1(instance!)
  }

    func testPractitioner1RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner1()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm1(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner1(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner1(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f001-evdb.json")
    
    XCTAssertEqual(inst.address[0].city, "Den Burg")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
    XCTAssertEqual(inst.address[0].postalCode, "9105 PZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1975-12-07")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f001")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "938273695")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "129IDH4OP733")
    XCTAssertEqual(inst.name?.family[0].value, "van den broek")
    XCTAssertEqual(inst.name?.given[0].value, "Eric")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "01.018")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Ear-, Nose and Throat")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "0205568263")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "E.M.vandenbroek@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205664440")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner2() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner2()
      try runPractitioner2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm2(instance!)
  }

    func testPractitioner2RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner2()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm2(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner2(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner2(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f002-pv.json")
    
    XCTAssertEqual(inst.address[0].city, "Den Burg")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
    XCTAssertEqual(inst.address[0].postalCode, "9105 PZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1979-04-29")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f002")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "730291637")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "174BIP3JH438")
    XCTAssertEqual(inst.name?.family[0].value, "Voigt")
    XCTAssertEqual(inst.name?.given[0].value, "Pieter")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "01.011")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Cardiothoracal surgery")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "0205569336")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "p.voigt@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205669382")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner3() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner3()
      try runPractitioner3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm3(instance!)
  }

    func testPractitioner3RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner3()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm3(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner3(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner3(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f003-mv.json")
    
    XCTAssertEqual(inst.address[0].city, "Amsterdam")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
    XCTAssertEqual(inst.address[0].postalCode, "1105 AZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1963-07-01")
    XCTAssertEqual(inst.communication[0].coding[0].code, "nl")
    XCTAssertEqual(inst.communication[0].coding[0].display, "Dutch")
    XCTAssertEqual(inst.communication[0].coding[0].system, "urn:oid:2.16.840.1.113883.6.121")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f003")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "846100293")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "243HID3RT938")
    XCTAssertEqual(inst.name?.family[0].value, "Versteegh")
    XCTAssertEqual(inst.name?.given[0].value, "Marc")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "01.011")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Cardiothoracal surgery")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "0205562431")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "m.versteegh@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205662948")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner4() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner4()
      try runPractitioner4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm4(instance!)
  }

    func testPractitioner4RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner4()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm4(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner4(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner4(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f004-rb.json")
    
    XCTAssertEqual(inst.address[0].city, "Amsterdam")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
    XCTAssertEqual(inst.address[0].postalCode, "1105 AZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1980-02-04")
    XCTAssertEqual(inst.communication[0].coding[0].code, "nl")
    XCTAssertEqual(inst.communication[0].coding[0].display, "Netherlands")
    XCTAssertEqual(inst.communication[0].coding[0].system, "urn:oid:2.16.840.1.113883.6.121")
    XCTAssertEqual(inst.communication[0].text, "Language")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f004")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "118265112")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "523ASA1LK927")
    XCTAssertEqual(inst.name?.family[0].value, "Briet")
    XCTAssertEqual(inst.name?.given[0].value, "Ronald")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "01.018")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Ear-, Nose and Throat")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "0205569273")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "r.briet@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205664440")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner5() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner5()
      try runPractitioner5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm5(instance!)
  }

    func testPractitioner5RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner5()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm5(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner5(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner5(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f005-al.json")
    
    XCTAssertEqual(inst.address[0].city, "Amsterdam")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 9")
    XCTAssertEqual(inst.address[0].postalCode, "1105 AZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1959-03-11")
    XCTAssertEqual(inst.communication[0].coding[0].code, "fr")
    XCTAssertEqual(inst.communication[0].coding[0].display, "France")
    XCTAssertEqual(inst.communication[0].coding[0].system, "urn:oid:2.16.840.1.113883.6.121")
    XCTAssertEqual(inst.gender, "female")
    XCTAssertEqual(inst.id, "f005")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "118265112")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "191REW8WE916")
    XCTAssertEqual(inst.name?.family[0].value, "Anne")
    XCTAssertEqual(inst.name?.given[0].value, "Langeveld")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "01.018")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Keel- neus- en oorarts")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "0205563847")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "a.langeveld@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205668916")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner6() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner6()
      try runPractitioner6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm6(instance!)
  }

    func testPractitioner6RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner6()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm6(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner6(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner6(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f006-rvdb.json")
    
    XCTAssertEqual(inst.address[0].city, "Den Burg")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
    XCTAssertEqual(inst.address[0].postalCode, "9105 PZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1975-12-07")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f006")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "937223645")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "134IDY41W988")
    XCTAssertEqual(inst.name?.family[0].value, "van den Berk")
    XCTAssertEqual(inst.name?.given[0].value, "Rob")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "17.000")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Pharmacist")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "0205569288")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "R.A.vandenberk@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205664987")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner7() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner7()
      try runPractitioner7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner7(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm7(instance!)
  }

    func testPractitioner7RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner7()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm7(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner7(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner7(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f007-sh.json")
    
    XCTAssertEqual(inst.address[0].city, "Den Burg")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Galapagosweg 91")
    XCTAssertEqual(inst.address[0].postalCode, "9105 PZ")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1971-11-07")
    XCTAssertEqual(inst.gender, "female")
    XCTAssertEqual(inst.id, "f007")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "874635264")
    XCTAssertEqual(inst.identifier[1].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
    XCTAssertEqual(inst.identifier[1].use, "usual")
    XCTAssertEqual(inst.identifier[1].value, "567IUI51C154")
    XCTAssertEqual(inst.name?.family[0].value, "Heps")
    XCTAssertEqual(inst.name?.given[0].value, "Simone")
    XCTAssertEqual(inst.name?.suffix[0].value, "MD")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "BMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f001")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "01.000")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Arts")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].role?.text, "Care role")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "01.015")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Physician")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "urn:oid:2.16.840.1.113883.2.4.15.111")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].text, "specialization")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "020556936")
    XCTAssertEqual(inst.telecom[1].system, "email")
    XCTAssertEqual(inst.telecom[1].use, "work")
    XCTAssertEqual(inst.telecom[1].value, "S.M.Heps@bmc.nl")
    XCTAssertEqual(inst.telecom[2].system, "fax")
    XCTAssertEqual(inst.telecom[2].use, "work")
    XCTAssertEqual(inst.telecom[2].value, "0205669283")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner8() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner8()
      try runPractitioner8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner8(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm8(instance!)
  }

    func testPractitioner8RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner8()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm8(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner8(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner8(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f201-ab.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.address[0].city, "Den helder")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Walvisbaai 3")
    XCTAssertEqual(inst.address[0].line[1].value, "C4 - Automatisering")
    XCTAssertEqual(inst.address[0].postalCode, "2333ZA")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1956-12-24")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f201")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].type?.text, "UZI-nummer")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "12345678901")
    XCTAssertEqual(inst.name?.family[0].value, "Bronsig")
    XCTAssertEqual(inst.name?.given[0].value, "Arend")
    XCTAssertEqual(inst.name?.prefix[0].value, "Dr.")
    XCTAssertEqual(inst.name?.text, "Dokter Bronsig")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "AUMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f201")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "225304007")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Implementation of planned interventions")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "310512001")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Medical oncologist")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.qualification[0].code?.coding[0].code, "41672002")
    XCTAssertEqual(inst.qualification[0].code?.coding[0].display, "Pulmonologist")
    XCTAssertEqual(inst.qualification[0].code?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "+31715269111")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner9() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner9()
      try runPractitioner9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner9(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm9(instance!)
  }

    func testPractitioner9RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner9()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm9(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner9(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner9(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f202-lm.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.address[0].city, "Den helder")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Walvisbaai 3")
    XCTAssertEqual(inst.address[0].line[1].value, "C4 - Automatisering")
    XCTAssertEqual(inst.address[0].postalCode, "2333ZA")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1960-06-12")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f202")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].type?.text, "UZI-nummer")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "12345678902")
    XCTAssertEqual(inst.identifier[1].system, "https://www.bigregister.nl/")
    XCTAssertEqual(inst.identifier[1].type?.text, "BIG-nummer")
    XCTAssertEqual(inst.identifier[1].use, "official")
    XCTAssertEqual(inst.identifier[1].value, "12345678902")
    XCTAssertEqual(inst.name?.family[0].value, "Maas")
    XCTAssertEqual(inst.name?.given[0].value, "Luigi")
    XCTAssertEqual(inst.name?.prefix[0].value, "Dr.")
    XCTAssertEqual(inst.name?.text, "Luigi Maas")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "AUMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f201")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "33526004")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Electronic laboratory reporting")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "159285000")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Medical laboratory technician")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "+31715269111")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testPractitioner10() {   
    var instance: FireKit.Practitioner?
    do {
      instance = try runPractitioner10()
      try runPractitioner10(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Practitioner
      XCTAssertNotNil(copy)
      try runPractitioner10(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runPractitioner10(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Practitioner successfully, but threw: \(error)")
    }

    testPractitionerRealm10(instance!)
  }

    func testPractitioner10RealmPK() {        
        do {
            let instance: FireKit.Practitioner = try runPractitioner10()
            let copy = (instance.copy() as! FireKit.Practitioner)

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
            XCTAssertTrue(false, "Must instantiate and test Practitioner's PKs, but threw: \(error)")
        }
    }

  func testPractitionerRealm10(_ instance: FireKit.Practitioner) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runPractitioner10(JSONEncoder().encode(realm.objects(FireKit.Practitioner.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Practitioner.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Practitioner()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner10(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Practitioner.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runPractitioner10(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Practitioner.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Practitioner.self).count)
  }
  
  @discardableResult
  func runPractitioner10(_ data: Data? = nil) throws -> FireKit.Practitioner {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-example-f203-jvg.json")
    
    XCTAssertTrue(inst.active.value ?? false)
    XCTAssertEqual(inst.address[0].city, "Den helder")
    XCTAssertEqual(inst.address[0].country, "NLD")
    XCTAssertEqual(inst.address[0].line[0].value, "Walvisbaai 3")
    XCTAssertEqual(inst.address[0].postalCode, "2333ZA")
    XCTAssertEqual(inst.address[0].use, "work")
    XCTAssertEqual(inst.birthDate?.description, "1983-04-20")
    XCTAssertEqual(inst.gender, "male")
    XCTAssertEqual(inst.id, "f203")
    XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.528.1.1007.3.1")
    XCTAssertEqual(inst.identifier[0].type?.text, "UZI-nummer")
    XCTAssertEqual(inst.identifier[0].use, "official")
    XCTAssertEqual(inst.identifier[0].value, "12345678903")
    XCTAssertEqual(inst.identifier[1].system, "https://www.bigregister.nl/")
    XCTAssertEqual(inst.identifier[1].type?.text, "BIG-nummer")
    XCTAssertEqual(inst.identifier[1].use, "official")
    XCTAssertEqual(inst.identifier[1].value, "12345678903")
    XCTAssertEqual(inst.name?.text, "Juri van Gelder")
    XCTAssertEqual(inst.name?.use, "official")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.display, "AUMC")
    XCTAssertEqual(inst.practitionerRole[0].managingOrganization?.reference, "Organization/f201")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].code, "36682004")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].display, "Physical therapist")
    XCTAssertEqual(inst.practitionerRole[0].role?.coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].code, "410158009")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].display, "Assess physical therapist service")
    XCTAssertEqual(inst.practitionerRole[0].specialty[0].coding[0].system, "http://snomed.info/sct")
    XCTAssertEqual(inst.telecom[0].system, "phone")
    XCTAssertEqual(inst.telecom[0].use, "work")
    XCTAssertEqual(inst.telecom[0].value, "+31715269111")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
