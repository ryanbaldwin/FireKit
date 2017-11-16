//
//  BinaryTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-11-13.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-11-13
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class BinaryTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Binary {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Binary {
        // print("Inflating FireKit.Binary from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Binary.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testBinary1() {   
        var instance: FireKit.Binary?
        do {
            instance = try runBinary1()
            try runBinary1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Binary successfully, but threw: \(error)")
        }

        testBinaryRealm1(instance!)
    }

    func testBinary1Copying() {
        do {
            let instance = try runBinary1()
            let copy = instance.copy() as? FireKit.Binary
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBinary1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Binary successfully, but threw: \(error)")
        }
    }

    func testBinary1Populatability() {
        do {
            let instance = try runBinary1()
            let copy = FireKit.Binary()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBinary1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Binary successfully, but threw: \(error)")
        }
    }

    func testBinary1NillingPopulatability() {
        do {
            let instance = try runBinary1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Binary()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Binary successfully, but threw: \(error)")
        }
    }

    func testBinaryRealm1(_ instance: FireKit.Binary) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBinary1(JSONEncoder().encode(realm.objects(FireKit.Binary.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Binary.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Binary.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Binary()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Binary.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Binary.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Binary.self).count)
    }
    
    @discardableResult
    func runBinary1(_ data: Data? = nil) throws -> FireKit.Binary {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "binary-example.json")
        
        XCTAssertEqual(inst.contentType, "application/pdf")
        XCTAssertEqual(inst.id, "example")

        return inst
    }
}