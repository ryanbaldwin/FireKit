//
//  ImmunizationRecommendationTests.swift
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


class ImmunizationRecommendationTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.ImmunizationRecommendation {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.ImmunizationRecommendation {
        // print("Inflating FireKit.ImmunizationRecommendation from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.ImmunizationRecommendation.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testImmunizationRecommendation1() {   
        var instance: FireKit.ImmunizationRecommendation?
        do {
            instance = try runImmunizationRecommendation1()
            try runImmunizationRecommendation1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test ImmunizationRecommendation successfully, but threw: \(error)")
        }

        testImmunizationRecommendationRealm1(instance!)
    }

    func testImmunizationRecommendation1Copying() {
        do {
            let instance = try runImmunizationRecommendation1()
            let copy = instance.copy() as? FireKit.ImmunizationRecommendation
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runImmunizationRecommendation1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test ImmunizationRecommendation successfully, but threw: \(error)")
        }
    }

    func testImmunizationRecommendation1Populatability() {
        do {
            let instance = try runImmunizationRecommendation1()
            let copy = FireKit.ImmunizationRecommendation()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runImmunizationRecommendation1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test ImmunizationRecommendation successfully, but threw: \(error)")
        }
    }

    func testImmunizationRecommendation1NillingPopulatability() {
        do {
            let instance = try runImmunizationRecommendation1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.ImmunizationRecommendation()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test ImmunizationRecommendation successfully, but threw: \(error)")
        }
    }

    func testImmunizationRecommendationRealm1(_ instance: FireKit.ImmunizationRecommendation) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runImmunizationRecommendation1(JSONEncoder().encode(realm.objects(FireKit.ImmunizationRecommendation.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ImmunizationRecommendation.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ImmunizationRecommendation.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ImmunizationRecommendation()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.ImmunizationRecommendation.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ImmunizationRecommendation.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ImmunizationRecommendation.self).count)
    }
    
    @discardableResult
    func runImmunizationRecommendation1(_ data: Data? = nil) throws -> FireKit.ImmunizationRecommendation {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "immunizationrecommendation-example.json")
        
        XCTAssertEqual(inst.id, "example")
        XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
        XCTAssertEqual(inst.identifier[0].value, "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1235")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.recommendation[0].date?.description, "2015-02-09T11:04:15.817-05:00")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[0].code?.coding[0].code, "earliest")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[0].code?.coding[0].display, "Earliest Date")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[0].code?.coding[0].system, "http://hl7.org/fhir/immunization-recommendation-date-criterion")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[0].value?.description, "2015-12-01T00:00:00-05:00")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[1].code?.coding[0].code, "recommended")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[1].code?.coding[0].display, "Recommended")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[1].code?.coding[0].system, "http://hl7.org/fhir/immunization-recommendation-date-criterion")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[1].value?.description, "2015-12-01T00:00:00-05:00")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[2].code?.coding[0].code, "overdue")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[2].code?.coding[0].display, "Past Due Date")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[2].code?.coding[0].system, "http://hl7.org/fhir/immunization-recommendation-date-criterion")
        XCTAssertEqual(inst.recommendation[0].dateCriterion[2].value?.description, "2016-12-28T00:00:00-05:00")
        XCTAssertEqual(inst.recommendation[0].doseNumber.value, 1)
        XCTAssertEqual(inst.recommendation[0].forecastStatus?.coding[0].code, "Not Complete")
        XCTAssertEqual(inst.recommendation[0].forecastStatus?.coding[0].display, "Not Complete")
        XCTAssertEqual(inst.recommendation[0].forecastStatus?.coding[0].system, "http://hl7.org/fhir/immunization-recommendation-status")
        XCTAssertEqual(inst.recommendation[0].protocol_fhir?.authority?.reference, "Organization/hl7")
        XCTAssertEqual(inst.recommendation[0].protocol_fhir?.description_fhir, "First sequence in protocol")
        XCTAssertEqual(inst.recommendation[0].protocol_fhir?.doseSequence.value, 1)
        XCTAssertEqual(inst.recommendation[0].protocol_fhir?.series, "Vaccination Series 1")
        XCTAssertEqual(inst.recommendation[0].supportingImmunization[0].reference, "Immunization/example")
        XCTAssertEqual(inst.recommendation[0].supportingPatientInformation[0].reference, "Observation/example")
        XCTAssertEqual(inst.recommendation[0].vaccineCode?.coding[0].code, "14745005")
        XCTAssertEqual(inst.recommendation[0].vaccineCode?.coding[0].display, "Hepatitis A vaccine")
        XCTAssertEqual(inst.recommendation[0].vaccineCode?.coding[0].system, "http://snomed.info/sct")
        XCTAssertEqual(inst.text?.div, "<div>Authored by Joginder Madra</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}