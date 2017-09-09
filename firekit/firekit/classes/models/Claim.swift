//
//  Claim.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Claim) on 2017-09-09.
//  2017, SMART Health IT.
//

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
        self.school = try container.decodeIfPresent(String.self, forKey: .school)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.accident, forKey: .accident)
        try container.encodeIfPresent(self.accidentType, forKey: .accidentType)
        try container.encode(self.additionalMaterials.flatMap { $0 }, forKey: .additionalMaterials)
        try container.encode(self.condition.flatMap { $0 }, forKey: .condition)
        try container.encode(self.coverage.flatMap { $0 }, forKey: .coverage)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encode(self.diagnosis.flatMap { $0 }, forKey: .diagnosis)
        try container.encodeIfPresent(self.enterer, forKey: .enterer)
        try container.encode(self.exception.flatMap { $0 }, forKey: .exception)
        try container.encodeIfPresent(self.facility, forKey: .facility)
        try container.encodeIfPresent(self.fundsReserve, forKey: .fundsReserve)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encode(self.interventionException.flatMap { $0 }, forKey: .interventionException)
        try container.encode(self.item.flatMap { $0 }, forKey: .item)
        try container.encode(self.missingTeeth.flatMap { $0 }, forKey: .missingTeeth)
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["accident"] {
				presentKeys.insert("accident")
				if let val = exist as? String {
					self.accident = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "accident", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["accidentType"] {
				presentKeys.insert("accidentType")
				if let val = exist as? FHIRJSON {
					upsert(accidentType: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "accidentType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["additionalMaterials"] {
				presentKeys.insert("additionalMaterials")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.additionalMaterials) }
						self.additionalMaterials.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "additionalMaterials", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["condition"] {
				presentKeys.insert("condition")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.condition) }
						self.condition.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "condition", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["coverage"] {
				presentKeys.insert("coverage")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimCoverage.instantiate(fromArray: val, owner: self) as? [ClaimCoverage] {
						if let realm = self.realm { realm.delete(self.coverage) }
						self.coverage.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "coverage", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["diagnosis"] {
				presentKeys.insert("diagnosis")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimDiagnosis.instantiate(fromArray: val, owner: self) as? [ClaimDiagnosis] {
						if let realm = self.realm { realm.delete(self.diagnosis) }
						self.diagnosis.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "diagnosis", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["enterer"] {
				presentKeys.insert("enterer")
				if let val = exist as? FHIRJSON {
					upsert(enterer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "enterer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exception"] {
				presentKeys.insert("exception")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.exception) }
						self.exception.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "exception", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["facility"] {
				presentKeys.insert("facility")
				if let val = exist as? FHIRJSON {
					upsert(facility: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "facility", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fundsReserve"] {
				presentKeys.insert("fundsReserve")
				if let val = exist as? FHIRJSON {
					upsert(fundsReserve: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fundsReserve", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["interventionException"] {
				presentKeys.insert("interventionException")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.interventionException) }
						self.interventionException.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "interventionException", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimItem.instantiate(fromArray: val, owner: self) as? [ClaimItem] {
						if let realm = self.realm { realm.delete(self.item) }
						self.item.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["missingTeeth"] {
				presentKeys.insert("missingTeeth")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimMissingTeeth.instantiate(fromArray: val, owner: self) as? [ClaimMissingTeeth] {
						if let realm = self.realm { realm.delete(self.missingTeeth) }
						self.missingTeeth.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "missingTeeth", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["organization"] {
				presentKeys.insert("organization")
				if let val = exist as? FHIRJSON {
					upsert(organization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "organization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["originalPrescription"] {
				presentKeys.insert("originalPrescription")
				if let val = exist as? FHIRJSON {
					upsert(originalPrescription: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "originalPrescription", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["originalRuleset"] {
				presentKeys.insert("originalRuleset")
				if let val = exist as? FHIRJSON {
					upsert(originalRuleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "originalRuleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					upsert(patient: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "patient"))
			}
			if let exist = js["payee"] {
				presentKeys.insert("payee")
				if let val = exist as? FHIRJSON {
					upsert(payee: ClaimPayee(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "payee", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prescription"] {
				presentKeys.insert("prescription")
				if let val = exist as? FHIRJSON {
					upsert(prescription: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "prescription", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? FHIRJSON {
					upsert(priority: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["provider"] {
				presentKeys.insert("provider")
				if let val = exist as? FHIRJSON {
					upsert(provider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "provider", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["referral"] {
				presentKeys.insert("referral")
				if let val = exist as? FHIRJSON {
					upsert(referral: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "referral", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ruleset"] {
				presentKeys.insert("ruleset")
				if let val = exist as? FHIRJSON {
					upsert(ruleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "ruleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["school"] {
				presentKeys.insert("school")
				if let val = exist as? String {
					self.school = val
				}
				else {
					errors.append(FHIRJSONError(key: "school", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					upsert(target: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["use"] {
				presentKeys.insert("use")
				if let val = exist as? String {
					self.use = val
				}
				else {
					errors.append(FHIRJSONError(key: "use", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let accident = self.accident {
			json["accident"] = accident.asJSON()
		}
		if let accidentType = self.accidentType {
			json["accidentType"] = accidentType.asJSON()
		}
		if additionalMaterials.count > 0 {
			json["additionalMaterials"] = Array(additionalMaterials.map() { $0.asJSON() })
		}
		if condition.count > 0 {
			json["condition"] = Array(condition.map() { $0.asJSON() })
		}
		if coverage.count > 0 {
			json["coverage"] = Array(coverage.map() { $0.asJSON() })
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if diagnosis.count > 0 {
			json["diagnosis"] = Array(diagnosis.map() { $0.asJSON() })
		}
		if let enterer = self.enterer {
			json["enterer"] = enterer.asJSON()
		}
		if exception.count > 0 {
			json["exception"] = Array(exception.map() { $0.asJSON() })
		}
		if let facility = self.facility {
			json["facility"] = facility.asJSON()
		}
		if let fundsReserve = self.fundsReserve {
			json["fundsReserve"] = fundsReserve.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if interventionException.count > 0 {
			json["interventionException"] = Array(interventionException.map() { $0.asJSON() })
		}
		if item.count > 0 {
			json["item"] = Array(item.map() { $0.asJSON() })
		}
		if missingTeeth.count > 0 {
			json["missingTeeth"] = Array(missingTeeth.map() { $0.asJSON() })
		}
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let originalPrescription = self.originalPrescription {
			json["originalPrescription"] = originalPrescription.asJSON()
		}
		if let originalRuleset = self.originalRuleset {
			json["originalRuleset"] = originalRuleset.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let payee = self.payee {
			json["payee"] = payee.asJSON()
		}
		if let prescription = self.prescription {
			json["prescription"] = prescription.asJSON()
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if let provider = self.provider {
			json["provider"] = provider.asJSON()
		}
		if let referral = self.referral {
			json["referral"] = referral.asJSON()
		}
		if let ruleset = self.ruleset {
			json["ruleset"] = ruleset.asJSON()
		}
		if let school = self.school {
			json["school"] = school.asJSON()
		}
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		
		return json
	}
*/
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
        self.focal.value = try container.decodeIfPresent(Bool.self, forKey: .focal)
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
        try container.encode(self.preAuthRef.flatMap { $0.value }, forKey: .preAuthRef)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["businessArrangement"] {
				presentKeys.insert("businessArrangement")
				if let val = exist as? String {
					self.businessArrangement = val
				}
				else {
					errors.append(FHIRJSONError(key: "businessArrangement", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["claimResponse"] {
				presentKeys.insert("claimResponse")
				if let val = exist as? FHIRJSON {
					upsert(claimResponse: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "claimResponse", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["coverage"] {
				presentKeys.insert("coverage")
				if let val = exist as? FHIRJSON {
					upsert(coverage: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "coverage", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "coverage"))
			}
			if let exist = js["focal"] {
				presentKeys.insert("focal")
				if let val = exist as? Bool {
					self.focal.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "focal", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "focal"))
			}
			if let exist = js["originalRuleset"] {
				presentKeys.insert("originalRuleset")
				if let val = exist as? FHIRJSON {
					upsert(originalRuleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "originalRuleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["preAuthRef"] {
				presentKeys.insert("preAuthRef")
				if let val = exist as? [String] {
					self.preAuthRef.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "preAuthRef", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["relationship"] {
				presentKeys.insert("relationship")
				if let val = exist as? FHIRJSON {
					upsert(relationship: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "relationship", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "relationship"))
			}
			if let exist = js["sequence"] {
				presentKeys.insert("sequence")
				if let val = exist as? Int {
					self.sequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequence", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequence"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let businessArrangement = self.businessArrangement {
			json["businessArrangement"] = businessArrangement.asJSON()
		}
		if let claimResponse = self.claimResponse {
			json["claimResponse"] = claimResponse.asJSON()
		}
		if let coverage = self.coverage {
			json["coverage"] = coverage.asJSON()
		}
		if let focal = self.focal.value {
			json["focal"] = focal.asJSON()
		}
		if let originalRuleset = self.originalRuleset {
			json["originalRuleset"] = originalRuleset.asJSON()
		}
		if preAuthRef.count > 0 {
			json["preAuthRef"] = Array(preAuthRef.map() { $0.value })
		}
		if let relationship = self.relationship {
			json["relationship"] = relationship.asJSON()
		}
		if let sequence = self.sequence.value {
			json["sequence"] = sequence.asJSON()
		}
		
		return json
	}
*/
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
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.diagnosis, forKey: .diagnosis)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["diagnosis"] {
				presentKeys.insert("diagnosis")
				if let val = exist as? FHIRJSON {
					upsert(diagnosis: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "diagnosis", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "diagnosis"))
			}
			if let exist = js["sequence"] {
				presentKeys.insert("sequence")
				if let val = exist as? Int {
					self.sequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequence", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequence"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let diagnosis = self.diagnosis {
			json["diagnosis"] = diagnosis.asJSON()
		}
		if let sequence = self.sequence.value {
			json["sequence"] = sequence.asJSON()
		}
		
		return json
	}
*/
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
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encode(self.detail.flatMap { $0 }, forKey: .detail)
        try container.encode(self.diagnosisLinkId.flatMap { $0.value }, forKey: .diagnosisLinkId)
        try container.encodeIfPresent(self.factor, forKey: .factor)
        try container.encode(self.modifier.flatMap { $0 }, forKey: .modifier)
        try container.encodeIfPresent(self.net, forKey: .net)
        try container.encodeIfPresent(self.points, forKey: .points)
        try container.encodeIfPresent(self.prosthesis, forKey: .prosthesis)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encodeIfPresent(self.sequence.value, forKey: .sequence)
        try container.encodeIfPresent(self.service, forKey: .service)
        try container.encodeIfPresent(self.serviceDate, forKey: .serviceDate)
        try container.encode(self.subSite.flatMap { $0 }, forKey: .subSite)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? FHIRJSON {
					upsert(bodySite: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimItemDetail.instantiate(fromArray: val, owner: self) as? [ClaimItemDetail] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["diagnosisLinkId"] {
				presentKeys.insert("diagnosisLinkId")
				if let val = exist as? [Int] {
					self.diagnosisLinkId.append(objectsIn: val.map{ RealmInt(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "diagnosisLinkId", wants: Array<Int>.self, has: type(of: exist)))
				}
			}
			if let exist = js["factor"] {
				presentKeys.insert("factor")
				if let val = exist as? NSNumber {
					self.factor = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "factor", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["modifier"] {
				presentKeys.insert("modifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.modifier) }
						self.modifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "modifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["net"] {
				presentKeys.insert("net")
				if let val = exist as? FHIRJSON {
					upsert(net: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "net", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["points"] {
				presentKeys.insert("points")
				if let val = exist as? NSNumber {
					self.points = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "points", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["prosthesis"] {
				presentKeys.insert("prosthesis")
				if let val = exist as? FHIRJSON {
					upsert(prosthesis: ClaimItemProsthesis(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "prosthesis", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["provider"] {
				presentKeys.insert("provider")
				if let val = exist as? FHIRJSON {
					upsert(provider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "provider", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["sequence"] {
				presentKeys.insert("sequence")
				if let val = exist as? Int {
					self.sequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequence", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequence"))
			}
			if let exist = js["service"] {
				presentKeys.insert("service")
				if let val = exist as? FHIRJSON {
					upsert(service: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "service", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "service"))
			}
			if let exist = js["serviceDate"] {
				presentKeys.insert("serviceDate")
				if let val = exist as? String {
					self.serviceDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "serviceDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["subSite"] {
				presentKeys.insert("subSite")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.subSite) }
						self.subSite.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subSite", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["udi"] {
				presentKeys.insert("udi")
				if let val = exist as? FHIRJSON {
					upsert(udi: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "udi", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["unitPrice"] {
				presentKeys.insert("unitPrice")
				if let val = exist as? FHIRJSON {
					upsert(unitPrice: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unitPrice", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let bodySite = self.bodySite {
			json["bodySite"] = bodySite.asJSON()
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if diagnosisLinkId.count > 0 {
			json["diagnosisLinkId"] = Array(diagnosisLinkId.map() { $0.value })
		}
		if let factor = self.factor {
			json["factor"] = factor.asJSON()
		}
		if modifier.count > 0 {
			json["modifier"] = Array(modifier.map() { $0.asJSON() })
		}
		if let net = self.net {
			json["net"] = net.asJSON()
		}
		if let points = self.points {
			json["points"] = points.asJSON()
		}
		if let prosthesis = self.prosthesis {
			json["prosthesis"] = prosthesis.asJSON()
		}
		if let provider = self.provider {
			json["provider"] = provider.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let sequence = self.sequence.value {
			json["sequence"] = sequence.asJSON()
		}
		if let service = self.service {
			json["service"] = service.asJSON()
		}
		if let serviceDate = self.serviceDate {
			json["serviceDate"] = serviceDate.asJSON()
		}
		if subSite.count > 0 {
			json["subSite"] = Array(subSite.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let udi = self.udi {
			json["udi"] = udi.asJSON()
		}
		if let unitPrice = self.unitPrice {
			json["unitPrice"] = unitPrice.asJSON()
		}
		
		return json
	}
*/
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
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
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
        try container.encode(self.subDetail.flatMap { $0 }, forKey: .subDetail)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.unitPrice, forKey: .unitPrice)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["factor"] {
				presentKeys.insert("factor")
				if let val = exist as? NSNumber {
					self.factor = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "factor", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["net"] {
				presentKeys.insert("net")
				if let val = exist as? FHIRJSON {
					upsert(net: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "net", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["points"] {
				presentKeys.insert("points")
				if let val = exist as? NSNumber {
					self.points = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "points", wants: NSNumber.self, has: type(of: exist)))
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
			if let exist = js["sequence"] {
				presentKeys.insert("sequence")
				if let val = exist as? Int {
					self.sequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequence", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequence"))
			}
			if let exist = js["service"] {
				presentKeys.insert("service")
				if let val = exist as? FHIRJSON {
					upsert(service: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "service", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "service"))
			}
			if let exist = js["subDetail"] {
				presentKeys.insert("subDetail")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimItemDetailSubDetail.instantiate(fromArray: val, owner: self) as? [ClaimItemDetailSubDetail] {
						if let realm = self.realm { realm.delete(self.subDetail) }
						self.subDetail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subDetail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["udi"] {
				presentKeys.insert("udi")
				if let val = exist as? FHIRJSON {
					upsert(udi: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "udi", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["unitPrice"] {
				presentKeys.insert("unitPrice")
				if let val = exist as? FHIRJSON {
					upsert(unitPrice: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unitPrice", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let factor = self.factor {
			json["factor"] = factor.asJSON()
		}
		if let net = self.net {
			json["net"] = net.asJSON()
		}
		if let points = self.points {
			json["points"] = points.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let sequence = self.sequence.value {
			json["sequence"] = sequence.asJSON()
		}
		if let service = self.service {
			json["service"] = service.asJSON()
		}
		if subDetail.count > 0 {
			json["subDetail"] = Array(subDetail.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let udi = self.udi {
			json["udi"] = udi.asJSON()
		}
		if let unitPrice = self.unitPrice {
			json["unitPrice"] = unitPrice.asJSON()
		}
		
		return json
	}
*/
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
        self.sequence.value = try container.decodeIfPresent(Int.self, forKey: .sequence)
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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["factor"] {
				presentKeys.insert("factor")
				if let val = exist as? NSNumber {
					self.factor = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "factor", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["net"] {
				presentKeys.insert("net")
				if let val = exist as? FHIRJSON {
					upsert(net: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "net", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["points"] {
				presentKeys.insert("points")
				if let val = exist as? NSNumber {
					self.points = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "points", wants: NSNumber.self, has: type(of: exist)))
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
			if let exist = js["sequence"] {
				presentKeys.insert("sequence")
				if let val = exist as? Int {
					self.sequence.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequence", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequence"))
			}
			if let exist = js["service"] {
				presentKeys.insert("service")
				if let val = exist as? FHIRJSON {
					upsert(service: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "service", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "service"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["udi"] {
				presentKeys.insert("udi")
				if let val = exist as? FHIRJSON {
					upsert(udi: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "udi", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["unitPrice"] {
				presentKeys.insert("unitPrice")
				if let val = exist as? FHIRJSON {
					upsert(unitPrice: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unitPrice", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let factor = self.factor {
			json["factor"] = factor.asJSON()
		}
		if let net = self.net {
			json["net"] = net.asJSON()
		}
		if let points = self.points {
			json["points"] = points.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if let sequence = self.sequence.value {
			json["sequence"] = sequence.asJSON()
		}
		if let service = self.service {
			json["service"] = service.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let udi = self.udi {
			json["udi"] = udi.asJSON()
		}
		if let unitPrice = self.unitPrice {
			json["unitPrice"] = unitPrice.asJSON()
		}
		
		return json
	}
*/
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.initial.value, forKey: .initial)
        try container.encodeIfPresent(self.priorDate, forKey: .priorDate)
        try container.encodeIfPresent(self.priorMaterial, forKey: .priorMaterial)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["initial"] {
				presentKeys.insert("initial")
				if let val = exist as? Bool {
					self.initial.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "initial", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["priorDate"] {
				presentKeys.insert("priorDate")
				if let val = exist as? String {
					self.priorDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "priorDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["priorMaterial"] {
				presentKeys.insert("priorMaterial")
				if let val = exist as? FHIRJSON {
					upsert(priorMaterial: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "priorMaterial", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let initial = self.initial.value {
			json["initial"] = initial.asJSON()
		}
		if let priorDate = self.priorDate {
			json["priorDate"] = priorDate.asJSON()
		}
		if let priorMaterial = self.priorMaterial {
			json["priorMaterial"] = priorMaterial.asJSON()
		}
		
		return json
	}
*/
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.extractionDate, forKey: .extractionDate)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encodeIfPresent(self.tooth, forKey: .tooth)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["extractionDate"] {
				presentKeys.insert("extractionDate")
				if let val = exist as? String {
					self.extractionDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "extractionDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? FHIRJSON {
					upsert(reason: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["tooth"] {
				presentKeys.insert("tooth")
				if let val = exist as? FHIRJSON {
					upsert(tooth: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "tooth", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "tooth"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let extractionDate = self.extractionDate {
			json["extractionDate"] = extractionDate.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if let tooth = self.tooth {
			json["tooth"] = tooth.asJSON()
		}
		
		return json
	}
*/
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
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.person, forKey: .person)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["organization"] {
				presentKeys.insert("organization")
				if let val = exist as? FHIRJSON {
					upsert(organization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "organization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["person"] {
				presentKeys.insert("person")
				if let val = exist as? FHIRJSON {
					upsert(person: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "person", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["provider"] {
				presentKeys.insert("provider")
				if let val = exist as? FHIRJSON {
					upsert(provider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "provider", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let person = self.person {
			json["person"] = person.asJSON()
		}
		if let provider = self.provider {
			json["provider"] = provider.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
}

