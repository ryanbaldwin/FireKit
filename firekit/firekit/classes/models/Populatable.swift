//
//  Populatable.swift
//  FireKit-iOS
//
//  Created by Ryan Baldwin on 2017-09-18.
//  Copyright © 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation
import RealmSwift

public protocol Populatable {
    func populate(from other: Any)
}
