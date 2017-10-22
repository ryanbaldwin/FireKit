//
//  CommunicationTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-22.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-22
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class CommunicationTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Communication {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Communication {
        // print("Inflating FireKit.Communication from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Communication.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testCommunication1() {   
        var instance: FireKit.Communication?
        do {
            instance = try runCommunication1()
            try runCommunication1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Communication successfully, but threw: \(error)")
        }

        testCommunicationRealm1(instance!)
    }

    func testCommunication1Copying() {
        do {
            let instance = try runCommunication1()
            let copy = instance.copy() as? FireKit.Communication
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runCommunication1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Communication successfully, but threw: \(error)")
        }
    }

    func testCommunication1Populatability() {
        do {
            let instance = try runCommunication1()
            let copy = FireKit.Communication()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runCommunication1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Communication successfully, but threw: \(error)")
        }
    }

    func testCommunication1NillingPopulatability() {
        do {
            let instance = try runCommunication1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Communication()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Communication successfully, but threw: \(error)")
        }
    }

    func testCommunicationRealm1(_ instance: FireKit.Communication) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runCommunication1(JSONEncoder().encode(realm.objects(FireKit.Communication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Communication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Communication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Communication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Communication.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Communication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Communication.self).count)
    }
    
    @discardableResult
    func runCommunication1(_ data: Data? = nil) throws -> FireKit.Communication {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "communication-example.json")
        
        XCTAssertEqual(inst.category?.coding[0].code, "Alert")
        XCTAssertEqual(inst.category?.coding[0].system, "http://acme.org/messagetypes")
        XCTAssertEqual(inst.category?.text, "Alert")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.3.4.5.6.7")
        XCTAssertEqual(inst.identifier[0].type?.text, "Paging System")
        XCTAssertEqual(inst.identifier[0].value, "2345678901")
        XCTAssertEqual(inst.payload[0].contentString, "Patient 1 has a very high serum potassium value (7.2 mmol/L on 2014-Dec-12 at 5:55 pm)")
        XCTAssertEqual(inst.payload[1].contentReference?.reference, "Observation/643666aa12f")
        XCTAssertEqual(inst.recipient[0].reference, "Practitioner/21")
        XCTAssertEqual(inst.sender?.reference, "Device/f001")
        XCTAssertEqual(inst.sent?.description, "2014-12-12T18:01:10-08:00")
        XCTAssertEqual(inst.status, "completed")
        XCTAssertEqual(inst.subject?.reference, "Patient/1")
        XCTAssertEqual(inst.text?.div, "<div>Patient has very high serum potassium</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}