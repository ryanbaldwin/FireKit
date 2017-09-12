//
//  TestScriptTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-11.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class TestScriptTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.TestScript {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.TestScript {
      let instance = try JSONDecoder().decode(FireKit.TestScript.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testTestScript1() {   
    var instance: FireKit.TestScript?
    do {
      instance = try runTestScript1()
      try runTestScript1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.TestScript
      XCTAssertNotNil(copy)
      try runTestScript1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runTestScript1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test TestScript successfully, but threw: \(error)")
    }

    testTestScriptRealm1(instance!)
  }

  func testTestScript1RealmPK() { 
      do {
        let instance: FireKit.TestScript = try runTestScript1()
        let copy = (instance.copy() as! FireKit.TestScript)

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
            XCTAssertTrue(false, "Must instantiate and test TestScript's PKs, but threw: \(error)")
        }
    }

  func testTestScriptRealm1(_ instance: FireKit.TestScript) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runTestScript1(JSONEncoder().encode(realm.objects(FireKit.TestScript.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.TestScript.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.TestScript.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.TestScript()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.TestScript.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runTestScript1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.TestScript.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runTestScript1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.TestScript.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.TestScript.self).count)
  }
  
  @discardableResult
  func runTestScript1(_ data: Data? = nil) throws -> FireKit.TestScript {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "testscript-example-multiserver.json")
    
    XCTAssertEqual(inst.description_fhir, "Multiserver Test Script")
    XCTAssertEqual(inst.fixture[0].id, "F1")
    XCTAssertEqual(inst.fixture[0].resource?.reference, "Patient/example")
    XCTAssertEqual(inst.id, "multiserver")
    XCTAssertTrue(inst.multiserver.value ?? false)
    XCTAssertEqual(inst.name, "Multiserver Test Script")
    XCTAssertEqual(inst.setup?.action[0].operation?.contentType, "xml")
    XCTAssertEqual(inst.setup?.action[0].operation?.destination.value, 0)
    XCTAssertEqual(inst.setup?.action[0].operation?.sourceId, "F1")
    XCTAssertEqual(inst.setup?.action[0].operation?.type?.code, "create")
    XCTAssertEqual(inst.setup?.metadata?.capability[0].conformance?.reference, "Conformance/example")
    XCTAssertEqual(inst.setup?.metadata?.capability[0].description_fhir, "Patient Create Operation")
    XCTAssertEqual(inst.setup?.metadata?.capability[0].link[0].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#create")
    XCTAssertTrue(inst.setup?.metadata?.capability[0].required.value ?? false)
    XCTAssertEqual(inst.setup?.metadata?.link[0].description_fhir, "FHIR Patient")
    XCTAssertEqual(inst.setup?.metadata?.link[0].url, "http://hl7.org/implement/standards/FHIR-Develop/patient.html")
    XCTAssertEqual(inst.status, "draft")
    XCTAssertEqual(inst.teardown?.action[0].operation?.destination.value, 0)
    XCTAssertEqual(inst.teardown?.action[0].operation?.targetId, "F1")
    XCTAssertEqual(inst.teardown?.action[0].operation?.type?.code, "delete")
    XCTAssertEqual(inst.teardown?.action[1].operation?.destination.value, 1)
    XCTAssertEqual(inst.teardown?.action[1].operation?.targetId, "F1")
    XCTAssertEqual(inst.teardown?.action[1].operation?.type?.code, "delete")
    XCTAssertEqual(inst.test[0].action[0].operation?.destination.value, 0)
    XCTAssertEqual(inst.test[0].action[0].operation?.responseId, "R1")
    XCTAssertEqual(inst.test[0].action[0].operation?.targetId, "F1")
    XCTAssertEqual(inst.test[0].action[0].operation?.type?.code, "read")
    XCTAssertEqual(inst.test[0].action[1].assert?.response, "okay")
    XCTAssertEqual(inst.test[0].action[2].assert?.headerField, "Last-Modified")
    XCTAssertEqual(inst.test[0].action[2].assert?.operator_fhir, "notEmpty")
    XCTAssertEqual(inst.test[0].action[3].assert?.resource, "Patient")
    XCTAssertEqual(inst.test[0].action[4].assert?.minimumId, "F1")
    XCTAssertEqual(inst.test[0].description_fhir, "Read the patient from server 0.")
    XCTAssertEqual(inst.test[0].id, "READ01")
    XCTAssertEqual(inst.test[0].metadata?.capability[0].conformance?.reference, "Conformance/example")
    XCTAssertEqual(inst.test[0].metadata?.capability[0].description_fhir, "Patient Read Operation")
    XCTAssertEqual(inst.test[0].metadata?.capability[0].link[0].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#read")
    XCTAssertTrue(inst.test[0].metadata?.capability[0].validated.value ?? false)
    XCTAssertEqual(inst.test[0].name, "Read Patient")
    XCTAssertEqual(inst.test[1].action[0].operation?.destination.value, 1)
    XCTAssertEqual(inst.test[1].action[0].operation?.sourceId, "R1")
    XCTAssertEqual(inst.test[1].action[0].operation?.type?.code, "create")
    XCTAssertEqual(inst.test[1].action[1].assert?.response, "okay")
    XCTAssertEqual(inst.test[1].action[2].operation?.destination.value, 1)
    XCTAssertEqual(inst.test[1].action[2].operation?.responseId, "R2")
    XCTAssertEqual(inst.test[1].action[2].operation?.targetId, "R1")
    XCTAssertEqual(inst.test[1].action[2].operation?.type?.code, "read")
    XCTAssertEqual(inst.test[1].action[3].assert?.response, "okay")
    XCTAssertEqual(inst.test[1].action[4].assert?.headerField, "Last-Modified")
    XCTAssertEqual(inst.test[1].action[4].assert?.operator_fhir, "notEmpty")
    XCTAssertEqual(inst.test[1].action[5].assert?.resource, "Patient")
    XCTAssertEqual(inst.test[1].action[6].assert?.minimumId, "F1")
    XCTAssertEqual(inst.test[1].action[7].assert?.minimumId, "R1")
    XCTAssertEqual(inst.test[1].description_fhir, "Write the patient read from server 0 to server 1.")
    XCTAssertEqual(inst.test[1].id, "WRITE01")
    XCTAssertEqual(inst.test[1].metadata?.capability[0].conformance?.reference, "Conformance/example")
    XCTAssertEqual(inst.test[1].metadata?.capability[0].description_fhir, "Patient Create Operation")
    XCTAssertEqual(inst.test[1].metadata?.capability[0].link[0].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#create")
    XCTAssertTrue(inst.test[1].metadata?.capability[0].validated.value ?? false)
    XCTAssertEqual(inst.test[1].metadata?.capability[1].conformance?.reference, "Conformance/example")
    XCTAssertEqual(inst.test[1].metadata?.capability[1].description_fhir, "Patient Read Operation")
    XCTAssertEqual(inst.test[1].metadata?.capability[1].link[0].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#read")
    XCTAssertTrue(inst.test[1].metadata?.capability[1].validated.value ?? false)
    XCTAssertEqual(inst.test[1].name, "Write Patient")
    XCTAssertEqual(inst.test[2].action[0].operation?.destination.value, 0)
    XCTAssertEqual(inst.test[2].action[0].operation?.sourceId, "R2")
    XCTAssertEqual(inst.test[2].action[0].operation?.targetId, "R1")
    XCTAssertEqual(inst.test[2].action[0].operation?.type?.code, "update")
    XCTAssertEqual(inst.test[2].action[1].assert?.response, "okay")
    XCTAssertEqual(inst.test[2].action[2].operation?.destination.value, 0)
    XCTAssertEqual(inst.test[2].action[2].operation?.responseId, "R3")
    XCTAssertEqual(inst.test[2].action[2].operation?.targetId, "R1")
    XCTAssertEqual(inst.test[2].action[2].operation?.type?.code, "read")
    XCTAssertEqual(inst.test[2].action[3].assert?.response, "okay")
    XCTAssertEqual(inst.test[2].action[4].assert?.headerField, "Last-Modified")
    XCTAssertEqual(inst.test[2].action[4].assert?.operator_fhir, "notEmpty")
    XCTAssertEqual(inst.test[2].action[5].assert?.resource, "Patient")
    XCTAssertEqual(inst.test[2].action[6].assert?.minimumId, "F1")
    XCTAssertEqual(inst.test[2].action[7].assert?.minimumId, "R1")
    XCTAssertEqual(inst.test[2].action[8].assert?.minimumId, "R2")
    XCTAssertEqual(inst.test[2].description_fhir, "Update the patient on server 0 with the one read from server 1.")
    XCTAssertEqual(inst.test[2].id, "UPDATE01")
    XCTAssertEqual(inst.test[2].metadata?.capability[0].conformance?.reference, "Conformance/example")
    XCTAssertEqual(inst.test[2].metadata?.capability[0].description_fhir, "Patient Update Operation")
    XCTAssertEqual(inst.test[2].metadata?.capability[0].link[0].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#update")
    XCTAssertTrue(inst.test[2].metadata?.capability[0].validated.value ?? false)
    XCTAssertEqual(inst.test[2].name, "Update Patient")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.url, "http://hl7.org/fhir/TestScript/multiserver")
    
    return inst
  }
  
  func testTestScript2() {   
    var instance: FireKit.TestScript?
    do {
      instance = try runTestScript2()
      try runTestScript2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.TestScript
      XCTAssertNotNil(copy)
      try runTestScript2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runTestScript2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test TestScript successfully, but threw: \(error)")
    }

    testTestScriptRealm2(instance!)
  }

  func testTestScript2RealmPK() { 
      do {
        let instance: FireKit.TestScript = try runTestScript2()
        let copy = (instance.copy() as! FireKit.TestScript)

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
            XCTAssertTrue(false, "Must instantiate and test TestScript's PKs, but threw: \(error)")
        }
    }

  func testTestScriptRealm2(_ instance: FireKit.TestScript) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runTestScript2(JSONEncoder().encode(realm.objects(FireKit.TestScript.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.TestScript.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.TestScript.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.TestScript()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.TestScript.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runTestScript2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.TestScript.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runTestScript2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.TestScript.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.TestScript.self).count)
  }
  
  @discardableResult
  func runTestScript2(_ data: Data? = nil) throws -> FireKit.TestScript {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "testscript-example.json")
    
    XCTAssertEqual(inst.contact[0].name, "Support")
    XCTAssertEqual(inst.contact[0].telecom[0].system, "email")
    XCTAssertEqual(inst.contact[0].telecom[0].use, "temp")
    XCTAssertEqual(inst.contact[0].telecom[0].value, "support@gmail.com")
    XCTAssertEqual(inst.date?.description, "2015-08-31")
    XCTAssertEqual(inst.description_fhir, "Example Test Script")
    XCTAssertTrue(inst.experimental.value ?? false)
    XCTAssertFalse(inst.fixture[0].autocreate.value ?? true)
    XCTAssertFalse(inst.fixture[0].autodelete.value ?? true)
    XCTAssertEqual(inst.fixture[0].id, "F1")
    XCTAssertEqual(inst.fixture[0].resource?.display, "Patient resource")
    XCTAssertEqual(inst.fixture[0].resource?.reference, "Patient/example")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.identifier?.system, "urn:ietf:rfc:3986")
    XCTAssertEqual(inst.identifier?.value, "urn:oid:1.3.6.1.4.1.21367.2005.3.7.9876")
    XCTAssertEqual(inst.metadata?.capability[0].conformance?.reference, "Conformance/example")
    XCTAssertEqual(inst.metadata?.capability[0].description_fhir, "Patient Create, Read, and Update Operations")
    XCTAssertEqual(inst.metadata?.capability[0].destination.value, 1)
    XCTAssertEqual(inst.metadata?.capability[0].link[0].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#create")
    XCTAssertEqual(inst.metadata?.capability[0].link[1].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#read")
    XCTAssertEqual(inst.metadata?.capability[0].link[2].value, "http://hl7.org/implement/standards/FHIR-Develop/http.html#update")
    XCTAssertTrue(inst.metadata?.capability[0].required.value ?? false)
    XCTAssertEqual(inst.name, "Test Script 1")
    XCTAssertEqual(inst.profile[0].id, "patient-profile")
    XCTAssertEqual(inst.profile[0].reference, "http://hl7.org/fhir/StructureDefinition/Patient")
    XCTAssertEqual(inst.publisher, "HL7")
    XCTAssertEqual(inst.requirements, "Patient Create, Read, and Update Operations")
    XCTAssertEqual(inst.setup?.action[0].operation?.accept, "json")
    XCTAssertEqual(inst.setup?.action[0].operation?.description_fhir, "Create patient resource on test server")
    XCTAssertEqual(inst.setup?.action[0].operation?.label, "SetupPatient")
    XCTAssertEqual(inst.setup?.action[0].operation?.responseId, "create-response")
    XCTAssertEqual(inst.setup?.action[0].operation?.sourceId, "F1")
    XCTAssertEqual(inst.setup?.action[0].operation?.type?.code, "create")
    XCTAssertEqual(inst.setup?.action[1].assert?.direction, "request")
    XCTAssertEqual(inst.setup?.action[1].assert?.responseCode, "201")
    XCTAssertEqual(inst.status, "draft")
    XCTAssertFalse(inst.test[0].action[0].operation?.encodeRequestUrl.value ?? true)
    XCTAssertEqual(inst.test[0].action[0].operation?.responseId, "F1-read")
    XCTAssertEqual(inst.test[0].action[0].operation?.targetId, "F1")
    XCTAssertEqual(inst.test[0].action[0].operation?.type?.code, "read")
    XCTAssertEqual(inst.test[0].action[1].assert?.description_fhir, "Test for OK response")
    XCTAssertEqual(inst.test[0].action[1].assert?.direction, "request")
    XCTAssertEqual(inst.test[0].action[1].assert?.label, "ReadOK")
    XCTAssertEqual(inst.test[0].action[1].assert?.response, "okay")
    XCTAssertEqual(inst.test[0].action[2].assert?.headerField, "Last-Modified")
    XCTAssertEqual(inst.test[0].action[2].assert?.operator_fhir, "notEmpty")
    XCTAssertTrue(inst.test[0].action[2].assert?.warningOnly.value ?? false)
    XCTAssertEqual(inst.test[0].action[3].assert?.resource, "Patient")
    XCTAssertEqual(inst.test[0].action[4].assert?.validateProfileId, "patient-profile")
    XCTAssertEqual(inst.test[0].action[5].assert?.operator_fhir, "equals")
    XCTAssertEqual(inst.test[0].action[5].assert?.path, "fhir:Patient/fhir:name/fhir:family/@value")
    XCTAssertEqual(inst.test[0].action[5].assert?.value, "Chalmers")
    XCTAssertEqual(inst.test[0].action[6].assert?.operator_fhir, "equals")
    XCTAssertEqual(inst.test[0].action[6].assert?.path, "fhir:Patient/fhir:name/fhir:family/@value")
    XCTAssertEqual(inst.test[0].action[6].assert?.sourceId, "F1")
    XCTAssertEqual(inst.test[0].action[6].assert?.value, "Chalmers")
    XCTAssertEqual(inst.test[0].action[7].assert?.compareToSourceId, "F1-read")
    XCTAssertEqual(inst.test[0].action[7].assert?.compareToSourcePath, "fhir:Patient/fhir:name/fhir:family/@value")
    XCTAssertEqual(inst.test[0].action[7].assert?.operator_fhir, "equals")
    XCTAssertEqual(inst.test[0].action[7].assert?.path, "fhir:Patient/fhir:name/fhir:family/@value")
    XCTAssertEqual(inst.test[0].action[8].assert?.compareToSourceId, "F1-read")
    XCTAssertEqual(inst.test[0].action[8].assert?.compareToSourcePath, "fhir:Patient/fhir:name/fhir:family/@value")
    XCTAssertEqual(inst.test[0].action[8].assert?.path, "fhir:Patient/fhir:name/fhir:family/@value")
    XCTAssertEqual(inst.test[0].action[8].assert?.sourceId, "F1")
    XCTAssertEqual(inst.test[0].action[9].assert?.minimumId, "F1-min")
    XCTAssertEqual(inst.test[0].description_fhir, "Read a patient and validate response.")
    XCTAssertEqual(inst.test[0].id, "READ01")
    XCTAssertEqual(inst.test[0].name, "Read Patient")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.url, "http://hl7.org/fhir/TestScript/example")
    XCTAssertEqual(inst.useContext[0].coding[0].code, "US")
    XCTAssertEqual(inst.useContext[0].coding[0].display, "United States of America (the)")
    XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")
    XCTAssertEqual(inst.version, "1.0")
    
    return inst
  }
}
