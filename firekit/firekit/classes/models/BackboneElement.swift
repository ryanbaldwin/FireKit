//
//  BackboneElement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/BackboneElement) on 2017-09-12.
//  2017, SMART Health IT.
//

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
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["modifierExtension"] {
				presentKeys.insert("modifierExtension")
				if let val = exist as? [FHIRJSON] {
					if let vals = Extension.instantiate(fromArray: val, owner: self) as? [Extension] {
						if let realm = self.realm { realm.delete(self.modifierExtension) }
						self.modifierExtension.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "modifierExtension", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if modifierExtension.count > 0 {
			json["modifierExtension"] = Array(modifierExtension.map() { $0.asJSON() })
		}
		
		return json
	}
*/
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
}

