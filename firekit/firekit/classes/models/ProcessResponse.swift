//
//  ProcessResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ProcessResponse) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  ProcessResponse resource.
 *
 *  This resource provides processing status, errors and notes from the processing of a resource.
 */
open class ProcessResponse: DomainResource {
	override open class var resourceType: String {
		get { return "ProcessResponse" }
	}

    @objc public dynamic var created: DateTime?
    @objc public dynamic var disposition: String?
    public let error = RealmSwift.List<Coding>()
    @objc public dynamic var form: Coding?
    public func upsert(form: Coding?) {
        upsert(prop: &self.form, val: form)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let notes = RealmSwift.List<ProcessResponseNotes>()
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var originalRuleset: Coding?
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }
    @objc public dynamic var outcome: Coding?
    public func upsert(outcome: Coding?) {
        upsert(prop: &self.outcome, val: outcome)
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

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case created = "created"
        case disposition = "disposition"
        case error = "error"
        case form = "form"
        case identifier = "identifier"
        case notes = "notes"
        case organization = "organization"
        case originalRuleset = "originalRuleset"
        case outcome = "outcome"
        case request = "request"
        case requestOrganization = "requestOrganization"
        case requestProvider = "requestProvider"
        case ruleset = "ruleset"
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
        self.disposition = try container.decodeIfPresent(String.self, forKey: .disposition)
        self.error.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .error) ?? [])
        self.form = try container.decodeIfPresent(Coding.self, forKey: .form)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.notes.append(objectsIn: try container.decodeIfPresent([ProcessResponseNotes].self, forKey: .notes) ?? [])
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.originalRuleset = try container.decodeIfPresent(Coding.self, forKey: .originalRuleset)
        self.outcome = try container.decodeIfPresent(Coding.self, forKey: .outcome)
        self.request = try container.decodeIfPresent(Reference.self, forKey: .request)
        self.requestOrganization = try container.decodeIfPresent(Reference.self, forKey: .requestOrganization)
        self.requestProvider = try container.decodeIfPresent(Reference.self, forKey: .requestProvider)
        self.ruleset = try container.decodeIfPresent(Coding.self, forKey: .ruleset)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.created, forKey: .created)
        try container.encodeIfPresent(self.disposition, forKey: .disposition)
        try container.encode(Array(self.error), forKey: .error)
        try container.encodeIfPresent(self.form, forKey: .form)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.notes), forKey: .notes)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.originalRuleset, forKey: .originalRuleset)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.request, forKey: .request)
        try container.encodeIfPresent(self.requestOrganization, forKey: .requestOrganization)
        try container.encodeIfPresent(self.requestProvider, forKey: .requestProvider)
        try container.encodeIfPresent(self.ruleset, forKey: .ruleset)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProcessResponse.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcessResponse. Will return empty instance: \(error))")
		}
		return ProcessResponse.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ProcessResponse else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.created, from: o.created)
        disposition = o.disposition

        for (index, t) in o.error.enumerated() {
            guard index < self.error.count else {
                self.error.append(t)
                continue
            }
            self.error[index].populate(from: t)
        }
    
        if self.error.count > o.error.count {
            for i in self.error.count...o.error.count {
                let objectToRemove = self.error[i]
                self.error.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
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

        for (index, t) in o.notes.enumerated() {
            guard index < self.notes.count else {
                self.notes.append(t)
                continue
            }
            self.notes[index].populate(from: t)
        }
    
        if self.notes.count > o.notes.count {
            for i in self.notes.count...o.notes.count {
                let objectToRemove = self.notes[i]
                self.notes.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.organization, from: o.organization)
        FireKit.populate(&self.originalRuleset, from: o.originalRuleset)
        FireKit.populate(&self.outcome, from: o.outcome)
        FireKit.populate(&self.request, from: o.request)
        FireKit.populate(&self.requestOrganization, from: o.requestOrganization)
        FireKit.populate(&self.requestProvider, from: o.requestProvider)
        FireKit.populate(&self.ruleset, from: o.ruleset)
    }
}


/**
 *  Notes.
 *
 *  Suite of processing note or additional requirements is the processing has been held.
 */
open class ProcessResponseNotes: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcessResponseNotes" }
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
			let clone = try JSONDecoder().decode(ProcessResponseNotes.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProcessResponseNotes. Will return empty instance: \(error))")
		}
		return ProcessResponseNotes.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ProcessResponseNotes else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        text = o.text
        FireKit.populate(&self.type, from: o.type)
    }
}

