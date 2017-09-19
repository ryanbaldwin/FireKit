//
//  Conformance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Conformance) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A conformance statement.
 *
 *  A conformance statement is a set of capabilities of a FHIR Server that may be used as a statement of actual server
 *  functionality or a statement of required or desired server implementation.
 */
open class Conformance: DomainResource {
	override open class var resourceType: String {
		get { return "Conformance" }
	}

    @objc public dynamic var acceptUnknown: String?
    public let contact = RealmSwift.List<ConformanceContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let document = RealmSwift.List<ConformanceDocument>()
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var fhirVersion: String?
    public let format = RealmSwift.List<RealmString>()
    @objc public dynamic var implementation: ConformanceImplementation?
    public func upsert(implementation: ConformanceImplementation?) {
        upsert(prop: &self.implementation, val: implementation)
    }
    @objc public dynamic var kind: String?
    public let messaging = RealmSwift.List<ConformanceMessaging>()
    @objc public dynamic var name: String?
    public let profile = RealmSwift.List<Reference>()
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    public let rest = RealmSwift.List<ConformanceRest>()
    @objc public dynamic var software: ConformanceSoftware?
    public func upsert(software: ConformanceSoftware?) {
        upsert(prop: &self.software, val: software)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var url: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(acceptUnknown: String, date: DateTime, fhirVersion: String, format: [String], kind: String) {
        self.init()
        self.acceptUnknown = acceptUnknown
        self.date = date
        self.fhirVersion = fhirVersion
        self.format.append(objectsIn: format.map{ RealmString(value: [$0]) })
        self.kind = kind
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case acceptUnknown = "acceptUnknown"
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case document = "document"
        case experimental = "experimental"
        case fhirVersion = "fhirVersion"
        case format = "format"
        case implementation = "implementation"
        case kind = "kind"
        case messaging = "messaging"
        case name = "name"
        case profile = "profile"
        case publisher = "publisher"
        case requirements = "requirements"
        case rest = "rest"
        case software = "software"
        case status = "status"
        case url = "url"
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

        self.acceptUnknown = try container.decodeIfPresent(String.self, forKey: .acceptUnknown)
        self.contact.append(objectsIn: try container.decodeIfPresent([ConformanceContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.document.append(objectsIn: try container.decodeIfPresent([ConformanceDocument].self, forKey: .document) ?? [])
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.fhirVersion = try container.decodeIfPresent(String.self, forKey: .fhirVersion)
        self.format.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .format) ?? [])
        self.implementation = try container.decodeIfPresent(ConformanceImplementation.self, forKey: .implementation)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.messaging.append(objectsIn: try container.decodeIfPresent([ConformanceMessaging].self, forKey: .messaging) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profile.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .profile) ?? [])
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.rest.append(objectsIn: try container.decodeIfPresent([ConformanceRest].self, forKey: .rest) ?? [])
        self.software = try container.decodeIfPresent(ConformanceSoftware.self, forKey: .software)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.acceptUnknown, forKey: .acceptUnknown)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.document), forKey: .document)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.fhirVersion, forKey: .fhirVersion)
        try container.encode(Array(self.format), forKey: .format)
        try container.encodeIfPresent(self.implementation, forKey: .implementation)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encode(Array(self.messaging), forKey: .messaging)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.profile), forKey: .profile)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encode(Array(self.rest), forKey: .rest)
        try container.encodeIfPresent(self.software, forKey: .software)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Conformance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Conformance. Will return empty instance: \(error))")
		}
		return Conformance.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Conformance else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        acceptUnknown = o.acceptUnknown
        FireKit.populateList(&self.contact, from: o.contact)
        copyright = o.copyright
        date = o.date
        description_fhir = o.description_fhir
        FireKit.populateList(&self.document, from: o.document)
        experimental.value = o.experimental.value
        fhirVersion = o.fhirVersion
        FireKit.populateList(&self.format, from: o.format)
        FireKit.populate(&self.implementation, from: o.implementation)
        kind = o.kind
        FireKit.populateList(&self.messaging, from: o.messaging)
        name = o.name
        FireKit.populateList(&self.profile, from: o.profile)
        publisher = o.publisher
        requirements = o.requirements
        FireKit.populateList(&self.rest, from: o.rest)
        FireKit.populate(&self.software, from: o.software)
        status = o.status
        url = o.url
        version = o.version
    }
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ConformanceContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceContact" }
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
			let clone = try JSONDecoder().decode(ConformanceContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceContact. Will return empty instance: \(error))")
		}
		return ConformanceContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        name = o.name
        FireKit.populateList(&self.telecom, from: o.telecom)
    }
}


/**
 *  Document definition.
 *
 *  A document definition.
 */
open class ConformanceDocument: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceDocument" }
	}

    @objc public dynamic var documentation: String?
    @objc public dynamic var mode: String?
    @objc public dynamic var profile: Reference?
    public func upsert(profile: Reference?) {
        upsert(prop: &self.profile, val: profile)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(mode: String, profile: Reference) {
        self.init()
        self.mode = mode
        self.profile = profile
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case documentation = "documentation"
        case mode = "mode"
        case profile = "profile"
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

        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.profile = try container.decodeIfPresent(Reference.self, forKey: .profile)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.profile, forKey: .profile)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceDocument.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceDocument. Will return empty instance: \(error))")
		}
		return ConformanceDocument.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceDocument else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        documentation = o.documentation
        mode = o.mode
        FireKit.populate(&self.profile, from: o.profile)
    }
}


/**
 *  If this describes a specific instance.
 *
 *  Identifies a specific implementation instance that is described by the conformance statement - i.e. a particular
 *  installation, rather than the capabilities of a software program.
 */
open class ConformanceImplementation: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceImplementation" }
	}

    @objc public dynamic var description_fhir: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(description_fhir: String) {
        self.init()
        self.description_fhir = description_fhir
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
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

        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceImplementation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceImplementation. Will return empty instance: \(error))")
		}
		return ConformanceImplementation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceImplementation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        description_fhir = o.description_fhir
        url = o.url
    }
}


/**
 *  If messaging is supported.
 *
 *  A description of the messaging capabilities of the solution.
 */
open class ConformanceMessaging: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceMessaging" }
	}

    @objc public dynamic var documentation: String?
    public let endpoint = RealmSwift.List<ConformanceMessagingEndpoint>()
    public let event = RealmSwift.List<ConformanceMessagingEvent>()
    public let reliableCache = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(event: [ConformanceMessagingEvent]) {
        self.init()
        self.event.append(objectsIn: event)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case documentation = "documentation"
        case endpoint = "endpoint"
        case event = "event"
        case reliableCache = "reliableCache"
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

        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.endpoint.append(objectsIn: try container.decodeIfPresent([ConformanceMessagingEndpoint].self, forKey: .endpoint) ?? [])
        self.event.append(objectsIn: try container.decodeIfPresent([ConformanceMessagingEvent].self, forKey: .event) ?? [])
        self.reliableCache.value = try container.decodeIfPresent(Int.self, forKey: .reliableCache)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encode(Array(self.endpoint), forKey: .endpoint)
        try container.encode(Array(self.event), forKey: .event)
        try container.encodeIfPresent(self.reliableCache.value, forKey: .reliableCache)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceMessaging.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceMessaging. Will return empty instance: \(error))")
		}
		return ConformanceMessaging.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceMessaging else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        documentation = o.documentation
        FireKit.populateList(&self.endpoint, from: o.endpoint)
        FireKit.populateList(&self.event, from: o.event)
        reliableCache.value = o.reliableCache.value
    }
}


/**
 *  A messaging service end-point.
 *
 *  An endpoint (network accessible address) to which messages and/or replies are to be sent.
 */
open class ConformanceMessagingEndpoint: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceMessagingEndpoint" }
	}

    @objc public dynamic var address: String?
    @objc public dynamic var protocol_fhir: Coding?
    public func upsert(protocol_fhir: Coding?) {
        upsert(prop: &self.protocol_fhir, val: protocol_fhir)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(address: String, protocol_fhir: Coding) {
        self.init()
        self.address = address
        self.protocol_fhir = protocol_fhir
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case protocol_fhir = "protocol"
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

        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.protocol_fhir = try container.decodeIfPresent(Coding.self, forKey: .protocol_fhir)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.protocol_fhir, forKey: .protocol_fhir)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceMessagingEndpoint.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceMessagingEndpoint. Will return empty instance: \(error))")
		}
		return ConformanceMessagingEndpoint.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceMessagingEndpoint else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        address = o.address
        FireKit.populate(&self.protocol_fhir, from: o.protocol_fhir)
    }
}


/**
 *  Declare support for this event.
 *
 *  A description of the solution's support for an event at this end-point.
 */
open class ConformanceMessagingEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceMessagingEvent" }
	}

    @objc public dynamic var category: String?
    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var documentation: String?
    @objc public dynamic var focus: String?
    @objc public dynamic var mode: String?
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var response: Reference?
    public func upsert(response: Reference?) {
        upsert(prop: &self.response, val: response)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding, focus: String, mode: String, request: Reference, response: Reference) {
        self.init()
        self.code = code
        self.focus = focus
        self.mode = mode
        self.request = request
        self.response = response
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case code = "code"
        case documentation = "documentation"
        case focus = "focus"
        case mode = "mode"
        case request = "request"
        case response = "response"
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

        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.focus = try container.decodeIfPresent(String.self, forKey: .focus)
        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.response = try container.decodeIfPresent(Reference.self, forKey: .response)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encodeIfPresent(self.focus, forKey: .focus)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.response, forKey: .response)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceMessagingEvent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceMessagingEvent. Will return empty instance: \(error))")
		}
		return ConformanceMessagingEvent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceMessagingEvent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        category = o.category
        FireKit.populate(&self.code, from: o.code)
        documentation = o.documentation
        focus = o.focus
        mode = o.mode
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.response, from: o.response)
    }
}


/**
 *  If the endpoint is a RESTful one.
 *
 *  A definition of the restful capabilities of the solution, if any.
 */
open class ConformanceRest: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRest" }
	}

    public let compartment = RealmSwift.List<RealmString>()
    @objc public dynamic var documentation: String?
    public let interaction = RealmSwift.List<ConformanceRestInteraction>()
    @objc public dynamic var mode: String?
    public let operation = RealmSwift.List<ConformanceRestOperation>()
    public let resource = RealmSwift.List<ConformanceRestResource>()
    public let searchParam = RealmSwift.List<ConformanceRestResourceSearchParam>()
    @objc public dynamic var security: ConformanceRestSecurity?
    public func upsert(security: ConformanceRestSecurity?) {
        upsert(prop: &self.security, val: security)
    }
    @objc public dynamic var transactionMode: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(mode: String, resource: [ConformanceRestResource]) {
        self.init()
        self.mode = mode
        self.resource.append(objectsIn: resource)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case compartment = "compartment"
        case documentation = "documentation"
        case interaction = "interaction"
        case mode = "mode"
        case operation = "operation"
        case resource = "resource"
        case searchParam = "searchParam"
        case security = "security"
        case transactionMode = "transactionMode"
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

        self.compartment.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .compartment) ?? [])
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.interaction.append(objectsIn: try container.decodeIfPresent([ConformanceRestInteraction].self, forKey: .interaction) ?? [])
        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.operation.append(objectsIn: try container.decodeIfPresent([ConformanceRestOperation].self, forKey: .operation) ?? [])
        self.resource.append(objectsIn: try container.decodeIfPresent([ConformanceRestResource].self, forKey: .resource) ?? [])
        self.searchParam.append(objectsIn: try container.decodeIfPresent([ConformanceRestResourceSearchParam].self, forKey: .searchParam) ?? [])
        self.security = try container.decodeIfPresent(ConformanceRestSecurity.self, forKey: .security)
        self.transactionMode = try container.decodeIfPresent(String.self, forKey: .transactionMode)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.compartment), forKey: .compartment)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encode(Array(self.interaction), forKey: .interaction)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encode(Array(self.operation), forKey: .operation)
        try container.encode(Array(self.resource), forKey: .resource)
        try container.encode(Array(self.searchParam), forKey: .searchParam)
        try container.encodeIfPresent(self.security, forKey: .security)
        try container.encodeIfPresent(self.transactionMode, forKey: .transactionMode)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRest. Will return empty instance: \(error))")
		}
		return ConformanceRest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.compartment, from: o.compartment)
        documentation = o.documentation
        FireKit.populateList(&self.interaction, from: o.interaction)
        mode = o.mode
        FireKit.populateList(&self.operation, from: o.operation)
        FireKit.populateList(&self.resource, from: o.resource)
        FireKit.populateList(&self.searchParam, from: o.searchParam)
        FireKit.populate(&self.security, from: o.security)
        transactionMode = o.transactionMode
    }
}


/**
 *  What operations are supported?.
 *
 *  A specification of restful operations supported by the system.
 */
open class ConformanceRestInteraction: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestInteraction" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var documentation: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case documentation = "documentation"
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
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestInteraction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestInteraction. Will return empty instance: \(error))")
		}
		return ConformanceRestInteraction.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestInteraction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code
        documentation = o.documentation
    }
}


/**
 *  Definition of an operation or a custom query.
 *
 *  Definition of an operation or a named query and with its parameters and their meaning and type.
 */
open class ConformanceRestOperation: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestOperation" }
	}

    @objc public dynamic var definition: Reference?
    public func upsert(definition: Reference?) {
        upsert(prop: &self.definition, val: definition)
    }
    @objc public dynamic var name: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(definition: Reference, name: String) {
        self.init()
        self.definition = definition
        self.name = name
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case definition = "definition"
        case name = "name"
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

        self.definition = try container.decodeIfPresent(Reference.self, forKey: .definition)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.definition, forKey: .definition)
        try container.encodeIfPresent(self.name, forKey: .name)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestOperation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestOperation. Will return empty instance: \(error))")
		}
		return ConformanceRestOperation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestOperation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.definition, from: o.definition)
        name = o.name
    }
}


/**
 *  Resource served on the REST interface.
 *
 *  A specification of the restful capabilities of the solution for a specific resource type.
 */
open class ConformanceRestResource: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestResource" }
	}

    public let conditionalCreate = RealmOptional<Bool>()
    @objc public dynamic var conditionalDelete: String?
    public let conditionalUpdate = RealmOptional<Bool>()
    public let interaction = RealmSwift.List<ConformanceRestResourceInteraction>()
    @objc public dynamic var profile: Reference?
    public func upsert(profile: Reference?) {
        upsert(prop: &self.profile, val: profile)
    }
    public let readHistory = RealmOptional<Bool>()
    public let searchInclude = RealmSwift.List<RealmString>()
    public let searchParam = RealmSwift.List<ConformanceRestResourceSearchParam>()
    public let searchRevInclude = RealmSwift.List<RealmString>()
    @objc public dynamic var type: String?
    public let updateCreate = RealmOptional<Bool>()
    @objc public dynamic var versioning: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(interaction: [ConformanceRestResourceInteraction], type: String) {
        self.init()
        self.interaction.append(objectsIn: interaction)
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case conditionalCreate = "conditionalCreate"
        case conditionalDelete = "conditionalDelete"
        case conditionalUpdate = "conditionalUpdate"
        case interaction = "interaction"
        case profile = "profile"
        case readHistory = "readHistory"
        case searchInclude = "searchInclude"
        case searchParam = "searchParam"
        case searchRevInclude = "searchRevInclude"
        case type = "type"
        case updateCreate = "updateCreate"
        case versioning = "versioning"
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

        self.conditionalCreate.value = try container.decodeIfPresent(Bool.self, forKey: .conditionalCreate)
        self.conditionalDelete = try container.decodeIfPresent(String.self, forKey: .conditionalDelete)
        self.conditionalUpdate.value = try container.decodeIfPresent(Bool.self, forKey: .conditionalUpdate)
        self.interaction.append(objectsIn: try container.decodeIfPresent([ConformanceRestResourceInteraction].self, forKey: .interaction) ?? [])
        self.profile = try container.decodeIfPresent(Reference.self, forKey: .profile)
        self.readHistory.value = try container.decodeIfPresent(Bool.self, forKey: .readHistory)
        self.searchInclude.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .searchInclude) ?? [])
        self.searchParam.append(objectsIn: try container.decodeIfPresent([ConformanceRestResourceSearchParam].self, forKey: .searchParam) ?? [])
        self.searchRevInclude.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .searchRevInclude) ?? [])
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.updateCreate.value = try container.decodeIfPresent(Bool.self, forKey: .updateCreate)
        self.versioning = try container.decodeIfPresent(String.self, forKey: .versioning)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.conditionalCreate.value, forKey: .conditionalCreate)
        try container.encodeIfPresent(self.conditionalDelete, forKey: .conditionalDelete)
        try container.encodeIfPresent(self.conditionalUpdate.value, forKey: .conditionalUpdate)
        try container.encode(Array(self.interaction), forKey: .interaction)
        try container.encodeIfPresent(self.profile, forKey: .profile)
        try container.encodeIfPresent(self.readHistory.value, forKey: .readHistory)
        try container.encode(Array(self.searchInclude), forKey: .searchInclude)
        try container.encode(Array(self.searchParam), forKey: .searchParam)
        try container.encode(Array(self.searchRevInclude), forKey: .searchRevInclude)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.updateCreate.value, forKey: .updateCreate)
        try container.encodeIfPresent(self.versioning, forKey: .versioning)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestResource.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestResource. Will return empty instance: \(error))")
		}
		return ConformanceRestResource.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestResource else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        conditionalCreate.value = o.conditionalCreate.value
        conditionalDelete = o.conditionalDelete
        conditionalUpdate.value = o.conditionalUpdate.value
        FireKit.populateList(&self.interaction, from: o.interaction)
        FireKit.populate(&self.profile, from: o.profile)
        readHistory.value = o.readHistory.value
        FireKit.populateList(&self.searchInclude, from: o.searchInclude)
        FireKit.populateList(&self.searchParam, from: o.searchParam)
        FireKit.populateList(&self.searchRevInclude, from: o.searchRevInclude)
        type = o.type
        updateCreate.value = o.updateCreate.value
        versioning = o.versioning
    }
}


/**
 *  What operations are supported?.
 *
 *  Identifies a restful operation supported by the solution.
 */
open class ConformanceRestResourceInteraction: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestResourceInteraction" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var documentation: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case documentation = "documentation"
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
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestResourceInteraction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestResourceInteraction. Will return empty instance: \(error))")
		}
		return ConformanceRestResourceInteraction.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestResourceInteraction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code
        documentation = o.documentation
    }
}


/**
 *  Search params supported by implementation.
 *
 *  Search parameters for implementations to support and/or make use of - either references to ones defined in the
 *  specification, or additional ones defined for/by the implementation.
 */
open class ConformanceRestResourceSearchParam: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestResourceSearchParam" }
	}

    public let chain = RealmSwift.List<RealmString>()
    @objc public dynamic var definition: String?
    @objc public dynamic var documentation: String?
    public let modifier = RealmSwift.List<RealmString>()
    @objc public dynamic var name: String?
    public let target = RealmSwift.List<RealmString>()
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String, type: String) {
        self.init()
        self.name = name
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case chain = "chain"
        case definition = "definition"
        case documentation = "documentation"
        case modifier = "modifier"
        case name = "name"
        case target = "target"
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

        self.chain.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .chain) ?? [])
        self.definition = try container.decodeIfPresent(String.self, forKey: .definition)
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.modifier.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .modifier) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.target.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .target) ?? [])
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.chain), forKey: .chain)
        try container.encodeIfPresent(self.definition, forKey: .definition)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encode(Array(self.modifier), forKey: .modifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.target), forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestResourceSearchParam.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestResourceSearchParam. Will return empty instance: \(error))")
		}
		return ConformanceRestResourceSearchParam.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestResourceSearchParam else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.chain, from: o.chain)
        definition = o.definition
        documentation = o.documentation
        FireKit.populateList(&self.modifier, from: o.modifier)
        name = o.name
        FireKit.populateList(&self.target, from: o.target)
        type = o.type
    }
}


/**
 *  Information about security of implementation.
 *
 *  Information about security implementation from an interface perspective - what a client needs to know.
 */
open class ConformanceRestSecurity: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestSecurity" }
	}

    public let certificate = RealmSwift.List<ConformanceRestSecurityCertificate>()
    public let cors = RealmOptional<Bool>()
    @objc public dynamic var description_fhir: String?
    public let service = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case certificate = "certificate"
        case cors = "cors"
        case description_fhir = "description"
        case service = "service"
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

        self.certificate.append(objectsIn: try container.decodeIfPresent([ConformanceRestSecurityCertificate].self, forKey: .certificate) ?? [])
        self.cors.value = try container.decodeIfPresent(Bool.self, forKey: .cors)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.service.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .service) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.certificate), forKey: .certificate)
        try container.encodeIfPresent(self.cors.value, forKey: .cors)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.service), forKey: .service)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestSecurity.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestSecurity. Will return empty instance: \(error))")
		}
		return ConformanceRestSecurity.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestSecurity else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.certificate, from: o.certificate)
        cors.value = o.cors.value
        description_fhir = o.description_fhir
        FireKit.populateList(&self.service, from: o.service)
    }
}


/**
 *  Certificates associated with security profiles.
 */
open class ConformanceRestSecurityCertificate: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestSecurityCertificate" }
	}

    @objc public dynamic var blob: Base64Binary?
    @objc public dynamic var type: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case blob = "blob"
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

        self.blob = try container.decodeIfPresent(Base64Binary.self, forKey: .blob)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.blob, forKey: .blob)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceRestSecurityCertificate.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceRestSecurityCertificate. Will return empty instance: \(error))")
		}
		return ConformanceRestSecurityCertificate.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceRestSecurityCertificate else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        blob = o.blob
        type = o.type
    }
}


/**
 *  Software that is covered by this conformance statement.
 *
 *  Software that is covered by this conformance statement.  It is used when the conformance statement describes the
 *  capabilities of a particular software version, independent of an installation.
 */
open class ConformanceSoftware: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceSoftware" }
	}

    @objc public dynamic var name: String?
    @objc public dynamic var releaseDate: DateTime?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String) {
        self.init()
        self.name = name
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case releaseDate = "releaseDate"
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

        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.releaseDate = try container.decodeIfPresent(DateTime.self, forKey: .releaseDate)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.releaseDate, forKey: .releaseDate)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConformanceSoftware.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConformanceSoftware. Will return empty instance: \(error))")
		}
		return ConformanceSoftware.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConformanceSoftware else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        name = o.name
        releaseDate = o.releaseDate
        version = o.version
    }
}

