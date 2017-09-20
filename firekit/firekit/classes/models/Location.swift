//
//  Location.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Location) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Details and position information for a physical place.
 *
 *  Details and position information for a physical place where services are provided  and resources and participants
 *  may be stored, found, contained or accommodated.
 */
open class Location: DomainResource {
	override open class var resourceType: String {
		get { return "Location" }
	}

    @objc public dynamic var address: Address?
    public func upsert(address: Address?) {
        upsert(prop: &self.address, val: address)
    }
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var managingOrganization: Reference?
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }
    @objc public dynamic var mode: String?
    @objc public dynamic var name: String?
    @objc public dynamic var partOf: Reference?
    public func upsert(partOf: Reference?) {
        upsert(prop: &self.partOf, val: partOf)
    }
    @objc public dynamic var physicalType: CodeableConcept?
    public func upsert(physicalType: CodeableConcept?) {
        upsert(prop: &self.physicalType, val: physicalType)
    }
    @objc public dynamic var position: LocationPosition?
    public func upsert(position: LocationPosition?) {
        upsert(prop: &self.position, val: position)
    }
    @objc public dynamic var status: String?
    public let telecom = RealmSwift.List<ContactPoint>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case description_fhir = "description"
        case identifier = "identifier"
        case managingOrganization = "managingOrganization"
        case mode = "mode"
        case name = "name"
        case partOf = "partOf"
        case physicalType = "physicalType"
        case position = "position"
        case status = "status"
        case telecom = "telecom"
        case type = "type"
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

        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.managingOrganization = try container.decodeIfPresent(Reference.self, forKey: .managingOrganization)
        self.mode = try container.decodeIfPresent(String.self, forKey: .mode)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.partOf = try container.decodeIfPresent(Reference.self, forKey: .partOf)
        self.physicalType = try container.decodeIfPresent(CodeableConcept.self, forKey: .physicalType)
        self.position = try container.decodeIfPresent(LocationPosition.self, forKey: .position)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.managingOrganization, forKey: .managingOrganization)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.partOf, forKey: .partOf)
        try container.encodeIfPresent(self.physicalType, forKey: .physicalType)
        try container.encodeIfPresent(self.position, forKey: .position)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.telecom), forKey: .telecom)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Location.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Location. Will return empty instance: \(error))")
		}
		return Location.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Location else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.address, from: o.address)
        description_fhir = o.description_fhir

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                self.identifier.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.managingOrganization, from: o.managingOrganization)
        mode = o.mode
        name = o.name
        FireKit.populate(&self.partOf, from: o.partOf)
        FireKit.populate(&self.physicalType, from: o.physicalType)
        FireKit.populate(&self.position, from: o.position)
        status = o.status

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        if self.telecom.count > o.telecom.count {
            for i in self.telecom.count...o.telecom.count {
                self.telecom.remove(objectAtIndex: i)
            }
        }
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  The absolute geographic location.
 *
 *  The absolute geographic location of the Location, expressed using the WGS84 datum (This is the same co-ordinate
 *  system used in KML).
 */
open class LocationPosition: BackboneElement {
	override open class var resourceType: String {
		get { return "LocationPosition" }
	}

    @objc public dynamic var altitude: RealmDecimal?
    @objc public dynamic var latitude: RealmDecimal?
    @objc public dynamic var longitude: RealmDecimal?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(latitude: RealmDecimal, longitude: RealmDecimal) {
        self.init()
        self.latitude = latitude
        self.longitude = longitude
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case altitude = "altitude"
        case latitude = "latitude"
        case longitude = "longitude"
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

        self.altitude = try container.decodeIfPresent(RealmDecimal.self, forKey: .altitude)
        self.latitude = try container.decodeIfPresent(RealmDecimal.self, forKey: .latitude)
        self.longitude = try container.decodeIfPresent(RealmDecimal.self, forKey: .longitude)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.altitude, forKey: .altitude)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(LocationPosition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy LocationPosition. Will return empty instance: \(error))")
		}
		return LocationPosition.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? LocationPosition else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        altitude = o.altitude
        latitude = o.latitude
        longitude = o.longitude
    }
}

