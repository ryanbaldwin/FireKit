//
//  SupplyRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SupplyRequest) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Request for a medication, substance or device.
 *
 *  A record of a request for a medication, substance or device used in the healthcare setting.
 */
open class SupplyRequest: DomainResource {
	override open class var resourceType: String {
		get { return "SupplyRequest" }
	}

    @objc public dynamic var date: DateTime?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var kind: CodeableConcept?
    public func upsert(kind: CodeableConcept?) {
        upsert(prop: &self.kind, val: kind)
    }
    @objc public dynamic var orderedItem: Reference?
    public func upsert(orderedItem: Reference?) {
        upsert(prop: &self.orderedItem, val: orderedItem)
    }
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    @objc public dynamic var reasonCodeableConcept: CodeableConcept?
    public func upsert(reasonCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.reasonCodeableConcept, val: reasonCodeableConcept)
    }
    @objc public dynamic var reasonReference: Reference?
    public func upsert(reasonReference: Reference?) {
        upsert(prop: &self.reasonReference, val: reasonReference)
    }
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var status: String?
    public let supplier = RealmSwift.List<Reference>()
    @objc public dynamic var when: SupplyRequestWhen?
    public func upsert(when: SupplyRequestWhen?) {
        upsert(prop: &self.when, val: when)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case identifier = "identifier"
        case kind = "kind"
        case orderedItem = "orderedItem"
        case patient = "patient"
        case reasonCodeableConcept = "reasonCodeableConcept"
        case reasonReference = "reasonReference"
        case source = "source"
        case status = "status"
        case supplier = "supplier"
        case when = "when"
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


        // DateTime: String
        if let dateVal = try container.decodeIfPresent(DateTime.self, forKey: .date) {
          self.date = dateVal
        }
        // Identifier: FHIRJSON
        if let identifierVal = try container.decodeIfPresent(Identifier.self, forKey: .identifier) {
          self.identifier = identifierVal
        }
        // CodeableConcept: FHIRJSON
        if let kindVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .kind) {
          self.kind = kindVal
        }
        // Reference: FHIRJSON
        if let orderedItemVal = try container.decodeIfPresent(Reference.self, forKey: .orderedItem) {
          self.orderedItem = orderedItemVal
        }
        // Reference: FHIRJSON
        if let patientVal = try container.decodeIfPresent(Reference.self, forKey: .patient) {
          self.patient = patientVal
        }
        // CodeableConcept: FHIRJSON
        if let reasonCodeableConceptVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .reasonCodeableConcept) {
          self.reasonCodeableConcept = reasonCodeableConceptVal
        }
        // Reference: FHIRJSON
        if let reasonReferenceVal = try container.decodeIfPresent(Reference.self, forKey: .reasonReference) {
          self.reasonReference = reasonReferenceVal
        }
        // Reference: FHIRJSON
        if let sourceVal = try container.decodeIfPresent(Reference.self, forKey: .source) {
          self.source = sourceVal
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        if let supplierVals = try container.decodeIfPresent([Reference].self, forKey: .supplier) {
          // Reference: FHIRJSON
        }
        // SupplyRequestWhen: FHIRJSON
        if let whenVal = try container.decodeIfPresent(SupplyRequestWhen.self, forKey: .when) {
          self.when = whenVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.orderedItem, forKey: .orderedItem)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encodeIfPresent(self.reasonCodeableConcept, forKey: .reasonCodeableConcept)
        try container.encodeIfPresent(self.reasonReference, forKey: .reasonReference)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(self.supplier.flatMap { $0 }, forKey: .supplier)
        try container.encodeIfPresent(self.when, forKey: .when)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
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
			if let exist = js["kind"] {
				presentKeys.insert("kind")
				if let val = exist as? FHIRJSON {
					upsert(kind: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "kind", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["orderedItem"] {
				presentKeys.insert("orderedItem")
				if let val = exist as? FHIRJSON {
					upsert(orderedItem: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "orderedItem", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["reasonCodeableConcept"] {
				presentKeys.insert("reasonCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(reasonCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonReference"] {
				presentKeys.insert("reasonReference")
				if let val = exist as? FHIRJSON {
					upsert(reasonReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reasonReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["supplier"] {
				presentKeys.insert("supplier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.supplier) }
						self.supplier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "supplier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["when"] {
				presentKeys.insert("when")
				if let val = exist as? FHIRJSON {
					upsert(when: SupplyRequestWhen(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "when", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if let orderedItem = self.orderedItem {
			json["orderedItem"] = orderedItem.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if let reasonCodeableConcept = self.reasonCodeableConcept {
			json["reasonCodeableConcept"] = reasonCodeableConcept.asJSON()
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if supplier.count > 0 {
			json["supplier"] = Array(supplier.map() { $0.asJSON() })
		}
		if let when = self.when {
			json["when"] = when.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  When the request should be fulfilled.
 */
open class SupplyRequestWhen: BackboneElement {
	override open class var resourceType: String {
		get { return "SupplyRequestWhen" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var schedule: Timing?
    public func upsert(schedule: Timing?) {
        upsert(prop: &self.schedule, val: schedule)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case schedule = "schedule"
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


        // CodeableConcept: FHIRJSON
        if let codeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .code) {
          self.code = codeVal
        }
        // Timing: FHIRJSON
        if let scheduleVal = try container.decodeIfPresent(Timing.self, forKey: .schedule) {
          self.schedule = scheduleVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.schedule, forKey: .schedule)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["schedule"] {
				presentKeys.insert("schedule")
				if let val = exist as? FHIRJSON {
					upsert(schedule: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "schedule", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let schedule = self.schedule {
			json["schedule"] = schedule.asJSON()
		}
		
		return json
	}
*/
}

