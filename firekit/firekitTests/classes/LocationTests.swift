//
//  LocationTests.swift
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


class LocationTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.Location {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.Location {
        // print("Inflating FireKit.Location from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.Location.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testLocation1() {   
        var instance: FireKit.Location?
        do {
            instance = try runLocation1()
            try runLocation1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw: \(error)")
        }

        testLocationRealm1(instance!)
    }

    func testLocation1Copying() {
        do {
            let instance = try runLocation1()
            let copy = instance.copy() as? FireKit.Location
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runLocation1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Location successfully, but threw: \(error)")
        }
    }

    func testLocation1Populatability() {
        do {
            let instance = try runLocation1()
            let copy = FireKit.Location()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runLocation1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Location successfully, but threw: \(error)")
        }
    }

    func testLocationRealm1(_ instance: FireKit.Location) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runLocation1(JSONEncoder().encode(realm.objects(FireKit.Location.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Location.self).count)
    }
    
    @discardableResult
    func runLocation1(_ data: Data? = nil) throws -> FireKit.Location {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "location-example-ambulance.json")
        
        XCTAssertEqual(inst.description_fhir, "Ambulance provided by Burgers University Medical Center")
        XCTAssertEqual(inst.id, "amb")
        XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
        XCTAssertEqual(inst.mode, "kind")
        XCTAssertEqual(inst.name, "BUMC Ambulance")
        XCTAssertEqual(inst.physicalType?.coding[0].code, "ve")
        XCTAssertEqual(inst.physicalType?.coding[0].display, "Vehicle")
        XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].use, "mobile")
        XCTAssertEqual(inst.telecom[0].value, "2329")
        XCTAssertEqual(inst.text?.div, "<div>Mobile Clinic</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "AMB")
        XCTAssertEqual(inst.type?.coding[0].display, "Ambulance")
        XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")

        return inst
    }
    
    func testLocation2() {   
        var instance: FireKit.Location?
        do {
            instance = try runLocation2()
            try runLocation2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw: \(error)")
        }

        testLocationRealm2(instance!)
    }

    func testLocation2Copying() {
        do {
            let instance = try runLocation2()
            let copy = instance.copy() as? FireKit.Location
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runLocation2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Location successfully, but threw: \(error)")
        }
    }

    func testLocation2Populatability() {
        do {
            let instance = try runLocation2()
            let copy = FireKit.Location()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runLocation2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Location successfully, but threw: \(error)")
        }
    }

    func testLocationRealm2(_ instance: FireKit.Location) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runLocation2(JSONEncoder().encode(realm.objects(FireKit.Location.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Location.self).count)
    }
    
    @discardableResult
    func runLocation2(_ data: Data? = nil) throws -> FireKit.Location {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "location-example-hl7hq.json")
        
        XCTAssertEqual(inst.address?.city, "Ann Arbor")
        XCTAssertEqual(inst.address?.country, "USA")
        XCTAssertEqual(inst.address?.line[0].value, "3300 Washtenaw Avenue, Suite 227")
        XCTAssertEqual(inst.address?.postalCode, "48104")
        XCTAssertEqual(inst.address?.state, "MI")
        XCTAssertEqual(inst.description_fhir, "HL7 Headquarters")
        XCTAssertEqual(inst.id, "hl7")
        XCTAssertEqual(inst.mode, "instance")
        XCTAssertEqual(inst.name, "Health Level Seven International")
        XCTAssertEqual(inst.physicalType?.coding[0].code, "bu")
        XCTAssertEqual(inst.physicalType?.coding[0].display, "Building")
        XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
        XCTAssertTrue(inst.position?.latitude! == RealmDecimal(string: "-83.69471"))
        XCTAssertTrue(inst.position?.longitude! == RealmDecimal(string: "42.2565"))
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].value, "(+1) 734-677-7777")
        XCTAssertEqual(inst.telecom[1].system, "fax")
        XCTAssertEqual(inst.telecom[1].value, "(+1) 734-677-6622")
        XCTAssertEqual(inst.telecom[2].system, "email")
        XCTAssertEqual(inst.telecom[2].value, "hq@HL7.org")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "SLEEP")
        XCTAssertEqual(inst.type?.coding[0].display, "Sleep disorders unit")
        XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")

        return inst
    }
    
    func testLocation3() {   
        var instance: FireKit.Location?
        do {
            instance = try runLocation3()
            try runLocation3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw: \(error)")
        }

        testLocationRealm3(instance!)
    }

    func testLocation3Copying() {
        do {
            let instance = try runLocation3()
            let copy = instance.copy() as? FireKit.Location
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runLocation3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Location successfully, but threw: \(error)")
        }
    }

    func testLocation3Populatability() {
        do {
            let instance = try runLocation3()
            let copy = FireKit.Location()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runLocation3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Location successfully, but threw: \(error)")
        }
    }

    func testLocationRealm3(_ instance: FireKit.Location) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runLocation3(JSONEncoder().encode(realm.objects(FireKit.Location.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Location.self).count)
    }
    
    @discardableResult
    func runLocation3(_ data: Data? = nil) throws -> FireKit.Location {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "location-example-patients-home.json")
        
        XCTAssertEqual(inst.description_fhir, "Patient's Home")
        XCTAssertEqual(inst.id, "ph")
        XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
        XCTAssertEqual(inst.mode, "kind")
        XCTAssertEqual(inst.name, "Patient's Home")
        XCTAssertEqual(inst.physicalType?.coding[0].code, "ho")
        XCTAssertEqual(inst.physicalType?.coding[0].display, "House")
        XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.text?.div, "<div>Patient's Home</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "PTRES")
        XCTAssertEqual(inst.type?.coding[0].display, "Patient's Residence")
        XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")

        return inst
    }
    
    func testLocation4() {   
        var instance: FireKit.Location?
        do {
            instance = try runLocation4()
            try runLocation4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw: \(error)")
        }

        testLocationRealm4(instance!)
    }

    func testLocation4Copying() {
        do {
            let instance = try runLocation4()
            let copy = instance.copy() as? FireKit.Location
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runLocation4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Location successfully, but threw: \(error)")
        }
    }

    func testLocation4Populatability() {
        do {
            let instance = try runLocation4()
            let copy = FireKit.Location()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runLocation4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Location successfully, but threw: \(error)")
        }
    }

    func testLocationRealm4(_ instance: FireKit.Location) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runLocation4(JSONEncoder().encode(realm.objects(FireKit.Location.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Location.self).count)
    }
    
    @discardableResult
    func runLocation4(_ data: Data? = nil) throws -> FireKit.Location {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "location-example-room.json")
        
        XCTAssertEqual(inst.description_fhir, "Old South Wing, Neuro Radiology Operation Room 1 on second floor")
        XCTAssertEqual(inst.id, "2")
        XCTAssertEqual(inst.identifier[0].value, "B1-S.F2.1.00")
        XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
        XCTAssertEqual(inst.mode, "instance")
        XCTAssertEqual(inst.name, "South Wing Neuro OR 1")
        XCTAssertEqual(inst.partOf?.reference, "Location/1")
        XCTAssertEqual(inst.physicalType?.coding[0].code, "ro")
        XCTAssertEqual(inst.physicalType?.coding[0].display, "Room")
        XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
        XCTAssertEqual(inst.status, "suspended")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].value, "2329")
        XCTAssertEqual(inst.text?.div, "<div>Burgers UMC, South Wing, second floor, Neuro Radiology Operation Room 1</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "RNEU")
        XCTAssertEqual(inst.type?.coding[0].display, "Neuroradiology unit")
        XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")

        return inst
    }
    
    func testLocation5() {   
        var instance: FireKit.Location?
        do {
            instance = try runLocation5()
            try runLocation5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw: \(error)")
        }

        testLocationRealm5(instance!)
    }

    func testLocation5Copying() {
        do {
            let instance = try runLocation5()
            let copy = instance.copy() as? FireKit.Location
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runLocation5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Location successfully, but threw: \(error)")
        }
    }

    func testLocation5Populatability() {
        do {
            let instance = try runLocation5()
            let copy = FireKit.Location()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runLocation5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Location successfully, but threw: \(error)")
        }
    }

    func testLocationRealm5(_ instance: FireKit.Location) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runLocation5(JSONEncoder().encode(realm.objects(FireKit.Location.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Location.self).count)
    }
    
    @discardableResult
    func runLocation5(_ data: Data? = nil) throws -> FireKit.Location {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "location-example-ukpharmacy.json")
        
        XCTAssertEqual(inst.description_fhir, "All Pharmacies in the United Kingdom covered by the National Pharmacy Association")
        XCTAssertEqual(inst.id, "ukp")
        XCTAssertEqual(inst.mode, "kind")
        XCTAssertEqual(inst.name, "UK Pharmacies")
        XCTAssertEqual(inst.physicalType?.coding[0].code, "jdn")
        XCTAssertEqual(inst.physicalType?.coding[0].display, "Jurisdiction")
        XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.text?.div, "<div>UK Pharmacies</div>")
        XCTAssertEqual(inst.text?.status, "generated")
        XCTAssertEqual(inst.type?.coding[0].code, "PHARM")
        XCTAssertEqual(inst.type?.coding[0].display, "Pharmacy")
        XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v3/RoleCode")

        return inst
    }
    
    func testLocation6() {   
        var instance: FireKit.Location?
        do {
            instance = try runLocation6()
            try runLocation6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test Location successfully, but threw: \(error)")
        }

        testLocationRealm6(instance!)
    }

    func testLocation6Copying() {
        do {
            let instance = try runLocation6()
            let copy = instance.copy() as? FireKit.Location
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runLocation6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test Location successfully, but threw: \(error)")
        }
    }

    func testLocation6Populatability() {
        do {
            let instance = try runLocation6()
            let copy = FireKit.Location()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runLocation6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test Location successfully, but threw: \(error)")
        }
    }

    func testLocationRealm6(_ instance: FireKit.Location) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runLocation6(JSONEncoder().encode(realm.objects(FireKit.Location.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Location.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Location()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Location.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runLocation6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Location.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Location.self).count)
    }
    
    @discardableResult
    func runLocation6(_ data: Data? = nil) throws -> FireKit.Location {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "location-example.json")
        
        XCTAssertEqual(inst.address?.city, "Den Burg")
        XCTAssertEqual(inst.address?.country, "NLD")
        XCTAssertEqual(inst.address?.line[0].value, "Galapagosweg 91, Building A")
        XCTAssertEqual(inst.address?.postalCode, "9105 PZ")
        XCTAssertEqual(inst.address?.use, "work")
        XCTAssertEqual(inst.description_fhir, "Second floor of the Old South Wing, formerly in use by Psychiatry")
        XCTAssertEqual(inst.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/location-alias")
        XCTAssertEqual(inst.extension_fhir[0].valueString, "Burgers University Medical Center, South Wing, second floor")
        XCTAssertEqual(inst.extension_fhir[1].url, "http://hl7.org/fhir/StructureDefinition/location-alias")
        XCTAssertEqual(inst.extension_fhir[1].valueString, "BU MC, SW, F2")
        XCTAssertEqual(inst.id, "1")
        XCTAssertEqual(inst.identifier[0].value, "B1-S.F2")
        XCTAssertEqual(inst.managingOrganization?.reference, "Organization/f001")
        XCTAssertEqual(inst.mode, "instance")
        XCTAssertEqual(inst.name, "South Wing, second floor")
        XCTAssertEqual(inst.physicalType?.coding[0].code, "wi")
        XCTAssertEqual(inst.physicalType?.coding[0].display, "Wing")
        XCTAssertEqual(inst.physicalType?.coding[0].system, "http://hl7.org/fhir/location-physical-type")
        XCTAssertTrue(inst.position?.altitude! == RealmDecimal(string: "0"))
        XCTAssertTrue(inst.position?.latitude! == RealmDecimal(string: "42.25475478"))
        XCTAssertTrue(inst.position?.longitude! == RealmDecimal(string: "-83.6945691"))
        XCTAssertEqual(inst.status, "active")
        XCTAssertEqual(inst.telecom[0].system, "phone")
        XCTAssertEqual(inst.telecom[0].use, "work")
        XCTAssertEqual(inst.telecom[0].value, "2328")
        XCTAssertEqual(inst.telecom[1].system, "fax")
        XCTAssertEqual(inst.telecom[1].use, "work")
        XCTAssertEqual(inst.telecom[1].value, "2329")
        XCTAssertEqual(inst.telecom[2].system, "email")
        XCTAssertEqual(inst.telecom[2].value, "second wing admissions")
        XCTAssertEqual(inst.telecom[3].system, "other")
        XCTAssertEqual(inst.telecom[3].use, "work")
        XCTAssertEqual(inst.telecom[3].value, "http://sampleorg.com/southwing")
        XCTAssertEqual(inst.text?.div, "<div>Burgers UMC, South Wing, second floor</div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
}