//
//  Group.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Group) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Group of multiple entities.
 *
 *  Represents a defined collection of entities that may be discussed or acted upon collectively but which are not
 *  expected to act collectively and are not formally or legally recognized; i.e. a collection of entities that isn't an
 *  Organization.
 */
open class Group: DomainResource {
	override open class var resourceType: String {
		get { return "Group" }
	}

    public let actual = RealmOptional<Bool>()
    public let characteristic = RealmSwift.List<GroupCharacteristic>()
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let identifier = RealmSwift.List<Identifier>()
    public let member = RealmSwift.List<GroupMember>()
    @objc public dynamic var name: String?
    public let quantity = RealmOptional<Int>()
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(actual: Bool, type: String) {
        self.init()
        self.actual.value = actual
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actual = "actual"
        case characteristic = "characteristic"
        case code = "code"
        case identifier = "identifier"
        case member = "member"
        case name = "name"
        case quantity = "quantity"
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

        self.actual.value = try container.decodeIfPresent(Bool.self, forKey: .actual)
        self.characteristic.append(objectsIn: try container.decodeIfPresent([GroupCharacteristic].self, forKey: .characteristic) ?? [])
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.member.append(objectsIn: try container.decodeIfPresent([GroupMember].self, forKey: .member) ?? [])
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.quantity.value = try container.decodeIfPresent(Int.self, forKey: .quantity)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actual.value, forKey: .actual)
        try container.encode(Array(self.characteristic), forKey: .characteristic)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.member), forKey: .member)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.quantity.value, forKey: .quantity)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["actual"] {
				presentKeys.insert("actual")
				if let val = exist as? Bool {
					self.actual.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "actual", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "actual"))
			}
			if let exist = js["characteristic"] {
				presentKeys.insert("characteristic")
				if let val = exist as? [FHIRJSON] {
					if let vals = GroupCharacteristic.instantiate(fromArray: val, owner: self) as? [GroupCharacteristic] {
						if let realm = self.realm { realm.delete(self.characteristic) }
						self.characteristic.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "characteristic", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["member"] {
				presentKeys.insert("member")
				if let val = exist as? [FHIRJSON] {
					if let vals = GroupMember.instantiate(fromArray: val, owner: self) as? [GroupMember] {
						if let realm = self.realm { realm.delete(self.member) }
						self.member.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "member", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["quantity"] {
				presentKeys.insert("quantity")
				if let val = exist as? Int {
					self.quantity.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "quantity", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let actual = self.actual.value {
			json["actual"] = actual.asJSON()
		}
		if characteristic.count > 0 {
			json["characteristic"] = Array(characteristic.map() { $0.asJSON() })
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if member.count > 0 {
			json["member"] = Array(member.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let quantity = self.quantity.value {
			json["quantity"] = quantity.asJSON()
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
			let clone = try JSONDecoder().decode(Group.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Group. Will return empty instance: \(error))")
		}
		return Group.init()
	}
}


/**
 *  Trait of group members.
 *
 *  Identifies the traits shared by members of the group.
 */
open class GroupCharacteristic: BackboneElement {
	override open class var resourceType: String {
		get { return "GroupCharacteristic" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let exclude = RealmOptional<Bool>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let valueBoolean = RealmOptional<Bool>()
    @objc public dynamic var valueCodeableConcept: CodeableConcept?
    public func upsert(valueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
    }
    @objc public dynamic var valueQuantity: Quantity?
    public func upsert(valueQuantity: Quantity?) {
        upsert(prop: &self.valueQuantity, val: valueQuantity)
    }
    @objc public dynamic var valueRange: Range?
    public func upsert(valueRange: Range?) {
        upsert(prop: &self.valueRange, val: valueRange)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, exclude: Bool, valueBoolean: Bool, valueCodeableConcept: CodeableConcept, valueQuantity: Quantity, valueRange: Range) {
        self.init()
        self.code = code
        self.exclude.value = exclude
        self.valueBoolean.value = valueBoolean
        self.valueCodeableConcept = valueCodeableConcept
        self.valueQuantity = valueQuantity
        self.valueRange = valueRange
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case exclude = "exclude"
        case period = "period"
        case valueBoolean = "valueBoolean"
        case valueCodeableConcept = "valueCodeableConcept"
        case valueQuantity = "valueQuantity"
        case valueRange = "valueRange"
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
        self.exclude.value = try container.decodeIfPresent(Bool.self, forKey: .exclude)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.valueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .valueBoolean)
        self.valueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .valueCodeableConcept)
        self.valueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .valueQuantity)
        self.valueRange = try container.decodeIfPresent(Range.self, forKey: .valueRange)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.exclude.value, forKey: .exclude)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.valueBoolean.value, forKey: .valueBoolean)
        try container.encodeIfPresent(self.valueCodeableConcept, forKey: .valueCodeableConcept)
        try container.encodeIfPresent(self.valueQuantity, forKey: .valueQuantity)
        try container.encodeIfPresent(self.valueRange, forKey: .valueRange)
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
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["exclude"] {
				presentKeys.insert("exclude")
				if let val = exist as? Bool {
					self.exclude.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "exclude", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "exclude"))
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueBoolean"] {
				presentKeys.insert("valueBoolean")
				if let val = exist as? Bool {
					self.valueBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueCodeableConcept"] {
				presentKeys.insert("valueCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(valueCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueQuantity"] {
				presentKeys.insert("valueQuantity")
				if let val = exist as? FHIRJSON {
					upsert(valueQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueRange"] {
				presentKeys.insert("valueRange")
				if let val = exist as? FHIRJSON {
					upsert(valueRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.valueCodeableConcept && nil == self.valueBoolean.value && nil == self.valueQuantity && nil == self.valueRange {
				errors.append(FHIRJSONError(key: "value*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let exclude = self.exclude.value {
			json["exclude"] = exclude.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let valueBoolean = self.valueBoolean.value {
			json["valueBoolean"] = valueBoolean.asJSON()
		}
		if let valueCodeableConcept = self.valueCodeableConcept {
			json["valueCodeableConcept"] = valueCodeableConcept.asJSON()
		}
		if let valueQuantity = self.valueQuantity {
			json["valueQuantity"] = valueQuantity.asJSON()
		}
		if let valueRange = self.valueRange {
			json["valueRange"] = valueRange.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(GroupCharacteristic.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy GroupCharacteristic. Will return empty instance: \(error))")
		}
		return GroupCharacteristic.init()
	}
}


/**
 *  Who or what is in group.
 *
 *  Identifies the resource instances that are members of the group.
 */
open class GroupMember: BackboneElement {
	override open class var resourceType: String {
		get { return "GroupMember" }
	}

    @objc public dynamic var entity: Reference?
    public func upsert(entity: Reference?) {
        upsert(prop: &self.entity, val: entity)
    }
    public let inactive = RealmOptional<Bool>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(entity: Reference) {
        self.init()
        self.entity = entity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case entity = "entity"
        case inactive = "inactive"
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

        self.entity = try container.decodeIfPresent(Reference.self, forKey: .entity)
        self.inactive.value = try container.decodeIfPresent(Bool.self, forKey: .inactive)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.entity, forKey: .entity)
        try container.encodeIfPresent(self.inactive.value, forKey: .inactive)
        try container.encodeIfPresent(self.period, forKey: .period)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["entity"] {
				presentKeys.insert("entity")
				if let val = exist as? FHIRJSON {
					upsert(entity: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "entity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "entity"))
			}
			if let exist = js["inactive"] {
				presentKeys.insert("inactive")
				if let val = exist as? Bool {
					self.inactive.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "inactive", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let entity = self.entity {
			json["entity"] = entity.asJSON()
		}
		if let inactive = self.inactive.value {
			json["inactive"] = inactive.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(GroupMember.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy GroupMember. Will return empty instance: \(error))")
		}
		return GroupMember.init()
	}
}

