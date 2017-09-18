//
//  Media.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Media) on 2017-09-18.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-18
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A photo, video, or audio recording acquired or used in healthcare. The actual content may be inline or provided by
 *  direct reference.
 */
open class Media: DomainResource {
	override open class var resourceType: String {
		get { return "Media" }
	}

    @objc public dynamic var content: Attachment?
    public func upsert(content: Attachment?) {
        upsert(prop: &self.content, val: content)
    }
    @objc public dynamic var deviceName: String?
    public let duration = RealmOptional<Int>()
    public let frames = RealmOptional<Int>()
    public let height = RealmOptional<Int>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var operator_fhir: Reference?
    public func upsert(operator_fhir: Reference?) {
        upsert(prop: &self.operator_fhir, val: operator_fhir)
    }
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var subtype: CodeableConcept?
    public func upsert(subtype: CodeableConcept?) {
        upsert(prop: &self.subtype, val: subtype)
    }
    @objc public dynamic var type: String?
    @objc public dynamic var view: CodeableConcept?
    public func upsert(view: CodeableConcept?) {
        upsert(prop: &self.view, val: view)
    }
    public let width = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(content: Attachment, type: String) {
        self.init()
        self.content = content
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case content = "content"
        case deviceName = "deviceName"
        case duration = "duration"
        case frames = "frames"
        case height = "height"
        case identifier = "identifier"
        case operator_fhir = "operator"
        case subject = "subject"
        case subtype = "subtype"
        case type = "type"
        case view = "view"
        case width = "width"
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

        self.content = try container.decodeIfPresent(Attachment.self, forKey: .content)
        self.deviceName = try container.decodeIfPresent(String.self, forKey: .deviceName)
        self.duration.value = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.frames.value = try container.decodeIfPresent(Int.self, forKey: .frames)
        self.height.value = try container.decodeIfPresent(Int.self, forKey: .height)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.operator_fhir = try container.decodeIfPresent(Reference.self, forKey: .operator_fhir)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.subtype = try container.decodeIfPresent(CodeableConcept.self, forKey: .subtype)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.view = try container.decodeIfPresent(CodeableConcept.self, forKey: .view)
        self.width.value = try container.decodeIfPresent(Int.self, forKey: .width)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.content, forKey: .content)
        try container.encodeIfPresent(self.deviceName, forKey: .deviceName)
        try container.encodeIfPresent(self.duration.value, forKey: .duration)
        try container.encodeIfPresent(self.frames.value, forKey: .frames)
        try container.encodeIfPresent(self.height.value, forKey: .height)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.operator_fhir, forKey: .operator_fhir)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.subtype, forKey: .subtype)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.view, forKey: .view)
        try container.encodeIfPresent(self.width.value, forKey: .width)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Media.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Media. Will return empty instance: \(error))")
		}
		return Media.init()
	}
}

