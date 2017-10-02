//
//  RealmExtensionTests.swift
//  FireKit
//
//  Created by Ryan Baldwin on 2017-08-09.
//  Copyright © 2017 Bunnyhug. All rights fall under Apache 2
//

import XCTest
import Foundation
import FireKit
import RealmSwift

class CascadeDeletableTests: XCTestCase, RealmPersistenceTesting {
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }
    
    func testCanDeleteUnmanagedResource() {
        let patient = Patient()
        patient.cascadeDelete()
    }
    
    func testCanDeleteManagedResource() {
        let patient = Patient()
        try! realm.write { realm.add(patient) }
        XCTAssertNotNil(realm.objects(Patient.self).first)
        
        try! realm.write { patient.cascadeDelete() }
        XCTAssertNil(realm.objects(Patient.self).first)
    }
    
    func testCanDeleteChildRelationship() {
        let patient = Patient()
        patient.animal = PatientAnimal()
        
        try! realm.write { realm.add(patient) }
        XCTAssertNotNil(realm.objects(Patient.self).first)
        XCTAssertNotNil(realm.objects(PatientAnimal.self).first)
        
        try! realm.write { patient.cascadeDelete() }
        XCTAssertNil(realm.objects(Patient.self).first)
        XCTAssertNil(realm.objects(PatientAnimal.self).first)
    }
    
    func testCanDeleteChildLists() {
        let patient = Patient()
        
        let name = HumanName()
        name.family.append(RealmString(val: "Baldwin"))
        name.given.append(RealmString(val: "Ryan"))
        patient.name.append(name)
        
        try! realm.write { realm.add(patient) }
        XCTAssertNotNil(realm.objects(Patient.self).first)
        XCTAssertNotNil(realm.objects(HumanName.self).first)
        XCTAssertEqual(realm.objects(RealmString.self).count, 2)
        
        try! realm.write { patient.cascadeDelete() }
        XCTAssertEqual(realm.objects(RealmString.self).count, 0)
        XCTAssertNil(realm.objects(HumanName.self).first)
        XCTAssertNil(realm.objects(Patient.self).first)
    }
}
