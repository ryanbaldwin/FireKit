//
//  Timing.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Timing) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A timing schedule that specifies an event that may occur multiple times.
 *
 *  Specifies an event that may occur multiple times. Timing schedules are used to record when things are expected or
 *  requested to occur. The most common usage is in dosage instructions for medications. They are also used when
 *  planning care of various kinds.
 */
open class Timing: Element {
	override open class var resourceType: String {
		get { return "Timing" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let event = RealmSwift.List<DateTime>()
    @objc public dynamic var repeat_fhir: TimingRepeat?
    public func upsert(repeat_fhir: TimingRepeat?) {
        upsert(prop: &self.repeat_fhir, val: repeat_fhir)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case event = "event"
        case repeat_fhir = "repeat"
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
        self.event.append(objectsIn: try container.decodeIfPresent([DateTime].self, forKey: .event) ?? [])
        self.repeat_fhir = try container.decodeIfPresent(TimingRepeat.self, forKey: .repeat_fhir)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.event), forKey: .event)
        try container.encodeIfPresent(self.repeat_fhir, forKey: .repeat_fhir)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Timing.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Timing. Will return empty instance: \(error))")
		}
		return Timing.init()
	}
}


/**
 *  When the event is to occur.
 *
 *  A set of rules that describe when the event should occur.
 */
open class TimingRepeat: Element {
	override open class var resourceType: String {
		get { return "TimingRepeat" }
	}

    @objc public dynamic var boundsPeriod: Period?
    public func upsert(boundsPeriod: Period?) {
        upsert(prop: &self.boundsPeriod, val: boundsPeriod)
    }
    @objc public dynamic var boundsQuantity: Quantity?
    public func upsert(boundsQuantity: Quantity?) {
        upsert(prop: &self.boundsQuantity, val: boundsQuantity)
    }
    @objc public dynamic var boundsRange: Range?
    public func upsert(boundsRange: Range?) {
        upsert(prop: &self.boundsRange, val: boundsRange)
    }
    public let count = RealmOptional<Int>()
    @objc public dynamic var duration: RealmDecimal?
    @objc public dynamic var durationMax: RealmDecimal?
    @objc public dynamic var durationUnits: String?
    public let frequency = RealmOptional<Int>()
    public let frequencyMax = RealmOptional<Int>()
    @objc public dynamic var period: RealmDecimal?
    @objc public dynamic var periodMax: RealmDecimal?
    @objc public dynamic var periodUnits: String?
    @objc public dynamic var when: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case boundsPeriod = "boundsPeriod"
        case boundsQuantity = "boundsQuantity"
        case boundsRange = "boundsRange"
        case count = "count"
        case duration = "duration"
        case durationMax = "durationMax"
        case durationUnits = "durationUnits"
        case frequency = "frequency"
        case frequencyMax = "frequencyMax"
        case period = "period"
        case periodMax = "periodMax"
        case periodUnits = "periodUnits"
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

        self.boundsPeriod = try container.decodeIfPresent(Period.self, forKey: .boundsPeriod)
        self.boundsQuantity = try container.decodeIfPresent(Quantity.self, forKey: .boundsQuantity)
        self.boundsRange = try container.decodeIfPresent(Range.self, forKey: .boundsRange)
        self.count.value = try container.decodeIfPresent(Int.self, forKey: .count)
        self.duration = try container.decodeIfPresent(RealmDecimal.self, forKey: .duration)
        self.durationMax = try container.decodeIfPresent(RealmDecimal.self, forKey: .durationMax)
        self.durationUnits = try container.decodeIfPresent(String.self, forKey: .durationUnits)
        self.frequency.value = try container.decodeIfPresent(Int.self, forKey: .frequency)
        self.frequencyMax.value = try container.decodeIfPresent(Int.self, forKey: .frequencyMax)
        self.period = try container.decodeIfPresent(RealmDecimal.self, forKey: .period)
        self.periodMax = try container.decodeIfPresent(RealmDecimal.self, forKey: .periodMax)
        self.periodUnits = try container.decodeIfPresent(String.self, forKey: .periodUnits)
        self.when = try container.decodeIfPresent(String.self, forKey: .when)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.boundsPeriod, forKey: .boundsPeriod)
        try container.encodeIfPresent(self.boundsQuantity, forKey: .boundsQuantity)
        try container.encodeIfPresent(self.boundsRange, forKey: .boundsRange)
        try container.encodeIfPresent(self.count.value, forKey: .count)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.durationMax, forKey: .durationMax)
        try container.encodeIfPresent(self.durationUnits, forKey: .durationUnits)
        try container.encodeIfPresent(self.frequency.value, forKey: .frequency)
        try container.encodeIfPresent(self.frequencyMax.value, forKey: .frequencyMax)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.periodMax, forKey: .periodMax)
        try container.encodeIfPresent(self.periodUnits, forKey: .periodUnits)
        try container.encodeIfPresent(self.when, forKey: .when)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(TimingRepeat.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy TimingRepeat. Will return empty instance: \(error))")
		}
		return TimingRepeat.init()
	}
}

