//
//  ClaimTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-22.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-22
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class ClaimTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Claim {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Claim {
        // print("Inflating FireKit.Claim from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Claim.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testClaim1() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim1()
            try runClaim1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm1(instance!)
    }

    func testClaim1Copying() {
        do {
            let instance = try runClaim1()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim1Populatability() {
        do {
            let instance = try runClaim1()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm1(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim1(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim1(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-institutional.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654456")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "960150")
        XCTAssertEqual(inst.identifier[0].system, "http://happyhospital.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "9612345")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "125.0"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "exam")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-serviceproduct")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "125.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "institutional")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim2() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim2()
            try runClaim2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm2(instance!)
    }

    func testClaim2Copying() {
        do {
            let instance = try runClaim2()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim2Populatability() {
        do {
            let instance = try runClaim2()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm2(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim2(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim2(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-oral-average.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123456")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "100151")
        XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "12346")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "135.57"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "1200")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "135.57"))
        XCTAssertEqual(inst.item[1].bodySite?.code, "21")
        XCTAssertEqual(inst.item[1].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
        XCTAssertEqual(inst.item[1].net?.code, "USD")
        XCTAssertEqual(inst.item[1].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[1].net?.value! == RealmDecimal(string: "105.0"))
        XCTAssertEqual(inst.item[1].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[1].sequence.value, 2)
        XCTAssertEqual(inst.item[1].service?.code, "21211")
        XCTAssertEqual(inst.item[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[1].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[1].subSite[0].code, "L")
        XCTAssertEqual(inst.item[1].subSite[0].system, "http://fdi.org/fhir/oralsurfacecodes")
        XCTAssertEqual(inst.item[1].type?.code, "service")
        XCTAssertEqual(inst.item[1].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[1].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[1].unitPrice?.value! == RealmDecimal(string: "105.0"))
        XCTAssertEqual(inst.item[2].bodySite?.code, "36")
        XCTAssertEqual(inst.item[2].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
        XCTAssertEqual(inst.item[2].detail[0].net?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[0].net?.value! == RealmDecimal(string: "750.0"))
        XCTAssertEqual(inst.item[2].detail[0].sequence.value, 1)
        XCTAssertEqual(inst.item[2].detail[0].service?.code, "27211")
        XCTAssertEqual(inst.item[2].detail[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[2].detail[0].type?.code, "service")
        XCTAssertEqual(inst.item[2].detail[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[0].unitPrice?.value! == RealmDecimal(string: "750.0"))
        XCTAssertEqual(inst.item[2].detail[1].net?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[1].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[1].net?.value! == RealmDecimal(string: "350.0"))
        XCTAssertEqual(inst.item[2].detail[1].sequence.value, 2)
        XCTAssertEqual(inst.item[2].detail[1].service?.code, "lab")
        XCTAssertEqual(inst.item[2].detail[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[2].detail[1].type?.code, "service")
        XCTAssertEqual(inst.item[2].detail[1].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[1].unitPrice?.value! == RealmDecimal(string: "350.0"))
        XCTAssertEqual(inst.item[2].net?.code, "USD")
        XCTAssertEqual(inst.item[2].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].net?.value! == RealmDecimal(string: "1100.0"))
        XCTAssertEqual(inst.item[2].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[2].sequence.value, 3)
        XCTAssertEqual(inst.item[2].service?.code, "27211")
        XCTAssertEqual(inst.item[2].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[2].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[2].type?.code, "group")
        XCTAssertEqual(inst.item[2].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[2].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].unitPrice?.value! == RealmDecimal(string: "1100.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "oral")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim3() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim3()
            try runClaim3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm3(instance!)
    }

    func testClaim3Copying() {
        do {
            let instance = try runClaim3()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim3Populatability() {
        do {
            let instance = try runClaim3()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm3(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim3(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim3(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-oral-contained.json")
        
        XCTAssertEqual(inst.contained[0].id, "organization-1")
        XCTAssertEqual(inst.contained[1].id, "organization-2")
        XCTAssertEqual(inst.contained[2].id, "practitioner-1")
        XCTAssertEqual(inst.contained[3].id, "patient-1")
        XCTAssertEqual(inst.contained[4].id, "coverage-1")
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "#coverage-1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123456")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "100152")
        XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "12347")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "135.57"))
        XCTAssertEqual(inst.item[0].provider?.reference, "#practitioner-1")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "1200")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "135.57"))
        XCTAssertEqual(inst.organization?.reference, "#organization-1")
        XCTAssertEqual(inst.patient?.reference, "#patient-1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "#organization-2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "oral")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim4() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim4()
            try runClaim4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm4(instance!)
    }

    func testClaim4Copying() {
        do {
            let instance = try runClaim4()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim4Populatability() {
        do {
            let instance = try runClaim4()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm4(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim4(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim4(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-oral-orthoplan.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2015-03-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123457")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.system, "http://hl7.org/fhir/sid/icd-10")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "100153")
        XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "12355")
        XCTAssertEqual(inst.item[0].detail[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[0].net?.value! == RealmDecimal(string: "1000.0"))
        XCTAssertEqual(inst.item[0].detail[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].detail[0].service?.code, "ORTHOEXAM")
        XCTAssertEqual(inst.item[0].detail[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].detail[0].type?.code, "CSINV")
        XCTAssertEqual(inst.item[0].detail[0].type?.system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.item[0].detail[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[0].unitPrice?.value! == RealmDecimal(string: "1000.0"))
        XCTAssertEqual(inst.item[0].detail[1].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[1].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[1].net?.value! == RealmDecimal(string: "1500.0"))
        XCTAssertEqual(inst.item[0].detail[1].sequence.value, 2)
        XCTAssertEqual(inst.item[0].detail[1].service?.code, "ORTHODIAG")
        XCTAssertEqual(inst.item[0].detail[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].detail[1].type?.code, "CSINV")
        XCTAssertEqual(inst.item[0].detail[1].type?.system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.item[0].detail[1].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[1].unitPrice?.value! == RealmDecimal(string: "1500.0"))
        XCTAssertEqual(inst.item[0].detail[2].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[2].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[2].net?.value! == RealmDecimal(string: "500.0"))
        XCTAssertEqual(inst.item[0].detail[2].sequence.value, 3)
        XCTAssertEqual(inst.item[0].detail[2].service?.code, "ORTHOINITIAL")
        XCTAssertEqual(inst.item[0].detail[2].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].detail[2].type?.code, "CSINV")
        XCTAssertEqual(inst.item[0].detail[2].type?.system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.item[0].detail[2].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[2].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[2].unitPrice?.value! == RealmDecimal(string: "500.0"))
        XCTAssertTrue(inst.item[0].detail[3].quantity?.value! == RealmDecimal(string: "24"))
        XCTAssertEqual(inst.item[0].detail[3].sequence.value, 4)
        XCTAssertEqual(inst.item[0].detail[3].service?.code, "ORTHOMONTHS")
        XCTAssertEqual(inst.item[0].detail[3].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].detail[3].type?.code, "CSINV")
        XCTAssertEqual(inst.item[0].detail[3].type?.system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.item[0].detail[4].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[4].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[4].net?.value! == RealmDecimal(string: "250.0"))
        XCTAssertTrue(inst.item[0].detail[4].quantity?.value! == RealmDecimal(string: "24"))
        XCTAssertEqual(inst.item[0].detail[4].sequence.value, 5)
        XCTAssertEqual(inst.item[0].detail[4].service?.code, "ORTHOPERIODIC")
        XCTAssertEqual(inst.item[0].detail[4].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].detail[4].type?.code, "CSINV")
        XCTAssertEqual(inst.item[0].detail[4].type?.system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.item[0].detail[4].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[4].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[4].unitPrice?.value! == RealmDecimal(string: "250.0"))
        XCTAssertEqual(inst.item[0].diagnosisLinkId[0].value, 1)
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "9000.0"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "ORTHPLAN")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2015-05-16")
        XCTAssertEqual(inst.item[0].type?.code, "FRAMEING")
        XCTAssertEqual(inst.item[0].type?.system, "http://hl7.org/fhir/v3/ActCode")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "9000.0"))
        XCTAssertEqual(inst.item[1].bodySite?.code, "21")
        XCTAssertEqual(inst.item[1].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
        XCTAssertEqual(inst.item[1].net?.code, "USD")
        XCTAssertEqual(inst.item[1].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[1].net?.value! == RealmDecimal(string: "105.0"))
        XCTAssertEqual(inst.item[1].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[1].sequence.value, 2)
        XCTAssertEqual(inst.item[1].service?.code, "21211")
        XCTAssertEqual(inst.item[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[1].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[1].subSite[0].code, "L")
        XCTAssertEqual(inst.item[1].subSite[0].system, "http://fdi.org/fhir/oralsurfacecodes")
        XCTAssertEqual(inst.item[1].type?.code, "service")
        XCTAssertEqual(inst.item[1].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[1].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[1].unitPrice?.value! == RealmDecimal(string: "105.0"))
        XCTAssertEqual(inst.item[2].bodySite?.code, "36")
        XCTAssertEqual(inst.item[2].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
        XCTAssertEqual(inst.item[2].detail[0].net?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[0].net?.value! == RealmDecimal(string: "750.0"))
        XCTAssertEqual(inst.item[2].detail[0].sequence.value, 1)
        XCTAssertEqual(inst.item[2].detail[0].service?.code, "27211")
        XCTAssertEqual(inst.item[2].detail[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[2].detail[0].type?.code, "service")
        XCTAssertEqual(inst.item[2].detail[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[0].unitPrice?.value! == RealmDecimal(string: "750.0"))
        XCTAssertEqual(inst.item[2].detail[1].net?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[1].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[1].net?.value! == RealmDecimal(string: "350.0"))
        XCTAssertEqual(inst.item[2].detail[1].sequence.value, 2)
        XCTAssertEqual(inst.item[2].detail[1].service?.code, "lab")
        XCTAssertEqual(inst.item[2].detail[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[2].detail[1].type?.code, "service")
        XCTAssertEqual(inst.item[2].detail[1].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[2].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].detail[1].unitPrice?.value! == RealmDecimal(string: "350.0"))
        XCTAssertEqual(inst.item[2].net?.code, "USD")
        XCTAssertEqual(inst.item[2].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].net?.value! == RealmDecimal(string: "1100.0"))
        XCTAssertEqual(inst.item[2].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[2].sequence.value, 3)
        XCTAssertEqual(inst.item[2].service?.code, "27211")
        XCTAssertEqual(inst.item[2].service?.system, "http://hl7.org/fhir/oralservicecodes")
        XCTAssertEqual(inst.item[2].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[2].type?.code, "group")
        XCTAssertEqual(inst.item[2].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[2].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[2].unitPrice?.value! == RealmDecimal(string: "1100.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "oral")
        XCTAssertEqual(inst.use, "proposed")

        return inst
    }
    
    func testClaim5() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim5()
            try runClaim5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm5(instance!)
    }

    func testClaim5Copying() {
        do {
            let instance = try runClaim5()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim5Populatability() {
        do {
            let instance = try runClaim5()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm5(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim5(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim5(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-pharmacy.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654456")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "760150")
        XCTAssertEqual(inst.identifier[0].system, "http://happypharma.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "7612345")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "60.0"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "smokecess")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-pharmaservice")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "60.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "stat")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Pharmacy Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "pharmacy")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim6() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim6()
            try runClaim6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm6(instance!)
    }

    func testClaim6Copying() {
        do {
            let instance = try runClaim6()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim6Populatability() {
        do {
            let instance = try runClaim6()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm6(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim6(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim6(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-professional.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654456")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "860150")
        XCTAssertEqual(inst.identifier[0].system, "http://happypdocs.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "8612345")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "75.0"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "exam")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-serviceproduct")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "75.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "professional")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim7() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim7()
            try runClaim7(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm7(instance!)
    }

    func testClaim7Copying() {
        do {
            let instance = try runClaim7()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim7(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim7Populatability() {
        do {
            let instance = try runClaim7()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim7(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm7(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim7(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim7(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-vision-glasses.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654321")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "660151")
        XCTAssertEqual(inst.identifier[0].system, "http://happysight.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "6612346")
        XCTAssertEqual(inst.item[0].detail[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[0].net?.value! == RealmDecimal(string: "100.0"))
        XCTAssertEqual(inst.item[0].detail[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].detail[0].service?.code, "frame")
        XCTAssertEqual(inst.item[0].detail[0].service?.system, "http://hl7.org/fhir/ex-visionservice")
        XCTAssertEqual(inst.item[0].detail[0].type?.code, "product")
        XCTAssertEqual(inst.item[0].detail[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[0].unitPrice?.value! == RealmDecimal(string: "100.0"))
        XCTAssertEqual(inst.item[0].detail[1].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[1].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[1].net?.value! == RealmDecimal(string: "100.0"))
        XCTAssertTrue(inst.item[0].detail[1].quantity?.value! == RealmDecimal(string: "2"))
        XCTAssertEqual(inst.item[0].detail[1].sequence.value, 2)
        XCTAssertEqual(inst.item[0].detail[1].service?.code, "lens")
        XCTAssertEqual(inst.item[0].detail[1].service?.system, "http://hl7.org/fhir/ex-visionservice")
        XCTAssertEqual(inst.item[0].detail[1].type?.code, "product")
        XCTAssertEqual(inst.item[0].detail[1].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[1].unitPrice?.value! == RealmDecimal(string: "50.0"))
        XCTAssertTrue(inst.item[0].detail[2].factor! == RealmDecimal(string: "0.07"))
        XCTAssertEqual(inst.item[0].detail[2].net?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[2].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[2].net?.value! == RealmDecimal(string: "14.0"))
        XCTAssertEqual(inst.item[0].detail[2].sequence.value, 3)
        XCTAssertEqual(inst.item[0].detail[2].service?.code, "fst")
        XCTAssertEqual(inst.item[0].detail[2].service?.system, "http://hl7.org/fhir/ex-visionservice")
        XCTAssertEqual(inst.item[0].detail[2].type?.code, "tax")
        XCTAssertEqual(inst.item[0].detail[2].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].detail[2].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].detail[2].unitPrice?.value! == RealmDecimal(string: "200.0"))
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "214.0"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "glasses")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-visionservice")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "group")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "214.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.prescription?.reference, "http://www.optdocs.com/prescription/12345")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Vision Claim for Glasses</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "vision")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim8() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim8()
            try runClaim8(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm8(instance!)
    }

    func testClaim8Copying() {
        do {
            let instance = try runClaim8()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim8(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim8Populatability() {
        do {
            let instance = try runClaim8()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim8(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm8(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim8(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim8(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example-vision.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654321")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "660150")
        XCTAssertEqual(inst.identifier[0].system, "http://happysight.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "6612345")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "80.0"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "exam")
        XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-visionservice")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "80.0"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Vision Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "vision")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
    
    func testClaim9() {   
        var instance: FireKit.Claim?
        do {
            instance = try runClaim9()
            try runClaim9(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw: \(error)")
        }

        testClaimRealm9(instance!)
    }

    func testClaim9Copying() {
        do {
            let instance = try runClaim9()
            let copy = instance.copy() as? FireKit.Claim
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runClaim9(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Claim successfully, but threw: \(error)")
        }
    }

    func testClaim9Populatability() {
        do {
            let instance = try runClaim9()
            let copy = FireKit.Claim()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runClaim9(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Claim successfully, but threw: \(error)")
        }
    }

    func testClaimRealm9(_ instance: FireKit.Claim) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runClaim9(JSONEncoder().encode(realm.objects(FireKit.Claim.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Claim.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Claim()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.Claim.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Claim.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Claim.self).count)
    }
    
    @discardableResult
    func runClaim9(_ data: Data? = nil) throws -> FireKit.Claim {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "claim-example.json")
        
        XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
        XCTAssertTrue(inst.coverage[0].focal.value ?? false)
        XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
        XCTAssertEqual(inst.coverage[0].sequence.value, 1)
        XCTAssertEqual(inst.created?.description, "2014-08-16")
        XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123456")
        XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
        XCTAssertEqual(inst.id, "100150")
        XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
        XCTAssertEqual(inst.identifier[0].value, "12345")
        XCTAssertEqual(inst.item[0].net?.code, "USD")
        XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "135.57"))
        XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
        XCTAssertEqual(inst.item[0].sequence.value, 1)
        XCTAssertEqual(inst.item[0].service?.code, "1200")
        XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
        XCTAssertEqual(inst.item[0].type?.code, "service")
        XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
        XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
        XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "135.57"))
        XCTAssertEqual(inst.organization?.reference, "Organization/1")
        XCTAssertEqual(inst.patient?.reference, "Patient/1")
        XCTAssertEqual(inst.payee?.type?.code, "provider")
        XCTAssertEqual(inst.priority?.code, "normal")
        XCTAssertEqual(inst.target?.reference, "Organization/2")
        XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type, "oral")
        XCTAssertEqual(inst.use, "complete")

        return inst
    }
}