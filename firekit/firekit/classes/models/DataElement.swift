//
//  DataElement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DataElement) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Resource data element.
 *
 *  The formal description of a single piece of information that can be gathered and reported.
 */
open class DataElement: DomainResource {
	override open class var resourceType: String {
		get { return "DataElement" }
	}

    public let contact = RealmSwift.List<DataElementContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    public let element = RealmSwift.List<ElementDefinition>()
    public let experimental = RealmOptional<Bool>()
    public let identifier = RealmSwift.List<Identifier>()
    public let mapping = RealmSwift.List<DataElementMapping>()
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var status: String?
    @objc public dynamic var stringency: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(element: [ElementDefinition], status: String) {
        self.init()
        self.element.append(objectsIn: element)
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case element = "element"
        case experimental = "experimental"
        case identifier = "identifier"
        case mapping = "mapping"
        case name = "name"
        case publisher = "publisher"
        case status = "status"
        case stringency = "stringency"
        case url = "url"
        case useContext = "useContext"
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

        self.contact.append(objectsIn: try container.decodeIfPresent([DataElementContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.element.append(objectsIn: try container.decodeIfPresent([ElementDefinition].self, forKey: .element) ?? [])
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.mapping.append(objectsIn: try container.decodeIfPresent([DataElementMapping].self, forKey: .mapping) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.stringency = try container.decodeIfPresent(String.self, forKey: .stringency)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encode(Array(self.element), forKey: .element)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.mapping), forKey: .mapping)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.stringency, forKey: .stringency)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(Array(self.useContext), forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DataElement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DataElement. Will return empty instance: \(error))")
		}
		return DataElement.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DataElement else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.contact.enumerated() {
            guard index < self.contact.count else {
                self.contact.append(t)
                continue
            }
            self.contact[index].populate(from: t)
        }
    
        while self.contact.count > o.contact.count {
            let objectToRemove = self.contact.last!
            self.contact.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        copyright = o.copyright
        FireKit.populate(&self.date, from: o.date)

        for (index, t) in o.element.enumerated() {
            guard index < self.element.count else {
                self.element.append(t)
                continue
            }
            self.element[index].populate(from: t)
        }
    
        while self.element.count > o.element.count {
            let objectToRemove = self.element.last!
            self.element.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        experimental.value = o.experimental.value

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.mapping.enumerated() {
            guard index < self.mapping.count else {
                self.mapping.append(t)
                continue
            }
            self.mapping[index].populate(from: t)
        }
    
        while self.mapping.count > o.mapping.count {
            let objectToRemove = self.mapping.last!
            self.mapping.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        name = o.name
        publisher = o.publisher
        status = o.status
        stringency = o.stringency
        url = o.url

        for (index, t) in o.useContext.enumerated() {
            guard index < self.useContext.count else {
                self.useContext.append(t)
                continue
            }
            self.useContext[index].populate(from: t)
        }
    
        while self.useContext.count > o.useContext.count {
            let objectToRemove = self.useContext.last!
            self.useContext.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        version = o.version
    }
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class DataElementContact: BackboneElement {
	override open class var resourceType: String {
		get { return "DataElementContact" }
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
			let clone = try JSONDecoder().decode(DataElementContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DataElementContact. Will return empty instance: \(error))")
		}
		return DataElementContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DataElementContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        name = o.name

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        while self.telecom.count > o.telecom.count {
            let objectToRemove = self.telecom.last!
            self.telecom.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}


/**
 *  External specification mapped to.
 *
 *  Identifies a specification (other than a terminology) that the elements which make up the DataElement have some
 *  correspondence with.
 */
open class DataElementMapping: BackboneElement {
	override open class var resourceType: String {
		get { return "DataElementMapping" }
	}

    @objc public dynamic var comments: String?
    @objc public dynamic var identity: String?
    @objc public dynamic var name: String?
    @objc public dynamic var uri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identity: String) {
        self.init()
        self.identity = identity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case comments = "comments"
        case identity = "identity"
        case name = "name"
        case uri = "uri"
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

        self.comments = try container.decodeIfPresent(String.self, forKey: .comments)
        self.identity = try container.decodeIfPresent(String.self, forKey: .identity)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.uri = try container.decodeIfPresent(String.self, forKey: .uri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.comments, forKey: .comments)
        try container.encodeIfPresent(self.identity, forKey: .identity)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.uri, forKey: .uri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DataElementMapping.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DataElementMapping. Will return empty instance: \(error))")
		}
		return DataElementMapping.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DataElementMapping else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        comments = o.comments
        identity = o.identity
        name = o.name
        uri = o.uri
    }
}

