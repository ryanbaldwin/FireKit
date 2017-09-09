//
//  NamingSystemTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class NamingSystemTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.NamingSystem {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.NamingSystem {
		let instance = FireKit.NamingSystem(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testNamingSystem1() {		
		var instance: FireKit.NamingSystem?
		do {
			instance = try runNamingSystem1()
			try runNamingSystem1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.NamingSystem
			XCTAssertNotNil(copy)
			try runNamingSystem1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runNamingSystem1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw")
		}

		testNamingSystemRealm1(instance!)
	}

    func testNamingSystem1RealmPK() {        
        do {
            let instance: FireKit.NamingSystem = try runNamingSystem1()
            let copy = (instance.copy() as! FireKit.NamingSystem)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test NamingSystem's PKs, but threw: \(error)")
        }
    }

	func testNamingSystemRealm1(_ instance: FireKit.NamingSystem) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runNamingSystem1(realm.objects(FireKit.NamingSystem.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NamingSystem.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NamingSystem()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runNamingSystem1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runNamingSystem1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NamingSystem.self).count)
	}
	
	@discardableResult
	func runNamingSystem1(_ json: FHIRJSON? = nil) throws -> FireKit.NamingSystem {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("namingsystem-example-id.json")
		
		XCTAssertEqual(inst.contact[0].name, "HL7 Australia FHIR Team")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7-australia.wikispaces.com/FHIR+Australia")
		XCTAssertEqual(inst.date?.description, "2015-08-31")
		XCTAssertEqual(inst.description_fhir, "Australian HI Identifier as established by relevant regulations etc")
		XCTAssertEqual(inst.id, "example-id")
		XCTAssertEqual(inst.kind, "identifier")
		XCTAssertEqual(inst.name, "Austalian Healthcare Identifier - Individual")
		XCTAssertEqual(inst.publisher, "HL7 Australia on behalf of NEHTA")
		XCTAssertEqual(inst.responsible, "HI Service Operator / NEHTA")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>\n        <b>Australian IHI Number</b>\n      </p>\n      \n      <p> oid: 1.2.36.1.2001.1003.0</p>\n      \n      <p> uri: http://ns.electronichealth.net.au/id/hi/ihi/1.0</p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "NI")
		XCTAssertEqual(inst.type?.coding[0].display, "National unique individual identifier")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
		XCTAssertEqual(inst.type?.text, "IHI")
		XCTAssertEqual(inst.uniqueId[0].type, "oid")
		XCTAssertEqual(inst.uniqueId[0].value, "1.2.36.1.2001.1003.0")
		XCTAssertEqual(inst.uniqueId[1].period?.start?.description, "2015-08-21")
		XCTAssertTrue(inst.uniqueId[1].preferred.value ?? false)
		XCTAssertEqual(inst.uniqueId[1].type, "uri")
		XCTAssertEqual(inst.uniqueId[1].value, "http://ns.electronichealth.net.au/id/hi/ihi/1.0")
		XCTAssertEqual(inst.usage, "Used in Australia for identifying patients")
		XCTAssertEqual(inst.useContext[0].coding[0].code, "AU")
		XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")
		
		return inst
	}
	
	func testNamingSystem2() {		
		var instance: FireKit.NamingSystem?
		do {
			instance = try runNamingSystem2()
			try runNamingSystem2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.NamingSystem
			XCTAssertNotNil(copy)
			try runNamingSystem2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runNamingSystem2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw")
		}

		testNamingSystemRealm2(instance!)
	}

    func testNamingSystem2RealmPK() {        
        do {
            let instance: FireKit.NamingSystem = try runNamingSystem2()
            let copy = (instance.copy() as! FireKit.NamingSystem)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test NamingSystem's PKs, but threw: \(error)")
        }
    }

	func testNamingSystemRealm2(_ instance: FireKit.NamingSystem) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runNamingSystem2(realm.objects(FireKit.NamingSystem.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NamingSystem.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NamingSystem()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runNamingSystem2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runNamingSystem2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NamingSystem.self).count)
	}
	
	@discardableResult
	func runNamingSystem2(_ json: FHIRJSON? = nil) throws -> FireKit.NamingSystem {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("namingsystem-example-replaced.json")
		
		XCTAssertEqual(inst.date?.description, "2005-01-25")
		XCTAssertEqual(inst.description_fhir, "This was a wrong registration for the spanish editions of SNOMED CT. Do not use")
		XCTAssertEqual(inst.id, "example-replaced")
		XCTAssertEqual(inst.kind, "codesystem")
		XCTAssertEqual(inst.name, "SNOMED CT Spanish")
		XCTAssertEqual(inst.publisher, "Not HL7!")
		XCTAssertEqual(inst.replacedBy?.reference, "NamingSystem/example")
		XCTAssertEqual(inst.status, "retired")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        <b>Deprecated SNOMED CT Spanish Registration</b>\n      </p>\n      \n      <p> oid: 2.16.840.1.113883.6.96.1 - deprecated <b>Do Not Use</b></p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.uniqueId[0].type, "oid")
		XCTAssertEqual(inst.uniqueId[0].value, "2.16.840.1.113883.6.96.1")
		
		return inst
	}
	
	func testNamingSystem3() {		
		var instance: FireKit.NamingSystem?
		do {
			instance = try runNamingSystem3()
			try runNamingSystem3(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.NamingSystem
			XCTAssertNotNil(copy)
			try runNamingSystem3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runNamingSystem3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw")
		}

		testNamingSystemRealm3(instance!)
	}

    func testNamingSystem3RealmPK() {        
        do {
            let instance: FireKit.NamingSystem = try runNamingSystem3()
            let copy = (instance.copy() as! FireKit.NamingSystem)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test NamingSystem's PKs, but threw: \(error)")
        }
    }

	func testNamingSystemRealm3(_ instance: FireKit.NamingSystem) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runNamingSystem3(realm.objects(FireKit.NamingSystem.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.NamingSystem.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.NamingSystem()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runNamingSystem3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.NamingSystem.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runNamingSystem3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.NamingSystem.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.NamingSystem.self).count)
	}
	
	@discardableResult
	func runNamingSystem3(_ json: FHIRJSON? = nil) throws -> FireKit.NamingSystem {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("namingsystem-example.json")
		
		XCTAssertEqual(inst.contact[0].name, "FHIR project team")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
		XCTAssertEqual(inst.date?.description, "2014-12-13")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.kind, "codesystem")
		XCTAssertEqual(inst.name, "SNOMED CT")
		XCTAssertEqual(inst.publisher, "HL7 International on behalf of IHTSDO")
		XCTAssertEqual(inst.responsible, "IHTSDO & affiliates")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        <b>SNOMED CT</b>\n      </p>\n      \n      <p> oid: 2.16.840.1.113883.6.96</p>\n      \n      <p> uri: http://snomed.info/sct</p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.uniqueId[0].type, "oid")
		XCTAssertEqual(inst.uniqueId[0].value, "2.16.840.1.113883.6.96")
		XCTAssertTrue(inst.uniqueId[1].preferred.value ?? false)
		XCTAssertEqual(inst.uniqueId[1].type, "uri")
		XCTAssertEqual(inst.uniqueId[1].value, "http://snomed.info/sct")
		
		return inst
	}
}
