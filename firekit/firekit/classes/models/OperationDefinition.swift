//
//  OperationDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/OperationDefinition) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Definition of an operation or a named query.
 *
 *  A formal computable definition of an operation (on the RESTful interface) or a named query (using the search
 *  interaction).
 */
open class OperationDefinition: DomainResource {
	override open class var resourceType: String {
		get { return "OperationDefinition" }
	}

    @objc public dynamic var base: Reference?
    public func upsert(base: Reference?) {
        upsert(prop: &self.base, val: base)
    }
    @objc public dynamic var code: String?
    public let contact = RealmSwift.List<OperationDefinitionContact>()
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let experimental = RealmOptional<Bool>()
    public let idempotent = RealmOptional<Bool>()
    public let instance = RealmOptional<Bool>()
    @objc public dynamic var kind: String?
    @objc public dynamic var name: String?
    @objc public dynamic var notes: String?
    public let parameter = RealmSwift.List<OperationDefinitionParameter>()
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var status: String?
    public let system = RealmOptional<Bool>()
    public let type = RealmSwift.List<RealmString>()
    @objc public dynamic var url: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, instance: Bool, kind: String, name: String, status: String, system: Bool) {
        self.init()
        self.code = code
        self.instance.value = instance
        self.kind = kind
        self.name = name
        self.status = status
        self.system.value = system
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case base = "base"
        case code = "code"
        case contact = "contact"
        case date = "date"
        case description_fhir = "description"
        case experimental = "experimental"
        case idempotent = "idempotent"
        case instance = "instance"
        case kind = "kind"
        case name = "name"
        case notes = "notes"
        case parameter = "parameter"
        case publisher = "publisher"
        case requirements = "requirements"
        case status = "status"
        case system = "system"
        case type = "type"
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

        self.base = try container.decodeIfPresent(Reference.self, forKey: .base)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.contact.append(objectsIn: try container.decodeIfPresent([OperationDefinitionContact].self, forKey: .contact) ?? [])
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.idempotent.value = try container.decodeIfPresent(Bool.self, forKey: .idempotent)
        self.instance.value = try container.decodeIfPresent(Bool.self, forKey: .instance)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
        self.parameter.append(objectsIn: try container.decodeIfPresent([OperationDefinitionParameter].self, forKey: .parameter) ?? [])
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.system.value = try container.decodeIfPresent(Bool.self, forKey: .system)
        self.type.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .type) ?? [])
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
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
        try container.encodeIfPresent(self.idempotent.value, forKey: .idempotent)
        try container.encodeIfPresent(self.instance.value, forKey: .instance)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encode(Array(self.parameter), forKey: .parameter)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.system.value, forKey: .system)
        try container.encode(Array(self.type), forKey: .type)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinition. Will return empty instance: \(error))")
		}
		return OperationDefinition.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OperationDefinition else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.base, from: o.base)
        code = o.code

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
        FireKit.populate(&self.date, from: o.date)
        description_fhir = o.description_fhir
        experimental.value = o.experimental.value
        idempotent.value = o.idempotent.value
        instance.value = o.instance.value
        kind = o.kind
        name = o.name
        notes = o.notes

        for (index, t) in o.parameter.enumerated() {
            guard index < self.parameter.count else {
                self.parameter.append(t)
                continue
            }
            self.parameter[index].populate(from: t)
        }
    
        while self.parameter.count > o.parameter.count {
            let objectToRemove = self.parameter.last!
            self.parameter.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        publisher = o.publisher
        requirements = o.requirements
        status = o.status
        system.value = o.system.value

        for (index, t) in o.type.enumerated() {
            guard index < self.type.count else {
                self.type.append(t)
                continue
            }
            self.type[index].populate(from: t)
        }
    
        while self.type.count > o.type.count {
            let objectToRemove = self.type.last!
            self.type.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        url = o.url
        version = o.version
    }
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class OperationDefinitionContact: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationDefinitionContact" }
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
			let clone = try JSONDecoder().decode(OperationDefinitionContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinitionContact. Will return empty instance: \(error))")
		}
		return OperationDefinitionContact.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OperationDefinitionContact else {
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
 *  Parameters for the operation/query.
 *
 *  The parameters for the operation/query.
 */
open class OperationDefinitionParameter: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationDefinitionParameter" }
	}

    @objc public dynamic var binding: OperationDefinitionParameterBinding?
    public func upsert(binding: OperationDefinitionParameterBinding?) {
        upsert(prop: &self.binding, val: binding)
    }
    @objc public dynamic var documentation: String?
    @objc public dynamic var max: String?
    public let min = RealmOptional<Int>()
    @objc public dynamic var name: String?
    public let part = RealmSwift.List<OperationDefinitionParameter>()
    @objc public dynamic var profile: Reference?
    public func upsert(profile: Reference?) {
        upsert(prop: &self.profile, val: profile)
    }
    @objc public dynamic var type: String?
    @objc public dynamic var use: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(max: String, min: Int, name: String, use: String) {
        self.init()
        self.max = max
        self.min.value = min
        self.name = name
        self.use = use
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case binding = "binding"
        case documentation = "documentation"
        case max = "max"
        case min = "min"
        case name = "name"
        case part = "part"
        case profile = "profile"
        case type = "type"
        case use = "use"
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

        self.binding = try container.decodeIfPresent(OperationDefinitionParameterBinding.self, forKey: .binding)
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.max = try container.decodeIfPresent(String.self, forKey: .max)
        self.min.value = try container.decodeIfPresent(Int.self, forKey: .min)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.part.append(objectsIn: try container.decodeIfPresent([OperationDefinitionParameter].self, forKey: .part) ?? [])
        self.profile = try container.decodeIfPresent(Reference.self, forKey: .profile)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.binding, forKey: .binding)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encodeIfPresent(self.max, forKey: .max)
        try container.encodeIfPresent(self.min.value, forKey: .min)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.part), forKey: .part)
        try container.encodeIfPresent(self.profile, forKey: .profile)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.use, forKey: .use)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinitionParameter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinitionParameter. Will return empty instance: \(error))")
		}
		return OperationDefinitionParameter.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OperationDefinitionParameter else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.binding, from: o.binding)
        documentation = o.documentation
        max = o.max
        min.value = o.min.value
        name = o.name

        for (index, t) in o.part.enumerated() {
            guard index < self.part.count else {
                self.part.append(t)
                continue
            }
            self.part[index].populate(from: t)
        }
    
        while self.part.count > o.part.count {
            let objectToRemove = self.part.last!
            self.part.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.profile, from: o.profile)
        type = o.type
        use = o.use
    }
}


/**
 *  ValueSet details if this is coded.
 *
 *  Binds to a value set if this parameter is coded (code, Coding, CodeableConcept).
 */
open class OperationDefinitionParameterBinding: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationDefinitionParameterBinding" }
	}

    @objc public dynamic var strength: String?
    @objc public dynamic var valueSetReference: Reference?
    public func upsert(valueSetReference: Reference?) {
        upsert(prop: &self.valueSetReference, val: valueSetReference)
    }
    @objc public dynamic var valueSetUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(strength: String, valueSetReference: Reference, valueSetUri: String) {
        self.init()
        self.strength = strength
        self.valueSetReference = valueSetReference
        self.valueSetUri = valueSetUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case strength = "strength"
        case valueSetReference = "valueSetReference"
        case valueSetUri = "valueSetUri"
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

        self.strength = try container.decodeIfPresent(String.self, forKey: .strength)
        self.valueSetReference = try container.decodeIfPresent(Reference.self, forKey: .valueSetReference)
        self.valueSetUri = try container.decodeIfPresent(String.self, forKey: .valueSetUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.strength, forKey: .strength)
        try container.encodeIfPresent(self.valueSetReference, forKey: .valueSetReference)
        try container.encodeIfPresent(self.valueSetUri, forKey: .valueSetUri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinitionParameterBinding.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinitionParameterBinding. Will return empty instance: \(error))")
		}
		return OperationDefinitionParameterBinding.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OperationDefinitionParameterBinding else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        strength = o.strength
        FireKit.populate(&self.valueSetReference, from: o.valueSetReference)
        valueSetUri = o.valueSetUri
    }
}

