//
//  EnrollmentRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/EnrollmentRequest) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Enrollment request.
 *
 *  This resource provides the insurance enrollment details to the insurer regarding a specified coverage.
 */
open class EnrollmentRequest: DomainResource {
	override open class var resourceType: String {
		get { return "EnrollmentRequest" }
	}

    @objc public dynamic var coverage: Reference?
    public func upsert(coverage: Reference?) {
        upsert(prop: &self.coverage, val: coverage)
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
    @objc public dynamic var provider: Reference?
    public func upsert(provider: Reference?) {
        upsert(prop: &self.provider, val: provider)
    }
    @objc public dynamic var relationship: Coding?
    public func upsert(relationship: Coding?) {
        upsert(prop: &self.relationship, val: relationship)
    }
    @objc public dynamic var ruleset: Coding?
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(coverage: Reference, relationship: Coding, subject: Reference) {
        self.init()
        self.coverage = coverage
        self.relationship = relationship
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case coverage = "coverage"
        case created = "created"
        case identifier = "identifier"
        case organization = "organization"
        case originalRuleset = "originalRuleset"
        case provider = "provider"
        case relationship = "relationship"
        case ruleset = "ruleset"
        case subject = "subject"
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

        self.coverage = try container.decodeIfPresent(Reference.self, forKey: .coverage)
        self.created = try container.decodeIfPresent(DateTime.self, forKey: .created)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.provider = try container.decodeIfPresent(Reference.self, forKey: .provider)
        self.relationship = try container.decodeIfPresent(Coding.self, forKey: .relationship)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.coverage, forKey: .coverage)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.provider, forKey: .provider)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.target, forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(EnrollmentRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy EnrollmentRequest. Will return empty instance: \(error))")
		}
		return EnrollmentRequest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? EnrollmentRequest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.coverage, from: o.coverage)
        FireKit.populate(&self.created, from: o.created)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        FireKit.populate(&self.provider, from: o.provider)
        FireKit.populate(&self.relationship, from: o.relationship)
        FireKit.populate(&self.ruleset, from: o.ruleset)
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populate(&self.target, from: o.target)
    }
}

