//
//  Attachment.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Attachment) on 2017-09-11.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contentType"] {
				presentKeys.insert("contentType")
				if let val = exist as? String {
					self.contentType = val
				}
				else {
					errors.append(FHIRJSONError(key: "contentType", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["creation"] {
				presentKeys.insert("creation")
				if let val = exist as? String {
					self.creation = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "creation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["data"] {
				presentKeys.insert("data")
				if let val = exist as? String {
					self.data = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "data", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["hash"] {
				presentKeys.insert("hash")
				if let val = exist as? String {
					self.hash_fhir = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "hash", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["language"] {
				presentKeys.insert("language")
				if let val = exist as? String {
					self.language = val
				}
				else {
					errors.append(FHIRJSONError(key: "language", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["size"] {
				presentKeys.insert("size")
				if let val = exist as? Int {
					self.size.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "size", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["title"] {
				presentKeys.insert("title")
				if let val = exist as? String {
					self.title = val
				}
				else {
					errors.append(FHIRJSONError(key: "title", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contentType = self.contentType {
			json["contentType"] = contentType.asJSON()
		}
		if let creation = self.creation {
			json["creation"] = creation.asJSON()
		}
		if let data = self.data {
			json["data"] = data.asJSON()
		}
		if let hash_fhir = self.hash_fhir {
			json["hash"] = hash_fhir.asJSON()
		}
		if let language = self.language {
			json["language"] = language.asJSON()
		}
		if let size = self.size.value {
			json["size"] = size.asJSON()
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
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
}

