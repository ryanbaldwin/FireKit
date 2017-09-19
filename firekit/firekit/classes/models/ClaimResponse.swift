//
//  ClaimResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ClaimResponse) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponse else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: addItem array
        // TODO: coverage array
        created = o.created
        disposition = o.disposition
        // TODO: error array
        FireKit.populate(&self.form, from: o.form)
        // TODO: identifier array
        // TODO: item array
        // TODO: note array
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        outcome = o.outcome
        FireKit.populate(&self.payeeType, from: o.payeeType)
        FireKit.populate(&self.paymentAdjustment, from: o.paymentAdjustment)
        FireKit.populate(&self.paymentAdjustmentReason, from: o.paymentAdjustmentReason)
        FireKit.populate(&self.paymentAmount, from: o.paymentAmount)
        paymentDate = o.paymentDate
        FireKit.populate(&self.paymentRef, from: o.paymentRef)
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.requestOrganization, from: o.requestOrganization)
        FireKit.populate(&self.requestProvider, from: o.requestProvider)
        FireKit.populate(&self.reserved, from: o.reserved)
        FireKit.populate(&self.ruleset, from: o.ruleset)
        FireKit.populate(&self.totalBenefit, from: o.totalBenefit)
        FireKit.populate(&self.totalCost, from: o.totalCost)
        FireKit.populate(&self.unallocDeductable, from: o.unallocDeductable)
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseAddItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: adjudication array
        // TODO: detail array
        FireKit.populate(&self.fee, from: o.fee)
        // TODO: noteNumberLinkId array
        // TODO: sequenceLinkId array
        FireKit.populate(&self.service, from: o.service)
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseAddItemAdjudication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.code, from: o.code)
        value = o.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseAddItemDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: adjudication array
        FireKit.populate(&self.fee, from: o.fee)
        FireKit.populate(&self.service, from: o.service)
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseAddItemDetailAdjudication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.code, from: o.code)
        value = o.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseCoverage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        businessArrangement = o.businessArrangement
        FireKit.populate(&self.claimResponse, from: o.claimResponse)
        FireKit.populate(&self.coverage, from: o.coverage)
        focal.value = o.focal.value
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        // TODO: preAuthRef array
        FireKit.populate(&self.relationship, from: o.relationship)
        sequence.value = o.sequence.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseError else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        detailSequenceLinkId.value = o.detailSequenceLinkId.value
        sequenceLinkId.value = o.sequenceLinkId.value
        subdetailSequenceLinkId.value = o.subdetailSequenceLinkId.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: adjudication array
        // TODO: detail array
        // TODO: noteNumber array
        sequenceLinkId.value = o.sequenceLinkId.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseItemAdjudication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.code, from: o.code)
        value = o.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseItemDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: adjudication array
        sequenceLinkId.value = o.sequenceLinkId.value
        // TODO: subDetail array
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseItemDetailAdjudication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.code, from: o.code)
        value = o.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseItemDetailSubDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        // TODO: adjudication array
        sequenceLinkId.value = o.sequenceLinkId.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseItemDetailSubDetailAdjudication else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.code, from: o.code)
        value = o.value
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

    public override func populate(from other: Any) {
        guard let o = other as? ClaimResponseNote else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        number.value = o.number.value
        text = o.text
        FireKit.populate(&self.type, from: o.type)
    }
}

