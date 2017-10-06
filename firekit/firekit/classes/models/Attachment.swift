//
//  Attachment.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Attachment) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Content in a format defined elsewhere.
 *
 *  For referring to data content defined in other formats.
 */
open class Attachment: Element {
	override open class var resourceType: String {
		get { return "Attachment" }
	}

    @objc public dynamic var contentType: String?
    @objc public dynamic var creation: DateTime?
    @objc public dynamic var data: Base64Binary?
    @objc public dynamic var hash_fhir: Base64Binary?
    @objc public dynamic var language: String?
    public let size = RealmOptional<Int>()
    @objc public dynamic var title: String?
    @objc public dynamic var url: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contentType = "contentType"
        case creation = "creation"
        case data = "data"
        case hash_fhir = "hash"
        case language = "language"
        case size = "size"
        case title = "title"
        case url = "url"
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

        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.creation = try container.decodeIfPresent(DateTime.self, forKey: .creation)
        self.data = try container.decodeIfPresent(Base64Binary.self, forKey: .data)
        self.hash_fhir = try container.decodeIfPresent(Base64Binary.self, forKey: .hash_fhir)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.size.value = try container.decodeIfPresent(Int.self, forKey: .size)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
        try container.encodeIfPresent(self.creation, forKey: .creation)
        try container.encodeIfPresent(self.data, forKey: .data)
        try container.encodeIfPresent(self.hash_fhir, forKey: .hash_fhir)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.size.value, forKey: .size)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Attachment.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Attachment. Will return empty instance: \(error))")
		}
		return Attachment.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Attachment else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        contentType = o.contentType
        FireKit.populate(&self.creation, from: o.creation)
        data = o.data
        hash_fhir = o.hash_fhir
        language = o.language
        size.value = o.size.value
        title = o.title
        url = o.url
    }
}

