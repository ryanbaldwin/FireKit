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

class PopulatableTests: XCTestCase, RealmPersistenceTesting {
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }
 
    
}
