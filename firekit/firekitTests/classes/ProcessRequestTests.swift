//
//  ProcessRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-11-07.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-11-07
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

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
        // print("Inflating FireKit.ProcessRequest from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ProcessRequest.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testProcessRequest1() {   
        var instance: FireKit.ProcessRequest?
        do {
            instance = try runProcessRequest1()
            try runProcessRequest1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm1(instance!)
    }

    func testProcessRequest1Copying() {
        do {
            let instance = try runProcessRequest1()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest1Populatability() {
        do {
            let instance = try runProcessRequest1()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest1NillingPopulatability() {
        do {
            let instance = try runProcessRequest1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm2(instance!)
    }

    func testProcessRequest2Copying() {
        do {
            let instance = try runProcessRequest2()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest2Populatability() {
        do {
            let instance = try runProcessRequest2()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest2NillingPopulatability() {
        do {
            let instance = try runProcessRequest2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm3(instance!)
    }

    func testProcessRequest3Copying() {
        do {
            let instance = try runProcessRequest3()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest3Populatability() {
        do {
            let instance = try runProcessRequest3()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest3NillingPopulatability() {
        do {
            let instance = try runProcessRequest3()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm4(instance!)
    }

    func testProcessRequest4Copying() {
        do {
            let instance = try runProcessRequest4()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest4Populatability() {
        do {
            let instance = try runProcessRequest4()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest4NillingPopulatability() {
        do {
            let instance = try runProcessRequest4()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm5(instance!)
    }

    func testProcessRequest5Copying() {
        do {
            let instance = try runProcessRequest5()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest5Populatability() {
        do {
            let instance = try runProcessRequest5()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest5NillingPopulatability() {
        do {
            let instance = try runProcessRequest5()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm6(instance!)
    }

    func testProcessRequest6Copying() {
        do {
            let instance = try runProcessRequest6()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest6Populatability() {
        do {
            let instance = try runProcessRequest6()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest6NillingPopulatability() {
        do {
            let instance = try runProcessRequest6()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm7(instance!)
    }

    func testProcessRequest7Copying() {
        do {
            let instance = try runProcessRequest7()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest7Populatability() {
        do {
            let instance = try runProcessRequest7()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest7NillingPopulatability() {
        do {
            let instance = try runProcessRequest7()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm8(instance!)
    }

    func testProcessRequest8Copying() {
        do {
            let instance = try runProcessRequest8()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest8(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest8Populatability() {
        do {
            let instance = try runProcessRequest8()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest8(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest8NillingPopulatability() {
        do {
            let instance = try runProcessRequest8()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcessRequest successfully, but threw: \(error)")
        }

        testProcessRequestRealm9(instance!)
    }

    func testProcessRequest9Copying() {
        do {
            let instance = try runProcessRequest9()
            let copy = instance.copy() as? FireKit.ProcessRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcessRequest9(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest9Populatability() {
        do {
            let instance = try runProcessRequest9()
            let copy = FireKit.ProcessRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcessRequest9(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcessRequest successfully, but threw: \(error)")
        }
    }

    func testProcessRequest9NillingPopulatability() {
        do {
            let instance = try runProcessRequest9()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ProcessRequest()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ProcessRequest successfully, but threw: \(error)")
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
        let existing = realm.object(ofType: FireKit.ProcessRequest.self, forPrimaryKey: newInst.pk)!
        
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