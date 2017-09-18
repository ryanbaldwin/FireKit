//
//  DomainResource.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DomainResource) on 2017-09-18.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-18
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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
            var inflatedContainers: [ContainedResource] = []
            var containedList = try container.nestedUnkeyedContainer(forKey: .contained)
            //print("Inflating \(containedList.count ?? 0) items.")
            while !containedList.isAtEnd {
                inflatedContainers.append(try containedList.decode(ContainedResource.self))
            }
            
            var secondPass = try container.nestedUnkeyedContainer(forKey: .contained)
            while !secondPass.isAtEnd {
                let containedResource = inflatedContainers[secondPass.currentIndex]
                let actualResource = try secondPass.decodeFHIRAbstractBase(containedResource.resourceType!)
                containedResource.json = try JSONEncoder().encode(actualResource)
            }
            
            self.contained.append(objectsIn: inflatedContainers)
        }
        self.extension_fhir.append(objectsIn: try container.decodeIfPresent([Extension].self, forKey: .extension_fhir) ?? [])
        self.modifierExtension.append(objectsIn: try container.decodeIfPresent([Extension].self, forKey: .modifierExtension) ?? [])
        self.text = try container.decodeIfPresent(Narrative.self, forKey: .text)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        let containedItems = Array(self.contained.flatMap { $0.resource })
        try container.encode(containedItems, forKey: .contained)
        try container.encode(Array(self.extension_fhir), forKey: .extension_fhir)
        try container.encode(Array(self.modifierExtension), forKey: .modifierExtension)
        try container.encodeIfPresent(self.text, forKey: .text)
    }

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

