//
//  Group.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Group) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? Group else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        actual.value = o.actual.value

        for (index, t) in o.characteristic.enumerated() {
            guard index < self.characteristic.count else {
                self.characteristic.append(t)
                continue
            }
            self.characteristic[index].populate(from: t)
        }
    
        if self.characteristic.count > o.characteristic.count {
            for i in self.characteristic.count...o.characteristic.count {
                let objectToRemove = self.characteristic[i]
                self.characteristic.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
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

        for (index, t) in o.member.enumerated() {
            guard index < self.member.count else {
                self.member.append(t)
                continue
            }
            self.member[index].populate(from: t)
        }
    
        if self.member.count > o.member.count {
            for i in self.member.count...o.member.count {
                let objectToRemove = self.member[i]
                self.member.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        name = o.name
        quantity.value = o.quantity.value
        type = o.type
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

    public override func populate(from other: Any) {
        guard let o = other as? GroupCharacteristic else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        exclude.value = o.exclude.value
        FireKit.populate(&self.period, from: o.period)
        valueBoolean.value = o.valueBoolean.value
        FireKit.populate(&self.valueCodeableConcept, from: o.valueCodeableConcept)
        FireKit.populate(&self.valueQuantity, from: o.valueQuantity)
        FireKit.populate(&self.valueRange, from: o.valueRange)
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

    public override func populate(from other: Any) {
        guard let o = other as? GroupMember else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.entity, from: o.entity)
        inactive.value = o.inactive.value
        FireKit.populate(&self.period, from: o.period)
    }
}

