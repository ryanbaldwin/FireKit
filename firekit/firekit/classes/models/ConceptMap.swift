//
//  ConceptMap.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ConceptMap) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A map from one set of concepts to one or more other concepts.
 *
 *  A statement of relationships from one set of concepts to one or more other concepts - either code systems or data
 *  elements, or classes in class models.
 */
open class ConceptMap: DomainResource {
	override open class var resourceType: String {
		get { return "ConceptMap" }
	}

    public let contact = RealmSwift.List<ConceptMapContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let element = RealmSwift.List<ConceptMapElement>()
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var sourceReference: Reference?
    public func upsert(sourceReference: Reference?) {
        upsert(prop: &self.sourceReference, val: sourceReference)
    }
    @objc public dynamic var sourceUri: String?
    @objc public dynamic var status: String?
    @objc public dynamic var targetReference: Reference?
    public func upsert(targetReference: Reference?) {
        upsert(prop: &self.targetReference, val: targetReference)
    }
    @objc public dynamic var targetUri: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sourceReference: Reference, sourceUri: String, status: String, targetReference: Reference, targetUri: String) {
        self.init()
        self.sourceReference = sourceReference
        self.sourceUri = sourceUri
        self.status = status
        self.targetReference = targetReference
        self.targetUri = targetUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case element = "element"
        case experimental = "experimental"
        case identifier = "identifier"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case sourceReference = "sourceReference"
        case sourceUri = "sourceUri"
        case status = "status"
        case targetReference = "targetReference"
        case targetUri = "targetUri"
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

        self.contact.append(objectsIn: try container.decodeIfPresent([ConceptMapContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.element.append(objectsIn: try container.decodeIfPresent([ConceptMapElement].self, forKey: .element) ?? [])
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.sourceReference = try container.decodeIfPresent(Reference.self, forKey: .sourceReference)
        self.sourceUri = try container.decodeIfPresent(String.self, forKey: .sourceUri)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.targetReference = try container.decodeIfPresent(Reference.self, forKey: .targetReference)
        self.targetUri = try container.decodeIfPresent(String.self, forKey: .targetUri)
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
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.element), forKey: .element)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.sourceReference, forKey: .sourceReference)
        try container.encodeIfPresent(self.sourceUri, forKey: .sourceUri)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.targetReference, forKey: .targetReference)
        try container.encodeIfPresent(self.targetUri, forKey: .targetUri)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(Array(self.useContext), forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMap.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMap. Will return empty instance: \(error))")
		}
		return ConceptMap.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConceptMap else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: contact array
        copyright = o.copyright
        date = o.date
        description_fhir = o.description_fhir
        // TODO: element array
        experimental.value = o.experimental.value
        FireKit.populate(&self.identifier, from: o.identifier)
        name = o.name
        publisher = o.publisher
        requirements = o.requirements
        FireKit.populate(&self.sourceReference, from: o.sourceReference)
        sourceUri = o.sourceUri
        status = o.status
        FireKit.populate(&self.targetReference, from: o.targetReference)
        targetUri = o.targetUri
        url = o.url
        // TODO: useContext array
        version = o.version
    }
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ConceptMapContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapContact" }
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
			let clone = try JSONDecoder().decode(ConceptMapContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapContact. Will return empty instance: \(error))")
		}
		return ConceptMapContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConceptMapContact else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        name = o.name
        // TODO: telecom array
    }
}


/**
 *  Mappings for a concept from the source set.
 *
 *  Mappings for an individual concept in the source to one or more concepts in the target.
 */
open class ConceptMapElement: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapElement" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var codeSystem: String?
    public let target = RealmSwift.List<ConceptMapElementTarget>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeSystem = "codeSystem"
        case target = "target"
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
        self.codeSystem = try container.decodeIfPresent(String.self, forKey: .codeSystem)
        self.target.append(objectsIn: try container.decodeIfPresent([ConceptMapElementTarget].self, forKey: .target) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encode(Array(self.target), forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapElement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapElement. Will return empty instance: \(error))")
		}
		return ConceptMapElement.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConceptMapElement else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        code = o.code
        codeSystem = o.codeSystem
        // TODO: target array
    }
}


/**
 *  Concept in target system for element.
 *
 *  A concept from the target value set that this concept maps to.
 */
open class ConceptMapElementTarget: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapElementTarget" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var codeSystem: String?
    @objc public dynamic var comments: String?
    public let dependsOn = RealmSwift.List<ConceptMapElementTargetDependsOn>()
    @objc public dynamic var equivalence: String?
    public let product = RealmSwift.List<ConceptMapElementTargetDependsOn>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(equivalence: String) {
        self.init()
        self.equivalence = equivalence
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeSystem = "codeSystem"
        case comments = "comments"
        case dependsOn = "dependsOn"
        case equivalence = "equivalence"
        case product = "product"
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
        self.codeSystem = try container.decodeIfPresent(String.self, forKey: .codeSystem)
        self.comments = try container.decodeIfPresent(String.self, forKey: .comments)
        self.dependsOn.append(objectsIn: try container.decodeIfPresent([ConceptMapElementTargetDependsOn].self, forKey: .dependsOn) ?? [])
        self.equivalence = try container.decodeIfPresent(String.self, forKey: .equivalence)
        self.product.append(objectsIn: try container.decodeIfPresent([ConceptMapElementTargetDependsOn].self, forKey: .product) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encodeIfPresent(self.comments, forKey: .comments)
        try container.encode(Array(self.dependsOn), forKey: .dependsOn)
        try container.encodeIfPresent(self.equivalence, forKey: .equivalence)
        try container.encode(Array(self.product), forKey: .product)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapElementTarget.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapElementTarget. Will return empty instance: \(error))")
		}
		return ConceptMapElementTarget.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConceptMapElementTarget else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        code = o.code
        codeSystem = o.codeSystem
        comments = o.comments
        // TODO: dependsOn array
        equivalence = o.equivalence
        // TODO: product array
    }
}


/**
 *  Other elements required for this mapping (from context).
 *
 *  A set of additional dependencies for this mapping to hold. This mapping is only applicable if the specified element
 *  can be resolved, and it has the specified value.
 */
open class ConceptMapElementTargetDependsOn: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapElementTargetDependsOn" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var codeSystem: String?
    @objc public dynamic var element: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, codeSystem: String, element: String) {
        self.init()
        self.code = code
        self.codeSystem = codeSystem
        self.element = element
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeSystem = "codeSystem"
        case element = "element"
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
        self.codeSystem = try container.decodeIfPresent(String.self, forKey: .codeSystem)
        self.element = try container.decodeIfPresent(String.self, forKey: .element)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encodeIfPresent(self.element, forKey: .element)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapElementTargetDependsOn.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapElementTargetDependsOn. Will return empty instance: \(error))")
		}
		return ConceptMapElementTargetDependsOn.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ConceptMapElementTargetDependsOn else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        code = o.code
        codeSystem = o.codeSystem
        element = o.element
    }
}

