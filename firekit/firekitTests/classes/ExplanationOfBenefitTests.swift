//
//  ExplanationOfBenefitTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class ExplanationOfBenefitTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func inflateFrom(filename: String) throws -> FireKit.ExplanationOfBenefit {
		return try inflateFrom(data: try readJSONFile(filename))
	}
	
	func inflateFrom(data: Data) throws -> FireKit.ExplanationOfBenefit {
      let data = NSKeyedArchiver.archivedData(withRootObject: data)
		  let instance = try JSONDecoder().decode(FireKit.ExplanationOfBenefit.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testExplanationOfBenefit1() {		
		var instance: FireKit.ExplanationOfBenefit?
		do {
			instance = try runExplanationOfBenefit1()
			try runExplanationOfBenefit1(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.ExplanationOfBenefit
			XCTAssertNotNil(copy)
			try runExplanationOfBenefit1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runExplanationOfBenefit1(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test ExplanationOfBenefit successfully, but threw")
		}

		testExplanationOfBenefitRealm1(instance!)
	}

    func testExplanationOfBenefit1RealmPK() {        
        do {
            let instance: FireKit.ExplanationOfBenefit = try runExplanationOfBenefit1()
            let copy = (instance.copy() as! FireKit.ExplanationOfBenefit)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test ExplanationOfBenefit's PKs, but threw: \(error)")
        }
    }

	func testExplanationOfBenefitRealm1(_ instance: FireKit.ExplanationOfBenefit) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runExplanationOfBenefit1(JSONEncoder().encode(realm.objects(FireKit.ExplanationOfBenefit.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.ExplanationOfBenefit.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.ExplanationOfBenefit.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.ExplanationOfBenefit()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.ExplanationOfBenefit.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runExplanationOfBenefit1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.ExplanationOfBenefit.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runExplanationOfBenefit1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.ExplanationOfBenefit.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.ExplanationOfBenefit.self).count)
	}
	
	@discardableResult
	func runExplanationOfBenefit1(_ data: Data? = nil) throws -> FireKit.ExplanationOfBenefit {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "explanationofbenefit-example.json")
		
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.disposition, "Claim settled as per contract.")
		XCTAssertEqual(inst.id, "R3500")
		XCTAssertEqual(inst.identifier[0].system, "http://www.BenefitsInc.com/fhir/eob")
		XCTAssertEqual(inst.identifier[0].value, "987654321")
		XCTAssertEqual(inst.organization?.reference, "Organization/2")
		XCTAssertEqual(inst.outcome, "complete")
		XCTAssertEqual(inst.request?.reference, "http://www.BenefitsInc.com/fhir/oralhealthclaim/15476332402")
		XCTAssertEqual(inst.requestOrganization?.reference, "Organization/1")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the ExplanationOfBenefit</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
