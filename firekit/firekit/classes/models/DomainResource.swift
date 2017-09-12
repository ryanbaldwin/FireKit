//
//  DomainResource.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DomainResource) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A resource with narrative, extensions, and contained resources.
 *
 *  A resource that includes narrative, extensions, and contained resources.
 */
open class DomainResource: Resource {
	override open class var resourceType: String {
		get { return "DomainResource" }
	}

    public let contained = RealmSwift.List<ContainedResource>()
    public let extension_fhir = RealmSwift.List<Extension>()
    public let modifierExtension = RealmSwift.List<Extension>()
    @objc public dynamic var text: Narrative?
    public func upsert(text: Narrative?) {
        upsert(prop: &self.text, val: text)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contained = "contained"
        case extension_fhir = "extension"
        case modifierExtension = "modifierExtension"
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

        if container.contains(.contained) {
            // Need to loop through all the contained items twice.
            // First time through we grab the resource type
            // the second time through we decode the contained resource for the actual resource type
            // I cannot find a better way to do this in Apple's Decodable containers.
            // If there's a way to get at the raw data in a container without decoding it,
            // please let me know and I will buy you 🍻
            var containedMap: [Int: ContainedResource] = [:]
            var containedList = try container.nestedUnkeyedContainer(forKey: .contained)
            print("Inflating \(containedList.count) items.")
            while !containedList.isAtEnd {
                containedMap[containedList.currentIndex] = try containedList.decode(ContainedResource.self)
            }
            
            var secondPass = try container.nestedUnkeyedContainer(forKey: .contained)
            while !secondPass.isAtEnd {
                let containedResource = containedMap[secondPass.currentIndex]!
                let actualResource = try secondPass.decodeFHIRAbstractBase(containedResource.resourceType!)
                containedResource.json = try JSONEncoder().encode(actualResource)
            }
            
            // TODO: need to append!
        }
        self.extension_fhir.append(objectsIn: try container.decodeIfPresent([Extension].self, forKey: .extension_fhir) ?? [])
        self.modifierExtension.append(objectsIn: try container.decodeIfPresent([Extension].self, forKey: .modifierExtension) ?? [])
        self.text = try container.decodeIfPresent(Narrative.self, forKey: .text)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contained), forKey: .contained)
        try container.encode(Array(self.extension_fhir), forKey: .extension_fhir)
        try container.encode(Array(self.modifierExtension), forKey: .modifierExtension)
        try container.encodeIfPresent(self.text, forKey: .text)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contained"] {
				presentKeys.insert("contained")
				if let val = exist as? [FHIRJSON] {
					// 'Resource' == prop.class_name
					self.contained.append(objectsIn: val.map({ return ContainedResource(json: $0, owner: self)}))
				}
				else {
					errors.append(FHIRJSONError(key: "contained", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["extension"] {
				presentKeys.insert("extension")
				if let val = exist as? [FHIRJSON] {
					if let vals = Extension.instantiate(fromArray: val, owner: self) as? [Extension] {
						if let realm = self.realm { realm.delete(self.extension_fhir) }
						self.extension_fhir.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "extension", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
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
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? FHIRJSON {
					upsert(text: Narrative(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if contained.count > 0 {
			json["contained"] = Array(contained.map() { $0.asJSON() })
		}
		if extension_fhir.count > 0 {
			json["extension"] = Array(extension_fhir.map() { $0.asJSON() })
		}
		if modifierExtension.count > 0 {
			json["modifierExtension"] = Array(modifierExtension.map() { $0.asJSON() })
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DomainResource.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DomainResource. Will return empty instance: \(error))")
		}
		return DomainResource.init()
	}
}

