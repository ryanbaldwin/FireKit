//
//  Bundle.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Bundle) on 2017-09-10.
//  2017, SMART Health IT.
//

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
        try container.encode(self.entry.flatMap { $0 }, forKey: .entry)
        try container.encode(self.link.flatMap { $0 }, forKey: .link)
        try container.encodeIfPresent(self.signature, forKey: .signature)
        try container.encodeIfPresent(self.total.value, forKey: .total)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["entry"] {
				presentKeys.insert("entry")
				if let val = exist as? [FHIRJSON] {
					if let vals = BundleEntry.instantiate(fromArray: val, owner: self) as? [BundleEntry] {
						if let realm = self.realm { realm.delete(self.entry) }
						self.entry.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "entry", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["link"] {
				presentKeys.insert("link")
				if let val = exist as? [FHIRJSON] {
					if let vals = BundleLink.instantiate(fromArray: val, owner: self) as? [BundleLink] {
						if let realm = self.realm { realm.delete(self.link) }
						self.link.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "link", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["signature"] {
				presentKeys.insert("signature")
				if let val = exist as? FHIRJSON {
					upsert(signature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "signature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["total"] {
				presentKeys.insert("total")
				if let val = exist as? Int {
					self.total.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "total", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if entry.count > 0 {
			json["entry"] = Array(entry.map() { $0.asJSON() })
		}
		if link.count > 0 {
			json["link"] = Array(link.map() { $0.asJSON() })
		}
		if let signature = self.signature {
			json["signature"] = signature.asJSON()
		}
		if let total = self.total.value {
			json["total"] = total.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
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
    @objc public dynamic var resource: Resource?
    public func upsert(resource: Resource?) {
        upsert(prop: &self.resource, val: resource)
    }
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
            let t = FHIRAbstractBase.resourceType(from: resourceType)
            self.resource = try container.decodeIfPresent(t, forKey: .resource) as? Resource
        }
    
        self.response = try container.decodeIfPresent(BundleEntryResponse.self, forKey: .response)
        self.search = try container.decodeIfPresent(BundleEntrySearch.self, forKey: .search)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.fullUrl, forKey: .fullUrl)
        try container.encode(self.link.flatMap { $0 }, forKey: .link)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.resource, forKey: .resource)
        try container.encodeIfPresent(self.response, forKey: .response)
        try container.encodeIfPresent(self.search, forKey: .search)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["fullUrl"] {
				presentKeys.insert("fullUrl")
				if let val = exist as? String {
					self.fullUrl = val
				}
				else {
					errors.append(FHIRJSONError(key: "fullUrl", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["link"] {
				presentKeys.insert("link")
				if let val = exist as? [FHIRJSON] {
					if let vals = BundleLink.instantiate(fromArray: val, owner: self) as? [BundleLink] {
						if let realm = self.realm { realm.delete(self.link) }
						self.link.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "link", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					upsert(request: BundleEntryRequest(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? FHIRJSON {
					self.resource = Resource.instantiate(from: val, owner: self) as? Resource
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? FHIRJSON {
					upsert(response: BundleEntryResponse(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["search"] {
				presentKeys.insert("search")
				if let val = exist as? FHIRJSON {
					upsert(search: BundleEntrySearch(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "search", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let fullUrl = self.fullUrl {
			json["fullUrl"] = fullUrl.asJSON()
		}
		if link.count > 0 {
			json["link"] = Array(link.map() { $0.asJSON() })
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let resource = self.resource {
			json["resource"] = resource.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		if let search = self.search {
			json["search"] = search.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["ifMatch"] {
				presentKeys.insert("ifMatch")
				if let val = exist as? String {
					self.ifMatch = val
				}
				else {
					errors.append(FHIRJSONError(key: "ifMatch", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["ifModifiedSince"] {
				presentKeys.insert("ifModifiedSince")
				if let val = exist as? String {
					self.ifModifiedSince = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "ifModifiedSince", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["ifNoneExist"] {
				presentKeys.insert("ifNoneExist")
				if let val = exist as? String {
					self.ifNoneExist = val
				}
				else {
					errors.append(FHIRJSONError(key: "ifNoneExist", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["ifNoneMatch"] {
				presentKeys.insert("ifNoneMatch")
				if let val = exist as? String {
					self.ifNoneMatch = val
				}
				else {
					errors.append(FHIRJSONError(key: "ifNoneMatch", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? String {
					self.method = val
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "method"))
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
			else {
				errors.append(FHIRJSONError(key: "url"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let ifMatch = self.ifMatch {
			json["ifMatch"] = ifMatch.asJSON()
		}
		if let ifModifiedSince = self.ifModifiedSince {
			json["ifModifiedSince"] = ifModifiedSince.asJSON()
		}
		if let ifNoneExist = self.ifNoneExist {
			json["ifNoneExist"] = ifNoneExist.asJSON()
		}
		if let ifNoneMatch = self.ifNoneMatch {
			json["ifNoneMatch"] = ifNoneMatch.asJSON()
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["etag"] {
				presentKeys.insert("etag")
				if let val = exist as? String {
					self.etag = val
				}
				else {
					errors.append(FHIRJSONError(key: "etag", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["lastModified"] {
				presentKeys.insert("lastModified")
				if let val = exist as? String {
					self.lastModified = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "lastModified", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? String {
					self.location = val
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let etag = self.etag {
			json["etag"] = etag.asJSON()
		}
		if let lastModified = self.lastModified {
			json["lastModified"] = lastModified.asJSON()
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? String {
					self.mode = val
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["score"] {
				presentKeys.insert("score")
				if let val = exist as? NSNumber {
					self.score = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "score", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if let score = self.score {
			json["score"] = score.asJSON()
		}
		
		return json
	}
*/
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["relation"] {
				presentKeys.insert("relation")
				if let val = exist as? String {
					self.relation = val
				}
				else {
					errors.append(FHIRJSONError(key: "relation", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "relation"))
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
			else {
				errors.append(FHIRJSONError(key: "url"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let relation = self.relation {
			json["relation"] = relation.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
}

