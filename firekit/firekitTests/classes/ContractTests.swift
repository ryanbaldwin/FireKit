//
//  ContractTests.swift
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


class ContractTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Contract {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Contract {
        print("Inflating FireKit.Contract from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Contract.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testContract1() {   
        var instance: FireKit.Contract?
        do {
            instance = try runContract1()
            try runContract1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Contract successfully, but threw: \(error)")
        }

        testContractRealm1(instance!)
    }

    func testContract1Copying() {
        do {
            let instance = try runContract1()
            let copy = instance.copy() as? FireKit.Contract
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runContract1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Contract successfully, but threw: \(error)")
        }
    }

    func testContract1Populatability() {
        do {
            let instance = try runContract1()
            let copy = FireKit.Contract()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runContract1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Contract successfully, but threw: \(error)")
        }
    }

    func testContractRealm1(_ instance: FireKit.Contract) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runContract1(JSONEncoder().encode(realm.objects(FireKit.Contract.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Contract.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Contract.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Contract()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Contract.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runContract1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Contract.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runContract1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Contract.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Contract.self).count)
    }
    
    @discardableResult
    func runContract1(_ data: Data? = nil) throws -> FireKit.Contract {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "contract-example.json")
        
        XCTAssertEqual(inst.id, "C-123")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the contract</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}