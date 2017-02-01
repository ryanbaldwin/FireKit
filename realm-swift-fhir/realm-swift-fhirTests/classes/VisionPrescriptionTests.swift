//
//  VisionPrescriptionTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class VisionPrescriptionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.VisionPrescription {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.VisionPrescription {
		let instance = RealmSwiftFHIR.VisionPrescription(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testVisionPrescription1() {		
		var instance: RealmSwiftFHIR.VisionPrescription?
		do {
			instance = try runVisionPrescription1()
			try runVisionPrescription1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test VisionPrescription successfully, but threw")
		}

		testVisionPrescriptionRealm1(instance: instance!)
	}

	func testVisionPrescriptionRealm1(instance: RealmSwiftFHIR.VisionPrescription) {
		try! realm.write {
                realm.add(instance)
            }
        try! runVisionPrescription1(realm.objects(RealmSwiftFHIR.VisionPrescription.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.VisionPrescription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.VisionPrescription.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runVisionPrescription1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.VisionPrescription {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "visionprescription-example-1.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2014-06-15")
		XCTAssertTrue(inst.dispense[0].add! == RealmDecimal(string: "1.75"))
		XCTAssertEqual(inst.dispense[0].axis.value, 160)
		XCTAssertTrue(inst.dispense[0].backCurve! == RealmDecimal(string: "8.7"))
		XCTAssertEqual(inst.dispense[0].brand, "OphthaGuard")
		XCTAssertEqual(inst.dispense[0].color, "green")
		XCTAssertTrue(inst.dispense[0].cylinder! == RealmDecimal(string: "-2.25"))
		XCTAssertTrue(inst.dispense[0].diameter! == RealmDecimal(string: "14.0"))
		XCTAssertEqual(inst.dispense[0].duration?.code, "month")
		XCTAssertEqual(inst.dispense[0].duration?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dispense[0].duration?.unit, "month")
		XCTAssertTrue(inst.dispense[0].duration?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dispense[0].eye, "right")
		XCTAssertTrue(inst.dispense[0].power! == RealmDecimal(string: "-2.75"))
		XCTAssertEqual(inst.dispense[0].product?.code, "contact")
		XCTAssertEqual(inst.dispense[0].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
		XCTAssertTrue(inst.dispense[1].add! == RealmDecimal(string: "1.75"))
		XCTAssertEqual(inst.dispense[1].axis.value, 160)
		XCTAssertTrue(inst.dispense[1].backCurve! == RealmDecimal(string: "8.7"))
		XCTAssertEqual(inst.dispense[1].brand, "OphthaGuard")
		XCTAssertEqual(inst.dispense[1].color, "green")
		XCTAssertTrue(inst.dispense[1].cylinder! == RealmDecimal(string: "-3.5"))
		XCTAssertTrue(inst.dispense[1].diameter! == RealmDecimal(string: "14.0"))
		XCTAssertEqual(inst.dispense[1].duration?.code, "month")
		XCTAssertEqual(inst.dispense[1].duration?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.dispense[1].duration?.unit, "month")
		XCTAssertTrue(inst.dispense[1].duration?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.dispense[1].eye, "left")
		XCTAssertTrue(inst.dispense[1].power! == RealmDecimal(string: "-2.75"))
		XCTAssertEqual(inst.dispense[1].product?.code, "contact")
		XCTAssertEqual(inst.dispense[1].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
		XCTAssertEqual(inst.id, "33124")
		XCTAssertEqual(inst.identifier[0].system, "http://www.happysight.com/prescription")
		XCTAssertEqual(inst.identifier[0].value, "15014")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/example")
		XCTAssertEqual(inst.text?.div, "<div>Sample Contract Lens prescription</div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testVisionPrescription2() {		
		var instance: RealmSwiftFHIR.VisionPrescription?
		do {
			instance = try runVisionPrescription2()
			try runVisionPrescription2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test VisionPrescription successfully, but threw")
		}

		testVisionPrescriptionRealm2(instance: instance!)
	}

	func testVisionPrescriptionRealm2(instance: RealmSwiftFHIR.VisionPrescription) {
		try! realm.write {
                realm.add(instance)
            }
        try! runVisionPrescription2(realm.objects(RealmSwiftFHIR.VisionPrescription.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.VisionPrescription.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.VisionPrescription.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runVisionPrescription2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.VisionPrescription {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "visionprescription-example.json")
		
		XCTAssertEqual(inst.dateWritten?.description, "2014-06-15")
		XCTAssertTrue(inst.dispense[0].add! == RealmDecimal(string: "2.0"))
		XCTAssertEqual(inst.dispense[0].base, "down")
		XCTAssertEqual(inst.dispense[0].eye, "right")
		XCTAssertTrue(inst.dispense[0].prism! == RealmDecimal(string: "0.5"))
		XCTAssertEqual(inst.dispense[0].product?.code, "lens")
		XCTAssertEqual(inst.dispense[0].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
		XCTAssertTrue(inst.dispense[0].sphere! == RealmDecimal(string: "-2.0"))
		XCTAssertTrue(inst.dispense[1].add! == RealmDecimal(string: "2.0"))
		XCTAssertEqual(inst.dispense[1].axis.value, 180)
		XCTAssertEqual(inst.dispense[1].base, "up")
		XCTAssertTrue(inst.dispense[1].cylinder! == RealmDecimal(string: "-0.5"))
		XCTAssertEqual(inst.dispense[1].eye, "left")
		XCTAssertTrue(inst.dispense[1].prism! == RealmDecimal(string: "0.5"))
		XCTAssertEqual(inst.dispense[1].product?.code, "lens")
		XCTAssertEqual(inst.dispense[1].product?.system, "http://hl7.org/fhir/ex-visionprescriptionproduct")
		XCTAssertTrue(inst.dispense[1].sphere! == RealmDecimal(string: "-1.0"))
		XCTAssertEqual(inst.id, "33123")
		XCTAssertEqual(inst.identifier[0].system, "http://www.happysight.com/prescription")
		XCTAssertEqual(inst.identifier[0].value, "15013")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.prescriber?.reference, "Practitioner/example")
		XCTAssertEqual(inst.text?.div, "<div>\n\t  <p>OD -2.00 SPH         +2.00 add    0.5 p.d. BD</p>\n      <p>OS -1.00 -0.50 x 180 +2.00 add    0.5 p.d. BU</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
