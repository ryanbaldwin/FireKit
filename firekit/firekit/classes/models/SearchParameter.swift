//
//  SearchParameter.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SearchParameter) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Search Parameter for a resource.
 *
 *  A search parameter that defines a named search item that can be used to search/filter on a resource.
 */
open class SearchParameter: DomainResource {
	override open class var resourceType: String {
		get { return "SearchParameter" }
	}

    @objc public dynamic var base: String?
    @objc public dynamic var code: String?
    public let contact = RealmSwift.List<SearchParameterContact>()
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var status: String?
    public let target = RealmSwift.List<RealmString>()
    @objc public dynamic var type: String?
    @objc public dynamic var url: String?
    @objc public dynamic var xpath: String?
    @objc public dynamic var xpathUsage: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(base: String, code: String, description_fhir: String, name: String, type: String, url: String) {
        self.init()
        self.base = base
        self.code = code
        self.description_fhir = description_fhir
        self.name = name
        self.type = type
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case base = "base"
        case code = "code"
        case contact = "contact"
        case date = "date"
        case description_fhir = "description"
        case experimental = "experimental"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case status = "status"
        case target = "target"
        case type = "type"
        case url = "url"
        case xpath = "xpath"
        case xpathUsage = "xpathUsage"
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

        self.base = try container.decodeIfPresent(String.self, forKey: .base)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.contact.append(objectsIn: try container.decodeIfPresent([SearchParameterContact].self, forKey: .contact) ?? [])
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.target.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .target) ?? [])
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.xpath = try container.decodeIfPresent(String.self, forKey: .xpath)
        self.xpathUsage = try container.decodeIfPresent(String.self, forKey: .xpathUsage)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.target), forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.xpath, forKey: .xpath)
        try container.encodeIfPresent(self.xpathUsage, forKey: .xpathUsage)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SearchParameter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SearchParameter. Will return empty instance: \(error))")
		}
		return SearchParameter.init()
	}
}




/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class SearchParameterContact: BackboneElement {
	override open class var resourceType: String {
		get { return "SearchParameterContact" }
	}

    @objc public dynamic var name: String?
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case telecom = "telecom"
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

        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SearchParameterContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SearchParameterContact. Will return empty instance: \(error))")
		}
		return SearchParameterContact.init()
	}
}



