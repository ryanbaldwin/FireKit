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
    
    func testUpsertWillRemoveItemsThatNoLongerExist() {
        let patientA2 = inflatePatient(fromFile: "patient-example-a.json")
        patientA2.name.removeAll()
        try! realm.write { realm.upsert(patientA2) }
        
        let patients = realm.objects(Patient.self)
        XCTAssertEqual(1, patients.count)
        XCTAssertEqual(0, patients.first?.name.count)
    }
    
    func testUpsertWillAddItemsThatAreNew() {
        let patientA2 = inflatePatient(fromFile: "patient-example-a.json")
        
        let name = HumanName()
        name.family.append(RealmString(val: "Ward"))
        name.given.append(RealmString(val: "Adam"))
        patientA2.name.append(name)
        
        try! realm.write { realm.upsert(patientA2) }
        
        let patients = realm.objects(Patient.self)
        XCTAssertEqual(1, patients.count)
        XCTAssertEqual(2, patients.first!.name.count)
    }
    
    func testUpsertWillUpdateItemsInPlace() {
        let patientA2 = inflatePatient(fromFile: "patient-example-a.json")
        
        let name = patientA2.name.first!
        name.family.first!.value = "Roberts"
        name.given.first!.value = "Steve"
        
        try! realm.write { realm.upsert(patientA2) }
        let patients = realm.objects(Patient.self)
        XCTAssertEqual(1, patients.count)
        XCTAssertEqual(1, patients.first!.name.count)
        
        let upsertedName = patients.first!.name.first!
        XCTAssertEqual(1, upsertedName.family.count)
        XCTAssertEqual(1, upsertedName.given.count)
        
        XCTAssertEqual("Roberts", upsertedName.family.first?.value)
        XCTAssertEqual("Steve", upsertedName.given.first?.value)
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
        let patientA: Patient = inflatePatient(fromFile: "patient-example-a.json")
        patientA.gender = "female"
        let patients: [Patient] = [patientA]
        try! realm.write {realm.upsert(patients)}
        
        
        XCTAssertEqual(1, realm.objects(Patient.self).count)
        XCTAssertEqual("female", realm.objects(Patient.self).first?.gender)
    }
    
    func testUpsertedListWillInsertNewItems() {
        let patientB: Patient = inflatePatient(fromFile: "patient-example-b.json")
        try! realm.write { realm.upsert([patientB]) }
        
        XCTAssertEqual(2, realm.objects(Patient.self).count)
        let patients = realm.objects(Patient.self).sorted(byKeyPath: "id")
        
        XCTAssertEqual("pat1", patients.first?.id)
        XCTAssertEqual("pat2", patients.last?.id)
    }
}
