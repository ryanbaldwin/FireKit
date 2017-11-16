//
//  ParametersTests.swift
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


class ParametersTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Parameters {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Parameters {
        // print("Inflating FireKit.Parameters from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Parameters.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testParameters1() {   
        var instance: FireKit.Parameters?
        do {
            instance = try runParameters1()
            try runParameters1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Parameters successfully, but threw: \(error)")
        }

        testParametersRealm1(instance!)
    }

    func testParameters1Copying() {
        do {
            let instance = try runParameters1()
            let copy = instance.copy() as? FireKit.Parameters
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runParameters1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Parameters successfully, but threw: \(error)")
        }
    }

    func testParameters1Populatability() {
        do {
            let instance = try runParameters1()
            let copy = FireKit.Parameters()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runParameters1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Parameters successfully, but threw: \(error)")
        }
    }

    func testParameters1NillingPopulatability() {
        do {
            let instance = try runParameters1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Parameters()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Parameters successfully, but threw: \(error)")
        }
    }

    func testParametersRealm1(_ instance: FireKit.Parameters) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runParameters1(JSONEncoder().encode(realm.objects(FireKit.Parameters.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Parameters.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Parameters.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Parameters()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Parameters.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Parameters.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Parameters.self).count)
    }
    
    @discardableResult
    func runParameters1(_ data: Data? = nil) throws -> FireKit.Parameters {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "parameters-example.json")
        
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.parameter[0].name, "start")
        XCTAssertEqual(inst.parameter[0].valueDate?.description, "2010-01-01")
        XCTAssertEqual(inst.parameter[1].name, "end")

        return inst
    }
}