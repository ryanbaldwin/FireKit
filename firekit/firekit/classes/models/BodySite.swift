//
//  BodySite.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/BodySite) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Specific and identified anatomical location.
 *
 *  Record details about the anatomical location of a specimen or body part.  This resource may be used when a coded
 *  concept does not provide the necessary detail needed for the use case.
 */
open class BodySite: DomainResource {
	override open class var resourceType: String {
		get { return "BodySite" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let image = RealmSwift.List<Attachment>()
    public let modifier = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference) {
        self.init()
        self.patient = patient
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case description_fhir = "description"
        case identifier = "identifier"
        case image = "image"
        case modifier = "modifier"
        case patient = "patient"
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
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.image.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .image) ?? [])
        self.modifier.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .modifier) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.image), forKey: .image)
        try container.encode(Array(self.modifier), forKey: .modifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BodySite.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BodySite. Will return empty instance: \(error))")
		}
		return BodySite.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? BodySite else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        description_fhir = o.description_fhir
        // TODO: identifier array
        // TODO: image array
        // TODO: modifier array
        FireKit.populate(&self.patient, from: o.patient)
    }
}

