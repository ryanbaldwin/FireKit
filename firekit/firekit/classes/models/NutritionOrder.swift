//
//  NutritionOrder.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/NutritionOrder) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A request for a diet, formula or nutritional supplement.
 *
 *  A request to supply a diet, formula feeding (enteral) or oral nutritional supplement to a patient/resident.
 */
open class NutritionOrder: DomainResource {
	override open class var resourceType: String {
		get { return "NutritionOrder" }
	}

    public let allergyIntolerance = RealmSwift.List<Reference>()
    @objc public dynamic var dateTime: DateTime?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var enteralFormula: NutritionOrderEnteralFormula?
    public func upsert(enteralFormula: NutritionOrderEnteralFormula?) {
        upsert(prop: &self.enteralFormula, val: enteralFormula)
    }
    public let excludeFoodModifier = RealmSwift.List<CodeableConcept>()
    public let foodPreferenceModifier = RealmSwift.List<CodeableConcept>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var oralDiet: NutritionOrderOralDiet?
    public func upsert(oralDiet: NutritionOrderOralDiet?) {
        upsert(prop: &self.oralDiet, val: oralDiet)
    }
    @objc public dynamic var orderer: Reference?
    public func upsert(orderer: Reference?) {
        upsert(prop: &self.orderer, val: orderer)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var status: String?
    public let supplement = RealmSwift.List<NutritionOrderSupplement>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(dateTime: DateTime, patient: Reference) {
        self.init()
        self.dateTime = dateTime
        self.patient = patient
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case allergyIntolerance = "allergyIntolerance"
        case dateTime = "dateTime"
        case encounter = "encounter"
        case enteralFormula = "enteralFormula"
        case excludeFoodModifier = "excludeFoodModifier"
        case foodPreferenceModifier = "foodPreferenceModifier"
        case identifier = "identifier"
        case oralDiet = "oralDiet"
        case orderer = "orderer"
        case patient = "patient"
        case status = "status"
        case supplement = "supplement"
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

        self.allergyIntolerance.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .allergyIntolerance) ?? [])
        self.dateTime = try container.decodeIfPresent(DateTime.self, forKey: .dateTime)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.enteralFormula = try container.decodeIfPresent(NutritionOrderEnteralFormula.self, forKey: .enteralFormula)
        self.excludeFoodModifier.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .excludeFoodModifier) ?? [])
        self.foodPreferenceModifier.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .foodPreferenceModifier) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.oralDiet = try container.decodeIfPresent(NutritionOrderOralDiet.self, forKey: .oralDiet)
        self.orderer = try container.decodeIfPresent(Reference.self, forKey: .orderer)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.supplement.append(objectsIn: try container.decodeIfPresent([NutritionOrderSupplement].self, forKey: .supplement) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.allergyIntolerance), forKey: .allergyIntolerance)
        try container.encodeIfPresent(self.dateTime, forKey: .dateTime)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.enteralFormula, forKey: .enteralFormula)
        try container.encode(Array(self.excludeFoodModifier), forKey: .excludeFoodModifier)
        try container.encode(Array(self.foodPreferenceModifier), forKey: .foodPreferenceModifier)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.oralDiet, forKey: .oralDiet)
        try container.encodeIfPresent(self.orderer, forKey: .orderer)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.supplement), forKey: .supplement)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrder.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrder. Will return empty instance: \(error))")
		}
		return NutritionOrder.init()
	}
}


/**
 *  Enteral formula components.
 *
 *  Feeding provided through the gastrointestinal tract via a tube, catheter, or stoma that delivers nutrition distal to
 *  the oral cavity.
 */
open class NutritionOrderEnteralFormula: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderEnteralFormula" }
	}

    @objc public dynamic var additiveProductName: String?
    @objc public dynamic var additiveType: CodeableConcept?
    public func upsert(additiveType: CodeableConcept?) {
        upsert(prop: &self.additiveType, val: additiveType)
    }
    public let administration = RealmSwift.List<NutritionOrderEnteralFormulaAdministration>()
    @objc public dynamic var administrationInstruction: String?
    @objc public dynamic var baseFormulaProductName: String?
    @objc public dynamic var baseFormulaType: CodeableConcept?
    public func upsert(baseFormulaType: CodeableConcept?) {
        upsert(prop: &self.baseFormulaType, val: baseFormulaType)
    }
    @objc public dynamic var caloricDensity: Quantity?
    public func upsert(caloricDensity: Quantity?) {
        upsert(prop: &self.caloricDensity, val: caloricDensity)
    }
    @objc public dynamic var maxVolumeToDeliver: Quantity?
    public func upsert(maxVolumeToDeliver: Quantity?) {
        upsert(prop: &self.maxVolumeToDeliver, val: maxVolumeToDeliver)
    }
    @objc public dynamic var routeofAdministration: CodeableConcept?
    public func upsert(routeofAdministration: CodeableConcept?) {
        upsert(prop: &self.routeofAdministration, val: routeofAdministration)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case additiveProductName = "additiveProductName"
        case additiveType = "additiveType"
        case administration = "administration"
        case administrationInstruction = "administrationInstruction"
        case baseFormulaProductName = "baseFormulaProductName"
        case baseFormulaType = "baseFormulaType"
        case caloricDensity = "caloricDensity"
        case maxVolumeToDeliver = "maxVolumeToDeliver"
        case routeofAdministration = "routeofAdministration"
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

        self.additiveProductName = try container.decodeIfPresent(String.self, forKey: .additiveProductName)
        self.additiveType = try container.decodeIfPresent(CodeableConcept.self, forKey: .additiveType)
        self.administration.append(objectsIn: try container.decodeIfPresent([NutritionOrderEnteralFormulaAdministration].self, forKey: .administration) ?? [])
        self.administrationInstruction = try container.decodeIfPresent(String.self, forKey: .administrationInstruction)
        self.baseFormulaProductName = try container.decodeIfPresent(String.self, forKey: .baseFormulaProductName)
        self.baseFormulaType = try container.decodeIfPresent(CodeableConcept.self, forKey: .baseFormulaType)
        self.caloricDensity = try container.decodeIfPresent(Quantity.self, forKey: .caloricDensity)
        self.maxVolumeToDeliver = try container.decodeIfPresent(Quantity.self, forKey: .maxVolumeToDeliver)
        self.routeofAdministration = try container.decodeIfPresent(CodeableConcept.self, forKey: .routeofAdministration)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.additiveProductName, forKey: .additiveProductName)
        try container.encodeIfPresent(self.additiveType, forKey: .additiveType)
        try container.encode(Array(self.administration), forKey: .administration)
        try container.encodeIfPresent(self.administrationInstruction, forKey: .administrationInstruction)
        try container.encodeIfPresent(self.baseFormulaProductName, forKey: .baseFormulaProductName)
        try container.encodeIfPresent(self.baseFormulaType, forKey: .baseFormulaType)
        try container.encodeIfPresent(self.caloricDensity, forKey: .caloricDensity)
        try container.encodeIfPresent(self.maxVolumeToDeliver, forKey: .maxVolumeToDeliver)
        try container.encodeIfPresent(self.routeofAdministration, forKey: .routeofAdministration)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrderEnteralFormula.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrderEnteralFormula. Will return empty instance: \(error))")
		}
		return NutritionOrderEnteralFormula.init()
	}
}


/**
 *  Formula feeding instruction as structured data.
 *
 *  Formula administration instructions as structured data.  This repeating structure allows for changing the
 *  administration rate or volume over time for both bolus and continuous feeding.  An example of this would be an
 *  instruction to increase the rate of continuous feeding every 2 hours.
 */
open class NutritionOrderEnteralFormulaAdministration: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderEnteralFormulaAdministration" }
	}

    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    @objc public dynamic var rateQuantity: Quantity?
    public func upsert(rateQuantity: Quantity?) {
        upsert(prop: &self.rateQuantity, val: rateQuantity)
    }
    @objc public dynamic var rateRatio: Ratio?
    public func upsert(rateRatio: Ratio?) {
        upsert(prop: &self.rateRatio, val: rateRatio)
    }
    @objc public dynamic var schedule: Timing?
    public func upsert(schedule: Timing?) {
        upsert(prop: &self.schedule, val: schedule)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case quantity = "quantity"
        case rateQuantity = "rateQuantity"
        case rateRatio = "rateRatio"
        case schedule = "schedule"
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

        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.rateQuantity = try container.decodeIfPresent(Quantity.self, forKey: .rateQuantity)
        self.rateRatio = try container.decodeIfPresent(Ratio.self, forKey: .rateRatio)
        self.schedule = try container.decodeIfPresent(Timing.self, forKey: .schedule)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.rateQuantity, forKey: .rateQuantity)
        try container.encodeIfPresent(self.rateRatio, forKey: .rateRatio)
        try container.encodeIfPresent(self.schedule, forKey: .schedule)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrderEnteralFormulaAdministration.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrderEnteralFormulaAdministration. Will return empty instance: \(error))")
		}
		return NutritionOrderEnteralFormulaAdministration.init()
	}
}


/**
 *  Oral diet components.
 *
 *  Diet given orally in contrast to enteral (tube) feeding.
 */
open class NutritionOrderOralDiet: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderOralDiet" }
	}

    public let fluidConsistencyType = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var instruction: String?
    public let nutrient = RealmSwift.List<NutritionOrderOralDietNutrient>()
    public let schedule = RealmSwift.List<Timing>()
    public let texture = RealmSwift.List<NutritionOrderOralDietTexture>()
    public let type = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case fluidConsistencyType = "fluidConsistencyType"
        case instruction = "instruction"
        case nutrient = "nutrient"
        case schedule = "schedule"
        case texture = "texture"
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

        self.fluidConsistencyType.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .fluidConsistencyType) ?? [])
        self.instruction = try container.decodeIfPresent(String.self, forKey: .instruction)
        self.nutrient.append(objectsIn: try container.decodeIfPresent([NutritionOrderOralDietNutrient].self, forKey: .nutrient) ?? [])
        self.schedule.append(objectsIn: try container.decodeIfPresent([Timing].self, forKey: .schedule) ?? [])
        self.texture.append(objectsIn: try container.decodeIfPresent([NutritionOrderOralDietTexture].self, forKey: .texture) ?? [])
        self.type.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.fluidConsistencyType), forKey: .fluidConsistencyType)
        try container.encodeIfPresent(self.instruction, forKey: .instruction)
        try container.encode(Array(self.nutrient), forKey: .nutrient)
        try container.encode(Array(self.schedule), forKey: .schedule)
        try container.encode(Array(self.texture), forKey: .texture)
        try container.encode(Array(self.type), forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrderOralDiet.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrderOralDiet. Will return empty instance: \(error))")
		}
		return NutritionOrderOralDiet.init()
	}
}


/**
 *  Required  nutrient modifications.
 *
 *  Class that defines the quantity and type of nutrient modifications required for the oral diet.
 */
open class NutritionOrderOralDietNutrient: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderOralDietNutrient" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var modifier: CodeableConcept?
    public func upsert(modifier: CodeableConcept?) {
        upsert(prop: &self.modifier, val: modifier)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case modifier = "modifier"
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
        self.modifier = try container.decodeIfPresent(CodeableConcept.self, forKey: .modifier)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.modifier, forKey: .modifier)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrderOralDietNutrient.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrderOralDietNutrient. Will return empty instance: \(error))")
		}
		return NutritionOrderOralDietNutrient.init()
	}
}


/**
 *  Required  texture modifications.
 *
 *  Class that describes any texture modifications required for the patient to safely consume various types of solid
 *  foods.
 */
open class NutritionOrderOralDietTexture: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderOralDietTexture" }
	}

    @objc public dynamic var foodType: CodeableConcept?
    public func upsert(foodType: CodeableConcept?) {
        upsert(prop: &self.foodType, val: foodType)
    }
    @objc public dynamic var modifier: CodeableConcept?
    public func upsert(modifier: CodeableConcept?) {
        upsert(prop: &self.modifier, val: modifier)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case foodType = "foodType"
        case modifier = "modifier"
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

        self.foodType = try container.decodeIfPresent(CodeableConcept.self, forKey: .foodType)
        self.modifier = try container.decodeIfPresent(CodeableConcept.self, forKey: .modifier)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.foodType, forKey: .foodType)
        try container.encodeIfPresent(self.modifier, forKey: .modifier)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrderOralDietTexture.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrderOralDietTexture. Will return empty instance: \(error))")
		}
		return NutritionOrderOralDietTexture.init()
	}
}


/**
 *  Supplement components.
 *
 *  Oral nutritional products given in order to add further nutritional value to the patient's diet.
 */
open class NutritionOrderSupplement: BackboneElement {
	override open class var resourceType: String {
		get { return "NutritionOrderSupplement" }
	}

    @objc public dynamic var instruction: String?
    @objc public dynamic var productName: String?
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let schedule = RealmSwift.List<Timing>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case instruction = "instruction"
        case productName = "productName"
        case quantity = "quantity"
        case schedule = "schedule"
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

        self.instruction = try container.decodeIfPresent(String.self, forKey: .instruction)
        self.productName = try container.decodeIfPresent(String.self, forKey: .productName)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.schedule.append(objectsIn: try container.decodeIfPresent([Timing].self, forKey: .schedule) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.instruction, forKey: .instruction)
        try container.encodeIfPresent(self.productName, forKey: .productName)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encode(Array(self.schedule), forKey: .schedule)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(NutritionOrderSupplement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy NutritionOrderSupplement. Will return empty instance: \(error))")
		}
		return NutritionOrderSupplement.init()
	}
}

