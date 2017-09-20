//
//  ImplementationGuideTests.swift
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


class ImplementationGuideTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ImplementationGuide {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ImplementationGuide {
        // print("Inflating FireKit.ImplementationGuide from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ImplementationGuide.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testImplementationGuide1() {   
        var instance: FireKit.ImplementationGuide?
        do {
            instance = try runImplementationGuide1()
            try runImplementationGuide1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ImplementationGuide successfully, but threw: \(error)")
        }

        testImplementationGuideRealm1(instance!)
    }

    func testImplementationGuide1Copying() {
        do {
            let instance = try runImplementationGuide1()
            let copy = instance.copy() as? FireKit.ImplementationGuide
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runImplementationGuide1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ImplementationGuide successfully, but threw: \(error)")
        }
    }

    func testImplementationGuide1Populatability() {
        do {
            let instance = try runImplementationGuide1()
            let copy = FireKit.ImplementationGuide()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runImplementationGuide1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ImplementationGuide successfully, but threw: \(error)")
        }
    }

    func testImplementationGuideRealm1(_ instance: FireKit.ImplementationGuide) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runImplementationGuide1(JSONEncoder().encode(realm.objects(FireKit.ImplementationGuide.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ImplementationGuide.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ImplementationGuide.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ImplementationGuide()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ImplementationGuide.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ImplementationGuide.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ImplementationGuide.self).count)
    }
    
    @discardableResult
    func runImplementationGuide1(_ data: Data? = nil) throws -> FireKit.ImplementationGuide {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "implementationguide-example.json")
        
        XCTAssertEqual(inst.binary[0].value, "http://h7.org/fhir/fhir.css")
        XCTAssertEqual(inst.contact[0].name, "ONC")
        XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
        XCTAssertEqual(inst.contact[0].telecom[0].value, "http://www.healthit.gov")
        XCTAssertEqual(inst.contact[1].name, "HL7")
        XCTAssertEqual(inst.contact[1].telecom[0].system, "other")
        XCTAssertEqual(inst.contact[1].telecom[0].value, "http://hl7.org/fhir")
        XCTAssertEqual(inst.copyright, "Published by ONC under the standard FHIR license (CC0)")
        XCTAssertEqual(inst.date?.description, "2015-01-01")
        XCTAssertEqual(inst.dependency[0].type, "reference")
        XCTAssertEqual(inst.dependency[0].uri, "http://hl7.org/fhir/ImplementationGuide/uscore")
        XCTAssertFalse(inst.experimental.value ?? true)
        XCTAssertEqual(inst.fhirVersion, "1.0.0")
        XCTAssertEqual(inst.global[0].profile?.reference, "StructureDefinition/daf-patient")
        XCTAssertEqual(inst.global[0].type, "Patient")
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.name, "Data Access Framework (DAF)")
        XCTAssertEqual(inst.package[0].description_fhir, "Base package (not broken up into multiple packages)")
        XCTAssertEqual(inst.package[0].name, "test")
        XCTAssertEqual(inst.package[0].resource[0].acronym, "daf-tst")
        XCTAssertEqual(inst.package[0].resource[0].description_fhir, "A test example to show how a package works")
        XCTAssertEqual(inst.package[0].resource[0].exampleFor?.reference, "StructureDefinition/daf-patient")
        XCTAssertEqual(inst.package[0].resource[0].name, "Test Example")
        XCTAssertEqual(inst.package[0].resource[0].purpose, "example")
        XCTAssertEqual(inst.package[0].resource[0].sourceUri, "test.html")
        XCTAssertEqual(inst.page?.kind, "page")
        XCTAssertEqual(inst.page?.name, "Example Patient Page")
        XCTAssertEqual(inst.page?.page[0].format, "text/html")
        XCTAssertEqual(inst.page?.page[0].kind, "list")
        XCTAssertEqual(inst.page?.page[0].name, "Value Set Page")
        XCTAssertEqual(inst.page?.page[0].package[0].value, "test")
        XCTAssertEqual(inst.page?.page[0].source, "list.html")
        XCTAssertEqual(inst.page?.page[0].type[0].value, "ValueSet")
        XCTAssertEqual(inst.page?.source, "patient-example.html")
        XCTAssertEqual(inst.publisher, "ONC / HL7 Joint project")
        XCTAssertEqual(inst.status, "draft")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.url, "http://hl7.org/fhir/daf")
        XCTAssertEqual(inst.useContext[0].coding[0].code, "US")
        XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")
        XCTAssertEqual(inst.version, "0")

        return inst
    }
}