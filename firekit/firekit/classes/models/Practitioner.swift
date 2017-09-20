//
//  Practitioner.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Practitioner) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A person with a  formal responsibility in the provisioning of healthcare or related services.
 *
 *  A person who is directly or indirectly involved in the provisioning of healthcare.
 */
open class Practitioner: DomainResource {
	override open class var resourceType: String {
		get { return "Practitioner" }
	}

    public let active = RealmOptional<Bool>()
    public let address = RealmSwift.List<Address>()
    @objc public dynamic var birthDate: FHIRDate?
    public let communication = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var name: HumanName?
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }
    public let photo = RealmSwift.List<Attachment>()
    public let practitionerRole = RealmSwift.List<PractitionerPractitionerRole>()
    public let qualification = RealmSwift.List<PractitionerQualification>()
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case active = "active"
        case address = "address"
        case birthDate = "birthDate"
        case communication = "communication"
        case gender = "gender"
        case identifier = "identifier"
        case name = "name"
        case photo = "photo"
        case practitionerRole = "practitionerRole"
        case qualification = "qualification"
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

        self.active.value = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.address.append(objectsIn: try container.decodeIfPresent([Address].self, forKey: .address) ?? [])
        self.birthDate = try container.decodeIfPresent(FHIRDate.self, forKey: .birthDate)
        self.communication.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .communication) ?? [])
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.name = try container.decodeIfPresent(HumanName.self, forKey: .name)
        self.photo.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .photo) ?? [])
        self.practitionerRole.append(objectsIn: try container.decodeIfPresent([PractitionerPractitionerRole].self, forKey: .practitionerRole) ?? [])
        self.qualification.append(objectsIn: try container.decodeIfPresent([PractitionerQualification].self, forKey: .qualification) ?? [])
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.active.value, forKey: .active)
        try container.encode(Array(self.address), forKey: .address)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encode(Array(self.communication), forKey: .communication)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.photo), forKey: .photo)
        try container.encode(Array(self.practitionerRole), forKey: .practitionerRole)
        try container.encode(Array(self.qualification), forKey: .qualification)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Practitioner.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Practitioner. Will return empty instance: \(error))")
		}
		return Practitioner.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Practitioner else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        active.value = o.active.value

        for (index, t) in o.address.enumerated() {
            guard index < self.address.count else {
                self.address.append(t)
                continue
            }
            self.address[index].populate(from: t)
        }
    
        if self.address.count > o.address.count {
            for i in self.address.count...o.address.count {
                let objectToRemove = self.address[i]
                self.address.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.birthDate, from: o.birthDate)

        for (index, t) in o.communication.enumerated() {
            guard index < self.communication.count else {
                self.communication.append(t)
                continue
            }
            self.communication[index].populate(from: t)
        }
    
        if self.communication.count > o.communication.count {
            for i in self.communication.count...o.communication.count {
                let objectToRemove = self.communication[i]
                self.communication.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        gender = o.gender

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                let objectToRemove = self.identifier[i]
                self.identifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.name, from: o.name)

        for (index, t) in o.photo.enumerated() {
            guard index < self.photo.count else {
                self.photo.append(t)
                continue
            }
            self.photo[index].populate(from: t)
        }
    
        if self.photo.count > o.photo.count {
            for i in self.photo.count...o.photo.count {
                let objectToRemove = self.photo[i]
                self.photo.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.practitionerRole.enumerated() {
            guard index < self.practitionerRole.count else {
                self.practitionerRole.append(t)
                continue
            }
            self.practitionerRole[index].populate(from: t)
        }
    
        if self.practitionerRole.count > o.practitionerRole.count {
            for i in self.practitionerRole.count...o.practitionerRole.count {
                let objectToRemove = self.practitionerRole[i]
                self.practitionerRole.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.qualification.enumerated() {
            guard index < self.qualification.count else {
                self.qualification.append(t)
                continue
            }
            self.qualification[index].populate(from: t)
        }
    
        if self.qualification.count > o.qualification.count {
            for i in self.qualification.count...o.qualification.count {
                let objectToRemove = self.qualification[i]
                self.qualification.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.telecom.enumerated() {
            guard index < self.telecom.count else {
                self.telecom.append(t)
                continue
            }
            self.telecom[index].populate(from: t)
        }
    
        if self.telecom.count > o.telecom.count {
            for i in self.telecom.count...o.telecom.count {
                let objectToRemove = self.telecom[i]
                self.telecom.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
    }
}


/**
 *  Roles/organizations the practitioner is associated with.
 *
 *  The list of roles/organizations that the practitioner is associated with.
 */
open class PractitionerPractitionerRole: BackboneElement {
	override open class var resourceType: String {
		get { return "PractitionerPractitionerRole" }
	}

    public let healthcareService = RealmSwift.List<Reference>()
    public let location = RealmSwift.List<Reference>()
    @objc public dynamic var managingOrganization: Reference?
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    @objc public dynamic var role: CodeableConcept?
    public func upsert(role: CodeableConcept?) {
        upsert(prop: &self.role, val: role)
    }
    public let specialty = RealmSwift.List<CodeableConcept>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case healthcareService = "healthcareService"
        case location = "location"
        case managingOrganization = "managingOrganization"
        case period = "period"
        case role = "role"
        case specialty = "specialty"
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

        self.healthcareService.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .healthcareService) ?? [])
        self.location.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .location) ?? [])
        self.managingOrganization = try container.decodeIfPresent(Reference.self, forKey: .managingOrganization)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.role = try container.decodeIfPresent(CodeableConcept.self, forKey: .role)
        self.specialty.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .specialty) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.healthcareService), forKey: .healthcareService)
        try container.encode(Array(self.location), forKey: .location)
        try container.encodeIfPresent(self.managingOrganization, forKey: .managingOrganization)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encode(Array(self.specialty), forKey: .specialty)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PractitionerPractitionerRole.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PractitionerPractitionerRole. Will return empty instance: \(error))")
		}
		return PractitionerPractitionerRole.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PractitionerPractitionerRole else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.healthcareService.enumerated() {
            guard index < self.healthcareService.count else {
                self.healthcareService.append(t)
                continue
            }
            self.healthcareService[index].populate(from: t)
        }
    
        if self.healthcareService.count > o.healthcareService.count {
            for i in self.healthcareService.count...o.healthcareService.count {
                let objectToRemove = self.healthcareService[i]
                self.healthcareService.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.location.enumerated() {
            guard index < self.location.count else {
                self.location.append(t)
                continue
            }
            self.location[index].populate(from: t)
        }
    
        if self.location.count > o.location.count {
            for i in self.location.count...o.location.count {
                let objectToRemove = self.location[i]
                self.location.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.managingOrganization, from: o.managingOrganization)
        FireKit.populate(&self.period, from: o.period)
        FireKit.populate(&self.role, from: o.role)

        for (index, t) in o.specialty.enumerated() {
            guard index < self.specialty.count else {
                self.specialty.append(t)
                continue
            }
            self.specialty[index].populate(from: t)
        }
    
        if self.specialty.count > o.specialty.count {
            for i in self.specialty.count...o.specialty.count {
                let objectToRemove = self.specialty[i]
                self.specialty.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
    }
}


/**
 *  Qualifications obtained by training and certification.
 */
open class PractitionerQualification: BackboneElement {
	override open class var resourceType: String {
		get { return "PractitionerQualification" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var issuer: Reference?
    public func upsert(issuer: Reference?) {
        upsert(prop: &self.issuer, val: issuer)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case identifier = "identifier"
        case issuer = "issuer"
        case period = "period"
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

        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.issuer = try container.decodeIfPresent(Reference.self, forKey: .issuer)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.issuer, forKey: .issuer)
        try container.encodeIfPresent(self.period, forKey: .period)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PractitionerQualification.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PractitionerQualification. Will return empty instance: \(error))")
		}
		return PractitionerQualification.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? PractitionerQualification else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        if self.identifier.count > o.identifier.count {
            for i in self.identifier.count...o.identifier.count {
                let objectToRemove = self.identifier[i]
                self.identifier.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.issuer, from: o.issuer)
        FireKit.populate(&self.period, from: o.period)
    }
}

