//
//  Signature.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Signature) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A digital Signature - XML DigSig, JWT, Graphical image of signature, etc..
 *
 *  A digital signature along with supporting context. The signature may be electronic/cryptographic in nature, or a
 *  graphical image representing a hand-written signature, or a signature process. Different Signature approaches have
 *  different utilities.
 */
open class Signature: Element {
	override open class var resourceType: String {
		get { return "Signature" }
	}

    @objc public dynamic var blob: Base64Binary?
    @objc public dynamic var contentType: String?
    public let type = RealmSwift.List<Coding>()
    @objc public dynamic var when: Instant?
    @objc public dynamic var whoReference: Reference?
    public func upsert(whoReference: Reference?) {
        upsert(prop: &self.whoReference, val: whoReference)
    }
    @objc public dynamic var whoUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(blob: Base64Binary, contentType: String, type: [Coding], when: Instant, whoReference: Reference, whoUri: String) {
        self.init()
        self.blob = blob
        self.contentType = contentType
        self.type.append(objectsIn: type)
        self.when = when
        self.whoReference = whoReference
        self.whoUri = whoUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case blob = "blob"
        case contentType = "contentType"
        case type = "type"
        case when = "when"
        case whoReference = "whoReference"
        case whoUri = "whoUri"
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

        self.blob = try container.decodeIfPresent(Base64Binary.self, forKey: .blob)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.type.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .type) ?? [])
        self.when = try container.decodeIfPresent(Instant.self, forKey: .when)
        self.whoReference = try container.decodeIfPresent(Reference.self, forKey: .whoReference)
        self.whoUri = try container.decodeIfPresent(String.self, forKey: .whoUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.blob, forKey: .blob)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
        try container.encode(Array(self.type), forKey: .type)
        try container.encodeIfPresent(self.when, forKey: .when)
        try container.encodeIfPresent(self.whoReference, forKey: .whoReference)
        try container.encodeIfPresent(self.whoUri, forKey: .whoUri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Signature.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Signature. Will return empty instance: \(error))")
		}
		return Signature.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Signature else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        blob = o.blob
        contentType = o.contentType

        for (index, t) in o.type.enumerated() {
            guard index < self.type.count else {
                self.type.append(t)
                continue
            }
            self.type[index].populate(from: t)
        }
    
        while self.type.count > o.type.count {
            let objectToRemove = self.type.last!
            self.type.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.when, from: o.when)
        FireKit.populate(&self.whoReference, from: o.whoReference)
        whoUri = o.whoUri
    }
}

