//
//  CommunicationRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class CommunicationRequestTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.CommunicationRequest {
		return try instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) throws -> FireKit.CommunicationRequest {
      let data = NSKeyedArchiver.archivedData(withRootObject: json)
		  let instance = try JSONDecoder().decode(FireKit.CommunicationRequest.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testCommunicationRequest1() {		
		var instance: FireKit.CommunicationRequest?
		do {
			instance = try runCommunicationRequest1()
			try runCommunicationRequest1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.CommunicationRequest
			XCTAssertNotNil(copy)
			try runCommunicationRequest1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runCommunicationRequest1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test CommunicationRequest successfully, but threw")
		}

		testCommunicationRequestRealm1(instance!)
	}

    func testCommunicationRequest1RealmPK() {        
        do {
            let instance: FireKit.CommunicationRequest = try runCommunicationRequest1()
            let copy = (instance.copy() as! FireKit.CommunicationRequest)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test CommunicationRequest's PKs, but threw: \(error)")
        }
    }

	func testCommunicationRequestRealm1(_ instance: FireKit.CommunicationRequest) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runCommunicationRequest1(realm.objects(FireKit.CommunicationRequest.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.CommunicationRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.CommunicationRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.CommunicationRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.CommunicationRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runCommunicationRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.CommunicationRequest.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runCommunicationRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.CommunicationRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.CommunicationRequest.self).count)
	}
	
	@discardableResult
	func runCommunicationRequest1(_ data: Data? = nil) throws -> FireKit.CommunicationRequest {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("communicationrequest-example.json")
		
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.div, "<div>To be filled out at a later time</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
