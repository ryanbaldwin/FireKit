//
//  Medication.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Medication) on 2017-11-13.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-13
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Medication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        isBrand.value = o.isBrand.value
        FireKit.populate(&self.manufacturer, from: o.manufacturer)
        FireKit.populate(&self.package, from: o.package)
        FireKit.populate(&self.product, from: o.product)
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
        try container.encode(Array(self.content), forKey: .content)
    }

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

    public override func populate(from other: Any) {
        guard let o = other as? MedicationPackage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.container, from: o.container)

        for (index, t) in o.content.enumerated() {
            guard index < self.content.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = MedicationPackageContent()
                val.populate(from: t)
                self.content.append(val)
                continue
            }
            self.content[index].populate(from: t)
        }
    
        while self.content.count > o.content.count {
            let objectToRemove = self.content.last!
            self.content.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? MedicationPackageContent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.item, from: o.item)
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
        try container.encode(Array(self.batch), forKey: .batch)
        try container.encodeIfPresent(self.form, forKey: .form)
        try container.encode(Array(self.ingredient), forKey: .ingredient)
    }

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

    public override func populate(from other: Any) {
        guard let o = other as? MedicationProduct else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.batch.enumerated() {
            guard index < self.batch.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = MedicationProductBatch()
                val.populate(from: t)
                self.batch.append(val)
                continue
            }
            self.batch[index].populate(from: t)
        }
    
        while self.batch.count > o.batch.count {
            let objectToRemove = self.batch.last!
            self.batch.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.form, from: o.form)

        for (index, t) in o.ingredient.enumerated() {
            guard index < self.ingredient.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = MedicationProductIngredient()
                val.populate(from: t)
                self.ingredient.append(val)
                continue
            }
            self.ingredient[index].populate(from: t)
        }
    
        while self.ingredient.count > o.ingredient.count {
            let objectToRemove = self.ingredient.last!
            self.ingredient.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? MedicationProductBatch else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.expirationDate, from: o.expirationDate)
        lotNumber = o.lotNumber
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

    public override func populate(from other: Any) {
        guard let o = other as? MedicationProductIngredient else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.item, from: o.item)
    }
}

