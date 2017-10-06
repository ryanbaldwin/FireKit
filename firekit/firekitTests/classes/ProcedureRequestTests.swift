//
//  ProcedureRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-10-06.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-10-06
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class ProcedureRequestTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ProcedureRequest {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ProcedureRequest {
        // print("Inflating FireKit.ProcedureRequest from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ProcedureRequest.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testProcedureRequest1() {   
        var instance: FireKit.ProcedureRequest?
        do {
            instance = try runProcedureRequest1()
            try runProcedureRequest1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ProcedureRequest successfully, but threw: \(error)")
        }

        testProcedureRequestRealm1(instance!)
    }

    func testProcedureRequest1Copying() {
        do {
            let instance = try runProcedureRequest1()
            let copy = instance.copy() as? FireKit.ProcedureRequest
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runProcedureRequest1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ProcedureRequest successfully, but threw: \(error)")
        }
    }

    func testProcedureRequest1Populatability() {
        do {
            let instance = try runProcedureRequest1()
            let copy = FireKit.ProcedureRequest()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runProcedureRequest1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ProcedureRequest successfully, but threw: \(error)")
        }
    }

    func testProcedureRequestRealm1(_ instance: FireKit.ProcedureRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runProcedureRequest1(JSONEncoder().encode(realm.objects(FireKit.ProcedureRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ProcedureRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ProcedureRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ProcedureRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.ProcedureRequest.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ProcedureRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ProcedureRequest.self).count)
    }
    
    @discardableResult
    func runProcedureRequest1(_ data: Data? = nil) throws -> FireKit.ProcedureRequest {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "procedurerequest-example.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "323418000")
        XCTAssertEqual(inst.code?.coding[0].display, "Fix me up")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.subject?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.div, "<div>To be added</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}