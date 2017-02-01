//
//  ClaimTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class ClaimTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Claim {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Claim {
		let instance = RealmSwiftFHIR.Claim(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testClaim1() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim1()
			try runClaim1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm1(instance: instance!)
	}

	func testClaimRealm1(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim1(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-institutional.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654456")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "960150")
		XCTAssertEqual(inst.identifier[0].system, "http://happyhospital.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "9612345")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "125.0"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "exam")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-serviceproduct")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "125.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "institutional")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim2() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim2()
			try runClaim2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm2(instance: instance!)
	}

	func testClaimRealm2(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim2(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-oral-average.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123456")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "100151")
		XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "12346")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "1200")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.item[1].bodySite?.code, "21")
		XCTAssertEqual(inst.item[1].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
		XCTAssertEqual(inst.item[1].net?.code, "USD")
		XCTAssertEqual(inst.item[1].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[1].net?.value! == RealmDecimal(string: "105.0"))
		XCTAssertEqual(inst.item[1].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[1].sequence.value, 2)
		XCTAssertEqual(inst.item[1].service?.code, "21211")
		XCTAssertEqual(inst.item[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[1].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[1].subSite[0].code, "L")
		XCTAssertEqual(inst.item[1].subSite[0].system, "http://fdi.org/fhir/oralsurfacecodes")
		XCTAssertEqual(inst.item[1].type?.code, "service")
		XCTAssertEqual(inst.item[1].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[1].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[1].unitPrice?.value! == RealmDecimal(string: "105.0"))
		XCTAssertEqual(inst.item[2].bodySite?.code, "36")
		XCTAssertEqual(inst.item[2].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
		XCTAssertEqual(inst.item[2].detail[0].net?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[0].net?.value! == RealmDecimal(string: "750.0"))
		XCTAssertEqual(inst.item[2].detail[0].sequence.value, 1)
		XCTAssertEqual(inst.item[2].detail[0].service?.code, "27211")
		XCTAssertEqual(inst.item[2].detail[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[2].detail[0].type?.code, "service")
		XCTAssertEqual(inst.item[2].detail[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[0].unitPrice?.value! == RealmDecimal(string: "750.0"))
		XCTAssertEqual(inst.item[2].detail[1].net?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[1].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[1].net?.value! == RealmDecimal(string: "350.0"))
		XCTAssertEqual(inst.item[2].detail[1].sequence.value, 2)
		XCTAssertEqual(inst.item[2].detail[1].service?.code, "lab")
		XCTAssertEqual(inst.item[2].detail[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[2].detail[1].type?.code, "service")
		XCTAssertEqual(inst.item[2].detail[1].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[1].unitPrice?.value! == RealmDecimal(string: "350.0"))
		XCTAssertEqual(inst.item[2].net?.code, "USD")
		XCTAssertEqual(inst.item[2].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].net?.value! == RealmDecimal(string: "1100.0"))
		XCTAssertEqual(inst.item[2].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[2].sequence.value, 3)
		XCTAssertEqual(inst.item[2].service?.code, "27211")
		XCTAssertEqual(inst.item[2].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[2].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[2].type?.code, "group")
		XCTAssertEqual(inst.item[2].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[2].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].unitPrice?.value! == RealmDecimal(string: "1100.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "oral")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim3() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim3()
			try runClaim3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm3(instance: instance!)
	}

	func testClaimRealm3(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim3(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-oral-contained.json")
		
		XCTAssertEqual(inst.contained[0].id, "organization-1")
		XCTAssertEqual(inst.contained[1].id, "organization-2")
		XCTAssertEqual(inst.contained[2].id, "practitioner-1")
		XCTAssertEqual(inst.contained[3].id, "patient-1")
		XCTAssertEqual(inst.contained[4].id, "coverage-1")
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "#coverage-1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123456")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "100152")
		XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "12347")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.item[0].provider?.reference, "#practitioner-1")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "1200")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.organization?.reference, "#organization-1")
		XCTAssertEqual(inst.patient?.reference, "#patient-1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "#organization-2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "oral")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim4() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim4()
			try runClaim4(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm4(instance: instance!)
	}

	func testClaimRealm4(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim4(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-oral-orthoplan.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2015-03-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123457")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.system, "http://hl7.org/fhir/sid/icd-10")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "100153")
		XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "12355")
		XCTAssertEqual(inst.item[0].detail[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[0].net?.value! == RealmDecimal(string: "1000.0"))
		XCTAssertEqual(inst.item[0].detail[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].detail[0].service?.code, "ORTHOEXAM")
		XCTAssertEqual(inst.item[0].detail[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].detail[0].type?.code, "CSINV")
		XCTAssertEqual(inst.item[0].detail[0].type?.system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.item[0].detail[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[0].unitPrice?.value! == RealmDecimal(string: "1000.0"))
		XCTAssertEqual(inst.item[0].detail[1].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[1].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[1].net?.value! == RealmDecimal(string: "1500.0"))
		XCTAssertEqual(inst.item[0].detail[1].sequence.value, 2)
		XCTAssertEqual(inst.item[0].detail[1].service?.code, "ORTHODIAG")
		XCTAssertEqual(inst.item[0].detail[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].detail[1].type?.code, "CSINV")
		XCTAssertEqual(inst.item[0].detail[1].type?.system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.item[0].detail[1].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[1].unitPrice?.value! == RealmDecimal(string: "1500.0"))
		XCTAssertEqual(inst.item[0].detail[2].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[2].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[2].net?.value! == RealmDecimal(string: "500.0"))
		XCTAssertEqual(inst.item[0].detail[2].sequence.value, 3)
		XCTAssertEqual(inst.item[0].detail[2].service?.code, "ORTHOINITIAL")
		XCTAssertEqual(inst.item[0].detail[2].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].detail[2].type?.code, "CSINV")
		XCTAssertEqual(inst.item[0].detail[2].type?.system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.item[0].detail[2].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[2].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[2].unitPrice?.value! == RealmDecimal(string: "500.0"))
		XCTAssertTrue(inst.item[0].detail[3].quantity?.value! == RealmDecimal(string: "24"))
		XCTAssertEqual(inst.item[0].detail[3].sequence.value, 4)
		XCTAssertEqual(inst.item[0].detail[3].service?.code, "ORTHOMONTHS")
		XCTAssertEqual(inst.item[0].detail[3].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].detail[3].type?.code, "CSINV")
		XCTAssertEqual(inst.item[0].detail[3].type?.system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.item[0].detail[4].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[4].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[4].net?.value! == RealmDecimal(string: "250.0"))
		XCTAssertTrue(inst.item[0].detail[4].quantity?.value! == RealmDecimal(string: "24"))
		XCTAssertEqual(inst.item[0].detail[4].sequence.value, 5)
		XCTAssertEqual(inst.item[0].detail[4].service?.code, "ORTHOPERIODIC")
		XCTAssertEqual(inst.item[0].detail[4].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].detail[4].type?.code, "CSINV")
		XCTAssertEqual(inst.item[0].detail[4].type?.system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.item[0].detail[4].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[4].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[4].unitPrice?.value! == RealmDecimal(string: "250.0"))
		XCTAssertEqual(inst.item[0].diagnosisLinkId[0].value, 1)
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "9000.0"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "ORTHPLAN")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2015-05-16")
		XCTAssertEqual(inst.item[0].type?.code, "FRAMEING")
		XCTAssertEqual(inst.item[0].type?.system, "http://hl7.org/fhir/v3/ActCode")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "9000.0"))
		XCTAssertEqual(inst.item[1].bodySite?.code, "21")
		XCTAssertEqual(inst.item[1].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
		XCTAssertEqual(inst.item[1].net?.code, "USD")
		XCTAssertEqual(inst.item[1].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[1].net?.value! == RealmDecimal(string: "105.0"))
		XCTAssertEqual(inst.item[1].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[1].sequence.value, 2)
		XCTAssertEqual(inst.item[1].service?.code, "21211")
		XCTAssertEqual(inst.item[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[1].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[1].subSite[0].code, "L")
		XCTAssertEqual(inst.item[1].subSite[0].system, "http://fdi.org/fhir/oralsurfacecodes")
		XCTAssertEqual(inst.item[1].type?.code, "service")
		XCTAssertEqual(inst.item[1].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[1].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[1].unitPrice?.value! == RealmDecimal(string: "105.0"))
		XCTAssertEqual(inst.item[2].bodySite?.code, "36")
		XCTAssertEqual(inst.item[2].bodySite?.system, "http://fdi.org/fhir/oraltoothcodes")
		XCTAssertEqual(inst.item[2].detail[0].net?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[0].net?.value! == RealmDecimal(string: "750.0"))
		XCTAssertEqual(inst.item[2].detail[0].sequence.value, 1)
		XCTAssertEqual(inst.item[2].detail[0].service?.code, "27211")
		XCTAssertEqual(inst.item[2].detail[0].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[2].detail[0].type?.code, "service")
		XCTAssertEqual(inst.item[2].detail[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[0].unitPrice?.value! == RealmDecimal(string: "750.0"))
		XCTAssertEqual(inst.item[2].detail[1].net?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[1].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[1].net?.value! == RealmDecimal(string: "350.0"))
		XCTAssertEqual(inst.item[2].detail[1].sequence.value, 2)
		XCTAssertEqual(inst.item[2].detail[1].service?.code, "lab")
		XCTAssertEqual(inst.item[2].detail[1].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[2].detail[1].type?.code, "service")
		XCTAssertEqual(inst.item[2].detail[1].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[2].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].detail[1].unitPrice?.value! == RealmDecimal(string: "350.0"))
		XCTAssertEqual(inst.item[2].net?.code, "USD")
		XCTAssertEqual(inst.item[2].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].net?.value! == RealmDecimal(string: "1100.0"))
		XCTAssertEqual(inst.item[2].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[2].sequence.value, 3)
		XCTAssertEqual(inst.item[2].service?.code, "27211")
		XCTAssertEqual(inst.item[2].service?.system, "http://hl7.org/fhir/oralservicecodes")
		XCTAssertEqual(inst.item[2].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[2].type?.code, "group")
		XCTAssertEqual(inst.item[2].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[2].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[2].unitPrice?.value! == RealmDecimal(string: "1100.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "oral")
		XCTAssertEqual(inst.use, "proposed")
		
		return inst
	}
	
	func testClaim5() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim5()
			try runClaim5(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm5(instance: instance!)
	}

	func testClaimRealm5(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim5(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-pharmacy.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654456")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "760150")
		XCTAssertEqual(inst.identifier[0].system, "http://happypharma.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "7612345")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "60.0"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "smokecess")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-pharmaservice")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "60.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "stat")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Pharmacy Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "pharmacy")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim6() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim6()
			try runClaim6(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm6(instance: instance!)
	}

	func testClaimRealm6(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim6(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim6(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-professional.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654456")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "860150")
		XCTAssertEqual(inst.identifier[0].system, "http://happypdocs.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "8612345")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "75.0"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "exam")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-serviceproduct")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "75.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "professional")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim7() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim7()
			try runClaim7(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm7(instance: instance!)
	}

	func testClaimRealm7(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim7(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim7(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-vision-glasses.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654321")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "660151")
		XCTAssertEqual(inst.identifier[0].system, "http://happysight.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "6612346")
		XCTAssertEqual(inst.item[0].detail[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[0].net?.value! == RealmDecimal(string: "100.0"))
		XCTAssertEqual(inst.item[0].detail[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].detail[0].service?.code, "frame")
		XCTAssertEqual(inst.item[0].detail[0].service?.system, "http://hl7.org/fhir/ex-visionservice")
		XCTAssertEqual(inst.item[0].detail[0].type?.code, "product")
		XCTAssertEqual(inst.item[0].detail[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[0].unitPrice?.value! == RealmDecimal(string: "100.0"))
		XCTAssertEqual(inst.item[0].detail[1].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[1].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[1].net?.value! == RealmDecimal(string: "100.0"))
		XCTAssertTrue(inst.item[0].detail[1].quantity?.value! == RealmDecimal(string: "2"))
		XCTAssertEqual(inst.item[0].detail[1].sequence.value, 2)
		XCTAssertEqual(inst.item[0].detail[1].service?.code, "lens")
		XCTAssertEqual(inst.item[0].detail[1].service?.system, "http://hl7.org/fhir/ex-visionservice")
		XCTAssertEqual(inst.item[0].detail[1].type?.code, "product")
		XCTAssertEqual(inst.item[0].detail[1].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[1].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[1].unitPrice?.value! == RealmDecimal(string: "50.0"))
		XCTAssertTrue(inst.item[0].detail[2].factor! == RealmDecimal(string: "0.07"))
		XCTAssertEqual(inst.item[0].detail[2].net?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[2].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[2].net?.value! == RealmDecimal(string: "14.0"))
		XCTAssertEqual(inst.item[0].detail[2].sequence.value, 3)
		XCTAssertEqual(inst.item[0].detail[2].service?.code, "fst")
		XCTAssertEqual(inst.item[0].detail[2].service?.system, "http://hl7.org/fhir/ex-visionservice")
		XCTAssertEqual(inst.item[0].detail[2].type?.code, "tax")
		XCTAssertEqual(inst.item[0].detail[2].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].detail[2].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].detail[2].unitPrice?.value! == RealmDecimal(string: "200.0"))
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "214.0"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "glasses")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-visionservice")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "group")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "214.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.prescription?.reference, "http://www.optdocs.com/prescription/12345")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Vision Claim for Glasses</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "vision")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim8() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim8()
			try runClaim8(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm8(instance: instance!)
	}

	func testClaimRealm8(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim8(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim8(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example-vision.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "654321")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "660150")
		XCTAssertEqual(inst.identifier[0].system, "http://happysight.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "6612345")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "80.0"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "exam")
		XCTAssertEqual(inst.item[0].service?.system, "http://hl7.org/fhir/ex-visionservice")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "80.0"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Vision Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "vision")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
	
	func testClaim9() {		
		var instance: RealmSwiftFHIR.Claim?
		do {
			instance = try runClaim9()
			try runClaim9(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Claim successfully, but threw")
		}

		testClaimRealm9(instance: instance!)
	}

	func testClaimRealm9(instance: RealmSwiftFHIR.Claim) {
		try! realm.write {
                realm.add(instance)
            }
        try! runClaim9(realm.objects(RealmSwiftFHIR.Claim.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Claim.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Claim.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runClaim9(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Claim {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "claim-example.json")
		
		XCTAssertEqual(inst.coverage[0].coverage?.reference, "Coverage/9876B1")
		XCTAssertTrue(inst.coverage[0].focal.value ?? false)
		XCTAssertEqual(inst.coverage[0].relationship?.code, "self")
		XCTAssertEqual(inst.coverage[0].sequence.value, 1)
		XCTAssertEqual(inst.created?.description, "2014-08-16")
		XCTAssertEqual(inst.diagnosis[0].diagnosis?.code, "123456")
		XCTAssertEqual(inst.diagnosis[0].sequence.value, 1)
		XCTAssertEqual(inst.id, "100150")
		XCTAssertEqual(inst.identifier[0].system, "http://happyvalley.com/claim")
		XCTAssertEqual(inst.identifier[0].value, "12345")
		XCTAssertEqual(inst.item[0].net?.code, "USD")
		XCTAssertEqual(inst.item[0].net?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].net?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.item[0].provider?.reference, "Practitioner/example")
		XCTAssertEqual(inst.item[0].sequence.value, 1)
		XCTAssertEqual(inst.item[0].service?.code, "1200")
		XCTAssertEqual(inst.item[0].serviceDate?.description, "2014-08-16")
		XCTAssertEqual(inst.item[0].type?.code, "service")
		XCTAssertEqual(inst.item[0].unitPrice?.code, "USD")
		XCTAssertEqual(inst.item[0].unitPrice?.system, "urn:iso:std:iso:4217")
		XCTAssertTrue(inst.item[0].unitPrice?.value! == RealmDecimal(string: "135.57"))
		XCTAssertEqual(inst.organization?.reference, "Organization/1")
		XCTAssertEqual(inst.patient?.reference, "Patient/1")
		XCTAssertEqual(inst.payee?.type?.code, "provider")
		XCTAssertEqual(inst.priority?.code, "normal")
		XCTAssertEqual(inst.target?.reference, "Organization/2")
		XCTAssertEqual(inst.text?.div, "<div>A human-readable rendering of the Oral Health Claim</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type, "oral")
		XCTAssertEqual(inst.use, "complete")
		
		return inst
	}
}
