//
//  DocumentReferenceTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-22.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class DocumentReferenceTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.DocumentReference {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.DocumentReference {
		let instance = RealmSwiftFHIR.DocumentReference(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testDocumentReference1() {		
		var instance: RealmSwiftFHIR.DocumentReference?
		do {
			instance = try runDocumentReference1()
			try runDocumentReference1(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.DocumentReference
			XCTAssertNotNil(copy)
			try runDocumentReference1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runDocumentReference1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test DocumentReference successfully, but threw")
		}

		testDocumentReferenceRealm1(instance: instance!)
	}

    func testDocumentReference1RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.DocumentReference = try runDocumentReference1()
            let copy = (instance.copy() as! RealmSwiftFHIR.DocumentReference)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test DocumentReference's PKs, but threw: \(error)")
        }
    }

	func testDocumentReferenceRealm1(instance: RealmSwiftFHIR.DocumentReference) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runDocumentReference1(realm.objects(RealmSwiftFHIR.DocumentReference.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DocumentReference.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.DocumentReference.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.DocumentReference()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.DocumentReference.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDocumentReference1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.DocumentReference.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runDocumentReference1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.DocumentReference.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.DocumentReference.self).count)
	}
	
	@discardableResult
	func runDocumentReference1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.DocumentReference {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "documentreference-example.json")
		
		XCTAssertEqual(inst.authenticator?.reference, "Organization/organization-example")
		XCTAssertEqual(inst.author[0].reference, "Practitioner/xcda1")
		XCTAssertEqual(inst.author[1].reference, "#a2")
		XCTAssertEqual(inst.class_fhir?.coding[0].code, "History and Physical")
		XCTAssertEqual(inst.class_fhir?.coding[0].display, "History and Physical")
		XCTAssertEqual(inst.class_fhir?.coding[0].system, "http://ihe.net/xds/connectathon/classCodes")
		XCTAssertEqual(inst.contained[0].id, "a2")
		XCTAssertEqual(inst.content[0].attachment?.contentType, "application/hl7-v3+xml")
		XCTAssertTrue(inst.content[0].attachment?.hash_fhir! == Base64Binary(val: "2jmj7l5rSw0yVb/vlWAYkK/YBwk="))
		XCTAssertEqual(inst.content[0].attachment?.language, "en-US")
		XCTAssertEqual(inst.content[0].attachment?.size.value, 3654)
		XCTAssertEqual(inst.content[0].attachment?.url, "http://example.org/xds/mhd/Binary/07a6483f-732b-461e-86b6-edb665c45510")
		XCTAssertEqual(inst.content[0].format[0].code, "urn:ihe:pcc:handp:2008")
		XCTAssertEqual(inst.content[0].format[0].display, "History and Physical Specification")
		XCTAssertEqual(inst.content[0].format[0].system, "urn:oid:1.3.6.1.4.1.19376.1.2.3")
		XCTAssertEqual(inst.context?.encounter?.reference, "Encounter/xcda")
		XCTAssertEqual(inst.context?.event[0].coding[0].code, "T-D8200")
		XCTAssertEqual(inst.context?.event[0].coding[0].display, "Arm")
		XCTAssertEqual(inst.context?.event[0].coding[0].system, "http://ihe.net/xds/connectathon/eventCodes")
		XCTAssertEqual(inst.context?.facilityType?.coding[0].code, "Outpatient")
		XCTAssertEqual(inst.context?.facilityType?.coding[0].display, "Outpatient")
		XCTAssertEqual(inst.context?.facilityType?.coding[0].system, "http://www.ihe.net/xds/connectathon/healthcareFacilityTypeCodes")
		XCTAssertEqual(inst.context?.period?.end?.description, "2004-12-23T08:01:00+11:00")
		XCTAssertEqual(inst.context?.period?.start?.description, "2004-12-23T08:00:00+11:00")
		XCTAssertEqual(inst.context?.practiceSetting?.coding[0].code, "General Medicine")
		XCTAssertEqual(inst.context?.practiceSetting?.coding[0].display, "General Medicine")
		XCTAssertEqual(inst.context?.practiceSetting?.coding[0].system, "http://www.ihe.net/xds/connectathon/practiceSettingCodes")
		XCTAssertEqual(inst.context?.related[0].identifier?.system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.context?.related[0].identifier?.value, "urn:oid:1.3.6.1.4.1.21367.2005.3.7.2345")
		XCTAssertEqual(inst.context?.related[0].ref?.reference, "Patient/xcda")
		XCTAssertEqual(inst.context?.sourcePatientInfo?.reference, "Patient/xcda")
		XCTAssertEqual(inst.created?.description, "2005-12-24T09:35:00+11:00")
		XCTAssertEqual(inst.custodian?.reference, "Organization/organization-example")
		XCTAssertEqual(inst.description_fhir, "Physical")
		XCTAssertEqual(inst.docStatus?.coding[0].code, "preliminary")
		XCTAssertEqual(inst.docStatus?.coding[0].display, "preliminary")
		XCTAssertEqual(inst.docStatus?.coding[0].system, "http://hl7.org/fhir/composition-status")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[0].value, "urn:oid:1.3.6.1.4.1.21367.2005.3.7.1234")
		XCTAssertEqual(inst.indexed?.description, "2005-12-24T09:43:41+11:00")
		XCTAssertEqual(inst.masterIdentifier?.system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.masterIdentifier?.value, "urn:oid:1.3.6.1.4.1.21367.2005.3.7")
		XCTAssertEqual(inst.relatesTo[0].code, "appends")
		XCTAssertEqual(inst.relatesTo[0].target?.reference, "DocumentReference/example")
		XCTAssertEqual(inst.securityLabel[0].coding[0].code, "V")
		XCTAssertEqual(inst.securityLabel[0].coding[0].display, "very restricted")
		XCTAssertEqual(inst.securityLabel[0].coding[0].system, "http://hl7.org/fhir/v3/Confidentiality")
		XCTAssertEqual(inst.status, "current")
		XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "34108-1")
		XCTAssertEqual(inst.type?.coding[0].display, "Outpatient Note")
		XCTAssertEqual(inst.type?.coding[0].system, "http://loinc.org")
		
		return inst
	}
}
