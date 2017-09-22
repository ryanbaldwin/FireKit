//
//  DiagnosticOrder.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DiagnosticOrder) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A request for a diagnostic service.
 *
 *  A record of a request for a diagnostic investigation service to be performed.
 */
open class DiagnosticOrder: DomainResource {
	override open class var resourceType: String {
		get { return "DiagnosticOrder" }
	}

    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let event = RealmSwift.List<DiagnosticOrderEvent>()
    public let identifier = RealmSwift.List<Identifier>()
    public let item = RealmSwift.List<DiagnosticOrderItem>()
    public let note = RealmSwift.List<Annotation>()
    @objc public dynamic var orderer: Reference?
    public func upsert(orderer: Reference?) {
        upsert(prop: &self.orderer, val: orderer)
    }
    @objc public dynamic var priority: String?
    public let reason = RealmSwift.List<CodeableConcept>()
    public let specimen = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    public let supportingInformation = RealmSwift.List<Reference>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(subject: Reference) {
        self.init()
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case encounter = "encounter"
        case event = "event"
        case identifier = "identifier"
        case item = "item"
        case note = "note"
        case orderer = "orderer"
        case priority = "priority"
        case reason = "reason"
        case specimen = "specimen"
        case status = "status"
        case subject = "subject"
        case supportingInformation = "supportingInformation"
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

        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.event.append(objectsIn: try container.decodeIfPresent([DiagnosticOrderEvent].self, forKey: .event) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.item.append(objectsIn: try container.decodeIfPresent([DiagnosticOrderItem].self, forKey: .item) ?? [])
        self.note.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .note) ?? [])
        self.orderer = try container.decodeIfPresent(Reference.self, forKey: .orderer)
        self.priority = try container.decodeIfPresent(String.self, forKey: .priority)
        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.specimen.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .specimen) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.supportingInformation.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supportingInformation) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.event), forKey: .event)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.item), forKey: .item)
        try container.encode(Array(self.note), forKey: .note)
        try container.encodeIfPresent(self.orderer, forKey: .orderer)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encode(Array(self.specimen), forKey: .specimen)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encode(Array(self.supportingInformation), forKey: .supportingInformation)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DiagnosticOrder.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DiagnosticOrder. Will return empty instance: \(error))")
		}
		return DiagnosticOrder.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DiagnosticOrder else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.encounter, from: o.encounter)

        for (index, t) in o.event.enumerated() {
            guard index < self.event.count else {
                self.event.append(t)
                continue
            }
            self.event[index].populate(from: t)
        }
    
        if self.event.count > o.event.count {
            for i in self.event.count...o.event.count {
                let objectToRemove = self.event[i]
                self.event.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

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

        for (index, t) in o.item.enumerated() {
            guard index < self.item.count else {
                self.item.append(t)
                continue
            }
            self.item[index].populate(from: t)
        }
    
        if self.item.count > o.item.count {
            for i in self.item.count...o.item.count {
                let objectToRemove = self.item[i]
                self.item.remove(objectAtIndex: i)
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
        FireKit.populate(&self.orderer, from: o.orderer)
        priority = o.priority

        for (index, t) in o.reason.enumerated() {
            guard index < self.reason.count else {
                self.reason.append(t)
                continue
            }
            self.reason[index].populate(from: t)
        }
    
        if self.reason.count > o.reason.count {
            for i in self.reason.count...o.reason.count {
                let objectToRemove = self.reason[i]
                self.reason.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.specimen.enumerated() {
            guard index < self.specimen.count else {
                self.specimen.append(t)
                continue
            }
            self.specimen[index].populate(from: t)
        }
    
        if self.specimen.count > o.specimen.count {
            for i in self.specimen.count...o.specimen.count {
                let objectToRemove = self.specimen[i]
                self.specimen.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)

        for (index, t) in o.supportingInformation.enumerated() {
            guard index < self.supportingInformation.count else {
                self.supportingInformation.append(t)
                continue
            }
            self.supportingInformation[index].populate(from: t)
        }
    
        if self.supportingInformation.count > o.supportingInformation.count {
            for i in self.supportingInformation.count...o.supportingInformation.count {
                let objectToRemove = self.supportingInformation[i]
                self.supportingInformation.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
    }
}


/**
 *  A list of events of interest in the lifecycle.
 *
 *  A summary of the events of interest that have occurred as the request is processed; e.g. when the order was made,
 *  various processing steps (specimens received), when it was completed.
 */
open class DiagnosticOrderEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "DiagnosticOrderEvent" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    @objc public dynamic var dateTime: DateTime?
    @objc public dynamic var description_fhir: CodeableConcept?
    public func upsert(description_fhir: CodeableConcept?) {
        upsert(prop: &self.description_fhir, val: description_fhir)
    }
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(dateTime: DateTime, status: String) {
        self.init()
        self.dateTime = dateTime
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case dateTime = "dateTime"
        case description_fhir = "description"
        case status = "status"
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

        self.actor = try container.decodeIfPresent(Reference.self, forKey: .actor)
        self.dateTime = try container.decodeIfPresent(DateTime.self, forKey: .dateTime)
        self.description_fhir = try container.decodeIfPresent(CodeableConcept.self, forKey: .description_fhir)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encodeIfPresent(self.dateTime, forKey: .dateTime)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DiagnosticOrderEvent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DiagnosticOrderEvent. Will return empty instance: \(error))")
		}
		return DiagnosticOrderEvent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DiagnosticOrderEvent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.actor, from: o.actor)
        FireKit.populate(&self.dateTime, from: o.dateTime)
        FireKit.populate(&self.description_fhir, from: o.description_fhir)
        status = o.status
    }
}


/**
 *  The items the orderer requested.
 *
 *  The specific diagnostic investigations that are requested as part of this request. Sometimes, there can only be one
 *  item per request, but in most contexts, more than one investigation can be requested.
 */
open class DiagnosticOrderItem: BackboneElement {
	override open class var resourceType: String {
		get { return "DiagnosticOrderItem" }
	}

    @objc public dynamic var bodySite: CodeableConcept?
    public func upsert(bodySite: CodeableConcept?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let event = RealmSwift.List<DiagnosticOrderEvent>()
    public let specimen = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySite = "bodySite"
        case code = "code"
        case event = "event"
        case specimen = "specimen"
        case status = "status"
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

        self.bodySite = try container.decodeIfPresent(CodeableConcept.self, forKey: .bodySite)
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.event.append(objectsIn: try container.decodeIfPresent([DiagnosticOrderEvent].self, forKey: .event) ?? [])
        self.specimen.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .specimen) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.event), forKey: .event)
        try container.encode(Array(self.specimen), forKey: .specimen)
        try container.encodeIfPresent(self.status, forKey: .status)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DiagnosticOrderItem.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DiagnosticOrderItem. Will return empty instance: \(error))")
		}
		return DiagnosticOrderItem.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DiagnosticOrderItem else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.bodySite, from: o.bodySite)
        FireKit.populate(&self.code, from: o.code)

        for (index, t) in o.event.enumerated() {
            guard index < self.event.count else {
                self.event.append(t)
                continue
            }
            self.event[index].populate(from: t)
        }
    
        if self.event.count > o.event.count {
            for i in self.event.count...o.event.count {
                let objectToRemove = self.event[i]
                self.event.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.specimen.enumerated() {
            guard index < self.specimen.count else {
                self.specimen.append(t)
                continue
            }
            self.specimen[index].populate(from: t)
        }
    
        if self.specimen.count > o.specimen.count {
            for i in self.specimen.count...o.specimen.count {
                let objectToRemove = self.specimen[i]
                self.specimen.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        status = o.status
    }
}

