//
//  DeviceTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-17.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DeviceTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.Device {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.Device {
		let instance = RealmSwiftFHIR.Device(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDevice1() {		
		var instance: RealmSwiftFHIR.Device?
		do {
			instance = try runDevice1()
			try runDevice1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Device
			XCTAssertNotNil(copy)
			try runDevice1(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw")
		}

		testDeviceRealm1(instance: instance!)
	}

    func testDevice1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Device = try runDevice1()
            let copy = (instance.copy() as! RealmSwiftFHIR.Device)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device's PKs, but threw: \(error)")
        }
    }

	func testDeviceRealm1(instance: RealmSwiftFHIR.Device) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDevice1(realm.objects(RealmSwiftFHIR.Device.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Device.self).count)
	}
	
	@discardableResult
	func runDevice1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Device {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "device-example-f001-feedingtube.json")
		
		XCTAssertEqual(inst.expiry?.description, "2020-08-08")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertEqual(inst.identifier[0].system, "http:/goodhealthhospital/identifier/devices")
		XCTAssertEqual(inst.identifier[0].value, "12345")
		XCTAssertEqual(inst.location?.display, "Central Supply")
		XCTAssertEqual(inst.manufactureDate?.description, "2015-08-08")
		XCTAssertEqual(inst.owner?.reference, "Organization/2.16.840.1.113883.19.5")
		XCTAssertEqual(inst.status, "available")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "25062003")
		XCTAssertEqual(inst.type?.coding[0].display, "Feeding tube, device")
		XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.udi, "(01)00000123000017(10)ABC123(17)120415")
		
		return inst
	}
	
	func testDevice2() {		
		var instance: RealmSwiftFHIR.Device?
		do {
			instance = try runDevice2()
			try runDevice2(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Device
			XCTAssertNotNil(copy)
			try runDevice2(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw")
		}

		testDeviceRealm2(instance: instance!)
	}

    func testDevice2RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Device = try runDevice2()
            let copy = (instance.copy() as! RealmSwiftFHIR.Device)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device's PKs, but threw: \(error)")
        }
    }

	func testDeviceRealm2(instance: RealmSwiftFHIR.Device) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDevice2(realm.objects(RealmSwiftFHIR.Device.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Device.self).count)
	}
	
	@discardableResult
	func runDevice2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Device {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "device-example-ihe-pcd.json")
		
		XCTAssertEqual(inst.id, "ihe-pcd")
		XCTAssertEqual(inst.identifier[0].type?.coding[0].code, "SNO")
		XCTAssertEqual(inst.identifier[0].type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
		XCTAssertEqual(inst.identifier[0].type?.text, "Serial Number")
		XCTAssertEqual(inst.identifier[0].value, "AMID-123-456")
		XCTAssertEqual(inst.lotNumber, "12345")
		XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
		XCTAssertEqual(inst.model, "A.1.1")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>Acme Patient Monitor</p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.text, "Vital Signs Monitor")
		
		return inst
	}
	
	func testDevice3() {		
		var instance: RealmSwiftFHIR.Device?
		do {
			instance = try runDevice3()
			try runDevice3(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Device
			XCTAssertNotNil(copy)
			try runDevice3(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw")
		}

		testDeviceRealm3(instance: instance!)
	}

    func testDevice3RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Device = try runDevice3()
            let copy = (instance.copy() as! RealmSwiftFHIR.Device)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device's PKs, but threw: \(error)")
        }
    }

	func testDeviceRealm3(instance: RealmSwiftFHIR.Device) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDevice3(realm.objects(RealmSwiftFHIR.Device.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Device.self).count)
	}
	
	@discardableResult
	func runDevice3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Device {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "device-example-pacemaker.json")
		
		XCTAssertEqual(inst.contact[0].system, "phone")
		XCTAssertEqual(inst.contact[0].value, "ext 4352")
		XCTAssertEqual(inst.id, "example-pacemaker")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.com/devices/pacemakers/octane/serial")
		XCTAssertEqual(inst.identifier[0].value, "1234-5678-90AB-CDEF")
		XCTAssertEqual(inst.lotNumber, "1234-5678")
		XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
		XCTAssertEqual(inst.model, "PM/Octane 2014")
		XCTAssertEqual(inst.patient?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "octane2014")
		XCTAssertEqual(inst.type?.coding[0].display, "Performance pace maker for high octane patients")
		XCTAssertEqual(inst.type?.coding[0].system, "http://acme.com/devices")
		
		return inst
	}
	
	func testDevice4() {		
		var instance: RealmSwiftFHIR.Device?
		do {
			instance = try runDevice4()
			try runDevice4(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Device
			XCTAssertNotNil(copy)
			try runDevice4(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw")
		}

		testDeviceRealm4(instance: instance!)
	}

    func testDevice4RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Device = try runDevice4()
            let copy = (instance.copy() as! RealmSwiftFHIR.Device)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device's PKs, but threw: \(error)")
        }
    }

	func testDeviceRealm4(instance: RealmSwiftFHIR.Device) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDevice4(realm.objects(RealmSwiftFHIR.Device.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Device.self).count)
	}
	
	@discardableResult
	func runDevice4(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Device {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "device-example-software.json")
		
		XCTAssertEqual(inst.contact[0].system, "other")
		XCTAssertEqual(inst.contact[0].value, "http://acme.com")
		XCTAssertEqual(inst.id, "software")
		XCTAssertEqual(inst.identifier[0].system, "http://acme.com/ehr/client-ids")
		XCTAssertEqual(inst.identifier[0].value, "goodhealth")
		XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.text, "EHR")
		XCTAssertEqual(inst.url, "http://acme.com/goodhealth/ehr/")
		XCTAssertEqual(inst.version, "10.23-23423")
		
		return inst
	}
	
	func testDevice5() {		
		var instance: RealmSwiftFHIR.Device?
		do {
			instance = try runDevice5()
			try runDevice5(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.Device
			XCTAssertNotNil(copy)
			try runDevice5(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Device successfully, but threw")
		}

		testDeviceRealm5(instance: instance!)
	}

    func testDevice5RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.Device = try runDevice5()
            let copy = (instance.copy() as! RealmSwiftFHIR.Device)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test Device's PKs, but threw: \(error)")
        }
    }

	func testDeviceRealm5(instance: RealmSwiftFHIR.Device) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDevice5(realm.objects(RealmSwiftFHIR.Device.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.Device.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.Device()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.Device.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDevice5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.Device.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Device.self).count)
	}
	
	@discardableResult
	func runDevice5(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.Device {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "device-example.json")
		
		XCTAssertEqual(inst.contact[0].system, "phone")
		XCTAssertEqual(inst.contact[0].value, "ext 4352")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "http://goodcare.org/devices/id")
		XCTAssertEqual(inst.identifier[0].value, "345675")
		XCTAssertEqual(inst.identifier[1].type?.coding[0].code, "SNO")
		XCTAssertEqual(inst.identifier[1].type?.coding[0].system, "http://hl7.org/fhir/identifier-type")
		XCTAssertEqual(inst.identifier[1].type?.text, "Serial Number")
		XCTAssertEqual(inst.identifier[1].value, "AMID-342135-8464")
		XCTAssertEqual(inst.lotNumber, "43453424")
		XCTAssertEqual(inst.manufacturer, "Acme Devices, Inc")
		XCTAssertEqual(inst.model, "AB 45-J")
		XCTAssertEqual(inst.note[0].authorReference?.reference, "Practitioner/xcda-author")
		XCTAssertEqual(inst.note[0].text, "QA Checked")
		XCTAssertEqual(inst.note[0].time?.description, "2015-06-28T14:03:32+10:00")
		XCTAssertEqual(inst.status, "available")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "86184003")
		XCTAssertEqual(inst.type?.coding[0].display, "Electrocardiographic monitor and recorder")
		XCTAssertEqual(inst.type?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.type?.text, "ECG")
		
		return inst
	}
}
