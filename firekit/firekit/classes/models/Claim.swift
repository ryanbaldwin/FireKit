//
//  Claim.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Claim) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Claim, Pre-determination or Pre-authorization.
 *
 *  A provider issued list of services and products provided, or to be provided, to a patient which is provided to an
 *  insurer for payment recovery.
 */
open class Claim: DomainResource {
	override open class var resourceType: String {
		get { return "Claim" }
	}

    @objc public dynamic var accident: FHIRDate?
    @objc public dynamic var accidentType: Coding?
    public func upsert(accidentType: Coding?) {
        upsert(prop: &self.accidentType, val: accidentType)
    }
    public let additionalMaterials = RealmSwift.List<Coding>()
    public let condition = RealmSwift.List<Coding>()
    public let coverage = RealmSwift.List<ClaimCoverage>()
    @objc public dynamic var created: DateTime?
    public let diagnosis = RealmSwift.List<ClaimDiagnosis>()
    @objc public dynamic var enterer: Reference?
    public func upsert(enterer: Reference?) {
        upsert(prop: &self.enterer, val: enterer)
    }
    public let exception = RealmSwift.List<Coding>()
    @objc public dynamic var facility: Reference?
    public func upsert(facility: Reference?) {
        upsert(prop: &self.facility, val: facility)
    }
    @objc public dynamic var fundsReserve: Coding?
    public func upsert(fundsReserve: Coding?) {
        upsert(prop: &self.fundsReserve, val: fundsReserve)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let interventionException = RealmSwift.List<Coding>()
    public let item = RealmSwift.List<ClaimItem>()
    public let missingTeeth = RealmSwift.List<ClaimMissingTeeth>()
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var originalPrescription: Reference?
    public func upsert(originalPrescription: Reference?) {
        upsert(prop: &self.originalPrescription, val: originalPrescription)
    }
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var payee: ClaimPayee?
    public func upsert(payee: ClaimPayee?) {
        upsert(prop: &self.payee, val: payee)
    }
    @objc public dynamic var prescription: Reference?
    public func upsert(prescription: Reference?) {
        upsert(prop: &self.prescription, val: prescription)
    }
    @objc public dynamic var priority: Coding?
    public func upsert(priority: Coding?) {
        upsert(prop: &self.priority, val: priority)
    }
    @objc public dynamic var provider: Reference?
    public func upsert(provider: Reference?) {
        upsert(prop: &self.provider, val: provider)
    }
    @objc public dynamic var referral: Reference?
    public func upsert(referral: Reference?) {
        upsert(prop: &self.referral, val: referral)
    }
    @objc public dynamic var ruleset: Coding?
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }
    @objc public dynamic var school: String?
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }
    @objc public dynamic var type: String?
    @objc public dynamic var use: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, type: String) {
        self.init()
        self.patient = patient
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case accident = "accident"
        case accidentType = "accidentType"
        case additionalMaterials = "additionalMaterials"
        case condition = "condition"
        case coverage = "coverage"
        case created = "created"
        case diagnosis = "diagnosis"
        case enterer = "enterer"
        case exception = "exception"
        case facility = "facility"
        case fundsReserve = "fundsReserve"
        case identifier = "identifier"
        case interventionException = "interventionException"
        case item = "item"
        case missingTeeth = "missingTeeth"
        case organization = "organization"
        case originalPrescription = "originalPrescription"
        case originalRuleset = "originalRuleset"
        case patient = "patient"
        case payee = "payee"
        case prescription = "prescription"
        case priority = "priority"
        case provider = "provider"
        case referral = "referral"
        case ruleset = "ruleset"
        case school = "school"
        case target = "target"
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

        self.accident = try container.decodeIfPresent(FHIRDate.self, forKey: .accident)
        self.accidentType = try container.decodeIfPresent(Coding.self, forKey: .accidentType)
        self.additionalMaterials.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .additionalMaterials) ?? [])
        self.condition.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .condition) ?? [])
        self.coverage.append(objectsIn: try container.decodeIfPresent([ClaimCoverage].self, forKey: .coverage) ?? [])
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.diagnosis.append(objectsIn: try container.decodeIfPresent([ClaimDiagnosis].self, forKey: .diagnosis) ?? [])
        self.enterer = try container.decodeIfPresent(Reference.self, forKey: .enterer)
        self.exception.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .exception) ?? [])
        self.facility = try container.decodeIfPresent(Reference.self, forKey: .facility)
        self.fundsReserve = try container.decodeIfPresent(Coding.self, forKey: .fundsReserve)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.interventionException.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .interventionException) ?? [])
        self.item.append(objectsIn: try container.decodeIfPresent([ClaimItem].self, forKey: .item) ?? [])
        self.missingTeeth.append(objectsIn: try container.decodeIfPresent([ClaimMissingTeeth].self, forKey: .missingTeeth) ?? [])
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalPrescription = try container.decodeIfPresent(Reference.self, forKey: .originalPrescription)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.payee = try container.decodeIfPresent(ClaimPayee.self, forKey: .payee)
        self.prescription = try container.decodeIfPresent(Reference.self, forKey: .prescription)
        self.priority = try container.decodeIfPresent(Coding.self, forKey: .priority)
        self.provider = try container.decodeIfPresent(Reference.self, forKey: .provider)
        self.referral = try container.decodeIfPresent(Reference.self, forKey: .referral)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
        self.school = try container.decodeIfPresent(String.self, forKey: .school)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.accident, forKey: .accident)
        try container.encodeIfPresent(self.accidentType, forKey: .accidentType)
        try container.encode(Array(self.additionalMaterials), forKey: .additionalMaterials)
        try container.encode(Array(self.condition), forKey: .condition)
        try container.encode(Array(self.coverage), forKey: .coverage)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encode(Array(self.diagnosis), forKey: .diagnosis)
        try container.encodeIfPresent(self.enterer, forKey: .enterer)
        try container.encode(Array(self.exception), forKey: .exception)
        try container.encodeIfPresent(self.facility, forKey: .facility)
        try container.encodeIfPresent(self.fundsReserve, forKey: .fundsReserve)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.interventionException), forKey: .interventionException)
        try container.encode(Array(self.item), forKey: .item)
        try container.encode(Array(self.missingTeeth), forKey: .missingTeeth)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalPrescription, forKey: .originalPrescription)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.payee, forKey: .payee)
        try container.encodeIfPresent(self.prescription, forKey: .prescription)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.referral, forKey: .referral)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
        try container.encodeIfPresent(self.school, forKey: .school)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.use, forKey: .use)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Claim.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Claim. Will return empty instance: \(error))")
		}
		return Claim.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Claim else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.accident, from: o.accident)
        FireKit.populate(&self.accidentType, from: o.accidentType)

        for (index, t) in o.additionalMaterials.enumerated() {
            guard index < self.additionalMaterials.count else {
                self.additionalMaterials.append(t)
                continue
            }
            self.additionalMaterials[index].populate(from: t)
        }
    
        if self.additionalMaterials.count > o.additionalMaterials.count {
            for i in self.additionalMaterials.count...o.additionalMaterials.count {
                let objectToRemove = self.additionalMaterials[i]
                self.additionalMaterials.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.condition.enumerated() {
            guard index < self.condition.count else {
                self.condition.append(t)
                continue
            }
            self.condition[index].populate(from: t)
        }
    
        if self.condition.count > o.condition.count {
            for i in self.condition.count...o.condition.count {
                let objectToRemove = self.condition[i]
                self.condition.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.coverage.enumerated() {
            guard index < self.coverage.count else {
                self.coverage.append(t)
                continue
            }
            self.coverage[index].populate(from: t)
        }
    
        if self.coverage.count > o.coverage.count {
            for i in self.coverage.count...o.coverage.count {
                let objectToRemove = self.coverage[i]
                self.coverage.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.created, from: o.created)

        for (index, t) in o.diagnosis.enumerated() {
            guard index < self.diagnosis.count else {
                self.diagnosis.append(t)
                continue
            }
            self.diagnosis[index].populate(from: t)
        }
    
        if self.diagnosis.count > o.diagnosis.count {
            for i in self.diagnosis.count...o.diagnosis.count {
                let objectToRemove = self.diagnosis[i]
                self.diagnosis.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.enterer, from: o.enterer)

        for (index, t) in o.exception.enumerated() {
            guard index < self.exception.count else {
                self.exception.append(t)
                continue
            }
            self.exception[index].populate(from: t)
        }
    
        if self.exception.count > o.exception.count {
            for i in self.exception.count...o.exception.count {
                let objectToRemove = self.exception[i]
                self.exception.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.facility, from: o.facility)
        FireKit.populate(&self.fundsReserve, from: o.fundsReserve)

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

        for (index, t) in o.interventionException.enumerated() {
            guard index < self.interventionException.count else {
                self.interventionException.append(t)
                continue
            }
            self.interventionException[index].populate(from: t)
        }
    
        if self.interventionException.count > o.interventionException.count {
            for i in self.interventionException.count...o.interventionException.count {
                let objectToRemove = self.interventionException[i]
                self.interventionException.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.item.enumerated() {
            guard index < self.item.count else {
                self.item.append(t)
                continue
            }
            self.item[index].populate(from: t)
        }
    
        if self.item.count > o.item.count {
            for i in self.item.count...o.item.count {
                let objectToRemove = self.item[i]
                self.item.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.missingTeeth.enumerated() {
            guard index < self.missingTeeth.count else {
                self.missingTeeth.append(t)
                continue
            }
            self.missingTeeth[index].populate(from: t)
        }
    
        if self.missingTeeth.count > o.missingTeeth.count {
            for i in self.missingTeeth.count...o.missingTeeth.count {
                let objectToRemove = self.missingTeeth[i]
                self.missingTeeth.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalPrescription, from: o.originalPrescription)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.payee, from: o.payee)
        FireKit.populate(&self.prescription, from: o.prescription)
        FireKit.populate(&self.priority, from: o.priority)
        FireKit.populate(&self.provider, from: o.provider)
        FireKit.populate(&self.referral, from: o.referral)
        FireKit.populate(&self.ruleset, from: o.ruleset)
        school = o.school
        FireKit.populate(&self.target, from: o.target)
        type = o.type
        use = o.use
    }
}


/**
 *  Insurance or medical plan.
 *
 *  Financial instrument by which payment information for health care.
 */
open class ClaimCoverage: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimCoverage" }
	}

    @objc public dynamic var businessArrangement: String?
    @objc public dynamic var claimResponse: Reference?
    public func upsert(claimResponse: Reference?) {
        upsert(prop: &self.claimResponse, val: claimResponse)
    }
    @objc public dynamic var coverage: Reference?
    public func upsert(coverage: Reference?) {
        upsert(prop: &self.coverage, val: coverage)
    }
    public let focal = RealmOptional<Bool>()
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    public let preAuthRef = RealmSwift.List<RealmString>()
    @objc public dynamic var relationship: Coding?
    public func upsert(relationship: Coding?) {
        upsert(prop: &self.relationship, val: relationship)
    }
    public let sequence = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(coverage: Reference, focal: Bool, relationship: Coding, sequence: Int) {
        self.init()
        self.coverage = coverage
        self.focal.value = focal
        self.relationship = relationship
        self.sequence.value = sequence
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case businessArrangement = "businessArrangement"
        case claimResponse = "claimResponse"
        case coverage = "coverage"
        case focal = "focal"
        case originalRuleset = "originalRuleset"
        case preAuthRef = "preAuthRef"
        case relationship = "relationship"
        case sequence = "sequence"
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

        self.businessArrangement = try container.decodeIfPresent(String.self, forKey: .businessArrangement)
        self.claimResponse = try container.decodeIfPresent(Reference.self, forKey: .claimResponse)
        self.coverage = try container.decodeIfPresent(Reference.self, forKey: .coverage)
        self.focal.value = try container.decodeIfPresent(Bool.self, forKey: .focal)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.preAuthRef.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .preAuthRef) ?? [])
        self.relationship = try container.decodeIfPresent(Coding.self, forKey: .relationship)
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.businessArrangement, forKey: .businessArrangement)
        try container.encodeIfPresent(self.claimResponse, forKey: .claimResponse)
        try container.encodeIfPresent(self.coverage, forKey: .coverage)
        try container.encodeIfPresent(self.focal.value, forKey: .focal)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encode(Array(self.preAuthRef), forKey: .preAuthRef)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimCoverage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimCoverage. Will return empty instance: \(error))")
		}
		return ClaimCoverage.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimCoverage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        businessArrangement = o.businessArrangement
        FireKit.populate(&self.claimResponse, from: o.claimResponse)
        FireKit.populate(&self.coverage, from: o.coverage)
        focal.value = o.focal.value
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)

        for (index, t) in o.preAuthRef.enumerated() {
            guard index < self.preAuthRef.count else {
                self.preAuthRef.append(t)
                continue
            }
            self.preAuthRef[index].populate(from: t)
        }
    
        if self.preAuthRef.count > o.preAuthRef.count {
            for i in self.preAuthRef.count...o.preAuthRef.count {
                let objectToRemove = self.preAuthRef[i]
                self.preAuthRef.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.relationship, from: o.relationship)
        sequence.value = o.sequence.value
    }
}


/**
 *  Diagnosis.
 *
 *  Ordered list of patient diagnosis for which care is sought.
 */
open class ClaimDiagnosis: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimDiagnosis" }
	}

    @objc public dynamic var diagnosis: Coding?
    public func upsert(diagnosis: Coding?) {
        upsert(prop: &self.diagnosis, val: diagnosis)
    }
    public let sequence = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(diagnosis: Coding, sequence: Int) {
        self.init()
        self.diagnosis = diagnosis
        self.sequence.value = sequence
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case diagnosis = "diagnosis"
        case sequence = "sequence"
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

        self.diagnosis = try container.decodeIfPresent(Coding.self, forKey: .diagnosis)
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.diagnosis, forKey: .diagnosis)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimDiagnosis.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimDiagnosis. Will return empty instance: \(error))")
		}
		return ClaimDiagnosis.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimDiagnosis else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.diagnosis, from: o.diagnosis)
        sequence.value = o.sequence.value
    }
}


/**
 *  Goods and Services.
 *
 *  First tier of goods and services.
 */
open class ClaimItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimItem" }
	}

    @objc public dynamic var bodySite: Coding?
    public func upsert(bodySite: Coding?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }
    public let detail = RealmSwift.List<ClaimItemDetail>()
    public let diagnosisLinkId = RealmSwift.List<RealmInt>()
    @objc public dynamic var factor: RealmDecimal?
    public let modifier = RealmSwift.List<Coding>()
    @objc public dynamic var net: Quantity?
    public func upsert(net: Quantity?) {
        upsert(prop: &self.net, val: net)
    }
    @objc public dynamic var points: RealmDecimal?
    @objc public dynamic var prosthesis: ClaimItemProsthesis?
    public func upsert(prosthesis: ClaimItemProsthesis?) {
        upsert(prop: &self.prosthesis, val: prosthesis)
    }
    @objc public dynamic var provider: Reference?
    public func upsert(provider: Reference?) {
        upsert(prop: &self.provider, val: provider)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let sequence = RealmOptional<Int>()
    @objc public dynamic var service: Coding?
    public func upsert(service: Coding?) {
        upsert(prop: &self.service, val: service)
    }
    @objc public dynamic var serviceDate: FHIRDate?
    public let subSite = RealmSwift.List<Coding>()
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var udi: Coding?
    public func upsert(udi: Coding?) {
        upsert(prop: &self.udi, val: udi)
    }
    @objc public dynamic var unitPrice: Quantity?
    public func upsert(unitPrice: Quantity?) {
        upsert(prop: &self.unitPrice, val: unitPrice)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequence: Int, service: Coding, type: Coding) {
        self.init()
        self.sequence.value = sequence
        self.service = service
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySite = "bodySite"
        case detail = "detail"
        case diagnosisLinkId = "diagnosisLinkId"
        case factor = "factor"
        case modifier = "modifier"
        case net = "net"
        case points = "points"
        case prosthesis = "prosthesis"
        case provider = "provider"
        case quantity = "quantity"
        case sequence = "sequence"
        case service = "service"
        case serviceDate = "serviceDate"
        case subSite = "subSite"
        case type = "type"
        case udi = "udi"
        case unitPrice = "unitPrice"
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

        self.bodySite = try container.decodeIfPresent(Coding.self, forKey: .bodySite)
        self.detail.append(objectsIn: try container.decodeIfPresent([ClaimItemDetail].self, forKey: .detail) ?? [])
        self.diagnosisLinkId.append(objectsIn: try container.decodeIfPresent([RealmInt].self, forKey: .diagnosisLinkId) ?? [])
        self.factor = try container.decodeIfPresent(RealmDecimal.self, forKey: .factor)
        self.modifier.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .modifier) ?? [])
        self.net = try container.decodeIfPresent(Quantity.self, forKey: .net)
        self.points = try container.decodeIfPresent(RealmDecimal.self, forKey: .points)
        self.prosthesis = try container.decodeIfPresent(ClaimItemProsthesis.self, forKey: .prosthesis)
        self.provider = try container.decodeIfPresent(Reference.self, forKey: .provider)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
        self.service = try container.decodeIfPresent(Coding.self, forKey: .service)
        self.serviceDate = try container.decodeIfPresent(FHIRDate.self, forKey: .serviceDate)
        self.subSite.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .subSite) ?? [])
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
        self.udi = try container.decodeIfPresent(Coding.self, forKey: .udi)
        self.unitPrice = try container.decodeIfPresent(Quantity.self, forKey: .unitPrice)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encode(Array(self.diagnosisLinkId), forKey: .diagnosisLinkId)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encode(Array(self.modifier), forKey: .modifier)
        try container.encodeIfPresent(self.net, forKey: .net)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.prosthesis, forKey: .prosthesis)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
        try container.encodeIfPresent(self.service, forKey: .service)
        try container.encodeIfPresent(self.serviceDate, forKey: .serviceDate)
        try container.encode(Array(self.subSite), forKey: .subSite)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimItem. Will return empty instance: \(error))")
		}
		return ClaimItem.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.bodySite, from: o.bodySite)

        for (index, t) in o.detail.enumerated() {
            guard index < self.detail.count else {
                self.detail.append(t)
                continue
            }
            self.detail[index].populate(from: t)
        }
    
        if self.detail.count > o.detail.count {
            for i in self.detail.count...o.detail.count {
                let objectToRemove = self.detail[i]
                self.detail.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.diagnosisLinkId.enumerated() {
            guard index < self.diagnosisLinkId.count else {
                self.diagnosisLinkId.append(t)
                continue
            }
            self.diagnosisLinkId[index].populate(from: t)
        }
    
        if self.diagnosisLinkId.count > o.diagnosisLinkId.count {
            for i in self.diagnosisLinkId.count...o.diagnosisLinkId.count {
                let objectToRemove = self.diagnosisLinkId[i]
                self.diagnosisLinkId.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        factor = o.factor

        for (index, t) in o.modifier.enumerated() {
            guard index < self.modifier.count else {
                self.modifier.append(t)
                continue
            }
            self.modifier[index].populate(from: t)
        }
    
        if self.modifier.count > o.modifier.count {
            for i in self.modifier.count...o.modifier.count {
                let objectToRemove = self.modifier[i]
                self.modifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.net, from: o.net)
        points = o.points
        FireKit.populate(&self.prosthesis, from: o.prosthesis)
        FireKit.populate(&self.provider, from: o.provider)
        FireKit.populate(&self.quantity, from: o.quantity)
        sequence.value = o.sequence.value
        FireKit.populate(&self.service, from: o.service)
        FireKit.populate(&self.serviceDate, from: o.serviceDate)

        for (index, t) in o.subSite.enumerated() {
            guard index < self.subSite.count else {
                self.subSite.append(t)
                continue
            }
            self.subSite[index].populate(from: t)
        }
    
        if self.subSite.count > o.subSite.count {
            for i in self.subSite.count...o.subSite.count {
                let objectToRemove = self.subSite[i]
                self.subSite.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.type, from: o.type)
        FireKit.populate(&self.udi, from: o.udi)
        FireKit.populate(&self.unitPrice, from: o.unitPrice)
    }
}


/**
 *  Additional items.
 *
 *  Second tier of goods and services.
 */
open class ClaimItemDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimItemDetail" }
	}

    @objc public dynamic var factor: RealmDecimal?
    @objc public dynamic var net: Quantity?
    public func upsert(net: Quantity?) {
        upsert(prop: &self.net, val: net)
    }
    @objc public dynamic var points: RealmDecimal?
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let sequence = RealmOptional<Int>()
    @objc public dynamic var service: Coding?
    public func upsert(service: Coding?) {
        upsert(prop: &self.service, val: service)
    }
    public let subDetail = RealmSwift.List<ClaimItemDetailSubDetail>()
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var udi: Coding?
    public func upsert(udi: Coding?) {
        upsert(prop: &self.udi, val: udi)
    }
    @objc public dynamic var unitPrice: Quantity?
    public func upsert(unitPrice: Quantity?) {
        upsert(prop: &self.unitPrice, val: unitPrice)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequence: Int, service: Coding, type: Coding) {
        self.init()
        self.sequence.value = sequence
        self.service = service
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case factor = "factor"
        case net = "net"
        case points = "points"
        case quantity = "quantity"
        case sequence = "sequence"
        case service = "service"
        case subDetail = "subDetail"
        case type = "type"
        case udi = "udi"
        case unitPrice = "unitPrice"
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

        self.factor = try container.decodeIfPresent(RealmDecimal.self, forKey: .factor)
        self.net = try container.decodeIfPresent(Quantity.self, forKey: .net)
        self.points = try container.decodeIfPresent(RealmDecimal.self, forKey: .points)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
        self.service = try container.decodeIfPresent(Coding.self, forKey: .service)
        self.subDetail.append(objectsIn: try container.decodeIfPresent([ClaimItemDetailSubDetail].self, forKey: .subDetail) ?? [])
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
        self.udi = try container.decodeIfPresent(Coding.self, forKey: .udi)
        self.unitPrice = try container.decodeIfPresent(Quantity.self, forKey: .unitPrice)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encodeIfPresent(self.net, forKey: .net)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
        try container.encodeIfPresent(self.service, forKey: .service)
        try container.encode(Array(self.subDetail), forKey: .subDetail)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimItemDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimItemDetail. Will return empty instance: \(error))")
		}
		return ClaimItemDetail.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimItemDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        factor = o.factor
        FireKit.populate(&self.net, from: o.net)
        points = o.points
        FireKit.populate(&self.quantity, from: o.quantity)
        sequence.value = o.sequence.value
        FireKit.populate(&self.service, from: o.service)

        for (index, t) in o.subDetail.enumerated() {
            guard index < self.subDetail.count else {
                self.subDetail.append(t)
                continue
            }
            self.subDetail[index].populate(from: t)
        }
    
        if self.subDetail.count > o.subDetail.count {
            for i in self.subDetail.count...o.subDetail.count {
                let objectToRemove = self.subDetail[i]
                self.subDetail.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.type, from: o.type)
        FireKit.populate(&self.udi, from: o.udi)
        FireKit.populate(&self.unitPrice, from: o.unitPrice)
    }
}


/**
 *  Additional items.
 *
 *  Third tier of goods and services.
 */
open class ClaimItemDetailSubDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimItemDetailSubDetail" }
	}

    @objc public dynamic var factor: RealmDecimal?
    @objc public dynamic var net: Quantity?
    public func upsert(net: Quantity?) {
        upsert(prop: &self.net, val: net)
    }
    @objc public dynamic var points: RealmDecimal?
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let sequence = RealmOptional<Int>()
    @objc public dynamic var service: Coding?
    public func upsert(service: Coding?) {
        upsert(prop: &self.service, val: service)
    }
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var udi: Coding?
    public func upsert(udi: Coding?) {
        upsert(prop: &self.udi, val: udi)
    }
    @objc public dynamic var unitPrice: Quantity?
    public func upsert(unitPrice: Quantity?) {
        upsert(prop: &self.unitPrice, val: unitPrice)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequence: Int, service: Coding, type: Coding) {
        self.init()
        self.sequence.value = sequence
        self.service = service
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case factor = "factor"
        case net = "net"
        case points = "points"
        case quantity = "quantity"
        case sequence = "sequence"
        case service = "service"
        case type = "type"
        case udi = "udi"
        case unitPrice = "unitPrice"
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

        self.factor = try container.decodeIfPresent(RealmDecimal.self, forKey: .factor)
        self.net = try container.decodeIfPresent(Quantity.self, forKey: .net)
        self.points = try container.decodeIfPresent(RealmDecimal.self, forKey: .points)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
        self.service = try container.decodeIfPresent(Coding.self, forKey: .service)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
        self.udi = try container.decodeIfPresent(Coding.self, forKey: .udi)
        self.unitPrice = try container.decodeIfPresent(Quantity.self, forKey: .unitPrice)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encodeIfPresent(self.net, forKey: .net)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
        try container.encodeIfPresent(self.service, forKey: .service)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimItemDetailSubDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimItemDetailSubDetail. Will return empty instance: \(error))")
		}
		return ClaimItemDetailSubDetail.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimItemDetailSubDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        factor = o.factor
        FireKit.populate(&self.net, from: o.net)
        points = o.points
        FireKit.populate(&self.quantity, from: o.quantity)
        sequence.value = o.sequence.value
        FireKit.populate(&self.service, from: o.service)
        FireKit.populate(&self.type, from: o.type)
        FireKit.populate(&self.udi, from: o.udi)
        FireKit.populate(&self.unitPrice, from: o.unitPrice)
    }
}


/**
 *  Prosthetic details.
 *
 *  The materials and placement date of prior fixed prosthesis.
 */
open class ClaimItemProsthesis: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimItemProsthesis" }
	}

    public let initial = RealmOptional<Bool>()
    @objc public dynamic var priorDate: FHIRDate?
    @objc public dynamic var priorMaterial: Coding?
    public func upsert(priorMaterial: Coding?) {
        upsert(prop: &self.priorMaterial, val: priorMaterial)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case initial = "initial"
        case priorDate = "priorDate"
        case priorMaterial = "priorMaterial"
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

        self.initial.value = try container.decodeIfPresent(Bool.self, forKey: .initial)
        self.priorDate = try container.decodeIfPresent(FHIRDate.self, forKey: .priorDate)
        self.priorMaterial = try container.decodeIfPresent(Coding.self, forKey: .priorMaterial)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.initial.value, forKey: .initial)
        try container.encodeIfPresent(self.priorDate, forKey: .priorDate)
        try container.encodeIfPresent(self.priorMaterial, forKey: .priorMaterial)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimItemProsthesis.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimItemProsthesis. Will return empty instance: \(error))")
		}
		return ClaimItemProsthesis.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimItemProsthesis else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        initial.value = o.initial.value
        FireKit.populate(&self.priorDate, from: o.priorDate)
        FireKit.populate(&self.priorMaterial, from: o.priorMaterial)
    }
}


/**
 *  Only if type = oral.
 *
 *  A list of teeth which would be expected but are not found due to having been previously  extracted or for other
 *  reasons.
 */
open class ClaimMissingTeeth: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimMissingTeeth" }
	}

    @objc public dynamic var extractionDate: FHIRDate?
    @objc public dynamic var reason: Coding?
    public func upsert(reason: Coding?) {
        upsert(prop: &self.reason, val: reason)
    }
    @objc public dynamic var tooth: Coding?
    public func upsert(tooth: Coding?) {
        upsert(prop: &self.tooth, val: tooth)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(tooth: Coding) {
        self.init()
        self.tooth = tooth
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case extractionDate = "extractionDate"
        case reason = "reason"
        case tooth = "tooth"
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

        self.extractionDate = try container.decodeIfPresent(FHIRDate.self, forKey: .extractionDate)
        self.reason = try container.decodeIfPresent(Coding.self, forKey: .reason)
        self.tooth = try container.decodeIfPresent(Coding.self, forKey: .tooth)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.extractionDate, forKey: .extractionDate)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.tooth, forKey: .tooth)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimMissingTeeth.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimMissingTeeth. Will return empty instance: \(error))")
		}
		return ClaimMissingTeeth.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimMissingTeeth else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.extractionDate, from: o.extractionDate)
        FireKit.populate(&self.reason, from: o.reason)
        FireKit.populate(&self.tooth, from: o.tooth)
    }
}


/**
 *  Payee.
 *
 *  The party to be reimbursed for the services.
 */
open class ClaimPayee: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimPayee" }
	}

    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var person: Reference?
    public func upsert(person: Reference?) {
        upsert(prop: &self.person, val: person)
    }
    @objc public dynamic var provider: Reference?
    public func upsert(provider: Reference?) {
        upsert(prop: &self.provider, val: provider)
    }
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case organization = "organization"
        case person = "person"
        case provider = "provider"
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

        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.person = try container.decodeIfPresent(Reference.self, forKey: .person)
        self.provider = try container.decodeIfPresent(Reference.self, forKey: .provider)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.person, forKey: .person)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimPayee.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimPayee. Will return empty instance: \(error))")
		}
		return ClaimPayee.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ClaimPayee else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.person, from: o.person)
        FireKit.populate(&self.provider, from: o.provider)
        FireKit.populate(&self.type, from: o.type)
    }
}

