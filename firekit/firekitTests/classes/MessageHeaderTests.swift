//
//  MessageHeaderTests.swift
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


class MessageHeaderTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.MessageHeader {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.MessageHeader {
        // print("Inflating FireKit.MessageHeader from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.MessageHeader.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testMessageHeader1() {   
        var instance: FireKit.MessageHeader?
        do {
            instance = try runMessageHeader1()
            try runMessageHeader1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test MessageHeader successfully, but threw: \(error)")
        }

        testMessageHeaderRealm1(instance!)
    }

    func testMessageHeader1Copying() {
        do {
            let instance = try runMessageHeader1()
            let copy = instance.copy() as? FireKit.MessageHeader
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runMessageHeader1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test MessageHeader successfully, but threw: \(error)")
        }
    }

    func testMessageHeader1Populatability() {
        do {
            let instance = try runMessageHeader1()
            let copy = FireKit.MessageHeader()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runMessageHeader1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test MessageHeader successfully, but threw: \(error)")
        }
    }

    func testMessageHeaderRealm1(_ instance: FireKit.MessageHeader) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runMessageHeader1(JSONEncoder().encode(realm.objects(FireKit.MessageHeader.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.MessageHeader.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.MessageHeader.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.MessageHeader()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.MessageHeader.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMessageHeader1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.MessageHeader.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMessageHeader1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.MessageHeader.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.MessageHeader.self).count)
    }
    
    @discardableResult
    func runMessageHeader1(_ data: Data? = nil) throws -> FireKit.MessageHeader {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "messageheader-example.json")
        
        XCTAssertEqual(inst.author?.reference, "Practitioner/example")
        XCTAssertEqual(inst.data[0].reference, "Patient/example")
        XCTAssertEqual(inst.destination[0].endpoint, "llp:10.11.12.14:5432")
        XCTAssertEqual(inst.destination[0].name, "Acme Message Gateway")
        XCTAssertEqual(inst.destination[0].target?.reference, "Device/example")
        XCTAssertEqual(inst.enterer?.reference, "Practitioner/example")
        XCTAssertEqual(inst.event?.code, "admin-update")
        XCTAssertEqual(inst.event?.system, "http://hl7.org/fhir/message-type")
        XCTAssertEqual(inst.id, "1cbdfb97-5859-48a4-8301-d54eab818d68")
        XCTAssertEqual(inst.reason?.coding[0].code, "admit")
        XCTAssertEqual(inst.reason?.coding[0].system, "http://hl7.org/fhir/message-reasons-encounter")
        XCTAssertEqual(inst.response?.code, "ok")
        XCTAssertEqual(inst.response?.identifier, "5015fe84-8e76-4526-89d8-44b322e8d4fb")
        XCTAssertEqual(inst.responsible?.reference, "Practitioner/example")
        XCTAssertEqual(inst.source?.contact?.system, "phone")
        XCTAssertEqual(inst.source?.contact?.value, "+1 (555) 123 4567")
        XCTAssertEqual(inst.source?.endpoint, "llp:10.11.12.13:5432")
        XCTAssertEqual(inst.source?.name, "Acme Central Patient Registry")
        XCTAssertEqual(inst.source?.software, "FooBar Patient Manager")
        XCTAssertEqual(inst.source?.version, "3.1.45.AABB")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Update Person resource for Peter James CHALMERS (Jim), MRN: 12345 (Acme Healthcare)</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.timestamp?.description, "2012-01-04T09:10:14Z")

        return inst
    }
}