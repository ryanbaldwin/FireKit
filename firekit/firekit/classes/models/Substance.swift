//
//  Substance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Substance) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A homogeneous material with a definite composition.
 */
open class Substance: DomainResource {
	override open class var resourceType: String {
		get { return "Substance" }
	}

    public let category = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let ingredient = RealmSwift.List<SubstanceIngredient>()
    public let instance = RealmSwift.List<SubstanceInstance>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case code = "code"
        case description_fhir = "description"
        case identifier = "identifier"
        case ingredient = "ingredient"
        case instance = "instance"
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

        self.category.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .category) ?? [])
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.ingredient.append(objectsIn: try container.decodeIfPresent([SubstanceIngredient].self, forKey: .ingredient) ?? [])
        self.instance.append(objectsIn: try container.decodeIfPresent([SubstanceInstance].self, forKey: .instance) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.category), forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.ingredient), forKey: .ingredient)
        try container.encode(Array(self.instance), forKey: .instance)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Substance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Substance. Will return empty instance: \(error))")
		}
		return Substance.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Substance else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.category.enumerated() {
            guard index < self.category.count else {
                self.category.append(t)
                continue
            }
            self.category[index].populate(from: t)
        }
    
        if self.category.count > o.category.count {
            for i in self.category.count...o.category.count {
                let objectToRemove = self.category[i]
                self.category.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.code, from: o.code)
        description_fhir = o.description_fhir

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                let objectToRemove = self.identifier[i]
                self.identifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.ingredient.enumerated() {
            guard index < self.ingredient.count else {
                self.ingredient.append(t)
                continue
            }
            self.ingredient[index].populate(from: t)
        }
    
        if self.ingredient.count > o.ingredient.count {
            for i in self.ingredient.count...o.ingredient.count {
                let objectToRemove = self.ingredient[i]
                self.ingredient.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.instance.enumerated() {
            guard index < self.instance.count else {
                self.instance.append(t)
                continue
            }
            self.instance[index].populate(from: t)
        }
    
        if self.instance.count > o.instance.count {
            for i in self.instance.count...o.instance.count {
                let objectToRemove = self.instance[i]
                self.instance.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
    }
}


/**
 *  Composition information about the substance.
 *
 *  A substance can be composed of other substances.
 */
open class SubstanceIngredient: BackboneElement {
	override open class var resourceType: String {
		get { return "SubstanceIngredient" }
	}

    @objc public dynamic var quantity: Ratio?
    public func upsert(quantity: Ratio?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    @objc public dynamic var substance: Reference?
    public func upsert(substance: Reference?) {
        upsert(prop: &self.substance, val: substance)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(substance: Reference) {
        self.init()
        self.substance = substance
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case quantity = "quantity"
        case substance = "substance"
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

        self.quantity = try container.decodeIfPresent(Ratio.self, forKey: .quantity)
        self.substance = try container.decodeIfPresent(Reference.self, forKey: .substance)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.substance, forKey: .substance)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SubstanceIngredient.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SubstanceIngredient. Will return empty instance: \(error))")
		}
		return SubstanceIngredient.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SubstanceIngredient else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.quantity, from: o.quantity)
        FireKit.populate(&self.substance, from: o.substance)
    }
}


/**
 *  If this describes a specific package/container of the substance.
 *
 *  Substance may be used to describe a kind of substance, or a specific package/container of the substance: an
 *  instance.
 */
open class SubstanceInstance: BackboneElement {
	override open class var resourceType: String {
		get { return "SubstanceInstance" }
	}

    @objc public dynamic var expiry: DateTime?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case expiry = "expiry"
        case identifier = "identifier"
        case quantity = "quantity"
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

        self.expiry = try container.decodeIfPresent(DateTime.self, forKey: .expiry)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.expiry, forKey: .expiry)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SubstanceInstance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SubstanceInstance. Will return empty instance: \(error))")
		}
		return SubstanceInstance.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? SubstanceInstance else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.expiry, from: o.expiry)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.quantity, from: o.quantity)
    }
}

