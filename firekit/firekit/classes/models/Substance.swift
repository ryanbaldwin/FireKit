//
//  Substance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Substance) on 2017-09-09.
//  2017, SMART Health IT.
//

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


        if let categoryVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .category) {
          // CodeableConcept: FHIRJSON
        }
        // CodeableConcept: FHIRJSON
        if let codeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .code) {
          self.code = codeVal
        }
        // String: String
        if let description_fhirVal = try container.decodeIfPresent(String.self, forKey: .description_fhir) {
          self.description_fhir = description_fhirVal
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        if let ingredientVals = try container.decodeIfPresent([SubstanceIngredient].self, forKey: .ingredient) {
          // SubstanceIngredient: FHIRJSON
        }
        if let instanceVals = try container.decodeIfPresent([SubstanceInstance].self, forKey: .instance) {
          // SubstanceInstance: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.category.flatMap { $0 }, forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encode(self.ingredient.flatMap { $0 }, forKey: .ingredient)
        try container.encode(self.instance.flatMap { $0 }, forKey: .instance)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.category) }
						self.category.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["ingredient"] {
				presentKeys.insert("ingredient")
				if let val = exist as? [FHIRJSON] {
					if let vals = SubstanceIngredient.instantiate(fromArray: val, owner: self) as? [SubstanceIngredient] {
						if let realm = self.realm { realm.delete(self.ingredient) }
						self.ingredient.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "ingredient", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["instance"] {
				presentKeys.insert("instance")
				if let val = exist as? [FHIRJSON] {
					if let vals = SubstanceInstance.instantiate(fromArray: val, owner: self) as? [SubstanceInstance] {
						if let realm = self.realm { realm.delete(self.instance) }
						self.instance.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "instance", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if category.count > 0 {
			json["category"] = Array(category.map() { $0.asJSON() })
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if ingredient.count > 0 {
			json["ingredient"] = Array(ingredient.map() { $0.asJSON() })
		}
		if instance.count > 0 {
			json["instance"] = Array(instance.map() { $0.asJSON() })
		}
		
		return json
	}
*/
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


        // Ratio: FHIRJSON
        if let quantityVal = try container.decodeIfPresent(Ratio.self, forKey: .quantity) {
          self.quantity = quantityVal
        }
        // Reference: FHIRJSON
        if let substanceVal = try container.decodeIfPresent(Reference.self, forKey: .substance) {
          self.substance = substanceVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.substance, forKey: .substance)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["substance"] {
				presentKeys.insert("substance")
				if let val = exist as? FHIRJSON {
					upsert(substance: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "substance", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "substance"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let substance = self.substance {
			json["substance"] = substance.asJSON()
		}
		
		return json
	}
*/
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


        // DateTime: String
        if let expiryVal = try container.decodeIfPresent(DateTime.self, forKey: .expiry) {
          self.expiry = expiryVal
        }
        // Identifier: FHIRJSON
        if let identifierVal = try container.decodeIfPresent(Identifier.self, forKey: .identifier) {
          self.identifier = identifierVal
        }
        // Quantity: FHIRJSON
        if let quantityVal = try container.decodeIfPresent(Quantity.self, forKey: .quantity) {
          self.quantity = quantityVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.expiry, forKey: .expiry)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["expiry"] {
				presentKeys.insert("expiry")
				if let val = exist as? String {
					self.expiry = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "expiry", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let expiry = self.expiry {
			json["expiry"] = expiry.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		
		return json
	}
*/
}

