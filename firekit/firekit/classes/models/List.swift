//
//  List.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/List) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Information summarized from a list of other resources.
 *
 *  A set of information summarized from a list of other resources.
 */
open class List: DomainResource {
	override open class var resourceType: String {
		get { return "List" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var emptyReason: CodeableConcept?
    public func upsert(emptyReason: CodeableConcept?) {
        upsert(prop: &self.emptyReason, val: emptyReason)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let entry = RealmSwift.List<ListEntry>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var mode: String?
    @objc public dynamic var note: String?
    @objc public dynamic var orderedBy: CodeableConcept?
    public func upsert(orderedBy: CodeableConcept?) {
        upsert(prop: &self.orderedBy, val: orderedBy)
    }
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var title: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(mode: String, status: String) {
        self.init()
        self.mode = mode
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case date = "date"
        case emptyReason = "emptyReason"
        case encounter = "encounter"
        case entry = "entry"
        case identifier = "identifier"
        case mode = "mode"
        case note = "note"
        case orderedBy = "orderedBy"
        case source = "source"
        case status = "status"
        case subject = "subject"
        case title = "title"
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

        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.emptyReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .emptyReason)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.entry.append(objectsIn: try container.decodeIfPresent([ListEntry].self, forKey: .entry) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.note = try container.decodeIfPresent(String.self, forKey: .note)
        self.orderedBy = try container.decodeIfPresent(CodeableConcept.self, forKey: .orderedBy)
        self.source = try container.decodeIfPresent(Reference.self, forKey: .source)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.emptyReason, forKey: .emptyReason)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.entry), forKey: .entry)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.orderedBy, forKey: .orderedBy)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(List.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy List. Will return empty instance: \(error))")
		}
		return List.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? List else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        FireKit.populate(&self.date, from: o.date)
        FireKit.populate(&self.emptyReason, from: o.emptyReason)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.entry.enumerated() {
            guard index < self.entry.count else {
                self.entry.append(t)
                continue
            }
            self.entry[index].populate(from: t)
        }
    
        while self.entry.count > o.entry.count {
            let objectToRemove = self.entry.last!
            self.entry.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

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
        mode = o.mode
        note = o.note
        FireKit.populate(&self.orderedBy, from: o.orderedBy)
        FireKit.populate(&self.source, from: o.source)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
        title = o.title
    }
}


/**
 *  Entries in the list.
 *
 *  Entries in this list.
 */
open class ListEntry: BackboneElement {
	override open class var resourceType: String {
		get { return "ListEntry" }
	}

    @objc public dynamic var date: DateTime?
    public let deleted = RealmOptional<Bool>()
    @objc public dynamic var flag: CodeableConcept?
    public func upsert(flag: CodeableConcept?) {
        upsert(prop: &self.flag, val: flag)
    }
    @objc public dynamic var item: Reference?
    public func upsert(item: Reference?) {
        upsert(prop: &self.item, val: item)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(item: Reference) {
        self.init()
        self.item = item
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case deleted = "deleted"
        case flag = "flag"
        case item = "item"
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

        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.deleted.value = try container.decodeIfPresent(Bool.self, forKey: .deleted)
        self.flag = try container.decodeIfPresent(CodeableConcept.self, forKey: .flag)
        self.item = try container.decodeIfPresent(Reference.self, forKey: .item)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.deleted.value, forKey: .deleted)
        try container.encodeIfPresent(self.flag, forKey: .flag)
        try container.encodeIfPresent(self.item, forKey: .item)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ListEntry.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ListEntry. Will return empty instance: \(error))")
		}
		return ListEntry.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ListEntry else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.date, from: o.date)
        deleted.value = o.deleted.value
        FireKit.populate(&self.flag, from: o.flag)
        FireKit.populate(&self.item, from: o.item)
    }
}

