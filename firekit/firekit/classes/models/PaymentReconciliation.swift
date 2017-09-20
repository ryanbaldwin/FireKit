//
//  PaymentReconciliation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/PaymentReconciliation) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  PaymentReconciliation resource.
 *
 *  This resource provides payment details and claim references supporting a bulk payment.
 */
open class PaymentReconciliation: DomainResource {
	override open class var resourceType: String {
		get { return "PaymentReconciliation" }
	}

    @objc public dynamic var created: DateTime?
    public let detail = RealmSwift.List<PaymentReconciliationDetail>()
    @objc public dynamic var disposition: String?
    @objc public dynamic var form: Coding?
    public func upsert(form: Coding?) {
        upsert(prop: &self.form, val: form)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let note = RealmSwift.List<PaymentReconciliationNote>()
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    @objc public dynamic var outcome: String?
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
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
    @objc public dynamic var ruleset: Coding?
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }
    @objc public dynamic var total: Quantity?
    public func upsert(total: Quantity?) {
        upsert(prop: &self.total, val: total)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(total: Quantity) {
        self.init()
        self.total = total
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case created = "created"
        case detail = "detail"
        case disposition = "disposition"
        case form = "form"
        case identifier = "identifier"
        case note = "note"
        case organization = "organization"
        case originalRuleset = "originalRuleset"
        case outcome = "outcome"
        case period = "period"
        case request = "request"
        case requestOrganization = "requestOrganization"
        case requestProvider = "requestProvider"
        case ruleset = "ruleset"
        case total = "total"
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

        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.detail.append(objectsIn: try container.decodeIfPresent([PaymentReconciliationDetail].self, forKey: .detail) ?? [])
        self.disposition = try container.decodeIfPresent(String.self, forKey: .disposition)
        self.form = try container.decodeIfPresent(Coding.self, forKey: .form)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.note.append(objectsIn: try container.decodeIfPresent([PaymentReconciliationNote].self, forKey: .note) ?? [])
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.outcome = try container.decodeIfPresent(String.self, forKey: .outcome)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.requestOrganization = try container.decodeIfPresent(Reference.self, forKey: .requestOrganization)
        self.requestProvider = try container.decodeIfPresent(Reference.self, forKey: .requestProvider)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
        self.total = try container.decodeIfPresent(Quantity.self, forKey: .total)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encodeIfPresent(self.disposition, forKey: .disposition)
        try container.encodeIfPresent(self.form, forKey: .form)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.note), forKey: .note)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.requestOrganization, forKey: .requestOrganization)
        try container.encodeIfPresent(self.requestProvider, forKey: .requestProvider)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
        try container.encodeIfPresent(self.total, forKey: .total)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PaymentReconciliation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PaymentReconciliation. Will return empty instance: \(error))")
		}
		return PaymentReconciliation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PaymentReconciliation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.created, from: o.created)

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
        disposition = o.disposition
        FireKit.populate(&self.form, from: o.form)

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

        for (index, t) in o.note.enumerated() {
            guard index < self.note.count else {
                self.note.append(t)
                continue
            }
            self.note[index].populate(from: t)
        }
    
        if self.note.count > o.note.count {
            for i in self.note.count...o.note.count {
                let objectToRemove = self.note[i]
                self.note.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        outcome = o.outcome
        FireKit.populate(&self.period, from: o.period)
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.requestOrganization, from: o.requestOrganization)
        FireKit.populate(&self.requestProvider, from: o.requestProvider)
        FireKit.populate(&self.ruleset, from: o.ruleset)
        FireKit.populate(&self.total, from: o.total)
    }
}


/**
 *  Details.
 *
 *  List of individual settlement amounts and the corresponding transaction.
 */
open class PaymentReconciliationDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "PaymentReconciliationDetail" }
	}

    @objc public dynamic var amount: Quantity?
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }
    @objc public dynamic var date: FHIRDate?
    @objc public dynamic var payee: Reference?
    public func upsert(payee: Reference?) {
        upsert(prop: &self.payee, val: payee)
    }
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var responce: Reference?
    public func upsert(responce: Reference?) {
        upsert(prop: &self.responce, val: responce)
    }
    @objc public dynamic var submitter: Reference?
    public func upsert(submitter: Reference?) {
        upsert(prop: &self.submitter, val: submitter)
    }
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: Coding) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case date = "date"
        case payee = "payee"
        case request = "request"
        case responce = "responce"
        case submitter = "submitter"
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

        self.amount = try container.decodeIfPresent(Quantity.self, forKey: .amount)
        self.date = try container.decodeIfPresent(FHIRDate.self, forKey: .date)
        self.payee = try container.decodeIfPresent(Reference.self, forKey: .payee)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.responce = try container.decodeIfPresent(Reference.self, forKey: .responce)
        self.submitter = try container.decodeIfPresent(Reference.self, forKey: .submitter)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.amount, forKey: .amount)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.payee, forKey: .payee)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.responce, forKey: .responce)
        try container.encodeIfPresent(self.submitter, forKey: .submitter)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PaymentReconciliationDetail.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PaymentReconciliationDetail. Will return empty instance: \(error))")
		}
		return PaymentReconciliationDetail.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PaymentReconciliationDetail else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.amount, from: o.amount)
        FireKit.populate(&self.date, from: o.date)
        FireKit.populate(&self.payee, from: o.payee)
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.responce, from: o.responce)
        FireKit.populate(&self.submitter, from: o.submitter)
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Note text.
 *
 *  Suite of notes.
 */
open class PaymentReconciliationNote: BackboneElement {
	override open class var resourceType: String {
		get { return "PaymentReconciliationNote" }
	}

    @objc public dynamic var text: String?
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
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

        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PaymentReconciliationNote.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PaymentReconciliationNote. Will return empty instance: \(error))")
		}
		return PaymentReconciliationNote.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PaymentReconciliationNote else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        text = o.text
        FireKit.populate(&self.type, from: o.type)
    }
}

