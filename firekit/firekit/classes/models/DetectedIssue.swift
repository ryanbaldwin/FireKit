//
//  DetectedIssue.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DetectedIssue) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Clinical issue with action.
 *
 *  Indicates an actual or potential clinical issue with or between one or more active or proposed clinical actions for
 *  a patient; e.g. Drug-drug interaction, Ineffective treatment frequency, Procedure-condition conflict, etc.
 */
open class DetectedIssue: DomainResource {
	override open class var resourceType: String {
		get { return "DetectedIssue" }
	}

    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var detail: String?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    public let implicated = RealmSwift.List<Reference>()
    public let mitigation = RealmSwift.List<DetectedIssueMitigation>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var reference: String?
    @objc public dynamic var severity: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case category = "category"
        case date = "date"
        case detail = "detail"
        case identifier = "identifier"
        case implicated = "implicated"
        case mitigation = "mitigation"
        case patient = "patient"
        case reference = "reference"
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

        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.detail = try container.decodeIfPresent(String.self, forKey: .detail)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.implicated.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .implicated) ?? [])
        self.mitigation.append(objectsIn: try container.decodeIfPresent([DetectedIssueMitigation].self, forKey: .mitigation) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.detail, forKey: .detail)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encode(Array(self.implicated), forKey: .implicated)
        try container.encode(Array(self.mitigation), forKey: .mitigation)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.severity, forKey: .severity)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DetectedIssue.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DetectedIssue. Will return empty instance: \(error))")
		}
		return DetectedIssue.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DetectedIssue else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.author, from: o.author)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.date, from: o.date)
        detail = o.detail
        FireKit.populate(&self.identifier, from: o.identifier)

        for (index, t) in o.implicated.enumerated() {
            guard index < self.implicated.count else {
                self.implicated.append(t)
                continue
            }
            self.implicated[index].populate(from: t)
        }
    
        while self.implicated.count > o.implicated.count {
            let objectToRemove = self.implicated.last!
            self.implicated.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.mitigation.enumerated() {
            guard index < self.mitigation.count else {
                self.mitigation.append(t)
                continue
            }
            self.mitigation[index].populate(from: t)
        }
    
        while self.mitigation.count > o.mitigation.count {
            let objectToRemove = self.mitigation.last!
            self.mitigation.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.patient, from: o.patient)
        reference = o.reference
        severity = o.severity
    }
}


/**
 *  Step taken to address.
 *
 *  Indicates an action that has been taken or is committed to to reduce or eliminate the likelihood of the risk
 *  identified by the detected issue from manifesting.  Can also reflect an observation of known mitigating factors that
 *  may reduce/eliminate the need for any action.
 */
open class DetectedIssueMitigation: BackboneElement {
	override open class var resourceType: String {
		get { return "DetectedIssueMitigation" }
	}

    @objc public dynamic var action: CodeableConcept?
    public func upsert(action: CodeableConcept?) {
        upsert(prop: &self.action, val: action)
    }
    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    @objc public dynamic var date: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(action: CodeableConcept) {
        self.init()
        self.action = action
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case action = "action"
        case author = "author"
        case date = "date"
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

        self.action = try container.decodeIfPresent(CodeableConcept.self, forKey: .action)
        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.action, forKey: .action)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.date, forKey: .date)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DetectedIssueMitigation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DetectedIssueMitigation. Will return empty instance: \(error))")
		}
		return DetectedIssueMitigation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DetectedIssueMitigation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.action, from: o.action)
        FireKit.populate(&self.author, from: o.author)
        FireKit.populate(&self.date, from: o.date)
    }
}

