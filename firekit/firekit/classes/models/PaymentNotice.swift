//
//  PaymentNotice.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/PaymentNotice) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  PaymentNotice request.
 *
 *  This resource provides the status of the payment for goods and services rendered, and the request and response
 *  resource references.
 */
open class PaymentNotice: DomainResource {
	override open class var resourceType: String {
		get { return "PaymentNotice" }
	}

    @objc public dynamic var created: DateTime?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    @objc public dynamic var paymentStatus: Coding?
    public func upsert(paymentStatus: Coding?) {
        upsert(prop: &self.paymentStatus, val: paymentStatus)
    }
    @objc public dynamic var provider: Reference?
    public func upsert(provider: Reference?) {
        upsert(prop: &self.provider, val: provider)
    }
    @objc public dynamic var request: Reference?
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }
    @objc public dynamic var response: Reference?
    public func upsert(response: Reference?) {
        upsert(prop: &self.response, val: response)
    }
    @objc public dynamic var ruleset: Coding?
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(paymentStatus: Coding) {
        self.init()
        self.paymentStatus = paymentStatus
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case created = "created"
        case identifier = "identifier"
        case organization = "organization"
        case originalRuleset = "originalRuleset"
        case paymentStatus = "paymentStatus"
        case provider = "provider"
        case request = "request"
        case response = "response"
        case ruleset = "ruleset"
        case target = "target"
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
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.paymentStatus = try container.decodeIfPresent(Coding.self, forKey: .paymentStatus)
        self.provider = try container.decodeIfPresent(Reference.self, forKey: .provider)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.response = try container.decodeIfPresent(Reference.self, forKey: .response)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.paymentStatus, forKey: .paymentStatus)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.response, forKey: .response)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
        try container.encodeIfPresent(self.target, forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PaymentNotice.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PaymentNotice. Will return empty instance: \(error))")
		}
		return PaymentNotice.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PaymentNotice else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.created, from: o.created)

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
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        FireKit.populate(&self.paymentStatus, from: o.paymentStatus)
        FireKit.populate(&self.provider, from: o.provider)
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.response, from: o.response)
        FireKit.populate(&self.ruleset, from: o.ruleset)
        FireKit.populate(&self.target, from: o.target)
    }
}

