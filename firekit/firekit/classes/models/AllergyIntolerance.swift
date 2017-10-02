//
//  AllergyIntolerance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AllergyIntolerance) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Allergy or Intolerance (generally: Risk Of Adverse reaction to a substance).
 *
 *  Risk of harmful or undesirable, physiological response which is unique to an individual and associated with exposure
 *  to a substance.
 */
open class AllergyIntolerance: DomainResource {
	override open class var resourceType: String {
		get { return "AllergyIntolerance" }
	}

    @objc public dynamic var category: String?
    @objc public dynamic var criticality: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var lastOccurence: DateTime?
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    @objc public dynamic var onset: DateTime?
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    public let reaction = RealmSwift.List<AllergyIntoleranceReaction>()
    @objc public dynamic var recordedDate: DateTime?
    @objc public dynamic var recorder: Reference?
    public func upsert(recorder: Reference?) {
        upsert(prop: &self.recorder, val: recorder)
    }
    @objc public dynamic var reporter: Reference?
    public func upsert(reporter: Reference?) {
        upsert(prop: &self.reporter, val: reporter)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var substance: CodeableConcept?
    public func upsert(substance: CodeableConcept?) {
        upsert(prop: &self.substance, val: substance)
    }
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, substance: CodeableConcept) {
        self.init()
        self.patient = patient
        self.substance = substance
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case criticality = "criticality"
        case identifier = "identifier"
        case lastOccurence = "lastOccurence"
        case note = "note"
        case onset = "onset"
        case patient = "patient"
        case reaction = "reaction"
        case recordedDate = "recordedDate"
        case recorder = "recorder"
        case reporter = "reporter"
        case status = "status"
        case substance = "substance"
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

        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.criticality = try container.decodeIfPresent(String.self, forKey: .criticality)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.lastOccurence = try container.decodeIfPresent(DateTime.self, forKey: .lastOccurence)
        self.note = try container.decodeIfPresent(Annotation.self, forKey: .note)
        self.onset = try container.decodeIfPresent(DateTime.self, forKey: .onset)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.reaction.append(objectsIn: try container.decodeIfPresent([AllergyIntoleranceReaction].self, forKey: .reaction) ?? [])
        self.recordedDate = try container.decodeIfPresent(DateTime.self, forKey: .recordedDate)
        self.recorder = try container.decodeIfPresent(Reference.self, forKey: .recorder)
        self.reporter = try container.decodeIfPresent(Reference.self, forKey: .reporter)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.substance = try container.decodeIfPresent(CodeableConcept.self, forKey: .substance)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.criticality, forKey: .criticality)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.lastOccurence, forKey: .lastOccurence)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.onset, forKey: .onset)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(Array(self.reaction), forKey: .reaction)
        try container.encodeIfPresent(self.recordedDate, forKey: .recordedDate)
        try container.encodeIfPresent(self.recorder, forKey: .recorder)
        try container.encodeIfPresent(self.reporter, forKey: .reporter)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.substance, forKey: .substance)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AllergyIntolerance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AllergyIntolerance. Will return empty instance: \(error))")
		}
		return AllergyIntolerance.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AllergyIntolerance else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        category = o.category
        criticality = o.criticality

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
        FireKit.populate(&self.lastOccurence, from: o.lastOccurence)
        FireKit.populate(&self.note, from: o.note)
        FireKit.populate(&self.onset, from: o.onset)
        FireKit.populate(&self.patient, from: o.patient)

        for (index, t) in o.reaction.enumerated() {
            guard index < self.reaction.count else {
                self.reaction.append(t)
                continue
            }
            self.reaction[index].populate(from: t)
        }
    
        if self.reaction.count > o.reaction.count {
            for i in self.reaction.count...o.reaction.count {
                let objectToRemove = self.reaction[i]
                self.reaction.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.recordedDate, from: o.recordedDate)
        FireKit.populate(&self.recorder, from: o.recorder)
        FireKit.populate(&self.reporter, from: o.reporter)
        status = o.status
        FireKit.populate(&self.substance, from: o.substance)
        type = o.type
    }
}


/**
 *  Adverse Reaction Events linked to exposure to substance.
 *
 *  Details about each adverse reaction event linked to exposure to the identified Substance.
 */
open class AllergyIntoleranceReaction: BackboneElement {
	override open class var resourceType: String {
		get { return "AllergyIntoleranceReaction" }
	}

    @objc public dynamic var certainty: String?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var exposureRoute: CodeableConcept?
    public func upsert(exposureRoute: CodeableConcept?) {
        upsert(prop: &self.exposureRoute, val: exposureRoute)
    }
    public let manifestation = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    @objc public dynamic var onset: DateTime?
    @objc public dynamic var severity: String?
    @objc public dynamic var substance: CodeableConcept?
    public func upsert(substance: CodeableConcept?) {
        upsert(prop: &self.substance, val: substance)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(manifestation: [CodeableConcept]) {
        self.init()
        self.manifestation.append(objectsIn: manifestation)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case certainty = "certainty"
        case description_fhir = "description"
        case exposureRoute = "exposureRoute"
        case manifestation = "manifestation"
        case note = "note"
        case onset = "onset"
        case severity = "severity"
        case substance = "substance"
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

        self.certainty = try container.decodeIfPresent(String.self, forKey: .certainty)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.exposureRoute = try container.decodeIfPresent(CodeableConcept.self, forKey: .exposureRoute)
        self.manifestation.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .manifestation) ?? [])
        self.note = try container.decodeIfPresent(Annotation.self, forKey: .note)
        self.onset = try container.decodeIfPresent(DateTime.self, forKey: .onset)
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
        self.substance = try container.decodeIfPresent(CodeableConcept.self, forKey: .substance)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.certainty, forKey: .certainty)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.exposureRoute, forKey: .exposureRoute)
        try container.encode(Array(self.manifestation), forKey: .manifestation)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.onset, forKey: .onset)
        try container.encodeIfPresent(self.severity, forKey: .severity)
        try container.encodeIfPresent(self.substance, forKey: .substance)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(AllergyIntoleranceReaction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy AllergyIntoleranceReaction. Will return empty instance: \(error))")
		}
		return AllergyIntoleranceReaction.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? AllergyIntoleranceReaction else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        certainty = o.certainty
        description_fhir = o.description_fhir
        FireKit.populate(&self.exposureRoute, from: o.exposureRoute)

        for (index, t) in o.manifestation.enumerated() {
            guard index < self.manifestation.count else {
                self.manifestation.append(t)
                continue
            }
            self.manifestation[index].populate(from: t)
        }
    
        if self.manifestation.count > o.manifestation.count {
            for i in self.manifestation.count...o.manifestation.count {
                let objectToRemove = self.manifestation[i]
                self.manifestation.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.note, from: o.note)
        FireKit.populate(&self.onset, from: o.onset)
        severity = o.severity
        FireKit.populate(&self.substance, from: o.substance)
    }
}

