//
//  HealthcareService.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/HealthcareService) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  The details of a healthcare service available at a location.
 */
open class HealthcareService: DomainResource {
	override open class var resourceType: String {
		get { return "HealthcareService" }
	}

    public let appointmentRequired = RealmOptional<Bool>()
    @objc public dynamic var availabilityExceptions: String?
    public let availableTime = RealmSwift.List<HealthcareServiceAvailableTime>()
    public let characteristic = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var comment: String?
    public let coverageArea = RealmSwift.List<Reference>()
    @objc public dynamic var eligibility: CodeableConcept?
    public func upsert(eligibility: CodeableConcept?) {
        upsert(prop: &self.eligibility, val: eligibility)
    }
    @objc public dynamic var eligibilityNote: String?
    @objc public dynamic var extraDetails: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    public let notAvailable = RealmSwift.List<HealthcareServiceNotAvailable>()
    @objc public dynamic var photo: Attachment?
    public func upsert(photo: Attachment?) {
        upsert(prop: &self.photo, val: photo)
    }
    public let programName = RealmSwift.List<RealmString>()
    @objc public dynamic var providedBy: Reference?
    public func upsert(providedBy: Reference?) {
        upsert(prop: &self.providedBy, val: providedBy)
    }
    @objc public dynamic var publicKey: String?
    public let referralMethod = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var serviceCategory: CodeableConcept?
    public func upsert(serviceCategory: CodeableConcept?) {
        upsert(prop: &self.serviceCategory, val: serviceCategory)
    }
    @objc public dynamic var serviceName: String?
    public let serviceProvisionCode = RealmSwift.List<CodeableConcept>()
    public let serviceType = RealmSwift.List<HealthcareServiceServiceType>()
    public let telecom = RealmSwift.List<ContactPoint>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(location: Reference) {
        self.init()
        self.location = location
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case appointmentRequired = "appointmentRequired"
        case availabilityExceptions = "availabilityExceptions"
        case availableTime = "availableTime"
        case characteristic = "characteristic"
        case comment = "comment"
        case coverageArea = "coverageArea"
        case eligibility = "eligibility"
        case eligibilityNote = "eligibilityNote"
        case extraDetails = "extraDetails"
        case identifier = "identifier"
        case location = "location"
        case notAvailable = "notAvailable"
        case photo = "photo"
        case programName = "programName"
        case providedBy = "providedBy"
        case publicKey = "publicKey"
        case referralMethod = "referralMethod"
        case serviceCategory = "serviceCategory"
        case serviceName = "serviceName"
        case serviceProvisionCode = "serviceProvisionCode"
        case serviceType = "serviceType"
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

        self.appointmentRequired.value = try container.decodeIfPresent(Bool.self, forKey: .appointmentRequired)
        self.availabilityExceptions = try container.decodeIfPresent(String.self, forKey: .availabilityExceptions)
        self.availableTime.append(objectsIn: try container.decodeIfPresent([HealthcareServiceAvailableTime].self, forKey: .availableTime) ?? [])
        self.characteristic.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .characteristic) ?? [])
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.coverageArea.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .coverageArea) ?? [])
        self.eligibility = try container.decodeIfPresent(CodeableConcept.self, forKey: .eligibility)
        self.eligibilityNote = try container.decodeIfPresent(String.self, forKey: .eligibilityNote)
        self.extraDetails = try container.decodeIfPresent(String.self, forKey: .extraDetails)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.notAvailable.append(objectsIn: try container.decodeIfPresent([HealthcareServiceNotAvailable].self, forKey: .notAvailable) ?? [])
        self.photo = try container.decodeIfPresent(Attachment.self, forKey: .photo)
        self.programName.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .programName) ?? [])
        self.providedBy = try container.decodeIfPresent(Reference.self, forKey: .providedBy)
        self.publicKey = try container.decodeIfPresent(String.self, forKey: .publicKey)
        self.referralMethod.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .referralMethod) ?? [])
        self.serviceCategory = try container.decodeIfPresent(CodeableConcept.self, forKey: .serviceCategory)
        self.serviceName = try container.decodeIfPresent(String.self, forKey: .serviceName)
        self.serviceProvisionCode.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .serviceProvisionCode) ?? [])
        self.serviceType.append(objectsIn: try container.decodeIfPresent([HealthcareServiceServiceType].self, forKey: .serviceType) ?? [])
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.appointmentRequired.value, forKey: .appointmentRequired)
        try container.encodeIfPresent(self.availabilityExceptions, forKey: .availabilityExceptions)
        try container.encode(Array(self.availableTime), forKey: .availableTime)
        try container.encode(Array(self.characteristic), forKey: .characteristic)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encode(Array(self.coverageArea), forKey: .coverageArea)
        try container.encodeIfPresent(self.eligibility, forKey: .eligibility)
        try container.encodeIfPresent(self.eligibilityNote, forKey: .eligibilityNote)
        try container.encodeIfPresent(self.extraDetails, forKey: .extraDetails)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encode(Array(self.notAvailable), forKey: .notAvailable)
        try container.encodeIfPresent(self.photo, forKey: .photo)
        try container.encode(Array(self.programName), forKey: .programName)
        try container.encodeIfPresent(self.providedBy, forKey: .providedBy)
        try container.encodeIfPresent(self.publicKey, forKey: .publicKey)
        try container.encode(Array(self.referralMethod), forKey: .referralMethod)
        try container.encodeIfPresent(self.serviceCategory, forKey: .serviceCategory)
        try container.encodeIfPresent(self.serviceName, forKey: .serviceName)
        try container.encode(Array(self.serviceProvisionCode), forKey: .serviceProvisionCode)
        try container.encode(Array(self.serviceType), forKey: .serviceType)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(HealthcareService.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy HealthcareService. Will return empty instance: \(error))")
		}
		return HealthcareService.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? HealthcareService else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        appointmentRequired.value = o.appointmentRequired.value
        availabilityExceptions = o.availabilityExceptions

        for (index, t) in o.availableTime.enumerated() {
            guard index < self.availableTime.count else {
                self.availableTime.append(t)
                continue
            }
            self.availableTime[index].populate(from: t)
        }
    
        while self.availableTime.count > o.availableTime.count {
            let objectToRemove = self.availableTime.last!
            self.availableTime.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.characteristic.enumerated() {
            guard index < self.characteristic.count else {
                self.characteristic.append(t)
                continue
            }
            self.characteristic[index].populate(from: t)
        }
    
        while self.characteristic.count > o.characteristic.count {
            let objectToRemove = self.characteristic.last!
            self.characteristic.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        comment = o.comment

        for (index, t) in o.coverageArea.enumerated() {
            guard index < self.coverageArea.count else {
                self.coverageArea.append(t)
                continue
            }
            self.coverageArea[index].populate(from: t)
        }
    
        while self.coverageArea.count > o.coverageArea.count {
            let objectToRemove = self.coverageArea.last!
            self.coverageArea.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.eligibility, from: o.eligibility)
        eligibilityNote = o.eligibilityNote
        extraDetails = o.extraDetails

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
        FireKit.populate(&self.location, from: o.location)

        for (index, t) in o.notAvailable.enumerated() {
            guard index < self.notAvailable.count else {
                self.notAvailable.append(t)
                continue
            }
            self.notAvailable[index].populate(from: t)
        }
    
        while self.notAvailable.count > o.notAvailable.count {
            let objectToRemove = self.notAvailable.last!
            self.notAvailable.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.photo, from: o.photo)

        for (index, t) in o.programName.enumerated() {
            guard index < self.programName.count else {
                self.programName.append(t)
                continue
            }
            self.programName[index].populate(from: t)
        }
    
        while self.programName.count > o.programName.count {
            let objectToRemove = self.programName.last!
            self.programName.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.providedBy, from: o.providedBy)
        publicKey = o.publicKey

        for (index, t) in o.referralMethod.enumerated() {
            guard index < self.referralMethod.count else {
                self.referralMethod.append(t)
                continue
            }
            self.referralMethod[index].populate(from: t)
        }
    
        while self.referralMethod.count > o.referralMethod.count {
            let objectToRemove = self.referralMethod.last!
            self.referralMethod.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.serviceCategory, from: o.serviceCategory)
        serviceName = o.serviceName

        for (index, t) in o.serviceProvisionCode.enumerated() {
            guard index < self.serviceProvisionCode.count else {
                self.serviceProvisionCode.append(t)
                continue
            }
            self.serviceProvisionCode[index].populate(from: t)
        }
    
        while self.serviceProvisionCode.count > o.serviceProvisionCode.count {
            let objectToRemove = self.serviceProvisionCode.last!
            self.serviceProvisionCode.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

        for (index, t) in o.serviceType.enumerated() {
            guard index < self.serviceType.count else {
                self.serviceType.append(t)
                continue
            }
            self.serviceType[index].populate(from: t)
        }
    
        while self.serviceType.count > o.serviceType.count {
            let objectToRemove = self.serviceType.last!
            self.serviceType.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }

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


/**
 *  Times the Service Site is available.
 *
 *  A collection of times that the Service Site is available.
 */
open class HealthcareServiceAvailableTime: BackboneElement {
	override open class var resourceType: String {
		get { return "HealthcareServiceAvailableTime" }
	}

    public let allDay = RealmOptional<Bool>()
    @objc public dynamic var availableEndTime: FHIRTime?
    @objc public dynamic var availableStartTime: FHIRTime?
    public let daysOfWeek = RealmSwift.List<RealmString>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case allDay = "allDay"
        case availableEndTime = "availableEndTime"
        case availableStartTime = "availableStartTime"
        case daysOfWeek = "daysOfWeek"
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

        self.allDay.value = try container.decodeIfPresent(Bool.self, forKey: .allDay)
        self.availableEndTime = try container.decodeIfPresent(FHIRTime.self, forKey: .availableEndTime)
        self.availableStartTime = try container.decodeIfPresent(FHIRTime.self, forKey: .availableStartTime)
        self.daysOfWeek.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .daysOfWeek) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.allDay.value, forKey: .allDay)
        try container.encodeIfPresent(self.availableEndTime, forKey: .availableEndTime)
        try container.encodeIfPresent(self.availableStartTime, forKey: .availableStartTime)
        try container.encode(Array(self.daysOfWeek), forKey: .daysOfWeek)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(HealthcareServiceAvailableTime.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy HealthcareServiceAvailableTime. Will return empty instance: \(error))")
		}
		return HealthcareServiceAvailableTime.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? HealthcareServiceAvailableTime else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        allDay.value = o.allDay.value
        FireKit.populate(&self.availableEndTime, from: o.availableEndTime)
        FireKit.populate(&self.availableStartTime, from: o.availableStartTime)

        for (index, t) in o.daysOfWeek.enumerated() {
            guard index < self.daysOfWeek.count else {
                self.daysOfWeek.append(t)
                continue
            }
            self.daysOfWeek[index].populate(from: t)
        }
    
        while self.daysOfWeek.count > o.daysOfWeek.count {
            let objectToRemove = self.daysOfWeek.last!
            self.daysOfWeek.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
    }
}


/**
 *  Not available during this time due to provided reason.
 *
 *  The HealthcareService is not available during this period of time due to the provided reason.
 */
open class HealthcareServiceNotAvailable: BackboneElement {
	override open class var resourceType: String {
		get { return "HealthcareServiceNotAvailable" }
	}

    @objc public dynamic var description_fhir: String?
    @objc public dynamic var during: Period?
    public func upsert(during: Period?) {
        upsert(prop: &self.during, val: during)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(description_fhir: String) {
        self.init()
        self.description_fhir = description_fhir
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case during = "during"
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

        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.during = try container.decodeIfPresent(Period.self, forKey: .during)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.during, forKey: .during)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(HealthcareServiceNotAvailable.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy HealthcareServiceNotAvailable. Will return empty instance: \(error))")
		}
		return HealthcareServiceNotAvailable.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? HealthcareServiceNotAvailable else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        description_fhir = o.description_fhir
        FireKit.populate(&self.during, from: o.during)
    }
}


/**
 *  Specific service delivered or performed.
 *
 *  A specific type of service that may be delivered or performed.
 */
open class HealthcareServiceServiceType: BackboneElement {
	override open class var resourceType: String {
		get { return "HealthcareServiceServiceType" }
	}

    public let specialty = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: CodeableConcept) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case specialty = "specialty"
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

        self.specialty.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .specialty) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.specialty), forKey: .specialty)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(HealthcareServiceServiceType.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy HealthcareServiceServiceType. Will return empty instance: \(error))")
		}
		return HealthcareServiceServiceType.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? HealthcareServiceServiceType else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.specialty.enumerated() {
            guard index < self.specialty.count else {
                self.specialty.append(t)
                continue
            }
            self.specialty[index].populate(from: t)
        }
    
        while self.specialty.count > o.specialty.count {
            let objectToRemove = self.specialty.last!
            self.specialty.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.type, from: o.type)
    }
}

