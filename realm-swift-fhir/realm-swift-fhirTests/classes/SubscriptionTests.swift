//
//  SubscriptionTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class SubscriptionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Subscription {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Subscription {
		let instance = RealmSwiftFHIR.Subscription(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testSubscription1() {		
		var instance: RealmSwiftFHIR.Subscription?
		do {
			instance = try runSubscription1()
			try runSubscription1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Subscription successfully, but threw")
		}

		testSubscriptionRealm1(instance: instance!)
	}

	func testSubscriptionRealm1(instance: RealmSwiftFHIR.Subscription) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubscription1(realm.objects(RealmSwiftFHIR.Subscription.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Subscription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Subscription.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubscription1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Subscription {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "subscription-example-error.json")
		
		XCTAssertEqual(inst.channel?.endpoint, "https://biliwatch.com/customers/mount-auburn-miu/on-result")
		XCTAssertEqual(inst.channel?.header, "Authorization: Bearer secret-token-abc-123")
		XCTAssertEqual(inst.channel?.payload, "application/json")
		XCTAssertEqual(inst.channel?.type, "rest-hook")
		XCTAssertEqual(inst.contact[0].system, "phone")
		XCTAssertEqual(inst.contact[0].value, "ext 4123")
		XCTAssertEqual(inst.criteria, "Observation?code=http://loinc.org|1975-2")
		XCTAssertEqual(inst.end?.description, "2021-01-01T00:00:00Z")
		XCTAssertEqual(inst.error, "Socket Error 10060 - can't connect to host")
		XCTAssertEqual(inst.id, "example-error")
		XCTAssertEqual(inst.reason, "Monitor new neonatal function")
		XCTAssertEqual(inst.status, "error")
		XCTAssertEqual(inst.tag[0].code, "bili-done")
		XCTAssertEqual(inst.tag[0].system, "http://example.org/fhir/cs/internal")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testSubscription2() {		
		var instance: RealmSwiftFHIR.Subscription?
		do {
			instance = try runSubscription2()
			try runSubscription2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Subscription successfully, but threw")
		}

		testSubscriptionRealm2(instance: instance!)
	}

	func testSubscriptionRealm2(instance: RealmSwiftFHIR.Subscription) {
		try! realm.write {
                realm.add(instance)
            }
        try! runSubscription2(realm.objects(RealmSwiftFHIR.Subscription.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Subscription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Subscription.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runSubscription2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Subscription {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "subscription-example.json")
		
		XCTAssertEqual(inst.channel?.endpoint, "https://biliwatch.com/customers/mount-auburn-miu/on-result")
		XCTAssertEqual(inst.channel?.header, "Authorization: Bearer secret-token-abc-123")
		XCTAssertEqual(inst.channel?.payload, "application/json")
		XCTAssertEqual(inst.channel?.type, "rest-hook")
		XCTAssertEqual(inst.contact[0].system, "phone")
		XCTAssertEqual(inst.contact[0].value, "ext 4123")
		XCTAssertEqual(inst.criteria, "Observation?code=http://loinc.org|1975-2")
		XCTAssertEqual(inst.end?.description, "2021-01-01T00:00:00Z")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.reason, "Monitor new neonatal function")
		XCTAssertEqual(inst.status, "requested")
		XCTAssertEqual(inst.tag[0].code, "bili-done")
		XCTAssertEqual(inst.tag[0].system, "http://example.org/fhir/cs/internal")
		XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
