//
//  RelatedPerson.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/RelatedPerson) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  An person that is related to a patient, but who is not a direct target of care.
 *
 *  Information about a person that is involved in the care for a patient, but who is not the target of healthcare, nor
 *  has a formal responsibility in the care process.
 */
open class RelatedPerson: DomainResource {
	override open class var resourceType: String {
		get { return "RelatedPerson" }
	}

    public let address = RealmSwift.List<Address>()
    @objc public dynamic var birthDate: FHIRDate?
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: HumanName?
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let photo = RealmSwift.List<Attachment>()
    @objc public dynamic var relationship: CodeableConcept?
    public func upsert(relationship: CodeableConcept?) {
        upsert(prop: &self.relationship, val: relationship)
    }
    public let telecom = RealmSwift.List<ContactPoint>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference) {
        self.init()
        self.patient = patient
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case birthDate = "birthDate"
        case gender = "gender"
        case identifier = "identifier"
        case name = "name"
        case patient = "patient"
        case period = "period"
        case photo = "photo"
        case relationship = "relationship"
        case telecom = "telecom"
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

        self.address.append(objectsIn: try container.decodeIfPresent([Address].self, forKey: .address) ?? [])
        self.birthDate = try container.decodeIfPresent(FHIRDate.self, forKey: .birthDate)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.name = try container.decodeIfPresent(HumanName.self, forKey: .name)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.photo.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .photo) ?? [])
        self.relationship = try container.decodeIfPresent(CodeableConcept.self, forKey: .relationship)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.address), forKey: .address)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.photo), forKey: .photo)
        try container.encodeIfPresent(self.relationship, forKey: .relationship)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(RelatedPerson.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy RelatedPerson. Will return empty instance: \(error))")
		}
		return RelatedPerson.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? RelatedPerson else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.address.enumerated() {
            guard index < self.address.count else {
                self.address.append(t)
                continue
            }
            self.address[index].populate(from: t)
        }
    
        while self.address.count > o.address.count {
            let objectToRemove = self.address.last!
            self.address.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.birthDate, from: o.birthDate)
        gender = o.gender

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.name, from: o.name)
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.period, from: o.period)

        for (index, t) in o.photo.enumerated() {
            guard index < self.photo.count else {
                self.photo.append(t)
                continue
            }
            self.photo[index].populate(from: t)
        }
    
        while self.photo.count > o.photo.count {
            let objectToRemove = self.photo.last!
            self.photo.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.relationship, from: o.relationship)

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        while self.telecom.count > o.telecom.count {
            let objectToRemove = self.telecom.last!
            self.telecom.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}

