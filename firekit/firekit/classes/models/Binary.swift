//
//  Binary.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Binary) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Pure binary content defined by some other format than FHIR.
 *
 *  A binary resource can contain any content, whether text, image, pdf, zip archive, etc.
 */
open class Binary: Resource {
	override open class var resourceType: String {
		get { return "Binary" }
	}

    @objc public dynamic var content: Base64Binary?
    @objc public dynamic var contentType: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(content: Base64Binary, contentType: String) {
        self.init()
        self.content = content
        self.contentType = contentType
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case content = "content"
        case contentType = "contentType"
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

        self.content = try container.decodeIfPresent(Base64Binary.self, forKey: .content)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Binary.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Binary. Will return empty instance: \(error))")
		}
		return Binary.init()
	}
}

