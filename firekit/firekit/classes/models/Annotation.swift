//
//  Annotation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Annotation) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Text node with attribution.
 *
 *  A  text note which also  contains information about who made the statement and when.
 */
open class Annotation: Element {
	override open class var resourceType: String {
		get { return "Annotation" }
	}

    @objc public dynamic var authorReference: Reference?
    public func upsert(authorReference: Reference?) {
        upsert(prop: &self.authorReference, val: authorReference)
    }
    @objc public dynamic var authorString: String?
    @objc public dynamic var text: String?
    @objc public dynamic var time: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(text: String) {
        self.init()
        self.text = text
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authorReference = "authorReference"
        case authorString = "authorString"
        case text = "text"
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

        self.authorReference = try container.decodeIfPresent(Reference.self, forKey: .authorReference)
        self.authorString = try container.decodeIfPresent(String.self, forKey: .authorString)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.time = try container.decodeIfPresent(DateTime.self, forKey: .time)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.authorReference, forKey: .authorReference)
        try container.encodeIfPresent(self.authorString, forKey: .authorString)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.time, forKey: .time)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Annotation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Annotation. Will return empty instance: \(error))")
		}
		return Annotation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Annotation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.authorReference, from: o.authorReference)
        authorString = o.authorString
        text = o.text
        FireKit.populate(&self.time, from: o.time)
    }
}

