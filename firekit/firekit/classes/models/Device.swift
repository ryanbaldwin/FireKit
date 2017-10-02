//
//  Device.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Device) on 2017-09-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  An instance of a manufactured te that is used in the provision of healthcare.
 *
 *  This resource identifies an instance of a manufactured item that is used in the provision of healthcare without
 *  being substantially changed through that activity. The device may be a medical or non-medical device.  Medical
 *  devices includes durable (reusable) medical equipment, implantable devices, as well as disposable equipment used for
 *  diagnostic, treatment, and research for healthcare and public health.  Non-medical devices may include items such as
 *  a machine, cellphone, computer, application, etc.
 */
open class Device: DomainResource {
	override open class var resourceType: String {
		get { return "Device" }
	}

    public let contact = RealmSwift.List<ContactPoint>()
    @objc public dynamic var expiry: DateTime?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var lotNumber: String?
    @objc public dynamic var manufactureDate: DateTime?
    @objc public dynamic var manufacturer: String?
    @objc public dynamic var model: String?
    public let note = RealmSwift.List<Annotation>()
    @objc public dynamic var owner: Reference?
    public func upsert(owner: Reference?) {
        upsert(prop: &self.owner, val: owner)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var udi: String?
    @objc public dynamic var url: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: CodeableConcept) {
        self.init()
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case expiry = "expiry"
        case identifier = "identifier"
        case location = "location"
        case lotNumber = "lotNumber"
        case manufactureDate = "manufactureDate"
        case manufacturer = "manufacturer"
        case model = "model"
        case note = "note"
        case owner = "owner"
        case patient = "patient"
        case status = "status"
        case type = "type"
        case udi = "udi"
        case url = "url"
        case version = "version"
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

        self.contact.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .contact) ?? [])
        self.expiry = try container.decodeIfPresent(DateTime.self, forKey: .expiry)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.lotNumber = try container.decodeIfPresent(String.self, forKey: .lotNumber)
        self.manufactureDate = try container.decodeIfPresent(DateTime.self, forKey: .manufactureDate)
        self.manufacturer = try container.decodeIfPresent(String.self, forKey: .manufacturer)
        self.model = try container.decodeIfPresent(String.self, forKey: .model)
        self.note.append(objectsIn: try container.decodeIfPresent([Annotation].self, forKey: .note) ?? [])
        self.owner = try container.decodeIfPresent(Reference.self, forKey: .owner)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.udi = try container.decodeIfPresent(String.self, forKey: .udi)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.expiry, forKey: .expiry)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.lotNumber, forKey: .lotNumber)
        try container.encodeIfPresent(self.manufactureDate, forKey: .manufactureDate)
        try container.encodeIfPresent(self.manufacturer, forKey: .manufacturer)
        try container.encodeIfPresent(self.model, forKey: .model)
        try container.encode(Array(self.note), forKey: .note)
        try container.encodeIfPresent(self.owner, forKey: .owner)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.udi, forKey: .udi)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.version, forKey: .version)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Device.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Device. Will return empty instance: \(error))")
		}
		return Device.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Device else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.contact.enumerated() {
            guard index < self.contact.count else {
                self.contact.append(t)
                continue
            }
            self.contact[index].populate(from: t)
        }
    
        if self.contact.count > o.contact.count {
            for i in self.contact.count...o.contact.count {
                let objectToRemove = self.contact[i]
                self.contact.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.expiry, from: o.expiry)

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
        FireKit.populate(&self.location, from: o.location)
        lotNumber = o.lotNumber
        FireKit.populate(&self.manufactureDate, from: o.manufactureDate)
        manufacturer = o.manufacturer
        model = o.model

        for (index, t) in o.note.enumerated() {
            guard index < self.note.count else {
                self.note.append(t)
                continue
            }
            self.note[index].populate(from: t)
        }
    
        if self.note.count > o.note.count {
            for i in self.note.count...o.note.count {
                let objectToRemove = self.note[i]
                self.note.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.owner, from: o.owner)
        FireKit.populate(&self.patient, from: o.patient)
        status = o.status
        FireKit.populate(&self.type, from: o.type)
        udi = o.udi
        url = o.url
        version = o.version
    }
}

