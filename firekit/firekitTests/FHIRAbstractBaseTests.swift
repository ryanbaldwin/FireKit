//
//  FHIRAbstractBaseTests.swift
//  FireKit-iOSTests
//
//  Created by Ryan Baldwin on 2017-11-08.
//  Copyright © 2017 Bunnyhug. All rights reserved.
//

import XCTest
import RealmSwift
import FireKit

class FHIRAbstractBaseTests: XCTestCase, RealmPersistenceTesting {
    var realm: Realm!
    
    override func setUp() {
        super.setUp()
        realm = makeRealm()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        clear(realm)
    }
    
    func testUpsertingElementCompartmentalizesTheElement() {
        let (patientA, patientB) = (Patient(), Patient())
        
        let coding = Coding()
        coding.system = "2.16.840.1.113883.4.642.1.19"
        coding.code = "M"
        let maritalStatus = CodeableConcept()
        maritalStatus.coding.append(coding)
        
        try! realm.write {
            realm.add([patientA, patientB])
            patientA.upsert(maritalStatus: maritalStatus)
            patientB.upsert(maritalStatus: maritalStatus)
        }
        
        XCTAssertNotNil(patientA.maritalStatus)
        XCTAssertNotNil(patientB.maritalStatus)
        XCTAssertEqual(2, realm.objects(CodeableConcept.self).count)
        
        try! realm.write {
            patientB.upsert(maritalStatus: nil)
        }
        
        XCTAssertNotNil(patientA.maritalStatus)
        XCTAssertNil(patientB.maritalStatus)
        XCTAssertEqual(1, realm.objects(CodeableConcept.self).count)
    }
}
