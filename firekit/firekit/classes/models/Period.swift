//
//  Period.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Period) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Time range defined by start and end date/time.
 *
 *  A time period defined by a start and end date and optionally time.
 */
open class Period: Element {
	override open class var resourceType: String {
		get { return "Period" }
	}

    @objc public dynamic var end: DateTime?
    @objc public dynamic var start: DateTime?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case end = "end"
        case start = "start"
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

        self.end = try container.decodeIfPresent(DateTime.self, forKey: .end)
        self.start = try container.decodeIfPresent(DateTime.self, forKey: .start)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.end, forKey: .end)
        try container.encodeIfPresent(self.start, forKey: .start)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Period.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Period. Will return empty instance: \(error))")
		}
		return Period.init()
	}
}

