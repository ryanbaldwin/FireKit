//
//  RelatedPersonTests.swift
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


class RelatedPersonTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.RelatedPerson {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.RelatedPerson {
        // print("Inflating FireKit.RelatedPerson from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.RelatedPerson.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testRelatedPerson1() {   
        var instance: FireKit.RelatedPerson?
        do {
            instance = try runRelatedPerson1()
            try runRelatedPerson1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw: \(error)")
        }

        testRelatedPersonRealm1(instance!)
    }

    func testRelatedPerson1Copying() {
        do {
            let instance = try runRelatedPerson1()
            let copy = instance.copy() as? FireKit.RelatedPerson
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRelatedPerson1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson1Populatability() {
        do {
            let instance = try runRelatedPerson1()
            let copy = FireKit.RelatedPerson()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRelatedPerson1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson1NillingPopulatability() {
        do {
            let instance = try runRelatedPerson1()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RelatedPerson()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPersonRealm1(_ instance: FireKit.RelatedPerson) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRelatedPerson1(JSONEncoder().encode(realm.objects(FireKit.RelatedPerson.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RelatedPerson.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RelatedPerson()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RelatedPerson.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RelatedPerson.self).count)
    }
    
    @discardableResult
    func runRelatedPerson1(_ data: Data? = nil) throws -> FireKit.RelatedPerson {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "relatedperson-example-f001-sarah.json")
        
        XCTAssertEqual(inst.gender, "female")
        XCTAssertEqual(inst.id, "f001")
        XCTAssertEqual(inst.identifier[0].system, "urn:oid:2.16.840.1.113883.2.4.6.3")
        XCTAssertEqual(inst.identifier[0].type?.text, "BSN")
        XCTAssertEqual(inst.identifier[0].use, "official")
        XCTAssertEqual(inst.name?.family[0].value, "Abels")
        XCTAssertEqual(inst.name?.given[0].value, "Sarah")
        XCTAssertEqual(inst.name?.use, "usual")
        XCTAssertEqual(inst.patient?.reference, "Patient/f001")
        XCTAssertEqual(inst.relationship?.coding[0].code, "SIGOTHR")
        XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].use, "mobile")
        XCTAssertEqual(inst.telecom[0].value, "0690383372")
        XCTAssertEqual(inst.telecom[1].system, "email")
        XCTAssertEqual(inst.telecom[1].use, "home")
        XCTAssertEqual(inst.telecom[1].value, "s.abels@kpn.nl")
        XCTAssertEqual(inst.text?.div, "<div>\n     Sarah Abels\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testRelatedPerson2() {   
        var instance: FireKit.RelatedPerson?
        do {
            instance = try runRelatedPerson2()
            try runRelatedPerson2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw: \(error)")
        }

        testRelatedPersonRealm2(instance!)
    }

    func testRelatedPerson2Copying() {
        do {
            let instance = try runRelatedPerson2()
            let copy = instance.copy() as? FireKit.RelatedPerson
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRelatedPerson2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson2Populatability() {
        do {
            let instance = try runRelatedPerson2()
            let copy = FireKit.RelatedPerson()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRelatedPerson2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson2NillingPopulatability() {
        do {
            let instance = try runRelatedPerson2()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RelatedPerson()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPersonRealm2(_ instance: FireKit.RelatedPerson) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRelatedPerson2(JSONEncoder().encode(realm.objects(FireKit.RelatedPerson.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RelatedPerson.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RelatedPerson()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RelatedPerson.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RelatedPerson.self).count)
    }
    
    @discardableResult
    func runRelatedPerson2(_ data: Data? = nil) throws -> FireKit.RelatedPerson {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "relatedperson-example-f002-ariadne.json")
        
        XCTAssertEqual(inst.birthDate?.description, "1963")
        XCTAssertEqual(inst.gender, "female")
        XCTAssertEqual(inst.id, "f002")
        XCTAssertEqual(inst.name?.text, "Ariadne Bor-Jansma")
        XCTAssertEqual(inst.name?.use, "usual")
        XCTAssertEqual(inst.patient?.reference, "Patient/f201")
        XCTAssertEqual(inst.period?.start?.description, "1975")
        XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
        XCTAssertEqual(inst.relationship?.coding[0].code, "SIGOTHR")
        XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].use, "home")
        XCTAssertEqual(inst.telecom[0].value, "+31201234567")
        XCTAssertEqual(inst.text?.div, "<div>\n     Ariadne Bor-Jansma\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testRelatedPerson3() {   
        var instance: FireKit.RelatedPerson?
        do {
            instance = try runRelatedPerson3()
            try runRelatedPerson3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw: \(error)")
        }

        testRelatedPersonRealm3(instance!)
    }

    func testRelatedPerson3Copying() {
        do {
            let instance = try runRelatedPerson3()
            let copy = instance.copy() as? FireKit.RelatedPerson
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRelatedPerson3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson3Populatability() {
        do {
            let instance = try runRelatedPerson3()
            let copy = FireKit.RelatedPerson()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRelatedPerson3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson3NillingPopulatability() {
        do {
            let instance = try runRelatedPerson3()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RelatedPerson()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPersonRealm3(_ instance: FireKit.RelatedPerson) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRelatedPerson3(JSONEncoder().encode(realm.objects(FireKit.RelatedPerson.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RelatedPerson.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RelatedPerson()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RelatedPerson.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RelatedPerson.self).count)
    }
    
    @discardableResult
    func runRelatedPerson3(_ data: Data? = nil) throws -> FireKit.RelatedPerson {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "relatedperson-example-peter.json")
        
        XCTAssertEqual(inst.address[0].city, "PleasantVille")
        XCTAssertEqual(inst.address[0].line[0].value, "534 Erewhon St")
        XCTAssertEqual(inst.address[0].postalCode, "3999")
        XCTAssertEqual(inst.address[0].state, "Vic")
        XCTAssertEqual(inst.address[0].use, "home")
        XCTAssertEqual(inst.gender, "male")
        XCTAssertEqual(inst.id, "peter")
        XCTAssertEqual(inst.name?.family[0].value, "Chalmers")
        XCTAssertEqual(inst.name?.given[0].value, "Peter")
        XCTAssertEqual(inst.name?.given[1].value, "James")
        XCTAssertEqual(inst.name?.use, "official")
        XCTAssertEqual(inst.patient?.reference, "Patient/animal")
        XCTAssertEqual(inst.period?.start?.description, "2012-03-11")
        XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
        XCTAssertEqual(inst.photo[0].url, "Binary/f012")
        XCTAssertEqual(inst.relationship?.coding[0].code, "owner")
        XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].use, "work")
        XCTAssertEqual(inst.telecom[0].value, "(03) 5555 6473")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testRelatedPerson4() {   
        var instance: FireKit.RelatedPerson?
        do {
            instance = try runRelatedPerson4()
            try runRelatedPerson4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test RelatedPerson successfully, but threw: \(error)")
        }

        testRelatedPersonRealm4(instance!)
    }

    func testRelatedPerson4Copying() {
        do {
            let instance = try runRelatedPerson4()
            let copy = instance.copy() as? FireKit.RelatedPerson
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runRelatedPerson4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson4Populatability() {
        do {
            let instance = try runRelatedPerson4()
            let copy = FireKit.RelatedPerson()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runRelatedPerson4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPerson4NillingPopulatability() {
        do {
            let instance = try runRelatedPerson4()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.RelatedPerson()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test RelatedPerson successfully, but threw: \(error)")
        }
    }

    func testRelatedPersonRealm4(_ instance: FireKit.RelatedPerson) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runRelatedPerson4(JSONEncoder().encode(realm.objects(FireKit.RelatedPerson.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.RelatedPerson.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.RelatedPerson()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.RelatedPerson.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.RelatedPerson.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.RelatedPerson.self).count)
    }
    
    @discardableResult
    func runRelatedPerson4(_ data: Data? = nil) throws -> FireKit.RelatedPerson {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "relatedperson-example.json")
        
        XCTAssertEqual(inst.address[0].city, "Paris")
        XCTAssertEqual(inst.address[0].country, "FRA")
        XCTAssertEqual(inst.address[0].postalCode, "75004")
        XCTAssertEqual(inst.gender, "female")
        XCTAssertEqual(inst.id, "benedicte")
        XCTAssertEqual(inst.identifier[0].system, "urn:oid:1.2.250.1.61")
        XCTAssertEqual(inst.identifier[0].type?.text, "INSEE")
        XCTAssertEqual(inst.identifier[0].use, "usual")
        XCTAssertEqual(inst.identifier[0].value, "272117510400399")
        XCTAssertEqual(inst.name?.family[0].value, "du")
        XCTAssertEqual(inst.patient?.reference, "Patient/example")
        XCTAssertEqual(inst.photo[0].contentType, "image/jpeg")
        XCTAssertEqual(inst.photo[0].url, "Binary/f016")
        XCTAssertEqual(inst.relationship?.coding[0].code, "partner")
        XCTAssertEqual(inst.relationship?.coding[0].system, "http://hl7.org/fhir/patient-contact-relationship")
        XCTAssertEqual(inst.relationship?.coding[1].code, "WIFE")
        XCTAssertEqual(inst.relationship?.coding[1].system, "http://hl7.org/fhir/v3/RoleCode")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].value, "+33 (237) 998327")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}