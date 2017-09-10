//
//  Medication.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Medication) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Definition of a Medication.
 *
 *  This resource is primarily used for the identification and definition of a medication. It covers the ingredients and
 *  the packaging for a medication.
 */
open class Medication: DomainResource {
	override open class var resourceType: String {
		get { return "Medication" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let isBrand = RealmOptional<Bool>()
    @objc public dynamic var manufacturer: Reference?
    public func upsert(manufacturer: Reference?) {
        upsert(prop: &self.manufacturer, val: manufacturer)
    }
    @objc public dynamic var package: MedicationPackage?
    public func upsert(package: MedicationPackage?) {
        upsert(prop: &self.package, val: package)
    }
    @objc public dynamic var product: MedicationProduct?
    public func upsert(product: MedicationProduct?) {
        upsert(prop: &self.product, val: product)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case isBrand = "isBrand"
        case manufacturer = "manufacturer"
        case package = "package"
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

        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.isBrand.value = try container.decodeIfPresent(Bool.self, forKey: .isBrand)
        self.manufacturer = try container.decodeIfPresent(Reference.self, forKey: .manufacturer)
        self.package = try container.decodeIfPresent(MedicationPackage.self, forKey: .package)
        self.product = try container.decodeIfPresent(MedicationProduct.self, forKey: .product)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.isBrand.value, forKey: .isBrand)
        try container.encodeIfPresent(self.manufacturer, forKey: .manufacturer)
        try container.encodeIfPresent(self.package, forKey: .package)
        try container.encodeIfPresent(self.product, forKey: .product)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["isBrand"] {
				presentKeys.insert("isBrand")
				if let val = exist as? Bool {
					self.isBrand.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "isBrand", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["manufacturer"] {
				presentKeys.insert("manufacturer")
				if let val = exist as? FHIRJSON {
					upsert(manufacturer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "manufacturer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["package"] {
				presentKeys.insert("package")
				if let val = exist as? FHIRJSON {
					upsert(package: MedicationPackage(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "package", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["product"] {
				presentKeys.insert("product")
				if let val = exist as? FHIRJSON {
					upsert(product: MedicationProduct(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "product", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let isBrand = self.isBrand.value {
			json["isBrand"] = isBrand.asJSON()
		}
		if let manufacturer = self.manufacturer {
			json["manufacturer"] = manufacturer.asJSON()
		}
		if let package = self.package {
			json["package"] = package.asJSON()
		}
		if let product = self.product {
			json["product"] = product.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Medication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Medication. Will return empty instance: \(error))")
		}
		return Medication.init()
	}
}


/**
 *  Details about packaged medications.
 *
 *  Information that only applies to packages (not products).
 */
open class MedicationPackage: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationPackage" }
	}

    @objc public dynamic var container: CodeableConcept?
    public func upsert(container: CodeableConcept?) {
        upsert(prop: &self.container, val: container)
    }
    public let content = RealmSwift.List<MedicationPackageContent>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case container = "container"
        case content = "content"
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

        self.container = try container.decodeIfPresent(CodeableConcept.self, forKey: .container)
        self.content.append(objectsIn: try container.decodeIfPresent([MedicationPackageContent].self, forKey: .content) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.container, forKey: .container)
        try container.encode(self.content.flatMap { $0 }, forKey: .content)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["container"] {
				presentKeys.insert("container")
				if let val = exist as? FHIRJSON {
					upsert(container: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "container", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["content"] {
				presentKeys.insert("content")
				if let val = exist as? [FHIRJSON] {
					if let vals = MedicationPackageContent.instantiate(fromArray: val, owner: self) as? [MedicationPackageContent] {
						if let realm = self.realm { realm.delete(self.content) }
						self.content.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "content", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let container = self.container {
			json["container"] = container.asJSON()
		}
		if content.count > 0 {
			json["content"] = Array(content.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationPackage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationPackage. Will return empty instance: \(error))")
		}
		return MedicationPackage.init()
	}
}


/**
 *  What is  in the package.
 *
 *  A set of components that go to make up the described item.
 */
open class MedicationPackageContent: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationPackageContent" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var item: Reference?
    public func upsert(item: Reference?) {
        upsert(prop: &self.item, val: item)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(item: Reference) {
        self.init()
        self.item = item
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case item = "item"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.item = try container.decodeIfPresent(Reference.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.item, forKey: .item)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["amount"] {
				presentKeys.insert("amount")
				if let val = exist as? FHIRJSON {
					upsert(amount: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "amount", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					upsert(item: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationPackageContent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationPackageContent. Will return empty instance: \(error))")
		}
		return MedicationPackageContent.init()
	}
}


/**
 *  Administrable medication details.
 *
 *  Information that only applies to products (not packages).
 */
open class MedicationProduct: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationProduct" }
	}

    public let batch = RealmSwift.List<MedicationProductBatch>()
    @objc public dynamic var form: CodeableConcept?
    public func upsert(form: CodeableConcept?) {
        upsert(prop: &self.form, val: form)
    }
    public let ingredient = RealmSwift.List<MedicationProductIngredient>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case batch = "batch"
        case form = "form"
        case ingredient = "ingredient"
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

        self.batch.append(objectsIn: try container.decodeIfPresent([MedicationProductBatch].self, forKey: .batch) ?? [])
        self.form = try container.decodeIfPresent(CodeableConcept.self, forKey: .form)
        self.ingredient.append(objectsIn: try container.decodeIfPresent([MedicationProductIngredient].self, forKey: .ingredient) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.batch.flatMap { $0 }, forKey: .batch)
        try container.encodeIfPresent(self.form, forKey: .form)
        try container.encode(self.ingredient.flatMap { $0 }, forKey: .ingredient)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["batch"] {
				presentKeys.insert("batch")
				if let val = exist as? [FHIRJSON] {
					if let vals = MedicationProductBatch.instantiate(fromArray: val, owner: self) as? [MedicationProductBatch] {
						if let realm = self.realm { realm.delete(self.batch) }
						self.batch.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "batch", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["form"] {
				presentKeys.insert("form")
				if let val = exist as? FHIRJSON {
					upsert(form: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "form", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ingredient"] {
				presentKeys.insert("ingredient")
				if let val = exist as? [FHIRJSON] {
					if let vals = MedicationProductIngredient.instantiate(fromArray: val, owner: self) as? [MedicationProductIngredient] {
						if let realm = self.realm { realm.delete(self.ingredient) }
						self.ingredient.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "ingredient", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if batch.count > 0 {
			json["batch"] = Array(batch.map() { $0.asJSON() })
		}
		if let form = self.form {
			json["form"] = form.asJSON()
		}
		if ingredient.count > 0 {
			json["ingredient"] = Array(ingredient.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationProduct.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationProduct. Will return empty instance: \(error))")
		}
		return MedicationProduct.init()
	}
}


/**
 *  None.
 *
 *  Information about a group of medication produced or packaged from one production run.
 */
open class MedicationProductBatch: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationProductBatch" }
	}

    @objc public dynamic var expirationDate: DateTime?
    @objc public dynamic var lotNumber: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case expirationDate = "expirationDate"
        case lotNumber = "lotNumber"
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

        self.expirationDate = try container.decodeIfPresent(DateTime.self, forKey: .expirationDate)
        self.lotNumber = try container.decodeIfPresent(String.self, forKey: .lotNumber)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.expirationDate, forKey: .expirationDate)
        try container.encodeIfPresent(self.lotNumber, forKey: .lotNumber)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["expirationDate"] {
				presentKeys.insert("expirationDate")
				if let val = exist as? String {
					self.expirationDate = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "expirationDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["lotNumber"] {
				presentKeys.insert("lotNumber")
				if let val = exist as? String {
					self.lotNumber = val
				}
				else {
					errors.append(FHIRJSONError(key: "lotNumber", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let expirationDate = self.expirationDate {
			json["expirationDate"] = expirationDate.asJSON()
		}
		if let lotNumber = self.lotNumber {
			json["lotNumber"] = lotNumber.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationProductBatch.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationProductBatch. Will return empty instance: \(error))")
		}
		return MedicationProductBatch.init()
	}
}


/**
 *  Active or inactive ingredient.
 *
 *  Identifies a particular constituent of interest in the product.
 */
open class MedicationProductIngredient: BackboneElement {
	override open class var resourceType: String {
		get { return "MedicationProductIngredient" }
	}

    @objc public dynamic var amount: Ratio?
    public func upsert(amount: Ratio?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var item: Reference?
    public func upsert(item: Reference?) {
        upsert(prop: &self.item, val: item)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(item: Reference) {
        self.init()
        self.item = item
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case item = "item"
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

        self.amount = try container.decodeIfPresent(Ratio.self, forKey: .amount)
        self.item = try container.decodeIfPresent(Reference.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.item, forKey: .item)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["amount"] {
				presentKeys.insert("amount")
				if let val = exist as? FHIRJSON {
					upsert(amount: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "amount", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					upsert(item: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(MedicationProductIngredient.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy MedicationProductIngredient. Will return empty instance: \(error))")
		}
		return MedicationProductIngredient.init()
	}
}

