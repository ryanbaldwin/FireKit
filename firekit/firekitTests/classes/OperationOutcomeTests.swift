//
//  OperationOutcomeTests.swift
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


class OperationOutcomeTests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.OperationOutcome {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.OperationOutcome {
        // print("Inflating FireKit.OperationOutcome from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.OperationOutcome.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }
    
    func testOperationOutcome1() {   
        var instance: FireKit.OperationOutcome?
        do {
            instance = try runOperationOutcome1()
            try runOperationOutcome1(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw: \(error)")
        }

        testOperationOutcomeRealm1(instance!)
    }

    func testOperationOutcome1Copying() {
        do {
            let instance = try runOperationOutcome1()
            let copy = instance.copy() as? FireKit.OperationOutcome
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOperationOutcome1(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcome1Populatability() {
        do {
            let instance = try runOperationOutcome1()
            let copy = FireKit.OperationOutcome()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOperationOutcome1(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcomeRealm1(_ instance: FireKit.OperationOutcome) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOperationOutcome1(JSONEncoder().encode(realm.objects(FireKit.OperationOutcome.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationOutcome.self).count)
    }
    
    @discardableResult
    func runOperationOutcome1(_ data: Data? = nil) throws -> FireKit.OperationOutcome {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "operationoutcome-example-allok.json")
        
        XCTAssertEqual(inst.id, "allok")
        XCTAssertEqual(inst.issue[0].code, "informational")
        XCTAssertEqual(inst.issue[0].details?.text, "All OK")
        XCTAssertEqual(inst.issue[0].severity, "information")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>All OK</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testOperationOutcome2() {   
        var instance: FireKit.OperationOutcome?
        do {
            instance = try runOperationOutcome2()
            try runOperationOutcome2(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw: \(error)")
        }

        testOperationOutcomeRealm2(instance!)
    }

    func testOperationOutcome2Copying() {
        do {
            let instance = try runOperationOutcome2()
            let copy = instance.copy() as? FireKit.OperationOutcome
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOperationOutcome2(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcome2Populatability() {
        do {
            let instance = try runOperationOutcome2()
            let copy = FireKit.OperationOutcome()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOperationOutcome2(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcomeRealm2(_ instance: FireKit.OperationOutcome) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOperationOutcome2(JSONEncoder().encode(realm.objects(FireKit.OperationOutcome.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationOutcome.self).count)
    }
    
    @discardableResult
    func runOperationOutcome2(_ data: Data? = nil) throws -> FireKit.OperationOutcome {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "operationoutcome-example-break-the-glass.json")
        
        XCTAssertEqual(inst.id, "break-the-glass")
        XCTAssertEqual(inst.issue[0].code, "suppressed")
        XCTAssertEqual(inst.issue[0].details?.coding[0].code, "ETREAT")
        XCTAssertEqual(inst.issue[0].details?.coding[0].display, "Emergency Treatment")
        XCTAssertEqual(inst.issue[0].details?.coding[0].system, "http://hl7.org/fhir/v3-ActReason")
        XCTAssertEqual(inst.issue[0].details?.text, "Additional information may be available using the Break-The-Glass Protocol")
        XCTAssertEqual(inst.issue[0].severity, "information")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Additional information may be available using the Break-The-Glass Protocol</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testOperationOutcome3() {   
        var instance: FireKit.OperationOutcome?
        do {
            instance = try runOperationOutcome3()
            try runOperationOutcome3(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw: \(error)")
        }

        testOperationOutcomeRealm3(instance!)
    }

    func testOperationOutcome3Copying() {
        do {
            let instance = try runOperationOutcome3()
            let copy = instance.copy() as? FireKit.OperationOutcome
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOperationOutcome3(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcome3Populatability() {
        do {
            let instance = try runOperationOutcome3()
            let copy = FireKit.OperationOutcome()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOperationOutcome3(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcomeRealm3(_ instance: FireKit.OperationOutcome) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOperationOutcome3(JSONEncoder().encode(realm.objects(FireKit.OperationOutcome.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationOutcome.self).count)
    }
    
    @discardableResult
    func runOperationOutcome3(_ data: Data? = nil) throws -> FireKit.OperationOutcome {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "operationoutcome-example-exception.json")
        
        XCTAssertEqual(inst.id, "exception")
        XCTAssertEqual(inst.issue[0].code, "exception")
        XCTAssertEqual(inst.issue[0].details?.text, "SQL Link Communication Error (dbx = 34234)")
        XCTAssertEqual(inst.issue[0].severity, "error")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>SQL Link Communication Error (dbx = 34234)</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
    
    func testOperationOutcome4() {   
        var instance: FireKit.OperationOutcome?
        do {
            instance = try runOperationOutcome4()
            try runOperationOutcome4(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw: \(error)")
        }

        testOperationOutcomeRealm4(instance!)
    }

    func testOperationOutcome4Copying() {
        do {
            let instance = try runOperationOutcome4()
            let copy = instance.copy() as? FireKit.OperationOutcome
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOperationOutcome4(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcome4Populatability() {
        do {
            let instance = try runOperationOutcome4()
            let copy = FireKit.OperationOutcome()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOperationOutcome4(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcomeRealm4(_ instance: FireKit.OperationOutcome) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOperationOutcome4(JSONEncoder().encode(realm.objects(FireKit.OperationOutcome.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationOutcome.self).count)
    }
    
    @discardableResult
    func runOperationOutcome4(_ data: Data? = nil) throws -> FireKit.OperationOutcome {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "operationoutcome-example-searchfail.json")
        
        XCTAssertEqual(inst.id, "searchfail")
        XCTAssertEqual(inst.issue[0].code, "code-invalid")
        XCTAssertEqual(inst.issue[0].details?.text, "The \"name\" parameter has the modifier \"exact\" which is not supported by this server")
        XCTAssertEqual(inst.issue[0].location[0].value, "http.name:exact")
        XCTAssertEqual(inst.issue[0].severity, "fatal")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>The &quot;name&quot; parameter has the modifier &quot;exact&quot; which is not supported by this server</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testOperationOutcome5() {   
        var instance: FireKit.OperationOutcome?
        do {
            instance = try runOperationOutcome5()
            try runOperationOutcome5(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw: \(error)")
        }

        testOperationOutcomeRealm5(instance!)
    }

    func testOperationOutcome5Copying() {
        do {
            let instance = try runOperationOutcome5()
            let copy = instance.copy() as? FireKit.OperationOutcome
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOperationOutcome5(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcome5Populatability() {
        do {
            let instance = try runOperationOutcome5()
            let copy = FireKit.OperationOutcome()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOperationOutcome5(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcomeRealm5(_ instance: FireKit.OperationOutcome) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOperationOutcome5(JSONEncoder().encode(realm.objects(FireKit.OperationOutcome.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationOutcome.self).count)
    }
    
    @discardableResult
    func runOperationOutcome5(_ data: Data? = nil) throws -> FireKit.OperationOutcome {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "operationoutcome-example-validationfail.json")
        
        XCTAssertEqual(inst.id, "validationfail")
        XCTAssertEqual(inst.issue[0].code, "structure")
        XCTAssertEqual(inst.issue[0].details?.text, "Error parsing resource XML (Unknown Content \"label\"")
        XCTAssertEqual(inst.issue[0].location[0].value, "/f:Patient/f:identifier")
        XCTAssertEqual(inst.issue[0].severity, "error")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>Error parsing resource XML (Unknown Content &quot;label&quot; @ /Patient/identifier/label)</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "generated")

        return inst
    }
    
    func testOperationOutcome6() {   
        var instance: FireKit.OperationOutcome?
        do {
            instance = try runOperationOutcome6()
            try runOperationOutcome6(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw: \(error)")
        }

        testOperationOutcomeRealm6(instance!)
    }

    func testOperationOutcome6Copying() {
        do {
            let instance = try runOperationOutcome6()
            let copy = instance.copy() as? FireKit.OperationOutcome
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try runOperationOutcome6(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcome6Populatability() {
        do {
            let instance = try runOperationOutcome6()
            let copy = FireKit.OperationOutcome()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try runOperationOutcome6(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test OperationOutcome successfully, but threw: \(error)")
        }
    }

    func testOperationOutcomeRealm6(_ instance: FireKit.OperationOutcome) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runOperationOutcome6(JSONEncoder().encode(realm.objects(FireKit.OperationOutcome.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runOperationOutcome6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.OperationOutcome.self).count)
    }
    
    @discardableResult
    func runOperationOutcome6(_ data: Data? = nil) throws -> FireKit.OperationOutcome {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "operationoutcome-example.json")
        
        XCTAssertEqual(inst.id, "101")
        XCTAssertEqual(inst.issue[0].code, "code-invalid")
        XCTAssertEqual(inst.issue[0].details?.text, "The code \"W\" is not known and not legal in this context")
        XCTAssertEqual(inst.issue[0].diagnostics, "Acme.Interop.FHIRProcessors.Patient.processGender line 2453")
        XCTAssertEqual(inst.issue[0].location[0].value, "/f:Person/f:gender")
        XCTAssertEqual(inst.issue[0].severity, "error")
        XCTAssertEqual(inst.text?.div, "<div>\n      <p>W is not a recognized code for Gender.</p>\n    </div>")
        XCTAssertEqual(inst.text?.status, "additional")

        return inst
    }
}