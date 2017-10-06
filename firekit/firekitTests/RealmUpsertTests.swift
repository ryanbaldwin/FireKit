//
//  RealmUpsertTests.swift
//  FireKit-iOSTests
//
//  Created by Ryan Baldwin on 2017-10-05.
//  Copyright © 2017 Bunnyhug. All rights reserved.
//

import XCTest
import RealmSwift
import FireKit

class RealmUpsertTests: XCTestCase, RealmPersistenceTesting {
    var realm: Realm!
    
    func inflatePatient(fromFile filename: String) -> Patient {
        let patientJSON = try? readJSONFile(filename)
        assert(patientJSON != nil, "Failed to read JSON file \(filename)")
        return try! JSONDecoder().decode(Patient.self, from: patientJSON!)
    }
    
    override func setUp() {
        super.setUp()
        realm = self.makeRealm()
        let patient = inflatePatient(fromFile: "patient-example-a.json")
        try! realm.write { realm.add(patient) }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.clear(realm)
    }
    
    func testResourceIsAddedIfResourceDoesNotExist() {
        // sanity check
        XCTAssertEqual(1, realm.objects(Patient.self).count)
        
        let patient = inflatePatient(fromFile: "patient-example-b.json")
        try! realm.write { _ = realm.upsert(patient) }
        
        XCTAssertEqual(2, realm.objects(Patient.self).count)
    }
    
    func testResourceISUpdatedIfResourceExists() {
        XCTAssertEqual(1, realm.objects(Patient.self).count)
        
        let patient = inflatePatient(fromFile: "patient-example-a.json")
        patient.gender = "female"
        try! realm.write { realm.upsert(patient) }
        
        XCTAssertEqual(1, realm.objects(Patient.self).count)
        XCTAssertEqual("female", realm.objects(Patient.self).first?.gender)
    }
    
    func testUpdatedResourceDoesNotHaveSuperfluousElements() {
        let patient = realm.objects(Patient.self).first!
        let contactCount = patient.contact.count
        let idCount = patient.identifier.count
        let linkCount = patient.link.count
        let nameCount = patient.name.count
        let photoCount = patient.photo.count
        
        let upserting = inflatePatient(fromFile: "patient-example-a.json")
        upserting.gender = "female"
        try! realm.write { realm.upsert(upserting) }
        
        let upserted = realm.objects(Patient.self).first!
        XCTAssertEqual(contactCount, upserted.contact.count)
        XCTAssertEqual(idCount, upserted.identifier.count)
        XCTAssertEqual(linkCount, upserted.link.count)
        XCTAssertEqual(nameCount, upserted.name.count)
        XCTAssertEqual(photoCount, upserted.photo.count)
    }
    
    func testUpsertedListWillUpdateExistingItems() {
        let patientA = inflatePatient(fromFile: "patient-example-a.json")
        patientA.gender = "female"
        try! realm.write { realm.upsert([patientA]) }
        
        XCTAssertEqual(1, realm.objects(Patient.self).count)
        XCTAssertEqual("female", realm.objects(Patient.self).first?.gender)
    }
    
    func testUpsertedListWillInsertNewItems() {
        let patientB = inflatePatient(fromFile: "patient-example-b.json")
        try! realm.write { realm.upsert([patientB]) }
        
        XCTAssertEqual(2, realm.objects(Patient.self).count)
        let patients = realm.objects(Patient.self).sorted(byKeyPath: "id")
        
        XCTAssertEqual("pat1", patients.first?.id)
        XCTAssertEqual("pat2", patients.last?.id)
    }
}
