//
//  CompositionTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class CompositionTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.Composition {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.Composition {
      let instance = try JSONDecoder().decode(FireKit.Composition.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testComposition1() {   
    var instance: FireKit.Composition?
    do {
      instance = try runComposition1()
      try runComposition1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.Composition
      XCTAssertNotNil(copy)
      try runComposition1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runComposition1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test Composition successfully, but threw: \(error)")
    }

    testCompositionRealm1(instance!)
  }

    func testComposition1RealmPK() {        
        do {
            let instance: FireKit.Composition = try runComposition1()
            let copy = (instance.copy() as! FireKit.Composition)

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
            XCTAssertTrue(false, "Must instantiate and test Composition's PKs, but threw: \(error)")
        }
    }

  func testCompositionRealm1(_ instance: FireKit.Composition) {
      // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
      try! realm.write { realm.add(instance) }
        try! runComposition1(JSONEncoder().encode(realm.objects(FireKit.Composition.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Composition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Composition.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Composition()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Composition.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runComposition1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Composition.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runComposition1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Composition.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Composition.self).count)
  }
  
  @discardableResult
  func runComposition1(_ data: Data? = nil) throws -> FireKit.Composition {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "composition-example.json")
    
    XCTAssertEqual(inst.attester[0].mode[0].value, "legal")
    XCTAssertEqual(inst.attester[0].party?.display, "Harold Hippocrates, MD")
    XCTAssertEqual(inst.attester[0].party?.reference, "Practitioner/xcda-author")
    XCTAssertEqual(inst.attester[0].time?.description, "2012-01-04T09:10:14Z")
    XCTAssertEqual(inst.author[0].display, "Harold Hippocrates, MD")
    XCTAssertEqual(inst.author[0].reference, "Practitioner/xcda-author")
    XCTAssertEqual(inst.class_fhir?.coding[0].code, "LP173421-1")
    XCTAssertEqual(inst.class_fhir?.coding[0].display, "Report")
    XCTAssertEqual(inst.class_fhir?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.confidentiality, "N")
    XCTAssertEqual(inst.custodian?.display, "Good Health Clinic")
    XCTAssertEqual(inst.custodian?.reference, "Organization/2.16.840.1.113883.19.5")
    XCTAssertEqual(inst.date?.description, "2012-01-04T09:10:14Z")
    XCTAssertEqual(inst.encounter?.reference, "Encounter/xcda")
    XCTAssertEqual(inst.event[0].code[0].coding[0].code, "HEALTHREC")
    XCTAssertEqual(inst.event[0].code[0].coding[0].display, "health record")
    XCTAssertEqual(inst.event[0].code[0].coding[0].system, "http://hl7.org/fhir/v3/ActCode")
    XCTAssertEqual(inst.event[0].detail[0].reference, "Observation/example")
    XCTAssertEqual(inst.event[0].period?.end?.description, "2012-11-12")
    XCTAssertEqual(inst.event[0].period?.start?.description, "2010-07-18")
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.identifier?.system, "http://healthintersections.com.au/test")
    XCTAssertEqual(inst.identifier?.value, "1")
    XCTAssertEqual(inst.section[0].code?.coding[0].code, "11348-0")
    XCTAssertEqual(inst.section[0].code?.coding[0].display, "History of past illness Narrative")
    XCTAssertEqual(inst.section[0].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.section[0].entry[0].reference, "Condition/stroke")
    XCTAssertEqual(inst.section[0].entry[1].reference, "Condition/example")
    XCTAssertEqual(inst.section[0].entry[2].reference, "Condition/example2")
    XCTAssertEqual(inst.section[0].mode, "snapshot")
    XCTAssertEqual(inst.section[0].orderedBy?.coding[0].code, "event-date")
    XCTAssertEqual(inst.section[0].orderedBy?.coding[0].display, "Sorted by Event Date")
    XCTAssertEqual(inst.section[0].orderedBy?.coding[0].system, "http://hl7.org/fhir/list-order")
    XCTAssertEqual(inst.section[0].text?.status, "generated")
    XCTAssertEqual(inst.section[0].title, "History of present illness")
    XCTAssertEqual(inst.section[1].code?.coding[0].code, "10157-6")
    XCTAssertEqual(inst.section[1].code?.coding[0].display, "History of family member diseases Narrative")
    XCTAssertEqual(inst.section[1].code?.coding[0].system, "http://loinc.org")
    XCTAssertEqual(inst.section[1].emptyReason?.coding[0].code, "withheld")
    XCTAssertEqual(inst.section[1].emptyReason?.coding[0].display, "Information Withheld")
    XCTAssertEqual(inst.section[1].emptyReason?.coding[0].system, "http://hl7.org/fhir/list-empty-reason")
    XCTAssertEqual(inst.section[1].mode, "snapshot")
    XCTAssertEqual(inst.section[1].text?.div, "<div>\n\t\t\t<p>History of family member diseases - not available</p>\n\t\t\t</div>")
    XCTAssertEqual(inst.section[1].text?.status, "generated")
    XCTAssertEqual(inst.section[1].title, "History of family member diseases")
    XCTAssertEqual(inst.status, "final")
    XCTAssertEqual(inst.subject?.display, "Henry Levin the 7th")
    XCTAssertEqual(inst.subject?.reference, "Patient/xcda")
    XCTAssertEqual(inst.text?.div, "<div>\n\t\t\t<p>Consultation note for Henry Levin the 7th</p>\n\t\t\t<p>Managed by Good Health Clinic</p>\n\t\t</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    XCTAssertEqual(inst.title, "Consultation Note")
    XCTAssertEqual(inst.type?.coding[0].code, "11488-4")
    XCTAssertEqual(inst.type?.coding[0].display, "Consult note")
    XCTAssertEqual(inst.type?.coding[0].system, "http://loinc.org")
    
    return inst
  }
}
