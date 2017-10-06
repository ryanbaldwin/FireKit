//
//  BackboneElement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/BackboneElement) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Base for elements defined inside a resource.
 *
 *  Base definition for all elements that are defined inside a resource - but not those in a data type.
 */
open class BackboneElement: Element {
	override open class var resourceType: String {
		get { return "BackboneElement" }
	}

    public let modifierExtension = RealmSwift.List<Extension>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case modifierExtension = "modifierExtension"
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

        self.modifierExtension.append(objectsIn: try container.decodeIfPresent([Extension].self, forKey: .modifierExtension) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.modifierExtension), forKey: .modifierExtension)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(BackboneElement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy BackboneElement. Will return empty instance: \(error))")
		}
		return BackboneElement.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? BackboneElement else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.modifierExtension.enumerated() {
            guard index < self.modifierExtension.count else {
                self.modifierExtension.append(t)
                continue
            }
            self.modifierExtension[index].populate(from: t)
        }
    
        while self.modifierExtension.count > o.modifierExtension.count {
            let objectToRemove = self.modifierExtension.last!
            self.modifierExtension.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}

