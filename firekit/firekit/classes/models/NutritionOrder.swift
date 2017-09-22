//
//  NutritionOrder.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/NutritionOrder) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrder else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.allergyIntolerance.enumerated() {
            guard index < self.allergyIntolerance.count else {
                self.allergyIntolerance.append(t)
                continue
            }
            self.allergyIntolerance[index].populate(from: t)
        }
    
        if self.allergyIntolerance.count > o.allergyIntolerance.count {
            for i in self.allergyIntolerance.count...o.allergyIntolerance.count {
                let objectToRemove = self.allergyIntolerance[i]
                self.allergyIntolerance.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.dateTime, from: o.dateTime)
        FireKit.populate(&self.encounter, from: o.encounter)
        FireKit.populate(&self.enteralFormula, from: o.enteralFormula)

        for (index, t) in o.excludeFoodModifier.enumerated() {
            guard index < self.excludeFoodModifier.count else {
                self.excludeFoodModifier.append(t)
                continue
            }
            self.excludeFoodModifier[index].populate(from: t)
        }
    
        if self.excludeFoodModifier.count > o.excludeFoodModifier.count {
            for i in self.excludeFoodModifier.count...o.excludeFoodModifier.count {
                let objectToRemove = self.excludeFoodModifier[i]
                self.excludeFoodModifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.foodPreferenceModifier.enumerated() {
            guard index < self.foodPreferenceModifier.count else {
                self.foodPreferenceModifier.append(t)
                continue
            }
            self.foodPreferenceModifier[index].populate(from: t)
        }
    
        if self.foodPreferenceModifier.count > o.foodPreferenceModifier.count {
            for i in self.foodPreferenceModifier.count...o.foodPreferenceModifier.count {
                let objectToRemove = self.foodPreferenceModifier[i]
                self.foodPreferenceModifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

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
        FireKit.populate(&self.oralDiet, from: o.oralDiet)
        FireKit.populate(&self.orderer, from: o.orderer)
        FireKit.populate(&self.patient, from: o.patient)
        status = o.status

        for (index, t) in o.supplement.enumerated() {
            guard index < self.supplement.count else {
                self.supplement.append(t)
                continue
            }
            self.supplement[index].populate(from: t)
        }
    
        if self.supplement.count > o.supplement.count {
            for i in self.supplement.count...o.supplement.count {
                let objectToRemove = self.supplement[i]
                self.supplement.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrderEnteralFormula else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        additiveProductName = o.additiveProductName
        FireKit.populate(&self.additiveType, from: o.additiveType)

        for (index, t) in o.administration.enumerated() {
            guard index < self.administration.count else {
                self.administration.append(t)
                continue
            }
            self.administration[index].populate(from: t)
        }
    
        if self.administration.count > o.administration.count {
            for i in self.administration.count...o.administration.count {
                let objectToRemove = self.administration[i]
                self.administration.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        administrationInstruction = o.administrationInstruction
        baseFormulaProductName = o.baseFormulaProductName
        FireKit.populate(&self.baseFormulaType, from: o.baseFormulaType)
        FireKit.populate(&self.caloricDensity, from: o.caloricDensity)
        FireKit.populate(&self.maxVolumeToDeliver, from: o.maxVolumeToDeliver)
        FireKit.populate(&self.routeofAdministration, from: o.routeofAdministration)
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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrderEnteralFormulaAdministration else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.quantity, from: o.quantity)
        FireKit.populate(&self.rateQuantity, from: o.rateQuantity)
        FireKit.populate(&self.rateRatio, from: o.rateRatio)
        FireKit.populate(&self.schedule, from: o.schedule)
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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrderOralDiet else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.fluidConsistencyType.enumerated() {
            guard index < self.fluidConsistencyType.count else {
                self.fluidConsistencyType.append(t)
                continue
            }
            self.fluidConsistencyType[index].populate(from: t)
        }
    
        if self.fluidConsistencyType.count > o.fluidConsistencyType.count {
            for i in self.fluidConsistencyType.count...o.fluidConsistencyType.count {
                let objectToRemove = self.fluidConsistencyType[i]
                self.fluidConsistencyType.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        instruction = o.instruction

        for (index, t) in o.nutrient.enumerated() {
            guard index < self.nutrient.count else {
                self.nutrient.append(t)
                continue
            }
            self.nutrient[index].populate(from: t)
        }
    
        if self.nutrient.count > o.nutrient.count {
            for i in self.nutrient.count...o.nutrient.count {
                let objectToRemove = self.nutrient[i]
                self.nutrient.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.schedule.enumerated() {
            guard index < self.schedule.count else {
                self.schedule.append(t)
                continue
            }
            self.schedule[index].populate(from: t)
        }
    
        if self.schedule.count > o.schedule.count {
            for i in self.schedule.count...o.schedule.count {
                let objectToRemove = self.schedule[i]
                self.schedule.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.texture.enumerated() {
            guard index < self.texture.count else {
                self.texture.append(t)
                continue
            }
            self.texture[index].populate(from: t)
        }
    
        if self.texture.count > o.texture.count {
            for i in self.texture.count...o.texture.count {
                let objectToRemove = self.texture[i]
                self.texture.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.type.enumerated() {
            guard index < self.type.count else {
                self.type.append(t)
                continue
            }
            self.type[index].populate(from: t)
        }
    
        if self.type.count > o.type.count {
            for i in self.type.count...o.type.count {
                let objectToRemove = self.type[i]
                self.type.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrderOralDietNutrient else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.modifier, from: o.modifier)
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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrderOralDietTexture else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.foodType, from: o.foodType)
        FireKit.populate(&self.modifier, from: o.modifier)
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

    public override func populate(from other: Any) {
        guard let o = other as? NutritionOrderSupplement else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        instruction = o.instruction
        productName = o.productName
        FireKit.populate(&self.quantity, from: o.quantity)

        for (index, t) in o.schedule.enumerated() {
            guard index < self.schedule.count else {
                self.schedule.append(t)
                continue
            }
            self.schedule[index].populate(from: t)
        }
    
        if self.schedule.count > o.schedule.count {
            for i in self.schedule.count...o.schedule.count {
                let objectToRemove = self.schedule[i]
                self.schedule.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.type, from: o.type)
    }
}

