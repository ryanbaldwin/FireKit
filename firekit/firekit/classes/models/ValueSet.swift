//
//  ValueSet.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ValueSet) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A set of codes drawn from one or more code systems.
 *
 *  A value set specifies a set of codes drawn from one or more code systems.
 */
open class ValueSet: DomainResource {
	override open class var resourceType: String {
		get { return "ValueSet" }
	}

    @objc public dynamic var codeSystem: ValueSetCodeSystem?
    public func upsert(codeSystem: ValueSetCodeSystem?) {
        upsert(prop: &self.codeSystem, val: codeSystem)
    }
    @objc public dynamic var compose: ValueSetCompose?
    public func upsert(compose: ValueSetCompose?) {
        upsert(prop: &self.compose, val: compose)
    }
    public let contact = RealmSwift.List<ValueSetContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var expansion: ValueSetExpansion?
    public func upsert(expansion: ValueSetExpansion?) {
        upsert(prop: &self.expansion, val: expansion)
    }
    public let experimental = RealmOptional<Bool>()
    public let extensible = RealmOptional<Bool>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    public let immutable = RealmOptional<Bool>()
    @objc public dynamic var lockedDate: FHIRDate?
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var status: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case codeSystem = "codeSystem"
        case compose = "compose"
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case expansion = "expansion"
        case experimental = "experimental"
        case extensible = "extensible"
        case identifier = "identifier"
        case immutable = "immutable"
        case lockedDate = "lockedDate"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case status = "status"
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

        self.codeSystem = try container.decodeIfPresent(ValueSetCodeSystem.self, forKey: .codeSystem)
        self.compose = try container.decodeIfPresent(ValueSetCompose.self, forKey: .compose)
        self.contact.append(objectsIn: try container.decodeIfPresent([ValueSetContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.expansion = try container.decodeIfPresent(ValueSetExpansion.self, forKey: .expansion)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.extensible.value = try container.decodeIfPresent(Bool.self, forKey: .extensible)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.immutable.value = try container.decodeIfPresent(Bool.self, forKey: .immutable)
        self.lockedDate = try container.decodeIfPresent(FHIRDate.self, forKey: .lockedDate)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encodeIfPresent(self.compose, forKey: .compose)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.expansion, forKey: .expansion)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.extensible.value, forKey: .extensible)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.immutable.value, forKey: .immutable)
        try container.encodeIfPresent(self.lockedDate, forKey: .lockedDate)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(Array(self.useContext), forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSet.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSet. Will return empty instance: \(error))")
		}
		return ValueSet.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSet else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.codeSystem, from: o.codeSystem)
        FireKit.populate(&self.compose, from: o.compose)

        for (index, t) in o.contact.enumerated() {
            guard index < self.contact.count else {
                self.contact.append(t)
                continue
            }
            self.contact[index].populate(from: t)
        }
    
        if self.contact.count > o.contact.count {
            for i in self.contact.count...o.contact.count {
                self.contact.remove(objectAtIndex: i)
            }
        }
        copyright = o.copyright
        FireKit.populate(&self.date, from: o.date)
        description_fhir = o.description_fhir
        FireKit.populate(&self.expansion, from: o.expansion)
        experimental.value = o.experimental.value
        extensible.value = o.extensible.value
        FireKit.populate(&self.identifier, from: o.identifier)
        immutable.value = o.immutable.value
        FireKit.populate(&self.lockedDate, from: o.lockedDate)
        name = o.name
        publisher = o.publisher
        requirements = o.requirements
        status = o.status
        url = o.url

        for (index, t) in o.useContext.enumerated() {
            guard index < self.useContext.count else {
                self.useContext.append(t)
                continue
            }
            self.useContext[index].populate(from: t)
        }
    
        if self.useContext.count > o.useContext.count {
            for i in self.useContext.count...o.useContext.count {
                self.useContext.remove(objectAtIndex: i)
            }
        }
        version = o.version
    }
}


/**
 *  An inline code system, which is part of this value set.
 *
 *  A definition of a code system, inlined into the value set (as a packaging convenience). Note that the inline code
 *  system may be used from other value sets by referring to its (codeSystem.system) directly.
 */
open class ValueSetCodeSystem: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCodeSystem" }
	}

    public let caseSensitive = RealmOptional<Bool>()
    public let concept = RealmSwift.List<ValueSetCodeSystemConcept>()
    @objc public dynamic var system: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(concept: [ValueSetCodeSystemConcept], system: String) {
        self.init()
        self.concept.append(objectsIn: concept)
        self.system = system
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case caseSensitive = "caseSensitive"
        case concept = "concept"
        case system = "system"
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

        self.caseSensitive.value = try container.decodeIfPresent(Bool.self, forKey: .caseSensitive)
        self.concept.append(objectsIn: try container.decodeIfPresent([ValueSetCodeSystemConcept].self, forKey: .concept) ?? [])
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.caseSensitive.value, forKey: .caseSensitive)
        try container.encode(Array(self.concept), forKey: .concept)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetCodeSystem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetCodeSystem. Will return empty instance: \(error))")
		}
		return ValueSetCodeSystem.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetCodeSystem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        caseSensitive.value = o.caseSensitive.value

        for (index, t) in o.concept.enumerated() {
            guard index < self.concept.count else {
                self.concept.append(t)
                continue
            }
            self.concept[index].populate(from: t)
        }
    
        if self.concept.count > o.concept.count {
            for i in self.concept.count...o.concept.count {
                self.concept.remove(objectAtIndex: i)
            }
        }
        system = o.system
        version = o.version
    }
}


/**
 *  Concepts in the code system.
 *
 *  Concepts that are in the code system. The concept definitions are inherently hierarchical, but the definitions must
 *  be consulted to determine what the meaning of the hierarchical relationships are.
 */
open class ValueSetCodeSystemConcept: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCodeSystemConcept" }
	}

    public let abstract = RealmOptional<Bool>()
    @objc public dynamic var code: String?
    public let concept = RealmSwift.List<ValueSetCodeSystemConcept>()
    @objc public dynamic var definition: String?
    public let designation = RealmSwift.List<ValueSetCodeSystemConceptDesignation>()
    @objc public dynamic var display: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case abstract = "abstract"
        case code = "code"
        case concept = "concept"
        case definition = "definition"
        case designation = "designation"
        case display = "display"
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

        self.abstract.value = try container.decodeIfPresent(Bool.self, forKey: .abstract)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.concept.append(objectsIn: try container.decodeIfPresent([ValueSetCodeSystemConcept].self, forKey: .concept) ?? [])
        self.definition = try container.decodeIfPresent(String.self, forKey: .definition)
        self.designation.append(objectsIn: try container.decodeIfPresent([ValueSetCodeSystemConceptDesignation].self, forKey: .designation) ?? [])
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abstract.value, forKey: .abstract)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.concept), forKey: .concept)
        try container.encodeIfPresent(self.definition, forKey: .definition)
        try container.encode(Array(self.designation), forKey: .designation)
        try container.encodeIfPresent(self.display, forKey: .display)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetCodeSystemConcept.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetCodeSystemConcept. Will return empty instance: \(error))")
		}
		return ValueSetCodeSystemConcept.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetCodeSystemConcept else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        abstract.value = o.abstract.value
        code = o.code

        for (index, t) in o.concept.enumerated() {
            guard index < self.concept.count else {
                self.concept.append(t)
                continue
            }
            self.concept[index].populate(from: t)
        }
    
        if self.concept.count > o.concept.count {
            for i in self.concept.count...o.concept.count {
                self.concept.remove(objectAtIndex: i)
            }
        }
        definition = o.definition

        for (index, t) in o.designation.enumerated() {
            guard index < self.designation.count else {
                self.designation.append(t)
                continue
            }
            self.designation[index].populate(from: t)
        }
    
        if self.designation.count > o.designation.count {
            for i in self.designation.count...o.designation.count {
                self.designation.remove(objectAtIndex: i)
            }
        }
        display = o.display
    }
}


/**
 *  Additional representations for the concept.
 *
 *  Additional representations for the concept - other languages, aliases, specialized purposes, used for particular
 *  purposes, etc.
 */
open class ValueSetCodeSystemConceptDesignation: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCodeSystemConceptDesignation" }
	}

    @objc public dynamic var language: String?
    @objc public dynamic var use: Coding?
    public func upsert(use: Coding?) {
        upsert(prop: &self.use, val: use)
    }
    @objc public dynamic var value: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(val: String) {
        self.init()
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case language = "language"
        case use = "use"
        case value = "value"
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

        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.use = try container.decodeIfPresent(Coding.self, forKey: .use)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.use, forKey: .use)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetCodeSystemConceptDesignation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetCodeSystemConceptDesignation. Will return empty instance: \(error))")
		}
		return ValueSetCodeSystemConceptDesignation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetCodeSystemConceptDesignation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        language = o.language
        FireKit.populate(&self.use, from: o.use)
        value = o.value
    }
}


/**
 *  When value set includes codes from elsewhere.
 *
 *  A set of criteria that provide the content logical definition of the value set by including or excluding codes from
 *  outside this value set.
 */
open class ValueSetCompose: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCompose" }
	}

    public let exclude = RealmSwift.List<ValueSetComposeInclude>()
    public let import_fhir = RealmSwift.List<RealmString>()
    public let include = RealmSwift.List<ValueSetComposeInclude>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case exclude = "exclude"
        case import_fhir = "import"
        case include = "include"
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

        self.exclude.append(objectsIn: try container.decodeIfPresent([ValueSetComposeInclude].self, forKey: .exclude) ?? [])
        self.import_fhir.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .import_fhir) ?? [])
        self.include.append(objectsIn: try container.decodeIfPresent([ValueSetComposeInclude].self, forKey: .include) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.exclude), forKey: .exclude)
        try container.encode(Array(self.import_fhir), forKey: .import_fhir)
        try container.encode(Array(self.include), forKey: .include)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetCompose.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetCompose. Will return empty instance: \(error))")
		}
		return ValueSetCompose.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetCompose else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.exclude.enumerated() {
            guard index < self.exclude.count else {
                self.exclude.append(t)
                continue
            }
            self.exclude[index].populate(from: t)
        }
    
        if self.exclude.count > o.exclude.count {
            for i in self.exclude.count...o.exclude.count {
                self.exclude.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.import_fhir.enumerated() {
            guard index < self.import_fhir.count else {
                self.import_fhir.append(t)
                continue
            }
            self.import_fhir[index].populate(from: t)
        }
    
        if self.import_fhir.count > o.import_fhir.count {
            for i in self.import_fhir.count...o.import_fhir.count {
                self.import_fhir.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.include.enumerated() {
            guard index < self.include.count else {
                self.include.append(t)
                continue
            }
            self.include[index].populate(from: t)
        }
    
        if self.include.count > o.include.count {
            for i in self.include.count...o.include.count {
                self.include.remove(objectAtIndex: i)
            }
        }
    }
}


/**
 *  Include one or more codes from a code system.
 */
open class ValueSetComposeInclude: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetComposeInclude" }
	}

    public let concept = RealmSwift.List<ValueSetComposeIncludeConcept>()
    public let filter = RealmSwift.List<ValueSetComposeIncludeFilter>()
    @objc public dynamic var system: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(system: String) {
        self.init()
        self.system = system
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case concept = "concept"
        case filter = "filter"
        case system = "system"
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

        self.concept.append(objectsIn: try container.decodeIfPresent([ValueSetComposeIncludeConcept].self, forKey: .concept) ?? [])
        self.filter.append(objectsIn: try container.decodeIfPresent([ValueSetComposeIncludeFilter].self, forKey: .filter) ?? [])
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.concept), forKey: .concept)
        try container.encode(Array(self.filter), forKey: .filter)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetComposeInclude.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetComposeInclude. Will return empty instance: \(error))")
		}
		return ValueSetComposeInclude.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetComposeInclude else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.concept.enumerated() {
            guard index < self.concept.count else {
                self.concept.append(t)
                continue
            }
            self.concept[index].populate(from: t)
        }
    
        if self.concept.count > o.concept.count {
            for i in self.concept.count...o.concept.count {
                self.concept.remove(objectAtIndex: i)
            }
        }

        for (index, t) in o.filter.enumerated() {
            guard index < self.filter.count else {
                self.filter.append(t)
                continue
            }
            self.filter[index].populate(from: t)
        }
    
        if self.filter.count > o.filter.count {
            for i in self.filter.count...o.filter.count {
                self.filter.remove(objectAtIndex: i)
            }
        }
        system = o.system
        version = o.version
    }
}


/**
 *  A concept defined in the system.
 *
 *  Specifies a concept to be included or excluded.
 */
open class ValueSetComposeIncludeConcept: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetComposeIncludeConcept" }
	}

    @objc public dynamic var code: String?
    public let designation = RealmSwift.List<ValueSetCodeSystemConceptDesignation>()
    @objc public dynamic var display: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case designation = "designation"
        case display = "display"
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
        self.designation.append(objectsIn: try container.decodeIfPresent([ValueSetCodeSystemConceptDesignation].self, forKey: .designation) ?? [])
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.designation), forKey: .designation)
        try container.encodeIfPresent(self.display, forKey: .display)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetComposeIncludeConcept.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetComposeIncludeConcept. Will return empty instance: \(error))")
		}
		return ValueSetComposeIncludeConcept.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetComposeIncludeConcept else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code

        for (index, t) in o.designation.enumerated() {
            guard index < self.designation.count else {
                self.designation.append(t)
                continue
            }
            self.designation[index].populate(from: t)
        }
    
        if self.designation.count > o.designation.count {
            for i in self.designation.count...o.designation.count {
                self.designation.remove(objectAtIndex: i)
            }
        }
        display = o.display
    }
}


/**
 *  Select codes/concepts by their properties (including relationships).
 *
 *  Select concepts by specify a matching criteria based on the properties (including relationships) defined by the
 *  system. If multiple filters are specified, they SHALL all be true.
 */
open class ValueSetComposeIncludeFilter: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetComposeIncludeFilter" }
	}

    @objc public dynamic var op: String?
    @objc public dynamic var property: String?
    @objc public dynamic var value: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(op: String, property: String, val: String) {
        self.init()
        self.op = op
        self.property = property
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case op = "op"
        case property = "property"
        case value = "value"
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

        self.op = try container.decodeIfPresent(String.self, forKey: .op)
        self.property = try container.decodeIfPresent(String.self, forKey: .property)
        self.value = try container.decodeIfPresent(String.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.op, forKey: .op)
        try container.encodeIfPresent(self.property, forKey: .property)
        try container.encodeIfPresent(self.value, forKey: .value)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetComposeIncludeFilter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetComposeIncludeFilter. Will return empty instance: \(error))")
		}
		return ValueSetComposeIncludeFilter.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetComposeIncludeFilter else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        op = o.op
        property = o.property
        value = o.value
    }
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ValueSetContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetContact" }
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
			let clone = try JSONDecoder().decode(ValueSetContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetContact. Will return empty instance: \(error))")
		}
		return ValueSetContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetContact else {
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
    
        if self.telecom.count > o.telecom.count {
            for i in self.telecom.count...o.telecom.count {
                self.telecom.remove(objectAtIndex: i)
            }
        }
    }
}


/**
 *  Used when the value set is "expanded".
 *
 *  A value set can also be "expanded", where the value set is turned into a simple collection of enumerated codes. This
 *  element holds the expansion, if it has been performed.
 */
open class ValueSetExpansion: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetExpansion" }
	}

    public let contains = RealmSwift.List<ValueSetExpansionContains>()
    @objc public dynamic var identifier: String?
    public let offset = RealmOptional<Int>()
    public let parameter = RealmSwift.List<ValueSetExpansionParameter>()
    @objc public dynamic var timestamp: DateTime?
    public let total = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: String, timestamp: DateTime) {
        self.init()
        self.identifier = identifier
        self.timestamp = timestamp
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contains = "contains"
        case identifier = "identifier"
        case offset = "offset"
        case parameter = "parameter"
        case timestamp = "timestamp"
        case total = "total"
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

        self.contains.append(objectsIn: try container.decodeIfPresent([ValueSetExpansionContains].self, forKey: .contains) ?? [])
        self.identifier = try container.decodeIfPresent(String.self, forKey: .identifier)
        self.offset.value = try container.decodeIfPresent(Int.self, forKey: .offset)
        self.parameter.append(objectsIn: try container.decodeIfPresent([ValueSetExpansionParameter].self, forKey: .parameter) ?? [])
        self.timestamp = try container.decodeIfPresent(DateTime.self, forKey: .timestamp)
        self.total.value = try container.decodeIfPresent(Int.self, forKey: .total)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contains), forKey: .contains)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.offset.value, forKey: .offset)
        try container.encode(Array(self.parameter), forKey: .parameter)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.total.value, forKey: .total)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetExpansion.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetExpansion. Will return empty instance: \(error))")
		}
		return ValueSetExpansion.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetExpansion else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.contains.enumerated() {
            guard index < self.contains.count else {
                self.contains.append(t)
                continue
            }
            self.contains[index].populate(from: t)
        }
    
        if self.contains.count > o.contains.count {
            for i in self.contains.count...o.contains.count {
                self.contains.remove(objectAtIndex: i)
            }
        }
        identifier = o.identifier
        offset.value = o.offset.value

        for (index, t) in o.parameter.enumerated() {
            guard index < self.parameter.count else {
                self.parameter.append(t)
                continue
            }
            self.parameter[index].populate(from: t)
        }
    
        if self.parameter.count > o.parameter.count {
            for i in self.parameter.count...o.parameter.count {
                self.parameter.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.timestamp, from: o.timestamp)
        total.value = o.total.value
    }
}


/**
 *  Codes in the value set.
 *
 *  The codes that are contained in the value set expansion.
 */
open class ValueSetExpansionContains: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetExpansionContains" }
	}

    public let abstract = RealmOptional<Bool>()
    @objc public dynamic var code: String?
    public let contains = RealmSwift.List<ValueSetExpansionContains>()
    @objc public dynamic var display: String?
    @objc public dynamic var system: String?
    @objc public dynamic var version: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case abstract = "abstract"
        case code = "code"
        case contains = "contains"
        case display = "display"
        case system = "system"
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

        self.abstract.value = try container.decodeIfPresent(Bool.self, forKey: .abstract)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.contains.append(objectsIn: try container.decodeIfPresent([ValueSetExpansionContains].self, forKey: .contains) ?? [])
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abstract.value, forKey: .abstract)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.contains), forKey: .contains)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetExpansionContains.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetExpansionContains. Will return empty instance: \(error))")
		}
		return ValueSetExpansionContains.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetExpansionContains else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        abstract.value = o.abstract.value
        code = o.code

        for (index, t) in o.contains.enumerated() {
            guard index < self.contains.count else {
                self.contains.append(t)
                continue
            }
            self.contains[index].populate(from: t)
        }
    
        if self.contains.count > o.contains.count {
            for i in self.contains.count...o.contains.count {
                self.contains.remove(objectAtIndex: i)
            }
        }
        display = o.display
        system = o.system
        version = o.version
    }
}


/**
 *  Parameter that controlled the expansion process.
 *
 *  A parameter that controlled the expansion process. These parameters may be used by users of expanded value sets to
 *  check whether the expansion is suitable for a particular purpose, or to pick the correct expansion.
 */
open class ValueSetExpansionParameter: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetExpansionParameter" }
	}

    @objc public dynamic var name: String?
    public let valueBoolean = RealmOptional<Bool>()
    @objc public dynamic var valueCode: String?
    @objc public dynamic var valueDecimal: RealmDecimal?
    public let valueInteger = RealmOptional<Int>()
    @objc public dynamic var valueString: String?
    @objc public dynamic var valueUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String) {
        self.init()
        self.name = name
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case valueBoolean = "valueBoolean"
        case valueCode = "valueCode"
        case valueDecimal = "valueDecimal"
        case valueInteger = "valueInteger"
        case valueString = "valueString"
        case valueUri = "valueUri"
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
        self.valueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .valueBoolean)
        self.valueCode = try container.decodeIfPresent(String.self, forKey: .valueCode)
        self.valueDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .valueDecimal)
        self.valueInteger.value = try container.decodeIfPresent(Int.self, forKey: .valueInteger)
        self.valueString = try container.decodeIfPresent(String.self, forKey: .valueString)
        self.valueUri = try container.decodeIfPresent(String.self, forKey: .valueUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.valueBoolean.value, forKey: .valueBoolean)
        try container.encodeIfPresent(self.valueCode, forKey: .valueCode)
        try container.encodeIfPresent(self.valueDecimal, forKey: .valueDecimal)
        try container.encodeIfPresent(self.valueInteger.value, forKey: .valueInteger)
        try container.encodeIfPresent(self.valueString, forKey: .valueString)
        try container.encodeIfPresent(self.valueUri, forKey: .valueUri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ValueSetExpansionParameter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ValueSetExpansionParameter. Will return empty instance: \(error))")
		}
		return ValueSetExpansionParameter.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ValueSetExpansionParameter else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        name = o.name
        valueBoolean.value = o.valueBoolean.value
        valueCode = o.valueCode
        valueDecimal = o.valueDecimal
        valueInteger.value = o.valueInteger.value
        valueString = o.valueString
        valueUri = o.valueUri
    }
}

