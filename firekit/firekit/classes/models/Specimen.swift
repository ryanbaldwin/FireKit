//
//  Specimen.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Specimen) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Sample for analysis.
 *
 *  A sample to be used for analysis.
 */
open class Specimen: DomainResource {
	override open class var resourceType: String {
		get { return "Specimen" }
	}

    @objc public dynamic var accessionIdentifier: Identifier?
    public func upsert(accessionIdentifier: Identifier?) {
        upsert(prop: &self.accessionIdentifier, val: accessionIdentifier)
    }
    @objc public dynamic var collection: SpecimenCollection?
    public func upsert(collection: SpecimenCollection?) {
        upsert(prop: &self.collection, val: collection)
    }
    public let container = RealmSwift.List<SpecimenContainer>()
    public let identifier = RealmSwift.List<Identifier>()
    public let parent = RealmSwift.List<Reference>()
    @objc public dynamic var receivedTime: DateTime?
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    public let treatment = RealmSwift.List<SpecimenTreatment>()
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(subject: Reference) {
        self.init()
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case accessionIdentifier = "accessionIdentifier"
        case collection = "collection"
        case container = "container"
        case identifier = "identifier"
        case parent = "parent"
        case receivedTime = "receivedTime"
        case status = "status"
        case subject = "subject"
        case treatment = "treatment"
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

        self.accessionIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .accessionIdentifier)
        self.collection = try container.decodeIfPresent(SpecimenCollection.self, forKey: .collection)
        self.container.append(objectsIn: try container.decodeIfPresent([SpecimenContainer].self, forKey: .container) ?? [])
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.parent.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .parent) ?? [])
        self.receivedTime = try container.decodeIfPresent(DateTime.self, forKey: .receivedTime)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.treatment.append(objectsIn: try container.decodeIfPresent([SpecimenTreatment].self, forKey: .treatment) ?? [])
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.accessionIdentifier, forKey: .accessionIdentifier)
        try container.encodeIfPresent(self.collection, forKey: .collection)
        try container.encode(self.container.flatMap { $0 }, forKey: .container)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encode(self.parent.flatMap { $0 }, forKey: .parent)
        try container.encodeIfPresent(self.receivedTime, forKey: .receivedTime)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encode(self.treatment.flatMap { $0 }, forKey: .treatment)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["accessionIdentifier"] {
				presentKeys.insert("accessionIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(accessionIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "accessionIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["collection"] {
				presentKeys.insert("collection")
				if let val = exist as? FHIRJSON {
					upsert(collection: SpecimenCollection(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "collection", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["container"] {
				presentKeys.insert("container")
				if let val = exist as? [FHIRJSON] {
					if let vals = SpecimenContainer.instantiate(fromArray: val, owner: self) as? [SpecimenContainer] {
						if let realm = self.realm { realm.delete(self.container) }
						self.container.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "container", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["parent"] {
				presentKeys.insert("parent")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.parent) }
						self.parent.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "parent", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["receivedTime"] {
				presentKeys.insert("receivedTime")
				if let val = exist as? String {
					self.receivedTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "receivedTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "subject"))
			}
			if let exist = js["treatment"] {
				presentKeys.insert("treatment")
				if let val = exist as? [FHIRJSON] {
					if let vals = SpecimenTreatment.instantiate(fromArray: val, owner: self) as? [SpecimenTreatment] {
						if let realm = self.realm { realm.delete(self.treatment) }
						self.treatment.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "treatment", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let accessionIdentifier = self.accessionIdentifier {
			json["accessionIdentifier"] = accessionIdentifier.asJSON()
		}
		if let collection = self.collection {
			json["collection"] = collection.asJSON()
		}
		if container.count > 0 {
			json["container"] = Array(container.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if parent.count > 0 {
			json["parent"] = Array(parent.map() { $0.asJSON() })
		}
		if let receivedTime = self.receivedTime {
			json["receivedTime"] = receivedTime.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if treatment.count > 0 {
			json["treatment"] = Array(treatment.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Specimen.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Specimen. Will return empty instance: \(error))")
		}
		return Specimen.init()
	}
}


/**
 *  Collection details.
 *
 *  Details concerning the specimen collection.
 */
open class SpecimenCollection: BackboneElement {
	override open class var resourceType: String {
		get { return "SpecimenCollection" }
	}

    @objc public dynamic var bodySite: CodeableConcept?
    public func upsert(bodySite: CodeableConcept?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }
    @objc public dynamic var collectedDateTime: DateTime?
    @objc public dynamic var collectedPeriod: Period?
    public func upsert(collectedPeriod: Period?) {
        upsert(prop: &self.collectedPeriod, val: collectedPeriod)
    }
    @objc public dynamic var collector: Reference?
    public func upsert(collector: Reference?) {
        upsert(prop: &self.collector, val: collector)
    }
    public let comment = RealmSwift.List<RealmString>()
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySite = "bodySite"
        case collectedDateTime = "collectedDateTime"
        case collectedPeriod = "collectedPeriod"
        case collector = "collector"
        case comment = "comment"
        case method = "method"
        case quantity = "quantity"
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

        self.bodySite = try container.decodeIfPresent(CodeableConcept.self, forKey: .bodySite)
        self.collectedDateTime = try container.decodeIfPresent(DateTime.self, forKey: .collectedDateTime)
        self.collectedPeriod = try container.decodeIfPresent(Period.self, forKey: .collectedPeriod)
        self.collector = try container.decodeIfPresent(Reference.self, forKey: .collector)
        self.comment.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .comment) ?? [])
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.quantity = try container.decodeIfPresent(Quantity.self, forKey: .quantity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encodeIfPresent(self.collectedDateTime, forKey: .collectedDateTime)
        try container.encodeIfPresent(self.collectedPeriod, forKey: .collectedPeriod)
        try container.encodeIfPresent(self.collector, forKey: .collector)
        try container.encode(self.comment.flatMap { $0.value }, forKey: .comment)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? FHIRJSON {
					upsert(bodySite: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["collectedDateTime"] {
				presentKeys.insert("collectedDateTime")
				if let val = exist as? String {
					self.collectedDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "collectedDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["collectedPeriod"] {
				presentKeys.insert("collectedPeriod")
				if let val = exist as? FHIRJSON {
					upsert(collectedPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "collectedPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["collector"] {
				presentKeys.insert("collector")
				if let val = exist as? FHIRJSON {
					upsert(collector: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "collector", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["comment"] {
				presentKeys.insert("comment")
				if let val = exist as? [String] {
					self.comment.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "comment", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? FHIRJSON {
					upsert(method: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? FHIRJSON {
					upsert(quantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let bodySite = self.bodySite {
			json["bodySite"] = bodySite.asJSON()
		}
		if let collectedDateTime = self.collectedDateTime {
			json["collectedDateTime"] = collectedDateTime.asJSON()
		}
		if let collectedPeriod = self.collectedPeriod {
			json["collectedPeriod"] = collectedPeriod.asJSON()
		}
		if let collector = self.collector {
			json["collector"] = collector.asJSON()
		}
		if comment.count > 0 {
			json["comment"] = Array(comment.map() { $0.value })
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SpecimenCollection.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SpecimenCollection. Will return empty instance: \(error))")
		}
		return SpecimenCollection.init()
	}
}


/**
 *  Direct container of specimen (tube/slide, etc.).
 *
 *  The container holding the specimen.  The recursive nature of containers; i.e. blood in tube in tray in rack is not
 *  addressed here.
 */
open class SpecimenContainer: BackboneElement {
	override open class var resourceType: String {
		get { return "SpecimenContainer" }
	}

    @objc public dynamic var additiveCodeableConcept: CodeableConcept?
    public func upsert(additiveCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.additiveCodeableConcept, val: additiveCodeableConcept)
    }
    @objc public dynamic var additiveReference: Reference?
    public func upsert(additiveReference: Reference?) {
        upsert(prop: &self.additiveReference, val: additiveReference)
    }
    @objc public dynamic var capacity: Quantity?
    public func upsert(capacity: Quantity?) {
        upsert(prop: &self.capacity, val: capacity)
    }
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var specimenQuantity: Quantity?
    public func upsert(specimenQuantity: Quantity?) {
        upsert(prop: &self.specimenQuantity, val: specimenQuantity)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case additiveCodeableConcept = "additiveCodeableConcept"
        case additiveReference = "additiveReference"
        case capacity = "capacity"
        case description_fhir = "description"
        case identifier = "identifier"
        case specimenQuantity = "specimenQuantity"
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

        self.additiveCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .additiveCodeableConcept)
        self.additiveReference = try container.decodeIfPresent(Reference.self, forKey: .additiveReference)
        self.capacity = try container.decodeIfPresent(Quantity.self, forKey: .capacity)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.specimenQuantity = try container.decodeIfPresent(Quantity.self, forKey: .specimenQuantity)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.additiveCodeableConcept, forKey: .additiveCodeableConcept)
        try container.encodeIfPresent(self.additiveReference, forKey: .additiveReference)
        try container.encodeIfPresent(self.capacity, forKey: .capacity)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.specimenQuantity, forKey: .specimenQuantity)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["additiveCodeableConcept"] {
				presentKeys.insert("additiveCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(additiveCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "additiveCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["additiveReference"] {
				presentKeys.insert("additiveReference")
				if let val = exist as? FHIRJSON {
					upsert(additiveReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "additiveReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["capacity"] {
				presentKeys.insert("capacity")
				if let val = exist as? FHIRJSON {
					upsert(capacity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "capacity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["specimenQuantity"] {
				presentKeys.insert("specimenQuantity")
				if let val = exist as? FHIRJSON {
					upsert(specimenQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "specimenQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let additiveCodeableConcept = self.additiveCodeableConcept {
			json["additiveCodeableConcept"] = additiveCodeableConcept.asJSON()
		}
		if let additiveReference = self.additiveReference {
			json["additiveReference"] = additiveReference.asJSON()
		}
		if let capacity = self.capacity {
			json["capacity"] = capacity.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let specimenQuantity = self.specimenQuantity {
			json["specimenQuantity"] = specimenQuantity.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SpecimenContainer.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SpecimenContainer. Will return empty instance: \(error))")
		}
		return SpecimenContainer.init()
	}
}


/**
 *  Treatment and processing step details.
 *
 *  Details concerning treatment and processing steps for the specimen.
 */
open class SpecimenTreatment: BackboneElement {
	override open class var resourceType: String {
		get { return "SpecimenTreatment" }
	}

    public let additive = RealmSwift.List<Reference>()
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var procedure: CodeableConcept?
    public func upsert(procedure: CodeableConcept?) {
        upsert(prop: &self.procedure, val: procedure)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case additive = "additive"
        case description_fhir = "description"
        case procedure = "procedure"
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

        self.additive.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .additive) ?? [])
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.procedure = try container.decodeIfPresent(CodeableConcept.self, forKey: .procedure)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.additive.flatMap { $0 }, forKey: .additive)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.procedure, forKey: .procedure)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["additive"] {
				presentKeys.insert("additive")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.additive) }
						self.additive.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "additive", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["procedure"] {
				presentKeys.insert("procedure")
				if let val = exist as? FHIRJSON {
					upsert(procedure: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "procedure", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if additive.count > 0 {
			json["additive"] = Array(additive.map() { $0.asJSON() })
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let procedure = self.procedure {
			json["procedure"] = procedure.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(SpecimenTreatment.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy SpecimenTreatment. Will return empty instance: \(error))")
		}
		return SpecimenTreatment.init()
	}
}

