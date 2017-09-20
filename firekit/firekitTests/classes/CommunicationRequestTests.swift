//
//  CommunicationRequestTests.swift
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


class CommunicationRequestTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.CommunicationRequest {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.CommunicationRequest {
        // print("Inflating FireKit.CommunicationRequest from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.CommunicationRequest.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testCommunicationRequest1() {   
        var instance: FireKit.CommunicationRequest?
        do {
            instance = try runCommunicationRequest1()
            try runCommunicationRequest1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test CommunicationRequest successfully, but threw: \(error)")
        }

        testCommunicationRequestRealm1(instance!)
    }

    func testCommunicationRequest1Copying() {
        do {
            let instance = try runCommunicationRequest1()
            let copy = instance.copy() as? FireKit.CommunicationRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCommunicationRequest1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test CommunicationRequest successfully, but threw: \(error)")
        }
    }

    func testCommunicationRequest1Populatability() {
        do {
            let instance = try runCommunicationRequest1()
            let copy = FireKit.CommunicationRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCommunicationRequest1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test CommunicationRequest successfully, but threw: \(error)")
        }
    }

    func testCommunicationRequestRealm1(_ instance: FireKit.CommunicationRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCommunicationRequest1(JSONEncoder().encode(realm.objects(FireKit.CommunicationRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CommunicationRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CommunicationRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CommunicationRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.CommunicationRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCommunicationRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.CommunicationRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runCommunicationRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CommunicationRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CommunicationRequest.self).count)
    }
    
    @discardableResult
    func runCommunicationRequest1(_ data: Data? = nil) throws -> FireKit.CommunicationRequest {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "communicationrequest-example.json")
        
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}