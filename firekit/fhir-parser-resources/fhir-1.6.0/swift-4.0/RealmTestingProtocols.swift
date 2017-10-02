//
//  RealmTestingProtocols.swift
//  FireKit
//
//  Created by Ryan Baldwin on 2017-08-09.
//  Copyright © 2017 Bunnyhug. All rights fall under Apache 2
//

import XCTest
import RealmSwift

/// Provides a small set of functionality to assist in Unit Testing something which depends on an in-memory Realm.
protocol RealmPersistenceTesting: class {}

extension RealmPersistenceTesting where Self: XCTestCase {
    /// Clears the current in-memory realm of all entities.
    func clear(_ realm: Realm) {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    /// Creates a new Realm based on the current configuration
    ///
    /// - Returns: A new Realm instance
    func makeRealm() -> Realm {
        var realm: Realm!
        // stopwatch("Time to fire up realm") {
            realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "FireKitInMemDB"))
        // }
        
        clear(realm)
        return realm
    }

    func stopwatch(_ label: String, closure: () -> ()) {
        let start = Date()
        closure()
        let end = Date()
        let timeInterval: Double = end.timeIntervalSince(start)
        print("\(label): \(timeInterval)")
    }
}
