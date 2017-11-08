//
//  BodySiteTests.swift
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


class BodySiteTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.BodySite {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.BodySite {
        // print("Inflating FireKit.BodySite from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.BodySite.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testBodySite1() {   
        var instance: FireKit.BodySite?
        do {
            instance = try runBodySite1()
            try runBodySite1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test BodySite successfully, but threw: \(error)")
        }

        testBodySiteRealm1(instance!)
    }

    func testBodySite1Copying() {
        do {
            let instance = try runBodySite1()
            let copy = instance.copy() as? FireKit.BodySite
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBodySite1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test BodySite successfully, but threw: \(error)")
        }
    }

    func testBodySite1Populatability() {
        do {
            let instance = try runBodySite1()
            let copy = FireKit.BodySite()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBodySite1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test BodySite successfully, but threw: \(error)")
        }
    }

    func testBodySite1NillingPopulatability() {
        do {
            let instance = try runBodySite1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.BodySite()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test BodySite successfully, but threw: \(error)")
        }
    }

    func testBodySiteRealm1(_ instance: FireKit.BodySite) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBodySite1(JSONEncoder().encode(realm.objects(FireKit.BodySite.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.BodySite.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.BodySite.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.BodySite()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.BodySite.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.BodySite.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.BodySite.self).count)
    }
    
    @discardableResult
    func runBodySite1(_ data: Data? = nil) throws -> FireKit.BodySite {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "bodysite-example.json")
        
        XCTAssertEqual(inst.code?.coding[0].code, "53120007")
        XCTAssertEqual(inst.code?.coding[0].display, "Arm")
        XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.code?.text, "Arm")
        XCTAssertEqual(inst.description_fhir, "front of upper left arm directly below the tattoo")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "http://www.acmehosp.com/bodysites")
        XCTAssertEqual(inst.identifier[0].use, "official")
        XCTAssertEqual(inst.identifier[0].value, "12345")
        XCTAssertEqual(inst.image[0].contentType, "image/png;base64")
        XCTAssertEqual(inst.image[0].title, "ARM")
        XCTAssertEqual(inst.modifier[0].coding[0].code, "419161000")
        XCTAssertEqual(inst.modifier[0].coding[0].display, "Unilateral left")
        XCTAssertEqual(inst.modifier[0].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.modifier[0].text, "Left")
        XCTAssertEqual(inst.modifier[1].coding[0].code, "261183002")
        XCTAssertEqual(inst.modifier[1].coding[0].display, "Upper")
        XCTAssertEqual(inst.modifier[1].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.modifier[1].text, "Upper")
        XCTAssertEqual(inst.modifier[2].coding[0].code, "255549009")
        XCTAssertEqual(inst.modifier[2].coding[0].display, "Anterior")
        XCTAssertEqual(inst.modifier[2].coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.modifier[2].text, "Anterior")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}