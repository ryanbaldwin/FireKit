//
//  ReferralRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ReferralRequest) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A request for referral or transfer of care.
 *
 *  Used to record and send details about a request for referral service or transfer of a patient to the care of another
 *  provider or provider organization.
 */
open class ReferralRequest: DomainResource {
	override open class var resourceType: String {
		get { return "ReferralRequest" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var dateSent: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var fulfillmentTime: Period?
    public func upsert(fulfillmentTime: Period?) {
        upsert(prop: &self.fulfillmentTime, val: fulfillmentTime)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var priority: CodeableConcept?
    public func upsert(priority: CodeableConcept?) {
        upsert(prop: &self.priority, val: priority)
    }
    @objc public dynamic var reason: CodeableConcept?
    public func upsert(reason: CodeableConcept?) {
        upsert(prop: &self.reason, val: reason)
    }
    public let recipient = RealmSwift.List<Reference>()
    @objc public dynamic var requester: Reference?
    public func upsert(requester: Reference?) {
        upsert(prop: &self.requester, val: requester)
    }
    public let serviceRequested = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var specialty: CodeableConcept?
    public func upsert(specialty: CodeableConcept?) {
        upsert(prop: &self.specialty, val: specialty)
    }
    @objc public dynamic var status: String?
    public let supportingInformation = RealmSwift.List<Reference>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case dateSent = "dateSent"
        case description_fhir = "description"
        case encounter = "encounter"
        case fulfillmentTime = "fulfillmentTime"
        case identifier = "identifier"
        case patient = "patient"
        case priority = "priority"
        case reason = "reason"
        case recipient = "recipient"
        case requester = "requester"
        case serviceRequested = "serviceRequested"
        case specialty = "specialty"
        case status = "status"
        case supportingInformation = "supportingInformation"
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

        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.dateSent = try container.decodeIfPresent(DateTime.self, forKey: .dateSent)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.fulfillmentTime = try container.decodeIfPresent(Period.self, forKey: .fulfillmentTime)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.priority = try container.decodeIfPresent(CodeableConcept.self, forKey: .priority)
        self.reason = try container.decodeIfPresent(CodeableConcept.self, forKey: .reason)
        self.recipient.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .recipient) ?? [])
        self.requester = try container.decodeIfPresent(Reference.self, forKey: .requester)
        self.serviceRequested.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .serviceRequested) ?? [])
        self.specialty = try container.decodeIfPresent(CodeableConcept.self, forKey: .specialty)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.supportingInformation.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .supportingInformation) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.dateSent, forKey: .dateSent)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.fulfillmentTime, forKey: .fulfillmentTime)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.priority, forKey: .priority)
        try container.encodeIfPresent(self.reason, forKey: .reason)
        try container.encode(Array(self.recipient), forKey: .recipient)
        try container.encodeIfPresent(self.requester, forKey: .requester)
        try container.encode(Array(self.serviceRequested), forKey: .serviceRequested)
        try container.encodeIfPresent(self.specialty, forKey: .specialty)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(Array(self.supportingInformation), forKey: .supportingInformation)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ReferralRequest.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ReferralRequest. Will return empty instance: \(error))")
		}
		return ReferralRequest.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ReferralRequest else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.date, from: o.date)
        FireKit.populate(&self.dateSent, from: o.dateSent)
        description_fhir = o.description_fhir
        FireKit.populate(&self.encounter, from: o.encounter)
        FireKit.populate(&self.fulfillmentTime, from: o.fulfillmentTime)

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
        FireKit.populate(&self.patient, from: o.patient)
        FireKit.populate(&self.priority, from: o.priority)
        FireKit.populate(&self.reason, from: o.reason)

        for (index, t) in o.recipient.enumerated() {
            guard index < self.recipient.count else {
                self.recipient.append(t)
                continue
            }
            self.recipient[index].populate(from: t)
        }
    
        while self.recipient.count > o.recipient.count {
            let objectToRemove = self.recipient.last!
            self.recipient.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.requester, from: o.requester)

        for (index, t) in o.serviceRequested.enumerated() {
            guard index < self.serviceRequested.count else {
                self.serviceRequested.append(t)
                continue
            }
            self.serviceRequested[index].populate(from: t)
        }
    
        while self.serviceRequested.count > o.serviceRequested.count {
            let objectToRemove = self.serviceRequested.last!
            self.serviceRequested.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.specialty, from: o.specialty)
        status = o.status

        for (index, t) in o.supportingInformation.enumerated() {
            guard index < self.supportingInformation.count else {
                self.supportingInformation.append(t)
                continue
            }
            self.supportingInformation[index].populate(from: t)
        }
    
        while self.supportingInformation.count > o.supportingInformation.count {
            let objectToRemove = self.supportingInformation.last!
            self.supportingInformation.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.type, from: o.type)
    }
}

