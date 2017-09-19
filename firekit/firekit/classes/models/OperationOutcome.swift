//
//  OperationOutcome.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/OperationOutcome) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Information about the success/failure of an action.
 *
 *  A collection of error, warning or information messages that result from a system action.
 */
open class OperationOutcome: DomainResource {
	override open class var resourceType: String {
		get { return "OperationOutcome" }
	}

    public let issue = RealmSwift.List<OperationOutcomeIssue>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(issue: [OperationOutcomeIssue]) {
        self.init()
        self.issue.append(objectsIn: issue)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case issue = "issue"
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

        self.issue.append(objectsIn: try container.decodeIfPresent([OperationOutcomeIssue].self, forKey: .issue) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.issue), forKey: .issue)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationOutcome.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationOutcome. Will return empty instance: \(error))")
		}
		return OperationOutcome.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OperationOutcome else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.issue, from: o.issue)
    }
}


/**
 *  A single issue associated with the action.
 *
 *  An error, warning or information message that results from a system action.
 */
open class OperationOutcomeIssue: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationOutcomeIssue" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var details: CodeableConcept?
    public func upsert(details: CodeableConcept?) {
        upsert(prop: &self.details, val: details)
    }
    @objc public dynamic var diagnostics: String?
    public let location = RealmSwift.List<RealmString>()
    @objc public dynamic var severity: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, severity: String) {
        self.init()
        self.code = code
        self.severity = severity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case details = "details"
        case diagnostics = "diagnostics"
        case location = "location"
        case severity = "severity"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.details = try container.decodeIfPresent(CodeableConcept.self, forKey: .details)
        self.diagnostics = try container.decodeIfPresent(String.self, forKey: .diagnostics)
        self.location.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .location) ?? [])
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.details, forKey: .details)
        try container.encodeIfPresent(self.diagnostics, forKey: .diagnostics)
        try container.encode(Array(self.location), forKey: .location)
        try container.encodeIfPresent(self.severity, forKey: .severity)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationOutcomeIssue.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationOutcomeIssue. Will return empty instance: \(error))")
		}
		return OperationOutcomeIssue.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? OperationOutcomeIssue else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        code = o.code
        FireKit.populate(&self.details, from: o.details)
        diagnostics = o.diagnostics
        FireKit.populateList(&self.location, from: o.location)
        severity = o.severity
    }
}

