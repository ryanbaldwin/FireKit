//
//  SupplyDelivery.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SupplyDelivery) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Delivery of Supply.
 *
 *  Record of delivery of what is supplied.
 */
open class SupplyDelivery: DomainResource {
	override open class var resourceType: String {
		get { return "SupplyDelivery" }
	}

    @objc public dynamic var destination: Reference?
    public func upsert(destination: Reference?) {
        upsert(prop: &self.destination, val: destination)
    }
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var quantity: Quantity?
    public func upsert(quantity: Quantity?) {
        upsert(prop: &self.quantity, val: quantity)
    }
    public let receiver = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?
    @objc public dynamic var suppliedItem: Reference?
    public func upsert(suppliedItem: Reference?) {
        upsert(prop: &self.suppliedItem, val: suppliedItem)
    }
    @objc public dynamic var supplier: Reference?
    public func upsert(supplier: Reference?) {
        upsert(prop: &self.supplier, val: supplier)
    }
    @objc public dynamic var time: DateTime?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var whenPrepared: Period?
    public func upsert(whenPrepared: Period?) {
        upsert(prop: &self.whenPrepared, val: whenPrepared)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case destination = "destination"
        case identifier = "identifier"
        case patient = "patient"
        case quantity = "quantity"
        case receiver = "receiver"
        case status = "status"
        case suppliedItem = "suppliedItem"
        case supplier = "supplier"
        case time = "time"
        case type = "type"
        case whenPrepared = "whenPrepared"
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


        // Reference: FHIRJSON
        if let destinationVal = try container.decodeIfPresent(Reference.self, forKey: .destination) {
          self.destination = destinationVal
        }
        // Identifier: FHIRJSON
        if let identifierVal = try container.decodeIfPresent(Identifier.self, forKey: .identifier) {
          self.identifier = identifierVal
        }
        // Reference: FHIRJSON
        if let patientVal = try container.decodeIfPresent(Reference.self, forKey: .patient) {
          self.patient = patientVal
        }
        // Quantity: FHIRJSON
        if let quantityVal = try container.decodeIfPresent(Quantity.self, forKey: .quantity) {
          self.quantity = quantityVal
        }
        if let receiverVals = try container.decodeIfPresent([Reference].self, forKey: .receiver) {
          // Reference: FHIRJSON
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        // Reference: FHIRJSON
        if let suppliedItemVal = try container.decodeIfPresent(Reference.self, forKey: .suppliedItem) {
          self.suppliedItem = suppliedItemVal
        }
        // Reference: FHIRJSON
        if let supplierVal = try container.decodeIfPresent(Reference.self, forKey: .supplier) {
          self.supplier = supplierVal
        }
        // DateTime: String
        if let timeVal = try container.decodeIfPresent(DateTime.self, forKey: .time) {
          self.time = timeVal
        }
        // CodeableConcept: FHIRJSON
        if let typeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .type) {
          self.type = typeVal
        }
        // Period: FHIRJSON
        if let whenPreparedVal = try container.decodeIfPresent(Period.self, forKey: .whenPrepared) {
          self.whenPrepared = whenPreparedVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.destination, forKey: .destination)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.quantity, forKey: .quantity)
        try container.encode(self.receiver.flatMap { $0 }, forKey: .receiver)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.suppliedItem, forKey: .suppliedItem)
        try container.encodeIfPresent(self.supplier, forKey: .supplier)
        try container.encodeIfPresent(self.time, forKey: .time)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.whenPrepared, forKey: .whenPrepared)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? FHIRJSON {
					upsert(destination: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					upsert(patient: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["receiver"] {
				presentKeys.insert("receiver")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.receiver) }
						self.receiver.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "receiver", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["suppliedItem"] {
				presentKeys.insert("suppliedItem")
				if let val = exist as? FHIRJSON {
					upsert(suppliedItem: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "suppliedItem", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["supplier"] {
				presentKeys.insert("supplier")
				if let val = exist as? FHIRJSON {
					upsert(supplier: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "supplier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["time"] {
				presentKeys.insert("time")
				if let val = exist as? String {
					self.time = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "time", wants: String.self, has: type(of: exist)))
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
			if let exist = js["whenPrepared"] {
				presentKeys.insert("whenPrepared")
				if let val = exist as? FHIRJSON {
					upsert(whenPrepared: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whenPrepared", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let destination = self.destination {
			json["destination"] = destination.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let quantity = self.quantity {
			json["quantity"] = quantity.asJSON()
		}
		if receiver.count > 0 {
			json["receiver"] = Array(receiver.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let suppliedItem = self.suppliedItem {
			json["suppliedItem"] = suppliedItem.asJSON()
		}
		if let supplier = self.supplier {
			json["supplier"] = supplier.asJSON()
		}
		if let time = self.time {
			json["time"] = time.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let whenPrepared = self.whenPrepared {
			json["whenPrepared"] = whenPrepared.asJSON()
		}
		
		return json
	}
*/
}

