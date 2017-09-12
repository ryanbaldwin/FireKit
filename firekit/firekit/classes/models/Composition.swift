//
//  Composition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Composition) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A set of resources composed into a single coherent clinical statement with clinical attestation.
 *
 *  A set of healthcare-related information that is assembled together into a single logical document that provides a
 *  single coherent statement of meaning, establishes its own context and that has clinical attestation with regard to
 *  who is making the statement. While a Composition defines the structure, it does not actually contain the content:
 *  rather the full content of a document is contained in a Bundle, of which the Composition is the first resource
 *  contained.
 */
open class Composition: DomainResource {
	override open class var resourceType: String {
		get { return "Composition" }
	}

    public let attester = RealmSwift.List<CompositionAttester>()
    public let author = RealmSwift.List<Reference>()
    @objc public dynamic var class_fhir: CodeableConcept?
    public func upsert(class_fhir: CodeableConcept?) {
        upsert(prop: &self.class_fhir, val: class_fhir)
    }
    @objc public dynamic var confidentiality: String?
    @objc public dynamic var custodian: Reference?
    public func upsert(custodian: Reference?) {
        upsert(prop: &self.custodian, val: custodian)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let event = RealmSwift.List<CompositionEvent>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    public let section = RealmSwift.List<CompositionSection>()
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var title: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(author: [Reference], date: DateTime, status: String, subject: Reference, title: String, type: CodeableConcept) {
        self.init()
        self.author.append(objectsIn: author)
        self.date = date
        self.status = status
        self.subject = subject
        self.title = title
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case attester = "attester"
        case author = "author"
        case class_fhir = "class"
        case confidentiality = "confidentiality"
        case custodian = "custodian"
        case date = "date"
        case encounter = "encounter"
        case event = "event"
        case identifier = "identifier"
        case section = "section"
        case status = "status"
        case subject = "subject"
        case title = "title"
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

        self.attester.append(objectsIn: try container.decodeIfPresent([CompositionAttester].self, forKey: .attester) ?? [])
        self.author.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .author) ?? [])
        self.class_fhir = try container.decodeIfPresent(CodeableConcept.self, forKey: .class_fhir)
        self.confidentiality = try container.decodeIfPresent(String.self, forKey: .confidentiality)
        self.custodian = try container.decodeIfPresent(Reference.self, forKey: .custodian)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.event.append(objectsIn: try container.decodeIfPresent([CompositionEvent].self, forKey: .event) ?? [])
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.section.append(objectsIn: try container.decodeIfPresent([CompositionSection].self, forKey: .section) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.attester), forKey: .attester)
        try container.encode(Array(self.author), forKey: .author)
        try container.encodeIfPresent(self.class_fhir, forKey: .class_fhir)
        try container.encodeIfPresent(self.confidentiality, forKey: .confidentiality)
        try container.encodeIfPresent(self.custodian, forKey: .custodian)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.event), forKey: .event)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encode(Array(self.section), forKey: .section)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Composition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Composition. Will return empty instance: \(error))")
		}
		return Composition.init()
	}
}


/**
 *  Attests to accuracy of composition.
 *
 *  A participant who has attested to the accuracy of the composition/document.
 */
open class CompositionAttester: BackboneElement {
	override open class var resourceType: String {
		get { return "CompositionAttester" }
	}

    public let mode = RealmSwift.List<RealmString>()
    @objc public dynamic var party: Reference?
    public func upsert(party: Reference?) {
        upsert(prop: &self.party, val: party)
    }
    @objc public dynamic var time: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(mode: [String]) {
        self.init()
        self.mode.append(objectsIn: mode.map{ RealmString(value: [$0]) })
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case mode = "mode"
        case party = "party"
        case time = "time"
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

        self.mode.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .mode) ?? [])
        self.party = try container.decodeIfPresent(Reference.self, forKey: .party)
        self.time = try container.decodeIfPresent(DateTime.self, forKey: .time)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.mode), forKey: .mode)
        try container.encodeIfPresent(self.party, forKey: .party)
        try container.encodeIfPresent(self.time, forKey: .time)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CompositionAttester.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CompositionAttester. Will return empty instance: \(error))")
		}
		return CompositionAttester.init()
	}
}


/**
 *  The clinical service(s) being documented.
 *
 *  The clinical service, such as a colonoscopy or an appendectomy, being documented.
 */
open class CompositionEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "CompositionEvent" }
	}

    public let code = RealmSwift.List<CodeableConcept>()
    public let detail = RealmSwift.List<Reference>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case detail = "detail"
        case period = "period"
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

        self.code.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .code) ?? [])
        self.detail.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .detail) ?? [])
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.code), forKey: .code)
        try container.encode(Array(self.detail), forKey: .detail)
        try container.encodeIfPresent(self.period, forKey: .period)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CompositionEvent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CompositionEvent. Will return empty instance: \(error))")
		}
		return CompositionEvent.init()
	}
}


/**
 *  Composition is broken into sections.
 *
 *  The root of the sections that make up the composition.
 */
open class CompositionSection: BackboneElement {
	override open class var resourceType: String {
		get { return "CompositionSection" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var emptyReason: CodeableConcept?
    public func upsert(emptyReason: CodeableConcept?) {
        upsert(prop: &self.emptyReason, val: emptyReason)
    }
    public let entry = RealmSwift.List<Reference>()
    @objc public dynamic var mode: String?
    @objc public dynamic var orderedBy: CodeableConcept?
    public func upsert(orderedBy: CodeableConcept?) {
        upsert(prop: &self.orderedBy, val: orderedBy)
    }
    public let section = RealmSwift.List<CompositionSection>()
    @objc public dynamic var text: Narrative?
    public func upsert(text: Narrative?) {
        upsert(prop: &self.text, val: text)
    }
    @objc public dynamic var title: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case emptyReason = "emptyReason"
        case entry = "entry"
        case mode = "mode"
        case orderedBy = "orderedBy"
        case section = "section"
        case text = "text"
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
        self.emptyReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .emptyReason)
        self.entry.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .entry) ?? [])
        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.orderedBy = try container.decodeIfPresent(CodeableConcept.self, forKey: .orderedBy)
        self.section.append(objectsIn: try container.decodeIfPresent([CompositionSection].self, forKey: .section) ?? [])
        self.text = try container.decodeIfPresent(Narrative.self, forKey: .text)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.emptyReason, forKey: .emptyReason)
        try container.encode(Array(self.entry), forKey: .entry)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.orderedBy, forKey: .orderedBy)
        try container.encode(Array(self.section), forKey: .section)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.title, forKey: .title)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CompositionSection.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CompositionSection. Will return empty instance: \(error))")
		}
		return CompositionSection.init()
	}
}

