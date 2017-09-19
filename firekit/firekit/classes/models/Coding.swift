//
//  Coding.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Coding) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A reference to a code defined by a terminology system.
 */
open class Coding: Element {
	override open class var resourceType: String {
		get { return "Coding" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var display: String?
    @objc public dynamic var system: String?
    public let userSelected = RealmOptional<Bool>()
    @objc public dynamic var version: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case display = "display"
        case system = "system"
        case userSelected = "userSelected"
        case version = "version"
    }
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.userSelected.value = try container.decodeIfPresent(Bool.self, forKey: .userSelected)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.userSelected.value, forKey: .userSelected)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Coding.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Coding. Will return empty instance: \(error))")
		}
		return Coding.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Coding else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        code = o.code
        display = o.display
        system = o.system
        userSelected.value = o.userSelected.value
        version = o.version
    }
}

