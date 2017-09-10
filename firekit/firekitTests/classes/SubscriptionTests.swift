//
//  SubscriptionTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class SubscriptionTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Subscription {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Subscription {
      let instance = try JSONDecoder().decode(FireKit.Subscription.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testSubscription1() {   
    var instance: FireKit.Subscription?
    do {
      instance = try runSubscription1()
      try runSubscription1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Subscription
      XCTAssertNotNil(copy)
      try runSubscription1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubscription1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Subscription successfully, but threw: \(error)")
    }

    testSubscriptionRealm1(instance!)
  }

    func testSubscription1RealmPK() {        
        do {
            let instance: FireKit.Subscription = try runSubscription1()
            let copy = (instance.copy() as! FireKit.Subscription)

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
            XCTAssertTrue(false, "Must instantiate and test Subscription's PKs, but threw: \(error)")
        }
    }

  func testSubscriptionRealm1(_ instance: FireKit.Subscription) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runSubscription1(JSONEncoder().encode(realm.objects(FireKit.Subscription.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Subscription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Subscription.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Subscription()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Subscription.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubscription1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Subscription.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubscription1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Subscription.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Subscription.self).count)
  }
  
  @discardableResult
  func runSubscription1(_ data: Data? = nil) throws -> FireKit.Subscription {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "subscription-example-error.json")
    
    XCTAssertEqual(inst.channel?.endpoint, "https://biliwatch.com/customers/mount-auburn-miu/on-result")
    XCTAssertEqual(inst.channel?.header, "Authorization: Bearer secret-token-abc-123")
    XCTAssertEqual(inst.channel?.payload, "application/json")
    XCTAssertEqual(inst.channel?.type, "rest-hook")
    XCTAssertEqual(inst.contact[0].system, "phone")
    XCTAssertEqual(inst.contact[0].value, "ext 4123")
    XCTAssertEqual(inst.criteria, "Observation?code=http://loinc.org|1975-2")
    XCTAssertEqual(inst.end?.description, "2021-01-01T00:00:00Z")
    XCTAssertEqual(inst.error, "Socket Error 10060 - can't connect to host")
    XCTAssertEqual(inst.id, "example-error")
    XCTAssertEqual(inst.reason, "Monitor new neonatal function")
    XCTAssertEqual(inst.status, "error")
    XCTAssertEqual(inst.tag[0].code, "bili-done")
    XCTAssertEqual(inst.tag[0].system, "http://example.org/fhir/cs/internal")
    XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
  
  func testSubscription2() {   
    var instance: FireKit.Subscription?
    do {
      instance = try runSubscription2()
      try runSubscription2(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Subscription
      XCTAssertNotNil(copy)
      try runSubscription2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runSubscription2(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Subscription successfully, but threw: \(error)")
    }

    testSubscriptionRealm2(instance!)
  }

    func testSubscription2RealmPK() {        
        do {
            let instance: FireKit.Subscription = try runSubscription2()
            let copy = (instance.copy() as! FireKit.Subscription)

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
            XCTAssertTrue(false, "Must instantiate and test Subscription's PKs, but threw: \(error)")
        }
    }

  func testSubscriptionRealm2(_ instance: FireKit.Subscription) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runSubscription2(JSONEncoder().encode(realm.objects(FireKit.Subscription.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Subscription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Subscription.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Subscription()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Subscription.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubscription2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Subscription.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSubscription2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Subscription.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Subscription.self).count)
  }
  
  @discardableResult
  func runSubscription2(_ data: Data? = nil) throws -> FireKit.Subscription {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "subscription-example.json")
    
    XCTAssertEqual(inst.channel?.endpoint, "https://biliwatch.com/customers/mount-auburn-miu/on-result")
    XCTAssertEqual(inst.channel?.header, "Authorization: Bearer secret-token-abc-123")
    XCTAssertEqual(inst.channel?.payload, "application/json")
    XCTAssertEqual(inst.channel?.type, "rest-hook")
    XCTAssertEqual(inst.contact[0].system, "phone")
    XCTAssertEqual(inst.contact[0].value, "ext 4123")
    XCTAssertEqual(inst.criteria, "Observation?code=http://loinc.org|1975-2")
    XCTAssertEqual(inst.end?.description, "2021-01-01T00:00:00Z")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.reason, "Monitor new neonatal function")
    XCTAssertEqual(inst.status, "requested")
    XCTAssertEqual(inst.tag[0].code, "bili-done")
    XCTAssertEqual(inst.tag[0].system, "http://example.org/fhir/cs/internal")
    XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
