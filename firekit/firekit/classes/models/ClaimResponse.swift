//
//  ClaimResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ClaimResponse) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Remittance resource.
 *
 *  This resource provides the adjudication details from the processing of a Claim resource.
 */
open class ClaimResponse: DomainResource {
	override open class var resourceType: String {
		get { return "ClaimResponse" }
	}

    public let addItem = RealmSwift.List<ClaimResponseAddItem>()
    public let coverage = RealmSwift.List<ClaimResponseCoverage>()
    @objc public dynamic var created: DateTime?
    @objc public dynamic var disposition: String?
    public let error = RealmSwift.List<ClaimResponseError>()
    @objc public dynamic var form: Coding?
    public func upsert(form: Coding?) {
        upsert(prop: &self.form, val: form)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let item = RealmSwift.List<ClaimResponseItem>()
    public let note = RealmSwift.List<ClaimResponseNote>()
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    @objc public dynamic var outcome: String?
    @objc public dynamic var payeeType: Coding?
    public func upsert(payeeType: Coding?) {
        upsert(prop: &self.payeeType, val: payeeType)
    }
    @objc public dynamic var paymentAdjustment: Quantity?
    public func upsert(paymentAdjustment: Quantity?) {
        upsert(prop: &self.paymentAdjustment, val: paymentAdjustment)
    }
    @objc public dynamic var paymentAdjustmentReason: Coding?
    public func upsert(paymentAdjustmentReason: Coding?) {
        upsert(prop: &self.paymentAdjustmentReason, val: paymentAdjustmentReason)
    }
    @objc public dynamic var paymentAmount: Quantity?
    public func upsert(paymentAmount: Quantity?) {
        upsert(prop: &self.paymentAmount, val: paymentAmount)
    }
    @objc public dynamic var paymentDate: FHIRDate?
    @objc public dynamic var paymentRef: Identifier?
    public func upsert(paymentRef: Identifier?) {
        upsert(prop: &self.paymentRef, val: paymentRef)
    }
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var requestOrganization: Reference?
    public func upsert(requestOrganization: Reference?) {
        upsert(prop: &self.requestOrganization, val: requestOrganization)
    }
    @objc public dynamic var requestProvider: Reference?
    public func upsert(requestProvider: Reference?) {
        upsert(prop: &self.requestProvider, val: requestProvider)
    }
    @objc public dynamic var reserved: Coding?
    public func upsert(reserved: Coding?) {
        upsert(prop: &self.reserved, val: reserved)
    }
    @objc public dynamic var ruleset: Coding?
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }
    @objc public dynamic var totalBenefit: Quantity?
    public func upsert(totalBenefit: Quantity?) {
        upsert(prop: &self.totalBenefit, val: totalBenefit)
    }
    @objc public dynamic var totalCost: Quantity?
    public func upsert(totalCost: Quantity?) {
        upsert(prop: &self.totalCost, val: totalCost)
    }
    @objc public dynamic var unallocDeductable: Quantity?
    public func upsert(unallocDeductable: Quantity?) {
        upsert(prop: &self.unallocDeductable, val: unallocDeductable)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case addItem = "addItem"
        case coverage = "coverage"
        case created = "created"
        case disposition = "disposition"
        case error = "error"
        case form = "form"
        case identifier = "identifier"
        case item = "item"
        case note = "note"
        case organization = "organization"
        case originalRuleset = "originalRuleset"
        case outcome = "outcome"
        case payeeType = "payeeType"
        case paymentAdjustment = "paymentAdjustment"
        case paymentAdjustmentReason = "paymentAdjustmentReason"
        case paymentAmount = "paymentAmount"
        case paymentDate = "paymentDate"
        case paymentRef = "paymentRef"
        case request = "request"
        case requestOrganization = "requestOrganization"
        case requestProvider = "requestProvider"
        case reserved = "reserved"
        case ruleset = "ruleset"
        case totalBenefit = "totalBenefit"
        case totalCost = "totalCost"
        case unallocDeductable = "unallocDeductable"
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

        self.addItem.append(objectsIn: try container.decodeIfPresent([ClaimResponseAddItem].self, forKey: .addItem) ?? [])
        self.coverage.append(objectsIn: try container.decodeIfPresent([ClaimResponseCoverage].self, forKey: .coverage) ?? [])
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.disposition = try container.decodeIfPresent(String.self, forKey: .disposition)
        self.error.append(objectsIn: try container.decodeIfPresent([ClaimResponseError].self, forKey: .error) ?? [])
        self.form = try container.decodeIfPresent(Coding.self, forKey: .form)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.item.append(objectsIn: try container.decodeIfPresent([ClaimResponseItem].self, forKey: .item) ?? [])
        self.note.append(objectsIn: try container.decodeIfPresent([ClaimResponseNote].self, forKey: .note) ?? [])
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.outcome = try container.decodeIfPresent(String.self, forKey: .outcome)
        self.payeeType = try container.decodeIfPresent(Coding.self, forKey: .payeeType)
        self.paymentAdjustment = try container.decodeIfPresent(Quantity.self, forKey: .paymentAdjustment)
        self.paymentAdjustmentReason = try container.decodeIfPresent(Coding.self, forKey: .paymentAdjustmentReason)
        self.paymentAmount = try container.decodeIfPresent(Quantity.self, forKey: .paymentAmount)
        self.paymentDate = try container.decodeIfPresent(FHIRDate.self, forKey: .paymentDate)
        self.paymentRef = try container.decodeIfPresent(Identifier.self, forKey: .paymentRef)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.requestOrganization = try container.decodeIfPresent(Reference.self, forKey: .requestOrganization)
        self.requestProvider = try container.decodeIfPresent(Reference.self, forKey: .requestProvider)
        self.reserved = try container.decodeIfPresent(Coding.self, forKey: .reserved)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
        self.totalBenefit = try container.decodeIfPresent(Quantity.self, forKey: .totalBenefit)
        self.totalCost = try container.decodeIfPresent(Quantity.self, forKey: .totalCost)
        self.unallocDeductable = try container.decodeIfPresent(Quantity.self, forKey: .unallocDeductable)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.addItem), forKey: .addItem)
        try container.encode(Array(self.coverage), forKey: .coverage)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.disposition, forKey: .disposition)
        try container.encode(Array(self.error), forKey: .error)
        try container.encodeIfPresent(self.form, forKey: .form)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.item), forKey: .item)
        try container.encode(Array(self.note), forKey: .note)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.payeeType, forKey: .payeeType)
        try container.encodeIfPresent(self.paymentAdjustment, forKey: .paymentAdjustment)
        try container.encodeIfPresent(self.paymentAdjustmentReason, forKey: .paymentAdjustmentReason)
        try container.encodeIfPresent(self.paymentAmount, forKey: .paymentAmount)
        try container.encodeIfPresent(self.paymentDate, forKey: .paymentDate)
        try container.encodeIfPresent(self.paymentRef, forKey: .paymentRef)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.requestOrganization, forKey: .requestOrganization)
        try container.encodeIfPresent(self.requestProvider, forKey: .requestProvider)
        try container.encodeIfPresent(self.reserved, forKey: .reserved)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
        try container.encodeIfPresent(self.totalBenefit, forKey: .totalBenefit)
        try container.encodeIfPresent(self.totalCost, forKey: .totalCost)
        try container.encodeIfPresent(self.unallocDeductable, forKey: .unallocDeductable)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["addItem"] {
				presentKeys.insert("addItem")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseAddItem.instantiate(fromArray: val, owner: self) as? [ClaimResponseAddItem] {
						if let realm = self.realm { realm.delete(self.addItem) }
						self.addItem.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "addItem", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["coverage"] {
				presentKeys.insert("coverage")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseCoverage.instantiate(fromArray: val, owner: self) as? [ClaimResponseCoverage] {
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
			if let exist = js["disposition"] {
				presentKeys.insert("disposition")
				if let val = exist as? String {
					self.disposition = val
				}
				else {
					errors.append(FHIRJSONError(key: "disposition", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["error"] {
				presentKeys.insert("error")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseError.instantiate(fromArray: val, owner: self) as? [ClaimResponseError] {
						if let realm = self.realm { realm.delete(self.error) }
						self.error.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "error", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["form"] {
				presentKeys.insert("form")
				if let val = exist as? FHIRJSON {
					upsert(form: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "form", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseItem.instantiate(fromArray: val, owner: self) as? [ClaimResponseItem] {
						if let realm = self.realm { realm.delete(self.item) }
						self.item.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseNote.instantiate(fromArray: val, owner: self) as? [ClaimResponseNote] {
						if let realm = self.realm { realm.delete(self.note) }
						self.note.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["originalRuleset"] {
				presentKeys.insert("originalRuleset")
				if let val = exist as? FHIRJSON {
					upsert(originalRuleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "originalRuleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? String {
					self.outcome = val
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["payeeType"] {
				presentKeys.insert("payeeType")
				if let val = exist as? FHIRJSON {
					upsert(payeeType: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "payeeType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["paymentAdjustment"] {
				presentKeys.insert("paymentAdjustment")
				if let val = exist as? FHIRJSON {
					upsert(paymentAdjustment: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "paymentAdjustment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["paymentAdjustmentReason"] {
				presentKeys.insert("paymentAdjustmentReason")
				if let val = exist as? FHIRJSON {
					upsert(paymentAdjustmentReason: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "paymentAdjustmentReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["paymentAmount"] {
				presentKeys.insert("paymentAmount")
				if let val = exist as? FHIRJSON {
					upsert(paymentAmount: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "paymentAmount", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["paymentDate"] {
				presentKeys.insert("paymentDate")
				if let val = exist as? String {
					self.paymentDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "paymentDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["paymentRef"] {
				presentKeys.insert("paymentRef")
				if let val = exist as? FHIRJSON {
					upsert(paymentRef: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "paymentRef", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					upsert(request: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestOrganization"] {
				presentKeys.insert("requestOrganization")
				if let val = exist as? FHIRJSON {
					upsert(requestOrganization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "requestOrganization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestProvider"] {
				presentKeys.insert("requestProvider")
				if let val = exist as? FHIRJSON {
					upsert(requestProvider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "requestProvider", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reserved"] {
				presentKeys.insert("reserved")
				if let val = exist as? FHIRJSON {
					upsert(reserved: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reserved", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["totalBenefit"] {
				presentKeys.insert("totalBenefit")
				if let val = exist as? FHIRJSON {
					upsert(totalBenefit: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "totalBenefit", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["totalCost"] {
				presentKeys.insert("totalCost")
				if let val = exist as? FHIRJSON {
					upsert(totalCost: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "totalCost", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["unallocDeductable"] {
				presentKeys.insert("unallocDeductable")
				if let val = exist as? FHIRJSON {
					upsert(unallocDeductable: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "unallocDeductable", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if addItem.count > 0 {
			json["addItem"] = Array(addItem.map() { $0.asJSON() })
		}
		if coverage.count > 0 {
			json["coverage"] = Array(coverage.map() { $0.asJSON() })
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if let disposition = self.disposition {
			json["disposition"] = disposition.asJSON()
		}
		if error.count > 0 {
			json["error"] = Array(error.map() { $0.asJSON() })
		}
		if let form = self.form {
			json["form"] = form.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if item.count > 0 {
			json["item"] = Array(item.map() { $0.asJSON() })
		}
		if note.count > 0 {
			json["note"] = Array(note.map() { $0.asJSON() })
		}
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let originalRuleset = self.originalRuleset {
			json["originalRuleset"] = originalRuleset.asJSON()
		}
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let payeeType = self.payeeType {
			json["payeeType"] = payeeType.asJSON()
		}
		if let paymentAdjustment = self.paymentAdjustment {
			json["paymentAdjustment"] = paymentAdjustment.asJSON()
		}
		if let paymentAdjustmentReason = self.paymentAdjustmentReason {
			json["paymentAdjustmentReason"] = paymentAdjustmentReason.asJSON()
		}
		if let paymentAmount = self.paymentAmount {
			json["paymentAmount"] = paymentAmount.asJSON()
		}
		if let paymentDate = self.paymentDate {
			json["paymentDate"] = paymentDate.asJSON()
		}
		if let paymentRef = self.paymentRef {
			json["paymentRef"] = paymentRef.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let requestOrganization = self.requestOrganization {
			json["requestOrganization"] = requestOrganization.asJSON()
		}
		if let requestProvider = self.requestProvider {
			json["requestProvider"] = requestProvider.asJSON()
		}
		if let reserved = self.reserved {
			json["reserved"] = reserved.asJSON()
		}
		if let ruleset = self.ruleset {
			json["ruleset"] = ruleset.asJSON()
		}
		if let totalBenefit = self.totalBenefit {
			json["totalBenefit"] = totalBenefit.asJSON()
		}
		if let totalCost = self.totalCost {
			json["totalCost"] = totalCost.asJSON()
		}
		if let unallocDeductable = self.unallocDeductable {
			json["unallocDeductable"] = unallocDeductable.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponse. Will return empty instance: \(error))")
		}
		return ClaimResponse.init()
	}
}


/**
 *  Insurer added line items.
 *
 *  The first tier service adjudications for payor added services.
 */
open class ClaimResponseAddItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseAddItem" }
	}

    public let adjudication = RealmSwift.List<ClaimResponseAddItemAdjudication>()
    public let detail = RealmSwift.List<ClaimResponseAddItemDetail>()
    @objc public dynamic var fee: Quantity?
    public func upsert(fee: Quantity?) {
        upsert(prop: &self.fee, val: fee)
    }
    public let noteNumberLinkId = RealmSwift.List<RealmInt>()
    public let sequenceLinkId = RealmSwift.List<RealmInt>()
    @objc public dynamic var service: Coding?
    public func upsert(service: Coding?) {
        upsert(prop: &self.service, val: service)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(service: Coding) {
        self.init()
        self.service = service
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case adjudication = "adjudication"
        case detail = "detail"
        case fee = "fee"
        case noteNumberLinkId = "noteNumberLinkId"
        case sequenceLinkId = "sequenceLinkId"
        case service = "service"
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

        self.adjudication.append(objectsIn: try container.decodeIfPresent([ClaimResponseAddItemAdjudication].self, forKey: .adjudication) ?? [])
        self.detail.append(objectsIn: try container.decodeIfPresent([ClaimResponseAddItemDetail].self, forKey: .detail) ?? [])
        self.fee = try container.decodeIfPresent(Quantity.self, forKey: .fee)
        self.noteNumberLinkId.append(objectsIn: try container.decodeIfPresent([RealmInt].self, forKey: .noteNumberLinkId) ?? [])
        self.sequenceLinkId.append(objectsIn: try container.decodeIfPresent([RealmInt].self, forKey: .sequenceLinkId) ?? [])
        self.service = try container.decodeIfPresent(Coding.self, forKey: .service)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.adjudication), forKey: .adjudication)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encodeIfPresent(self.fee, forKey: .fee)
        try container.encode(Array(self.noteNumberLinkId), forKey: .noteNumberLinkId)
        try container.encode(Array(self.sequenceLinkId), forKey: .sequenceLinkId)
        try container.encodeIfPresent(self.service, forKey: .service)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["adjudication"] {
				presentKeys.insert("adjudication")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseAddItemAdjudication.instantiate(fromArray: val, owner: self) as? [ClaimResponseAddItemAdjudication] {
						if let realm = self.realm { realm.delete(self.adjudication) }
						self.adjudication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "adjudication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseAddItemDetail.instantiate(fromArray: val, owner: self) as? [ClaimResponseAddItemDetail] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["fee"] {
				presentKeys.insert("fee")
				if let val = exist as? FHIRJSON {
					upsert(fee: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fee", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["noteNumberLinkId"] {
				presentKeys.insert("noteNumberLinkId")
				if let val = exist as? [Int] {
					self.noteNumberLinkId.append(objectsIn: val.map{ RealmInt(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "noteNumberLinkId", wants: Array<Int>.self, has: type(of: exist)))
				}
			}
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? [Int] {
					self.sequenceLinkId.append(objectsIn: val.map{ RealmInt(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Array<Int>.self, has: type(of: exist)))
				}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if adjudication.count > 0 {
			json["adjudication"] = Array(adjudication.map() { $0.asJSON() })
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if let fee = self.fee {
			json["fee"] = fee.asJSON()
		}
		if noteNumberLinkId.count > 0 {
			json["noteNumberLinkId"] = Array(noteNumberLinkId.map() { $0.value })
		}
		if sequenceLinkId.count > 0 {
			json["sequenceLinkId"] = Array(sequenceLinkId.map() { $0.value })
		}
		if let service = self.service {
			json["service"] = service.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseAddItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseAddItem. Will return empty instance: \(error))")
		}
		return ClaimResponseAddItem.init()
	}
}


/**
 *  Added items adjudication.
 *
 *  The adjudications results.
 */
open class ClaimResponseAddItemAdjudication: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseAddItemAdjudication" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var value: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case code = "code"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.value = try container.decodeIfPresent(RealmDecimal.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.value, forKey: .value)
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
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? NSNumber {
					self.value = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseAddItemAdjudication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseAddItemAdjudication. Will return empty instance: \(error))")
		}
		return ClaimResponseAddItemAdjudication.init()
	}
}


/**
 *  Added items details.
 *
 *  The second tier service adjudications for payor added services.
 */
open class ClaimResponseAddItemDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseAddItemDetail" }
	}

    public let adjudication = RealmSwift.List<ClaimResponseAddItemDetailAdjudication>()
    @objc public dynamic var fee: Quantity?
    public func upsert(fee: Quantity?) {
        upsert(prop: &self.fee, val: fee)
    }
    @objc public dynamic var service: Coding?
    public func upsert(service: Coding?) {
        upsert(prop: &self.service, val: service)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(service: Coding) {
        self.init()
        self.service = service
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case adjudication = "adjudication"
        case fee = "fee"
        case service = "service"
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

        self.adjudication.append(objectsIn: try container.decodeIfPresent([ClaimResponseAddItemDetailAdjudication].self, forKey: .adjudication) ?? [])
        self.fee = try container.decodeIfPresent(Quantity.self, forKey: .fee)
        self.service = try container.decodeIfPresent(Coding.self, forKey: .service)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.adjudication), forKey: .adjudication)
        try container.encodeIfPresent(self.fee, forKey: .fee)
        try container.encodeIfPresent(self.service, forKey: .service)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["adjudication"] {
				presentKeys.insert("adjudication")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseAddItemDetailAdjudication.instantiate(fromArray: val, owner: self) as? [ClaimResponseAddItemDetailAdjudication] {
						if let realm = self.realm { realm.delete(self.adjudication) }
						self.adjudication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "adjudication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["fee"] {
				presentKeys.insert("fee")
				if let val = exist as? FHIRJSON {
					upsert(fee: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fee", wants: FHIRJSON.self, has: type(of: exist)))
				}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if adjudication.count > 0 {
			json["adjudication"] = Array(adjudication.map() { $0.asJSON() })
		}
		if let fee = self.fee {
			json["fee"] = fee.asJSON()
		}
		if let service = self.service {
			json["service"] = service.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseAddItemDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseAddItemDetail. Will return empty instance: \(error))")
		}
		return ClaimResponseAddItemDetail.init()
	}
}


/**
 *  Added items detail adjudication.
 *
 *  The adjudications results.
 */
open class ClaimResponseAddItemDetailAdjudication: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseAddItemDetailAdjudication" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var value: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case code = "code"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.value = try container.decodeIfPresent(RealmDecimal.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.value, forKey: .value)
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
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? NSNumber {
					self.value = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseAddItemDetailAdjudication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseAddItemDetailAdjudication. Will return empty instance: \(error))")
		}
		return ClaimResponseAddItemDetailAdjudication.init()
	}
}


/**
 *  Insurance or medical plan.
 *
 *  Financial instrument by which payment information for health care.
 */
open class ClaimResponseCoverage: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseCoverage" }
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
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseCoverage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseCoverage. Will return empty instance: \(error))")
		}
		return ClaimResponseCoverage.init()
	}
}


/**
 *  Processing errors.
 *
 *  Mutually exclusive with Services Provided (Item).
 */
open class ClaimResponseError: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseError" }
	}

    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    public let detailSequenceLinkId = RealmOptional<Int>()
    public let sequenceLinkId = RealmOptional<Int>()
    public let subdetailSequenceLinkId = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case detailSequenceLinkId = "detailSequenceLinkId"
        case sequenceLinkId = "sequenceLinkId"
        case subdetailSequenceLinkId = "subdetailSequenceLinkId"
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

        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.detailSequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .detailSequenceLinkId)
        self.sequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .sequenceLinkId)
        self.subdetailSequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .subdetailSequenceLinkId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.detailSequenceLinkId.value, forKey: .detailSequenceLinkId)
        try container.encodeIfPresent(self.sequenceLinkId.value, forKey: .sequenceLinkId)
        try container.encodeIfPresent(self.subdetailSequenceLinkId.value, forKey: .subdetailSequenceLinkId)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["detailSequenceLinkId"] {
				presentKeys.insert("detailSequenceLinkId")
				if let val = exist as? Int {
					self.detailSequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "detailSequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? Int {
					self.sequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["subdetailSequenceLinkId"] {
				presentKeys.insert("subdetailSequenceLinkId")
				if let val = exist as? Int {
					self.subdetailSequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "subdetailSequenceLinkId", wants: Int.self, has: type(of: exist)))
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
		if let detailSequenceLinkId = self.detailSequenceLinkId.value {
			json["detailSequenceLinkId"] = detailSequenceLinkId.asJSON()
		}
		if let sequenceLinkId = self.sequenceLinkId.value {
			json["sequenceLinkId"] = sequenceLinkId.asJSON()
		}
		if let subdetailSequenceLinkId = self.subdetailSequenceLinkId.value {
			json["subdetailSequenceLinkId"] = subdetailSequenceLinkId.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseError.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseError. Will return empty instance: \(error))")
		}
		return ClaimResponseError.init()
	}
}


/**
 *  Line items.
 *
 *  The first tier service adjudications for submitted services.
 */
open class ClaimResponseItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseItem" }
	}

    public let adjudication = RealmSwift.List<ClaimResponseItemAdjudication>()
    public let detail = RealmSwift.List<ClaimResponseItemDetail>()
    public let noteNumber = RealmSwift.List<RealmInt>()
    public let sequenceLinkId = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequenceLinkId: Int) {
        self.init()
        self.sequenceLinkId.value = sequenceLinkId
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case adjudication = "adjudication"
        case detail = "detail"
        case noteNumber = "noteNumber"
        case sequenceLinkId = "sequenceLinkId"
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

        self.adjudication.append(objectsIn: try container.decodeIfPresent([ClaimResponseItemAdjudication].self, forKey: .adjudication) ?? [])
        self.detail.append(objectsIn: try container.decodeIfPresent([ClaimResponseItemDetail].self, forKey: .detail) ?? [])
        self.noteNumber.append(objectsIn: try container.decodeIfPresent([RealmInt].self, forKey: .noteNumber) ?? [])
        self.sequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .sequenceLinkId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.adjudication), forKey: .adjudication)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encode(Array(self.noteNumber), forKey: .noteNumber)
        try container.encodeIfPresent(self.sequenceLinkId.value, forKey: .sequenceLinkId)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["adjudication"] {
				presentKeys.insert("adjudication")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseItemAdjudication.instantiate(fromArray: val, owner: self) as? [ClaimResponseItemAdjudication] {
						if let realm = self.realm { realm.delete(self.adjudication) }
						self.adjudication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "adjudication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseItemDetail.instantiate(fromArray: val, owner: self) as? [ClaimResponseItemDetail] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["noteNumber"] {
				presentKeys.insert("noteNumber")
				if let val = exist as? [Int] {
					self.noteNumber.append(objectsIn: val.map{ RealmInt(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "noteNumber", wants: Array<Int>.self, has: type(of: exist)))
				}
			}
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? Int {
					self.sequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequenceLinkId"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if adjudication.count > 0 {
			json["adjudication"] = Array(adjudication.map() { $0.asJSON() })
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if noteNumber.count > 0 {
			json["noteNumber"] = Array(noteNumber.map() { $0.value })
		}
		if let sequenceLinkId = self.sequenceLinkId.value {
			json["sequenceLinkId"] = sequenceLinkId.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseItem. Will return empty instance: \(error))")
		}
		return ClaimResponseItem.init()
	}
}


/**
 *  Adjudication details.
 *
 *  The adjudications results.
 */
open class ClaimResponseItemAdjudication: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseItemAdjudication" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var value: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case code = "code"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.value = try container.decodeIfPresent(RealmDecimal.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.value, forKey: .value)
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
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? NSNumber {
					self.value = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseItemAdjudication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseItemAdjudication. Will return empty instance: \(error))")
		}
		return ClaimResponseItemAdjudication.init()
	}
}


/**
 *  Detail line items.
 *
 *  The second tier service adjudications for submitted services.
 */
open class ClaimResponseItemDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseItemDetail" }
	}

    public let adjudication = RealmSwift.List<ClaimResponseItemDetailAdjudication>()
    public let sequenceLinkId = RealmOptional<Int>()
    public let subDetail = RealmSwift.List<ClaimResponseItemDetailSubDetail>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequenceLinkId: Int) {
        self.init()
        self.sequenceLinkId.value = sequenceLinkId
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case adjudication = "adjudication"
        case sequenceLinkId = "sequenceLinkId"
        case subDetail = "subDetail"
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

        self.adjudication.append(objectsIn: try container.decodeIfPresent([ClaimResponseItemDetailAdjudication].self, forKey: .adjudication) ?? [])
        self.sequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .sequenceLinkId)
        self.subDetail.append(objectsIn: try container.decodeIfPresent([ClaimResponseItemDetailSubDetail].self, forKey: .subDetail) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.adjudication), forKey: .adjudication)
        try container.encodeIfPresent(self.sequenceLinkId.value, forKey: .sequenceLinkId)
        try container.encode(Array(self.subDetail), forKey: .subDetail)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["adjudication"] {
				presentKeys.insert("adjudication")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseItemDetailAdjudication.instantiate(fromArray: val, owner: self) as? [ClaimResponseItemDetailAdjudication] {
						if let realm = self.realm { realm.delete(self.adjudication) }
						self.adjudication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "adjudication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? Int {
					self.sequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequenceLinkId"))
			}
			if let exist = js["subDetail"] {
				presentKeys.insert("subDetail")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseItemDetailSubDetail.instantiate(fromArray: val, owner: self) as? [ClaimResponseItemDetailSubDetail] {
						if let realm = self.realm { realm.delete(self.subDetail) }
						self.subDetail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subDetail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if adjudication.count > 0 {
			json["adjudication"] = Array(adjudication.map() { $0.asJSON() })
		}
		if let sequenceLinkId = self.sequenceLinkId.value {
			json["sequenceLinkId"] = sequenceLinkId.asJSON()
		}
		if subDetail.count > 0 {
			json["subDetail"] = Array(subDetail.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseItemDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseItemDetail. Will return empty instance: \(error))")
		}
		return ClaimResponseItemDetail.init()
	}
}


/**
 *  Detail adjudication.
 *
 *  The adjudications results.
 */
open class ClaimResponseItemDetailAdjudication: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseItemDetailAdjudication" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var value: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case code = "code"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.value = try container.decodeIfPresent(RealmDecimal.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.value, forKey: .value)
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
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? NSNumber {
					self.value = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseItemDetailAdjudication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseItemDetailAdjudication. Will return empty instance: \(error))")
		}
		return ClaimResponseItemDetailAdjudication.init()
	}
}


/**
 *  Subdetail line items.
 *
 *  The third tier service adjudications for submitted services.
 */
open class ClaimResponseItemDetailSubDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseItemDetailSubDetail" }
	}

    public let adjudication = RealmSwift.List<ClaimResponseItemDetailSubDetailAdjudication>()
    public let sequenceLinkId = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sequenceLinkId: Int) {
        self.init()
        self.sequenceLinkId.value = sequenceLinkId
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case adjudication = "adjudication"
        case sequenceLinkId = "sequenceLinkId"
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

        self.adjudication.append(objectsIn: try container.decodeIfPresent([ClaimResponseItemDetailSubDetailAdjudication].self, forKey: .adjudication) ?? [])
        self.sequenceLinkId.value = try container.decodeIfPresent(Int.self, forKey: .sequenceLinkId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.adjudication), forKey: .adjudication)
        try container.encodeIfPresent(self.sequenceLinkId.value, forKey: .sequenceLinkId)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["adjudication"] {
				presentKeys.insert("adjudication")
				if let val = exist as? [FHIRJSON] {
					if let vals = ClaimResponseItemDetailSubDetailAdjudication.instantiate(fromArray: val, owner: self) as? [ClaimResponseItemDetailSubDetailAdjudication] {
						if let realm = self.realm { realm.delete(self.adjudication) }
						self.adjudication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "adjudication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? Int {
					self.sequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequenceLinkId"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if adjudication.count > 0 {
			json["adjudication"] = Array(adjudication.map() { $0.asJSON() })
		}
		if let sequenceLinkId = self.sequenceLinkId.value {
			json["sequenceLinkId"] = sequenceLinkId.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseItemDetailSubDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseItemDetailSubDetail. Will return empty instance: \(error))")
		}
		return ClaimResponseItemDetailSubDetail.init()
	}
}


/**
 *  Subdetail adjudication.
 *
 *  The adjudications results.
 */
open class ClaimResponseItemDetailSubDetailAdjudication: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseItemDetailSubDetailAdjudication" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var code: Coding?
    public func upsert(code: Coding?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var value: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: Coding) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case code = "code"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.code = try container.decodeIfPresent(Coding.self, forKey: .code)
        self.value = try container.decodeIfPresent(RealmDecimal.self, forKey: .value)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.value, forKey: .value)
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
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? NSNumber {
					self.value = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: NSNumber.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseItemDetailSubDetailAdjudication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseItemDetailSubDetailAdjudication. Will return empty instance: \(error))")
		}
		return ClaimResponseItemDetailSubDetailAdjudication.init()
	}
}


/**
 *  Processing notes.
 *
 *  Note text.
 */
open class ClaimResponseNote: BackboneElement {
	override open class var resourceType: String {
		get { return "ClaimResponseNote" }
	}

    public let number = RealmOptional<Int>()
    @objc public dynamic var text: String?
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case number = "number"
        case text = "text"
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

        self.number.value = try container.decodeIfPresent(Int.self, forKey: .number)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.number.value, forKey: .number)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["number"] {
				presentKeys.insert("number")
				if let val = exist as? Int {
					self.number.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "number", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
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
		
		if let number = self.number.value {
			json["number"] = number.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ClaimResponseNote.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ClaimResponseNote. Will return empty instance: \(error))")
		}
		return ClaimResponseNote.init()
	}
}

