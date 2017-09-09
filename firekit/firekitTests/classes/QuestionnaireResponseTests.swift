//
//  QuestionnaireResponseTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-09.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class QuestionnaireResponseTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(_ filename: String) throws -> FireKit.QuestionnaireResponse {
		return instantiateFrom(try readJSONFile(filename))
	}
	
	func instantiateFrom(_ json: FHIRJSON) -> FireKit.QuestionnaireResponse {
		let instance = FireKit.QuestionnaireResponse(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testQuestionnaireResponse1() {		
		var instance: FireKit.QuestionnaireResponse?
		do {
			instance = try runQuestionnaireResponse1()
			try runQuestionnaireResponse1(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.QuestionnaireResponse
			XCTAssertNotNil(copy)
			try runQuestionnaireResponse1(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaireResponse1(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse successfully, but threw")
		}

		testQuestionnaireResponseRealm1(instance!)
	}

    func testQuestionnaireResponse1RealmPK() {        
        do {
            let instance: FireKit.QuestionnaireResponse = try runQuestionnaireResponse1()
            let copy = (instance.copy() as! FireKit.QuestionnaireResponse)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireResponseRealm1(_ instance: FireKit.QuestionnaireResponse) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaireResponse1(realm.objects(FireKit.QuestionnaireResponse.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.QuestionnaireResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.QuestionnaireResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.QuestionnaireResponse.self).count)
	}
	
	@discardableResult
	func runQuestionnaireResponse1(_ json: FHIRJSON? = nil) throws -> FireKit.QuestionnaireResponse {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("questionnaireresponse-example-bluebook.json")
		
		XCTAssertEqual(inst.author?.reference, "http://hl7.org/fhir/Practitioner/example")
		XCTAssertEqual(inst.authored?.description, "2013-02-19T14:15:00+10:00")
		XCTAssertEqual(inst.group?.group[0].group[0].question[0].answer[0].valueString, "Cathy Jones")
		XCTAssertEqual(inst.group?.group[0].group[0].question[0].linkId, "nameOfChild")
		XCTAssertEqual(inst.group?.group[0].group[0].question[0].text, "Name of child")
		XCTAssertEqual(inst.group?.group[0].group[0].question[1].answer[0].valueCoding?.code, "f")
		XCTAssertEqual(inst.group?.group[0].group[0].question[1].linkId, "sex")
		XCTAssertEqual(inst.group?.group[0].group[0].question[1].text, "Sex")
		XCTAssertEqual(inst.group?.group[0].group[1].linkId, "neonatalInformation")
		XCTAssertTrue(inst.group?.group[0].group[1].question[0].answer[0].valueDecimal! == RealmDecimal(string: "3.25"))
		XCTAssertEqual(inst.group?.group[0].group[1].question[0].linkId, "birthWeight")
		XCTAssertEqual(inst.group?.group[0].group[1].question[0].text, "Birth weight (kg)")
		XCTAssertTrue(inst.group?.group[0].group[1].question[1].answer[0].valueDecimal! == RealmDecimal(string: "44.3"))
		XCTAssertEqual(inst.group?.group[0].group[1].question[1].linkId, "birthLength")
		XCTAssertEqual(inst.group?.group[0].group[1].question[1].text, "Birth length (cm)")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].extension_fhir[0].url, "http://example.org/Profile/questionnaire#visibilityCondition")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].extension_fhir[0].valueString, "HAS_VALUE(../choice/code) AND NEQ(../choice/code,'NO')")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].linkId, "vitaminKgivenDoses")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].question[0].answer[0].valueDate?.description, "1972-11-30")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].question[0].linkId, "vitaminiKDose1")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].question[0].text, "1st dose")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].question[1].answer[0].valueDate?.description, "1972-12-11")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].question[1].linkId, "vitaminiKDose2")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].group[0].question[1].text, "2nd dose")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].answer[0].valueCoding?.code, "INJECTION")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].linkId, "vitaminKgiven")
		XCTAssertEqual(inst.group?.group[0].group[1].question[2].text, "Vitamin K given")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].answer[0].group[0].linkId, "hepBgivenDate")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].answer[0].group[0].question[0].answer[0].valueDate?.description, "1972-12-04")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].answer[0].group[0].question[0].text, "Date given")
		XCTAssertTrue(inst.group?.group[0].group[1].question[3].answer[0].valueBoolean.value ?? false)
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].linkId, "hepBgiven")
		XCTAssertEqual(inst.group?.group[0].group[1].question[3].text, "Hep B given y / n")
		XCTAssertEqual(inst.group?.group[0].group[1].question[4].answer[0].valueString, "Already able to speak Chinese")
		XCTAssertEqual(inst.group?.group[0].group[1].question[4].linkId, "abnormalitiesAtBirth")
		XCTAssertEqual(inst.group?.group[0].group[1].question[4].text, "Abnormalities noted at birth")
		XCTAssertEqual(inst.group?.group[0].group[1].title, "Neonatal Information")
		XCTAssertEqual(inst.group?.group[0].linkId, "birthDetails")
		XCTAssertEqual(inst.group?.group[0].title, "Birth details - To be completed by health professional")
		XCTAssertEqual(inst.group?.linkId, "PHR")
		XCTAssertEqual(inst.group?.title, "NSW Government My Personal Health Record, january 2013")
		XCTAssertEqual(inst.id, "bb")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.subject?.reference, "http://hl7.org/fhir/Patient/1")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testQuestionnaireResponse2() {		
		var instance: FireKit.QuestionnaireResponse?
		do {
			instance = try runQuestionnaireResponse2()
			try runQuestionnaireResponse2(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.QuestionnaireResponse
			XCTAssertNotNil(copy)
			try runQuestionnaireResponse2(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaireResponse2(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse successfully, but threw")
		}

		testQuestionnaireResponseRealm2(instance!)
	}

    func testQuestionnaireResponse2RealmPK() {        
        do {
            let instance: FireKit.QuestionnaireResponse = try runQuestionnaireResponse2()
            let copy = (instance.copy() as! FireKit.QuestionnaireResponse)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireResponseRealm2(_ instance: FireKit.QuestionnaireResponse) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaireResponse2(realm.objects(FireKit.QuestionnaireResponse.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.QuestionnaireResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.QuestionnaireResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.QuestionnaireResponse.self).count)
	}
	
	@discardableResult
	func runQuestionnaireResponse2(_ json: FHIRJSON? = nil) throws -> FireKit.QuestionnaireResponse {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("questionnaireresponse-example-f201-lifelines.json")
		
		XCTAssertEqual(inst.author?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.authored?.description, "2013-06-18T00:00:00+01:00")
		XCTAssertEqual(inst.group?.group[0].linkId, "1")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].valueString, "I am allergic to house dust")
		XCTAssertEqual(inst.group?.group[0].question[0].linkId, "1.1")
		XCTAssertEqual(inst.group?.group[0].question[0].text, "Do you have allergies?")
		XCTAssertEqual(inst.group?.group[1].linkId, "2")
		XCTAssertEqual(inst.group?.group[1].question[0].answer[0].valueString, "Male")
		XCTAssertEqual(inst.group?.group[1].question[0].linkId, "2.1")
		XCTAssertEqual(inst.group?.group[1].question[0].text, "What is your gender?")
		XCTAssertEqual(inst.group?.group[1].question[1].answer[0].valueDate?.description, "1960-03-13")
		XCTAssertEqual(inst.group?.group[1].question[1].linkId, "2.2")
		XCTAssertEqual(inst.group?.group[1].question[1].text, "What is your date of birth?")
		XCTAssertEqual(inst.group?.group[1].question[2].answer[0].valueString, "The Netherlands")
		XCTAssertEqual(inst.group?.group[1].question[2].linkId, "2.3")
		XCTAssertEqual(inst.group?.group[1].question[2].text, "What is your country of birth?")
		XCTAssertEqual(inst.group?.group[1].question[3].answer[0].valueString, "married")
		XCTAssertEqual(inst.group?.group[1].question[3].linkId, "2.4")
		XCTAssertEqual(inst.group?.group[1].question[3].text, "What is your marital status?")
		XCTAssertEqual(inst.group?.group[1].title, "General questions")
		XCTAssertEqual(inst.group?.group[2].linkId, "3")
		XCTAssertEqual(inst.group?.group[2].question[0].answer[0].valueString, "No")
		XCTAssertEqual(inst.group?.group[2].question[0].linkId, "3.1")
		XCTAssertEqual(inst.group?.group[2].question[0].text, "Do you smoke?")
		XCTAssertEqual(inst.group?.group[2].question[1].answer[0].valueString, "No, but I used to drink")
		XCTAssertEqual(inst.group?.group[2].question[1].linkId, "3.2")
		XCTAssertEqual(inst.group?.group[2].question[1].text, "Do you drink alchohol?")
		XCTAssertEqual(inst.group?.group[2].title, "Intoxications")
		XCTAssertEqual(inst.group?.linkId, "root")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertEqual(inst.source?.reference, "Practitioner/f201")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.subject?.display, "Roel")
		XCTAssertEqual(inst.subject?.reference, "Patient/f201")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testQuestionnaireResponse3() {		
		var instance: FireKit.QuestionnaireResponse?
		do {
			instance = try runQuestionnaireResponse3()
			try runQuestionnaireResponse3(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.QuestionnaireResponse
			XCTAssertNotNil(copy)
			try runQuestionnaireResponse3(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaireResponse3(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse successfully, but threw")
		}

		testQuestionnaireResponseRealm3(instance!)
	}

    func testQuestionnaireResponse3RealmPK() {        
        do {
            let instance: FireKit.QuestionnaireResponse = try runQuestionnaireResponse3()
            let copy = (instance.copy() as! FireKit.QuestionnaireResponse)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireResponseRealm3(_ instance: FireKit.QuestionnaireResponse) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaireResponse3(realm.objects(FireKit.QuestionnaireResponse.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.QuestionnaireResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.QuestionnaireResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.QuestionnaireResponse.self).count)
	}
	
	@discardableResult
	func runQuestionnaireResponse3(_ json: FHIRJSON? = nil) throws -> FireKit.QuestionnaireResponse {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("questionnaireresponse-example-gcs.json")
		
		XCTAssertEqual(inst.authored?.description, "2014-12-11T04:44:16Z")
		XCTAssertEqual(inst.group?.linkId, "1")
		XCTAssertEqual(inst.group?.question[0].answer[0].valueCoding?.code, "LA6560-2")
		XCTAssertEqual(inst.group?.question[0].answer[0].valueCoding?.display, "Confused")
		XCTAssertEqual(inst.group?.question[0].answer[0].valueCoding?.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/iso21090-CO-value")
		XCTAssertTrue(inst.group?.question[0].answer[0].valueCoding?.extension_fhir[0].valueDecimal! == RealmDecimal(string: "4"))
		XCTAssertEqual(inst.group?.question[0].answer[0].valueCoding?.system, "http://loinc.org")
		XCTAssertEqual(inst.group?.question[0].linkId, "1.1")
		XCTAssertEqual(inst.group?.question[1].answer[0].valueCoding?.code, "LA6566-9")
		XCTAssertEqual(inst.group?.question[1].answer[0].valueCoding?.display, "Localizing pain")
		XCTAssertEqual(inst.group?.question[1].answer[0].valueCoding?.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/iso21090-CO-value")
		XCTAssertTrue(inst.group?.question[1].answer[0].valueCoding?.extension_fhir[0].valueDecimal! == RealmDecimal(string: "5"))
		XCTAssertEqual(inst.group?.question[1].answer[0].valueCoding?.system, "http://loinc.org")
		XCTAssertEqual(inst.group?.question[1].linkId, "1.2")
		XCTAssertEqual(inst.group?.question[2].answer[0].valueCoding?.code, "LA6556-0")
		XCTAssertEqual(inst.group?.question[2].answer[0].valueCoding?.display, "Eyes open spontaneously")
		XCTAssertEqual(inst.group?.question[2].answer[0].valueCoding?.extension_fhir[0].url, "http://hl7.org/fhir/StructureDefinition/iso21090-CO-value")
		XCTAssertTrue(inst.group?.question[2].answer[0].valueCoding?.extension_fhir[0].valueDecimal! == RealmDecimal(string: "4"))
		XCTAssertEqual(inst.group?.question[2].answer[0].valueCoding?.system, "http://loinc.org")
		XCTAssertEqual(inst.group?.question[2].linkId, "1.3")
		XCTAssertEqual(inst.group?.title, "Glasgow Coma Score")
		XCTAssertEqual(inst.id, "gcs")
		XCTAssertEqual(inst.questionnaire?.reference, "Questionnaire/gcs")
		XCTAssertEqual(inst.source?.reference, "Practitioner/f007")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.subject?.display, "Peter James Chalmers")
		XCTAssertEqual(inst.subject?.reference, "Patient/example")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testQuestionnaireResponse4() {		
		var instance: FireKit.QuestionnaireResponse?
		do {
			instance = try runQuestionnaireResponse4()
			try runQuestionnaireResponse4(instance!.asJSON()) 		
			let copy = instance!.copy() as? FireKit.QuestionnaireResponse
			XCTAssertNotNil(copy)
			try runQuestionnaireResponse4(copy!.asJSON())     

            try! realm.write { copy!.populate(from: instance!) }
            try runQuestionnaireResponse4(copy!.asJSON())  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse successfully, but threw")
		}

		testQuestionnaireResponseRealm4(instance!)
	}

    func testQuestionnaireResponse4RealmPK() {        
        do {
            let instance: FireKit.QuestionnaireResponse = try runQuestionnaireResponse4()
            let copy = (instance.copy() as! FireKit.QuestionnaireResponse)

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test QuestionnaireResponse's PKs, but threw: \(error)")
        }
    }

	func testQuestionnaireResponseRealm4(_ instance: FireKit.QuestionnaireResponse) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! runQuestionnaireResponse4(realm.objects(FireKit.QuestionnaireResponse.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.QuestionnaireResponse.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.QuestionnaireResponse()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.QuestionnaireResponse.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! runQuestionnaireResponse4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.QuestionnaireResponse.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.QuestionnaireResponse.self).count)
	}
	
	@discardableResult
	func runQuestionnaireResponse4(_ json: FHIRJSON? = nil) throws -> FireKit.QuestionnaireResponse {
		let inst = (nil != json) ? instantiateFrom(json!) : try instantiateFrom("questionnaireresponse-example.json")
		
		XCTAssertEqual(inst.author?.reference, "#questauth")
		XCTAssertEqual(inst.authored?.description, "2013-02-19T14:15:00-05:00")
		XCTAssertEqual(inst.contained[0].id, "patsub")
		XCTAssertEqual(inst.contained[1].id, "questauth")
		XCTAssertEqual(inst.contained[2].id, "obs.pt-category")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].group[0].question[0].answer[0].valueCoding?.code, "1")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].group[0].question[0].answer[0].valueCoding?.system, "http://cancer.questionnaire.org/system/code/yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].group[0].question[1].answer[0].valueCoding?.code, "1")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].group[0].question[1].answer[0].valueCoding?.system, "http://cancer.questionnaire.org/system/code/yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].group[0].question[2].answer[0].valueCoding?.code, "0")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].group[0].question[2].answer[0].valueCoding?.system, "http://cancer.questionnaire.org/system/code/yesno")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].valueCoding?.code, "1")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].valueCoding?.display, "Yes")
		XCTAssertEqual(inst.group?.group[0].question[0].answer[0].valueCoding?.system, "http://cancer.questionnaire.org/system/code/yesno")
		XCTAssertEqual(inst.group?.title, "Cancer Quality Forum Questionnaire 2012")
		XCTAssertEqual(inst.id, "3141")
		XCTAssertEqual(inst.status, "completed")
		XCTAssertEqual(inst.subject?.reference, "#patsub")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
