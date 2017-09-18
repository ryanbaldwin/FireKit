//
//  Element.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Element) on 2017-09-18.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-18
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Base for all elements.
 *
 *  Base definition for all elements in a resource.
 */
open class Element: FHIRAbstractBase {
	override open class var resourceType: String {
		get { return "Element" }
	}

    public let extension_fhir = RealmSwift.List<Extension>()
    @objc public dynamic var id: String?
    @objc public dynamic var pk = UUID().uuidString
    override open static func primaryKey() -> String? { return "pk" }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case extension_fhir = "extension"
        case id = "id"
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

        self.extension_fhir.append(objectsIn: try container.decodeIfPresent([Extension].self, forKey: .extension_fhir) ?? [])
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.extension_fhir), forKey: .extension_fhir)
        try container.encodeIfPresent(self.id, forKey: .id)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Element.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Element. Will return empty instance: \(error))")
		}
		return Element.init()
	}
}

