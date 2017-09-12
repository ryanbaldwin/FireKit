//
//  ProcessRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-12.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ProcessRequestTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.ProcessRequest {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.ProcessRequest {
      print("Inflating FireKit.ProcessRequest from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.ProcessRequest.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testProcessRequest1() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest1()
      try runProcessRequest1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm1(instance!)
  }

  func testProcessRequest1RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest1()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm1(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest1(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest1(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-poll-eob.json")
    
    XCTAssertEqual(inst.action, "poll")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "1115")
    XCTAssertEqual(inst.identifier[0].system, "http://www.phr.com/patient/12345/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "115")
    XCTAssertEqual(inst.include[0].value, "ExplanationOfBenefit")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Poll ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest2() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest2()
      try runProcessRequest2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm2(instance!)
  }

  func testProcessRequest2RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest2()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm2(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest2(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest2(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-poll-exclusive.json")
    
    XCTAssertEqual(inst.action, "poll")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.exclude[0].value, "SupportingDocumentation")
    XCTAssertEqual(inst.exclude[1].value, "Reconciliation")
    XCTAssertEqual(inst.id, "1113")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "113")
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Poll ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest3() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest3()
      try runProcessRequest3(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest3(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm3(instance!)
  }

  func testProcessRequest3RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest3()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm3(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest3(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest3(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-poll-inclusive.json")
    
    XCTAssertEqual(inst.action, "poll")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "1112")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "112")
    XCTAssertEqual(inst.include[0].value, "Reconciliation")
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Poll ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest4() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest4()
      try runProcessRequest4(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest4(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm4(instance!)
  }

  func testProcessRequest4RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest4()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm4(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest4(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest4(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-poll-payrec.json")
    
    XCTAssertEqual(inst.action, "poll")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "1114")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "114")
    XCTAssertEqual(inst.include[0].value, "Reconciliation")
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.period?.end?.description, "2014-08-20")
    XCTAssertEqual(inst.period?.start?.description, "2014-08-10")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Poll ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest5() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest5()
      try runProcessRequest5(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest5(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm5(instance!)
  }

  func testProcessRequest5RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest5()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm5(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest5(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest5(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-poll-specific.json")
    
    XCTAssertEqual(inst.action, "poll")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "1111")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "111")
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.request?.reference, "http://benefitco.com/oralhealthclaim/12345")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Poll ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest6() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest6()
      try runProcessRequest6(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest6(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm6(instance!)
  }

  func testProcessRequest6RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest6()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm6(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest6(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest6(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-reprocess.json")
    
    XCTAssertEqual(inst.action, "reprocess")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "44654")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "44543")
    XCTAssertEqual(inst.item[0].sequenceLinkId.value, 1)
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.reference, "ABC12345G")
    XCTAssertEqual(inst.request?.reference, "http://BenefitsInc.com/fhir/oralhealthclaim/12345")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ReProcess ProcessRequest resource.</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest7() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest7()
      try runProcessRequest7(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest7(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest7(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm7(instance!)
  }

  func testProcessRequest7RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest7()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm7(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest7(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest7(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-reverse.json")
    
    XCTAssertEqual(inst.action, "cancel")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "87654")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "76543")
    XCTAssertFalse(inst.nullify.value ?? true)
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.request?.reference, "http://BenefitsInc.com/fhir/oralhealthclaim/12345")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Reversal ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest8() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest8()
      try runProcessRequest8(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest8(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest8(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm8(instance!)
  }

  func testProcessRequest8RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest8()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm8(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest8(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest8(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example-status.json")
    
    XCTAssertEqual(inst.action, "status")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "87655")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "1776543")
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.request?.reference, "http://BenefitsInc.com/oralhealthclaim/12345")
    XCTAssertEqual(inst.response?.reference, "http://BenefitsInc.com/fhir/claimresponse/3500")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Status ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testProcessRequest9() {   
    var instance: FireKit.ProcessRequest?
    do {
      instance = try runProcessRequest9()
      try runProcessRequest9(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.ProcessRequest
      XCTAssertNotNil(copy)
      try runProcessRequest9(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runProcessRequest9(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
    }

    testProcessRequestRealm9(instance!)
  }

  func testProcessRequest9RealmPK() { 
      do {
        let instance: FireKit.ProcessRequest = try runProcessRequest9()
        let copy = (instance.copy() as! FireKit.ProcessRequest)

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
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest's PKs, but threw: \(error)")
        }
    }

  func testProcessRequestRealm9(_ instance: FireKit.ProcessRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcessRequest9(JSONEncoder().encode(realm.objects(FireKit.ProcessRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcessRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcessRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest9(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runProcessRequest9(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcessRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcessRequest.self).count)
  }
  
  @discardableResult
  func runProcessRequest9(_ data: Data? = nil) throws -> FireKit.ProcessRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "processrequest-example.json")
    
    XCTAssertEqual(inst.action, "poll")
    XCTAssertEqual(inst.created?.description, "2014-08-16")
    XCTAssertEqual(inst.id, "1110")
    XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/processrequest")
    XCTAssertEqual(inst.identifier[0].value, "110")
    XCTAssertEqual(inst.organization?.reference, "Organization/1")
    XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Poll ProcessRequest</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
