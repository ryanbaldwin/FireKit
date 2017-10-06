//
//  Meta.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Meta) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Metadata about a resource.
 *
 *  The metadata about a resource. This is content in the resource that is maintained by the infrastructure. Changes to
 *  the content may not always be associated with version changes to the resource.
 */
open class Meta: Element {
	override open class var resourceType: String {
		get { return "Meta" }
	}

    @objc public dynamic var lastUpdated: Instant?
    public let profile = RealmSwift.List<RealmString>()
    public let security = RealmSwift.List<Coding>()
    public let tag = RealmSwift.List<Coding>()
    @objc public dynamic var versionId: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case lastUpdated = "lastUpdated"
        case profile = "profile"
        case security = "security"
        case tag = "tag"
        case versionId = "versionId"
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

        self.lastUpdated = try container.decodeIfPresent(Instant.self, forKey: .lastUpdated)
        self.profile.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .profile) ?? [])
        self.security.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .security) ?? [])
        self.tag.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .tag) ?? [])
        self.versionId = try container.decodeIfPresent(String.self, forKey: .versionId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.lastUpdated, forKey: .lastUpdated)
        try container.encode(Array(self.profile), forKey: .profile)
        try container.encode(Array(self.security), forKey: .security)
        try container.encode(Array(self.tag), forKey: .tag)
        try container.encodeIfPresent(self.versionId, forKey: .versionId)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Meta.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Meta. Will return empty instance: \(error))")
		}
		return Meta.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Meta else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.lastUpdated, from: o.lastUpdated)

        for (index, t) in o.profile.enumerated() {
            guard index < self.profile.count else {
                self.profile.append(t)
                continue
            }
            self.profile[index].populate(from: t)
        }
    
        while self.profile.count > o.profile.count {
            let objectToRemove = self.profile.last!
            self.profile.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.security.enumerated() {
            guard index < self.security.count else {
                self.security.append(t)
                continue
            }
            self.security[index].populate(from: t)
        }
    
        while self.security.count > o.security.count {
            let objectToRemove = self.security.last!
            self.security.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.tag.enumerated() {
            guard index < self.tag.count else {
                self.tag.append(t)
                continue
            }
            self.tag[index].populate(from: t)
        }
    
        while self.tag.count > o.tag.count {
            let objectToRemove = self.tag.last!
            self.tag.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        versionId = o.versionId
    }
}

