//
//  BundleTests.swift
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


class BundleTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Bundle {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Bundle {
        // print("Inflating FireKit.Bundle from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Bundle.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testBundle1() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle1()
            try runBundle1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm1(instance!)
    }

    func testBundle1Copying() {
        do {
            let instance = try runBundle1()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle1Populatability() {
        do {
            let instance = try runBundle1()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle1NillingPopulatability() {
        do {
            let instance = try runBundle1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm1(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle1(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle1(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "bundle-example.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "https://example.com/base/MedicationOrder/3123")
        XCTAssertEqual(inst.entry[0].resource?.id, "3123")
        XCTAssertEqual(inst.entry[0].search?.mode, "match")
        XCTAssertTrue(inst.entry[0].search?.score! == RealmDecimal(string: "1"))
        XCTAssertEqual(inst.entry[1].fullUrl, "https://example.com/base/Medication/example")
        XCTAssertEqual(inst.entry[1].resource?.id, "example")
        XCTAssertEqual(inst.entry[1].search?.mode, "include")
        XCTAssertEqual(inst.id, "bundle-example")
        XCTAssertEqual(inst.link[0].relation, "self")
        XCTAssertEqual(inst.link[0].url, "https://example.com/base/MedicationOrder?patient=347&_include=MedicationOrder.medication")
        XCTAssertEqual(inst.link[1].relation, "next")
        XCTAssertEqual(inst.link[1].url, "https://example.com/base/MedicationOrder?patient=347&searchId=ff15fd40-ff71-4b48-b366-09c706bed9d0&page=2")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2014-08-18T01:43:30Z")
        XCTAssertEqual(inst.total.value, 3)
        XCTAssertEqual(inst.type, "searchset")

        return inst
    }
    
    func testBundle2() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle2()
            try runBundle2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm2(instance!)
    }

    func testBundle2Copying() {
        do {
            let instance = try runBundle2()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle2Populatability() {
        do {
            let instance = try runBundle2()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle2NillingPopulatability() {
        do {
            let instance = try runBundle2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm2(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle2(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle2(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "diagnosticreport-examples-general.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "http://hl7.org/fhir/DiagnosticReport/3")
        XCTAssertEqual(inst.entry[0].resource?.id, "3")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://hl7.org/fhir/DiagnosticReport/4")
        XCTAssertEqual(inst.entry[1].resource?.id, "4")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://hl7.org/fhir/DiagnosticReport/5")
        XCTAssertEqual(inst.entry[2].resource?.id, "5")
        XCTAssertEqual(inst.entry[2].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://hl7.org/fhir/DiagnosticReport/6")
        XCTAssertEqual(inst.entry[3].resource?.id, "6")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "http://hl7.org/fhir/DiagnosticReport/7")
        XCTAssertEqual(inst.entry[4].resource?.id, "7")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[5].fullUrl, "http://hl7.org/fhir/DiagnosticReport/8")
        XCTAssertEqual(inst.entry[5].resource?.id, "8")
        XCTAssertEqual(inst.entry[5].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[6].fullUrl, "http://hl7.org/fhir/DiagnosticReport/9")
        XCTAssertEqual(inst.entry[6].resource?.id, "9")
        XCTAssertEqual(inst.entry[6].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[7].fullUrl, "http://hl7.org/fhir/DiagnosticReport/15")
        XCTAssertEqual(inst.entry[7].resource?.id, "15")
        XCTAssertEqual(inst.entry[7].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[8].fullUrl, "http://hl7.org/fhir/DiagnosticReport/16")
        XCTAssertEqual(inst.entry[8].resource?.id, "16")
        XCTAssertEqual(inst.entry[8].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[9].fullUrl, "http://hl7.org/fhir/DiagnosticReport/17")
        XCTAssertEqual(inst.entry[9].resource?.id, "17")
        XCTAssertEqual(inst.entry[9].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.id, "72ac8493-52ac-41bd-8d5d-7258c289b5ea")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.type, "collection")

        return inst
    }
    
    func testBundle3() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle3()
            try runBundle3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm3(instance!)
    }

    func testBundle3Copying() {
        do {
            let instance = try runBundle3()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle3Populatability() {
        do {
            let instance = try runBundle3()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle3NillingPopulatability() {
        do {
            let instance = try runBundle3()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm3(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle3(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle3(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "diagnosticreport-examples-lab-text.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "http://hl7.org/fhir/DiagnosticReport/103")
        XCTAssertEqual(inst.entry[0].resource?.id, "103")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://hl7.org/fhir/DiagnosticReport/104")
        XCTAssertEqual(inst.entry[1].resource?.id, "104")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://hl7.org/fhir/DiagnosticReport/105")
        XCTAssertEqual(inst.entry[2].resource?.id, "105")
        XCTAssertEqual(inst.entry[2].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://hl7.org/fhir/DiagnosticReport/106")
        XCTAssertEqual(inst.entry[3].resource?.id, "106")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "http://hl7.org/fhir/DiagnosticReport/107")
        XCTAssertEqual(inst.entry[4].resource?.id, "107")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[5].fullUrl, "http://hl7.org/fhir/DiagnosticReport/108")
        XCTAssertEqual(inst.entry[5].resource?.id, "108")
        XCTAssertEqual(inst.entry[5].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[6].fullUrl, "http://hl7.org/fhir/DiagnosticReport/109")
        XCTAssertEqual(inst.entry[6].resource?.id, "109")
        XCTAssertEqual(inst.entry[6].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[7].fullUrl, "http://hl7.org/fhir/DiagnosticReport/110")
        XCTAssertEqual(inst.entry[7].resource?.id, "110")
        XCTAssertEqual(inst.entry[7].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[8].fullUrl, "http://hl7.org/fhir/DiagnosticReport/111")
        XCTAssertEqual(inst.entry[8].resource?.id, "111")
        XCTAssertEqual(inst.entry[8].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.entry[9].fullUrl, "http://hl7.org/fhir/DiagnosticReport/112")
        XCTAssertEqual(inst.entry[9].resource?.id, "112")
        XCTAssertEqual(inst.entry[9].resource?.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.id, "2763c3ea-6bce-4f15-bdc9-4b41aaceee03")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2012-04-14T10:35:23Z")
        XCTAssertEqual(inst.type, "collection")

        return inst
    }
    
    func testBundle4() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle4()
            try runBundle4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm4(instance!)
    }

    func testBundle4Copying() {
        do {
            let instance = try runBundle4()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle4Populatability() {
        do {
            let instance = try runBundle4()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle4NillingPopulatability() {
        do {
            let instance = try runBundle4()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm4(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle4(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle4(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "document-example-dischargesummary.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "http://fhir.healthintersections.com.au/open/Composition/180f219f-97a8-486d-99d9-ed631fe4fc57")
        XCTAssertEqual(inst.entry[0].resource?.id, "180f219f-97a8-486d-99d9-ed631fe4fc57")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2013-05-28T22:12:21Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://fhir.healthintersections.com.au/open/Practitioner/example")
        XCTAssertEqual(inst.entry[1].resource?.id, "example")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2013-05-05T16:13:03Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://fhir.healthintersections.com.au/open/Patient/d1")
        XCTAssertEqual(inst.entry[2].resource?.id, "d1")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://fhir.healthintersections.com.au/open/Encounter/doc-example")
        XCTAssertEqual(inst.entry[3].resource?.id, "doc-example")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2013-05-05T16:13:03Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "urn:uuid:541a72a8-df75-4484-ac89-ac4923f03b81")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2013-05-05T16:13:03Z")
        XCTAssertEqual(inst.entry[5].fullUrl, "urn:uuid:124a6916-5d84-4b8c-b250-10cefb8e6e86")
        XCTAssertEqual(inst.entry[5].resource?.meta?.lastUpdated?.description, "2013-05-05T16:13:03Z")
        XCTAssertEqual(inst.entry[6].fullUrl, "urn:uuid:673f8db5-0ffd-4395-9657-6da00420bbc1")
        XCTAssertEqual(inst.entry[7].fullUrl, "urn:uuid:47600e0f-b6b5-4308-84b5-5dec157f7637")
        XCTAssertEqual(inst.entry[7].resource?.meta?.lastUpdated?.description, "2013-05-05T16:13:03Z")
        XCTAssertEqual(inst.id, "father")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2013-05-28T22:12:21Z")
        XCTAssertEqual(inst.signature?.contentType, "image/jpg")
        XCTAssertEqual(inst.signature?.type[0].code, "1.2.840.10065.1.12.1.1")
        XCTAssertEqual(inst.signature?.type[0].display, "AuthorID")
        XCTAssertEqual(inst.signature?.type[0].system, "http://hl7.org/fhir/valueset-signature-type")
        XCTAssertEqual(inst.signature?.when?.description, "2015-08-31T07:42:33+10:00")
        XCTAssertEqual(inst.signature?.whoReference?.reference, "Device/software")
        XCTAssertEqual(inst.type, "document")

        return inst
    }
    
    func testBundle5() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle5()
            try runBundle5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm5(instance!)
    }

    func testBundle5Copying() {
        do {
            let instance = try runBundle5()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle5Populatability() {
        do {
            let instance = try runBundle5()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle5NillingPopulatability() {
        do {
            let instance = try runBundle5()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm5(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle5(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle5(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-examples-cypress-template.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "http://hl7.org/fhir/Patient/71")
        XCTAssertEqual(inst.entry[0].resource?.id, "71")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://hl7.org/fhir/Patient/72")
        XCTAssertEqual(inst.entry[1].resource?.id, "72")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://hl7.org/fhir/Patient/73")
        XCTAssertEqual(inst.entry[2].resource?.id, "73")
        XCTAssertEqual(inst.entry[2].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://hl7.org/fhir/Patient/74")
        XCTAssertEqual(inst.entry[3].resource?.id, "74")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "http://hl7.org/fhir/Patient/75")
        XCTAssertEqual(inst.entry[4].resource?.id, "75")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[5].fullUrl, "http://hl7.org/fhir/Patient/76")
        XCTAssertEqual(inst.entry[5].resource?.id, "76")
        XCTAssertEqual(inst.entry[5].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[6].fullUrl, "http://hl7.org/fhir/Patient/77")
        XCTAssertEqual(inst.entry[6].resource?.id, "77")
        XCTAssertEqual(inst.entry[6].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[7].fullUrl, "http://hl7.org/fhir/Patient/78")
        XCTAssertEqual(inst.entry[7].resource?.id, "78")
        XCTAssertEqual(inst.entry[7].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[8].fullUrl, "http://hl7.org/fhir/Patient/79")
        XCTAssertEqual(inst.entry[8].resource?.id, "79")
        XCTAssertEqual(inst.entry[8].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.entry[9].fullUrl, "http://hl7.org/fhir/Patient/80")
        XCTAssertEqual(inst.entry[9].resource?.id, "80")
        XCTAssertEqual(inst.entry[9].resource?.meta?.lastUpdated?.description, "2012-06-03T23:45:32Z")
        XCTAssertEqual(inst.id, "b0a5e4277-83c4-4adb-87e2-e3efe3369b6f")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.type, "collection")

        return inst
    }
    
    func testBundle6() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle6()
            try runBundle6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm6(instance!)
    }

    func testBundle6Copying() {
        do {
            let instance = try runBundle6()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle6Populatability() {
        do {
            let instance = try runBundle6()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle6NillingPopulatability() {
        do {
            let instance = try runBundle6()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm6(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle6(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle6(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "patient-examples-general.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "http://hl7.org/fhir/Patient/1")
        XCTAssertEqual(inst.entry[0].resource?.id, "1")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://hl7.org/fhir/Patient/2")
        XCTAssertEqual(inst.entry[1].resource?.id, "2")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://hl7.org/fhir/Patient/3")
        XCTAssertEqual(inst.entry[2].resource?.id, "3")
        XCTAssertEqual(inst.entry[2].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://hl7.org/fhir/Patient/4")
        XCTAssertEqual(inst.entry[3].resource?.id, "4")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "http://hl7.org/fhir/Patient/5")
        XCTAssertEqual(inst.entry[4].resource?.id, "5")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[5].fullUrl, "http://hl7.org/fhir/Patient/6")
        XCTAssertEqual(inst.entry[5].resource?.id, "6")
        XCTAssertEqual(inst.entry[5].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[6].fullUrl, "http://hl7.org/fhir/Patient/7")
        XCTAssertEqual(inst.entry[6].resource?.id, "7")
        XCTAssertEqual(inst.entry[6].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[7].fullUrl, "http://hl7.org/fhir/Patient/8")
        XCTAssertEqual(inst.entry[7].resource?.id, "8")
        XCTAssertEqual(inst.entry[7].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[8].fullUrl, "http://hl7.org/fhir/Patient/9")
        XCTAssertEqual(inst.entry[8].resource?.id, "9")
        XCTAssertEqual(inst.entry[8].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[9].fullUrl, "http://hl7.org/fhir/Patient/10")
        XCTAssertEqual(inst.entry[9].resource?.id, "10")
        XCTAssertEqual(inst.entry[9].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.id, "b248b1b2-1686-4b94-9936-37d7a5f94b51")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.type, "collection")

        return inst
    }
    
    func testBundle7() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle7()
            try runBundle7(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm7(instance!)
    }

    func testBundle7Copying() {
        do {
            let instance = try runBundle7()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle7Populatability() {
        do {
            let instance = try runBundle7()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle7NillingPopulatability() {
        do {
            let instance = try runBundle7()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm7(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle7(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle7(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "practitioner-examples-general.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "http://hl7.org/fhir/Practitioner/13")
        XCTAssertEqual(inst.entry[0].resource?.id, "13")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://hl7.org/fhir/Practitioner/14")
        XCTAssertEqual(inst.entry[1].resource?.id, "14")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://hl7.org/fhir/Practitioner/15")
        XCTAssertEqual(inst.entry[2].resource?.id, "15")
        XCTAssertEqual(inst.entry[2].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://hl7.org/fhir/Practitioner/16")
        XCTAssertEqual(inst.entry[3].resource?.id, "16")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "http://hl7.org/fhir/Practitioner/17")
        XCTAssertEqual(inst.entry[4].resource?.id, "17")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[5].fullUrl, "http://hl7.org/fhir/Practitioner/18")
        XCTAssertEqual(inst.entry[5].resource?.id, "18")
        XCTAssertEqual(inst.entry[5].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[6].fullUrl, "http://hl7.org/fhir/Practitioner/19")
        XCTAssertEqual(inst.entry[6].resource?.id, "19")
        XCTAssertEqual(inst.entry[6].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[7].fullUrl, "http://hl7.org/fhir/Practitioner/20")
        XCTAssertEqual(inst.entry[7].resource?.id, "20")
        XCTAssertEqual(inst.entry[7].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[8].fullUrl, "http://hl7.org/fhir/Practitioner/21")
        XCTAssertEqual(inst.entry[8].resource?.id, "21")
        XCTAssertEqual(inst.entry[8].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.entry[9].fullUrl, "http://hl7.org/fhir/Practitioner/22")
        XCTAssertEqual(inst.entry[9].resource?.id, "22")
        XCTAssertEqual(inst.entry[9].resource?.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.id, "3ad0687e-f477-468c-afd5-fcc2bf897809")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2012-05-29T23:45:32Z")
        XCTAssertEqual(inst.type, "collection")

        return inst
    }
    
    func testBundle8() {   
        var instance: FireKit.Bundle?
        do {
            instance = try runBundle8()
            try runBundle8(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Bundle successfully, but threw: \(error)")
        }

        testBundleRealm8(instance!)
    }

    func testBundle8Copying() {
        do {
            let instance = try runBundle8()
            let copy = instance.copy() as? FireKit.Bundle
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runBundle8(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle8Populatability() {
        do {
            let instance = try runBundle8()
            let copy = FireKit.Bundle()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runBundle8(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundle8NillingPopulatability() {
        do {
            let instance = try runBundle8()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.Bundle()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test Bundle successfully, but threw: \(error)")
        }
    }

    func testBundleRealm8(_ instance: FireKit.Bundle) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runBundle8(JSONEncoder().encode(realm.objects(FireKit.Bundle.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Bundle.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Bundle()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Bundle.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Bundle.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Bundle.self).count)
    }
    
    @discardableResult
    func runBundle8(_ data: Data? = nil) throws -> FireKit.Bundle {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "xds-example.json")
        
        XCTAssertEqual(inst.entry[0].fullUrl, "urn:uuid:3fdc72f4-a11d-4a9d-9260-a9f745779e1d")
        XCTAssertEqual(inst.entry[0].request?.method, "POST")
        XCTAssertEqual(inst.entry[0].request?.url, "DocumentReference")
        XCTAssertEqual(inst.entry[0].resource?.meta?.lastUpdated?.description, "2013-07-01T13:11:33Z")
        XCTAssertEqual(inst.entry[1].fullUrl, "http://localhost:9556/svc/fhir/Patient/a2")
        XCTAssertEqual(inst.entry[1].request?.ifNoneExist, "Patient?identifier=http://acme.org/xds/patients!89765a87b")
        XCTAssertEqual(inst.entry[1].request?.method, "POST")
        XCTAssertEqual(inst.entry[1].request?.url, "Patient")
        XCTAssertEqual(inst.entry[1].resource?.id, "a2")
        XCTAssertEqual(inst.entry[1].resource?.meta?.lastUpdated?.description, "2013-07-01T13:11:33Z")
        XCTAssertEqual(inst.entry[2].fullUrl, "http://localhost:9556/svc/fhir/Practitioner/a3")
        XCTAssertEqual(inst.entry[2].request?.method, "POST")
        XCTAssertEqual(inst.entry[2].request?.url, "Practitioner")
        XCTAssertEqual(inst.entry[2].resource?.id, "a3")
        XCTAssertEqual(inst.entry[2].resource?.meta?.lastUpdated?.description, "2013-07-01T13:11:33Z")
        XCTAssertEqual(inst.entry[3].fullUrl, "http://localhost:9556/svc/fhir/Practitioner/a4")
        XCTAssertEqual(inst.entry[3].request?.method, "POST")
        XCTAssertEqual(inst.entry[3].request?.url, "Practitioner")
        XCTAssertEqual(inst.entry[3].resource?.id, "a4")
        XCTAssertEqual(inst.entry[3].resource?.meta?.lastUpdated?.description, "2013-07-01T13:11:33Z")
        XCTAssertEqual(inst.entry[4].fullUrl, "http://localhost:9556/svc/fhir/Binary/1e404af3-077f-4bee-b7a6-a9be97e1ce32")
        XCTAssertEqual(inst.entry[4].request?.method, "POST")
        XCTAssertEqual(inst.entry[4].request?.url, "Binary")
        XCTAssertEqual(inst.entry[4].resource?.id, "1e404af3-077f-4bee-b7a6-a9be97e1ce32")
        XCTAssertEqual(inst.entry[4].resource?.meta?.lastUpdated?.description, "2013-07-01T13:11:33Z")
        XCTAssertEqual(inst.id, "xds")
        XCTAssertEqual(inst.meta?.lastUpdated?.description, "2013-07-01T13:11:33Z")
        XCTAssertEqual(inst.type, "transaction")

        return inst
    }
}