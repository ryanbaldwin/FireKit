//
//  CodeableConcept.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/CodeableConcept) on 2017-11-07.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-11-07
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Concept - reference to a terminology or just  text.
 *
 *  A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text.
 */
open class CodeableConcept: Element {
	override open class var resourceType: String {
		get { return "CodeableConcept" }
	}

    public let coding = RealmSwift.List<Coding>()
    @objc public dynamic var text: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case coding = "coding"
        case text = "text"
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

        self.coding.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .coding) ?? [])
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.coding), forKey: .coding)
        try container.encodeIfPresent(self.text, forKey: .text)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(CodeableConcept.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy CodeableConcept. Will return empty instance: \(error))")
		}
		return CodeableConcept.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? CodeableConcept else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.coding.enumerated() {
            guard index < self.coding.count else {
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = Coding()
                val.populate(from: t)
                self.coding.append(val)
                continue
            }
            self.coding[index].populate(from: t)
        }
    
        while self.coding.count > o.coding.count {
            let objectToRemove = self.coding.last!
            self.coding.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        text = o.text
    }
}

