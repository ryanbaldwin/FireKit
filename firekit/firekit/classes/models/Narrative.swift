//
//  Narrative.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Narrative) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A human-readable formatted text, including images.
 */
open class Narrative: Element {
	override open class var resourceType: String {
		get { return "Narrative" }
	}

    @objc public dynamic var div: String?
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(div: String, status: String) {
        self.init()
        self.div = div
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case div = "div"
        case status = "status"
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

        self.div = try container.decodeIfPresent(String.self, forKey: .div)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.div, forKey: .div)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Narrative.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Narrative. Will return empty instance: \(error))")
		}
		return Narrative.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Narrative else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        div = o.div
        status = o.status
    }
}

