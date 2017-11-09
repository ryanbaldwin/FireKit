//
//  RealmResourceTests.swift
//  FireKit-iOSTests
//
//  Created by Ryan Baldwin on 2017-11-09.
//  Copyright © 2017 Bunnyhug. All rights reserved.
//

import Foundation
import XCTest
import RealmSwift
import FireKit

class RealmResourceTests: XCTestCase, RealmPersistenceTesting {
    
    var realm: Realm!
    
    func inflatePatient(fromFile filename: String) -> Patient {
        let patientJSON = try? readJSONFile(filename)
        assert(patientJSON != nil, "Failed to read JSON file \(filename)")
        return try! JSONDecoder().decode(Patient.self, from: patientJSON!)
    }
    
    override func setUp() {
        super.setUp()
        realm = self.makeRealm()
        
        let patients: [Patient] = (1...3).map {
            let patient = inflatePatient(fromFile: "patient-example-a.json")
            patient.id = "\($0)"
            return patient
        }
        
        try! realm.write { realm.add(patients) }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        self.clear(realm)
    }
    
    func testResourceReturnsResourceWhenFound() {
       XCTAssertNotNil(realm.resource(Patient.self, withId: "2"))
    }
    
    func testResourceReturnsNilWhenNotFound() {
        XCTAssertNil(realm.resource(Patient.self, withId: "5"))
    }
    
    func testResourcesReturnsFoundMatches() {
        let patients = realm.resources(Patient.self, withIds: ["1", "3"])
                            .sorted(byKeyPath: "id")
        XCTAssertEqual(2, patients.count)
        XCTAssertEqual("1", patients.first?.id)
        XCTAssertEqual("3", patients.last?.id)
    }
}
