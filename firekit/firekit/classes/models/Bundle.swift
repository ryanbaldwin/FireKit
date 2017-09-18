//
//  Bundle.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Bundle) on 2017-09-18.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-18
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Contains a collection of resources.
 *
 *  A container for a collection of resources.
 */
open class Bundle: Resource {
	override open class var resourceType: String {
		get { return "Bundle" }
	}

    public let entry = RealmSwift.List<BundleEntry>()
    public let link = RealmSwift.List<BundleLink>()
    @objc public dynamic var signature: Signature?
    public func upsert(signature: Signature?) {
        upsert(prop: &self.signature, val: signature)
    }
    public let total = RealmOptional<Int>()
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case entry = "entry"
        case link = "link"
        case signature = "signature"
        case total = "total"
        case type = "type"
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

        self.entry.append(objectsIn: try container.decodeIfPresent([BundleEntry].self, forKey: .entry) ?? [])
        self.link.append(objectsIn: try container.decodeIfPresent([BundleLink].self, forKey: .link) ?? [])
        self.signature = try container.decodeIfPresent(Signature.self, forKey: .signature)
        self.total.value = try container.decodeIfPresent(Int.self, forKey: .total)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.entry), forKey: .entry)
        try container.encode(Array(self.link), forKey: .link)
        try container.encodeIfPresent(self.signature, forKey: .signature)
        try container.encodeIfPresent(self.total.value, forKey: .total)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Bundle.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Bundle. Will return empty instance: \(error))")
		}
		return Bundle.init()
	}
}


/**
 *  Entry in the bundle - will have a resource, or information.
 *
 *  An entry in a bundle resource - will either contain a resource, or information about a resource (transactions and
 *  history only).
 */
open class BundleEntry: BackboneElement {
	override open class var resourceType: String {
		get { return "BundleEntry" }
	}

    @objc public dynamic var fullUrl: String?
    public let link = RealmSwift.List<BundleLink>()
    @objc public dynamic var request: BundleEntryRequest?
    public func upsert(request: BundleEntryRequest?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var resource: ContainedResource?
    @objc public dynamic var response: BundleEntryResponse?
    public func upsert(response: BundleEntryResponse?) {
        upsert(prop: &self.response, val: response)
    }
    @objc public dynamic var search: BundleEntrySearch?
    public func upsert(search: BundleEntrySearch?) {
        upsert(prop: &self.search, val: search)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case fullUrl = "fullUrl"
        case link = "link"
        case request = "request"
        case resource = "resource"
        case response = "response"
        case search = "search"
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

        self.fullUrl = try container.decodeIfPresent(String.self, forKey: .fullUrl)
        self.link.append(objectsIn: try container.decodeIfPresent([BundleLink].self, forKey: .link) ?? [])
        self.request = try container.decodeIfPresent(BundleEntryRequest.self, forKey: .request)

        if let resourceContained = try container.decodeIfPresent(ContainedResource.self, forKey: .resource),
           let resourceType = resourceContained.resourceType {
            let actualResource = try container.decodeFHIRAbstractBaseIfPresent(resourceType, forKey: .resource)
            resourceContained.json = try JSONEncoder().encode(actualResource)
            self.resource = resourceContained
        }
    
        self.response = try container.decodeIfPresent(BundleEntryResponse.self, forKey: .response)
        self.search = try container.decodeIfPresent(BundleEntrySearch.self, forKey: .search)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.fullUrl, forKey: .fullUrl)
        try container.encode(Array(self.link), forKey: .link)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.resource, forKey: .resource)
        try container.encodeIfPresent(self.response, forKey: .response)
        try container.encodeIfPresent(self.search, forKey: .search)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BundleEntry.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BundleEntry. Will return empty instance: \(error))")
		}
		return BundleEntry.init()
	}
}


/**
 *  Transaction Related Information.
 *
 *  Additional information about how this entry should be processed as part of a transaction.
 */
open class BundleEntryRequest: BackboneElement {
	override open class var resourceType: String {
		get { return "BundleEntryRequest" }
	}

    @objc public dynamic var ifMatch: String?
    @objc public dynamic var ifModifiedSince: Instant?
    @objc public dynamic var ifNoneExist: String?
    @objc public dynamic var ifNoneMatch: String?
    @objc public dynamic var method: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(method: String, url: String) {
        self.init()
        self.method = method
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case ifMatch = "ifMatch"
        case ifModifiedSince = "ifModifiedSince"
        case ifNoneExist = "ifNoneExist"
        case ifNoneMatch = "ifNoneMatch"
        case method = "method"
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

        self.ifMatch = try container.decodeIfPresent(String.self, forKey: .ifMatch)
        self.ifModifiedSince = try container.decodeIfPresent(Instant.self, forKey: .ifModifiedSince)
        self.ifNoneExist = try container.decodeIfPresent(String.self, forKey: .ifNoneExist)
        self.ifNoneMatch = try container.decodeIfPresent(String.self, forKey: .ifNoneMatch)
        self.method = try container.decodeIfPresent(String.self, forKey: .method)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.ifMatch, forKey: .ifMatch)
        try container.encodeIfPresent(self.ifModifiedSince, forKey: .ifModifiedSince)
        try container.encodeIfPresent(self.ifNoneExist, forKey: .ifNoneExist)
        try container.encodeIfPresent(self.ifNoneMatch, forKey: .ifNoneMatch)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BundleEntryRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BundleEntryRequest. Will return empty instance: \(error))")
		}
		return BundleEntryRequest.init()
	}
}


/**
 *  Transaction Related Information.
 *
 *  Additional information about how this entry should be processed as part of a transaction.
 */
open class BundleEntryResponse: BackboneElement {
	override open class var resourceType: String {
		get { return "BundleEntryResponse" }
	}

    @objc public dynamic var etag: String?
    @objc public dynamic var lastModified: Instant?
    @objc public dynamic var location: String?
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case etag = "etag"
        case lastModified = "lastModified"
        case location = "location"
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

        self.etag = try container.decodeIfPresent(String.self, forKey: .etag)
        self.lastModified = try container.decodeIfPresent(Instant.self, forKey: .lastModified)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.etag, forKey: .etag)
        try container.encodeIfPresent(self.lastModified, forKey: .lastModified)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BundleEntryResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BundleEntryResponse. Will return empty instance: \(error))")
		}
		return BundleEntryResponse.init()
	}
}


/**
 *  Search related information.
 *
 *  Information about the search process that lead to the creation of this entry.
 */
open class BundleEntrySearch: BackboneElement {
	override open class var resourceType: String {
		get { return "BundleEntrySearch" }
	}

    @objc public dynamic var mode: String?
    @objc public dynamic var score: RealmDecimal?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case mode = "mode"
        case score = "score"
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

        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.score = try container.decodeIfPresent(RealmDecimal.self, forKey: .score)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.score, forKey: .score)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BundleEntrySearch.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BundleEntrySearch. Will return empty instance: \(error))")
		}
		return BundleEntrySearch.init()
	}
}


/**
 *  Links related to this Bundle.
 *
 *  A series of links that provide context to this bundle.
 */
open class BundleLink: BackboneElement {
	override open class var resourceType: String {
		get { return "BundleLink" }
	}

    @objc public dynamic var relation: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(relation: String, url: String) {
        self.init()
        self.relation = relation
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case relation = "relation"
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

        self.relation = try container.decodeIfPresent(String.self, forKey: .relation)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.relation, forKey: .relation)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BundleLink.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BundleLink. Will return empty instance: \(error))")
		}
		return BundleLink.init()
	}
}

