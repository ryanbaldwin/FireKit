//
//  OperationOutcomeTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-16.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class OperationOutcomeTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.OperationOutcome {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.OperationOutcome {
		let instance = RealmSwiftFHIR.OperationOutcome(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testOperationOutcome1() {		
		var instance: RealmSwiftFHIR.OperationOutcome?
		do {
			instance = try runOperationOutcome1()
			try runOperationOutcome1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.OperationOutcome
			XCTAssertNotNil(copy)
			try runOperationOutcome1(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw")
		}

		testOperationOutcomeRealm1(instance: instance!)
	}

	func testOperationOutcomeRealm1(instance: RealmSwiftFHIR.OperationOutcome) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationOutcome1(realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
	}
	
	@discardableResult
	func runOperationOutcome1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationOutcome {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationoutcome-example-allok.json")
		
		XCTAssertEqual(inst.id, "allok")
		XCTAssertEqual(inst.issue[0].code, "informational")
		XCTAssertEqual(inst.issue[0].details?.text, "All OK")
		XCTAssertEqual(inst.issue[0].severity, "information")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>All OK</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "additional")
		
		return inst
	}
	
	func testOperationOutcome2() {		
		var instance: RealmSwiftFHIR.OperationOutcome?
		do {
			instance = try runOperationOutcome2()
			try runOperationOutcome2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.OperationOutcome
			XCTAssertNotNil(copy)
			try runOperationOutcome2(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw")
		}

		testOperationOutcomeRealm2(instance: instance!)
	}

	func testOperationOutcomeRealm2(instance: RealmSwiftFHIR.OperationOutcome) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationOutcome2(realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
	}
	
	@discardableResult
	func runOperationOutcome2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationOutcome {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationoutcome-example-break-the-glass.json")
		
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
		var instance: RealmSwiftFHIR.OperationOutcome?
		do {
			instance = try runOperationOutcome3()
			try runOperationOutcome3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.OperationOutcome
			XCTAssertNotNil(copy)
			try runOperationOutcome3(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw")
		}

		testOperationOutcomeRealm3(instance: instance!)
	}

	func testOperationOutcomeRealm3(instance: RealmSwiftFHIR.OperationOutcome) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationOutcome3(realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
	}
	
	@discardableResult
	func runOperationOutcome3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationOutcome {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationoutcome-example-exception.json")
		
		XCTAssertEqual(inst.id, "exception")
		XCTAssertEqual(inst.issue[0].code, "exception")
		XCTAssertEqual(inst.issue[0].details?.text, "SQL Link Communication Error (dbx = 34234)")
		XCTAssertEqual(inst.issue[0].severity, "error")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>SQL Link Communication Error (dbx = 34234)</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "additional")
		
		return inst
	}
	
	func testOperationOutcome4() {		
		var instance: RealmSwiftFHIR.OperationOutcome?
		do {
			instance = try runOperationOutcome4()
			try runOperationOutcome4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.OperationOutcome
			XCTAssertNotNil(copy)
			try runOperationOutcome4(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw")
		}

		testOperationOutcomeRealm4(instance: instance!)
	}

	func testOperationOutcomeRealm4(instance: RealmSwiftFHIR.OperationOutcome) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationOutcome4(realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
	}
	
	@discardableResult
	func runOperationOutcome4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationOutcome {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationoutcome-example-searchfail.json")
		
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
		var instance: RealmSwiftFHIR.OperationOutcome?
		do {
			instance = try runOperationOutcome5()
			try runOperationOutcome5(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.OperationOutcome
			XCTAssertNotNil(copy)
			try runOperationOutcome5(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw")
		}

		testOperationOutcomeRealm5(instance: instance!)
	}

	func testOperationOutcomeRealm5(instance: RealmSwiftFHIR.OperationOutcome) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationOutcome5(realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
	}
	
	@discardableResult
	func runOperationOutcome5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationOutcome {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationoutcome-example-validationfail.json")
		
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
		var instance: RealmSwiftFHIR.OperationOutcome?
		do {
			instance = try runOperationOutcome6()
			try runOperationOutcome6(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.OperationOutcome
			XCTAssertNotNil(copy)
			try runOperationOutcome6(copy!.asJSON())
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test OperationOutcome successfully, but threw")
		}

		testOperationOutcomeRealm6(instance: instance!)
	}

	func testOperationOutcomeRealm6(instance: RealmSwiftFHIR.OperationOutcome) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runOperationOutcome6(realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.OperationOutcome.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.OperationOutcome()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.OperationOutcome.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runOperationOutcome6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.OperationOutcome.self).count)
	}
	
	@discardableResult
	func runOperationOutcome6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.OperationOutcome {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "operationoutcome-example.json")
		
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
