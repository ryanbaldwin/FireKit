//
//  DeviceMetric.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceMetric) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Measurement, calculation or setting capability of a medical device.
 *
 *  Describes a measurement, calculation or setting capability of a medical device.
 */
open class DeviceMetric: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceMetric" }
	}

    public let calibration = RealmSwift.List<DeviceMetricCalibration>()
    @objc public dynamic var category: String?
    @objc public dynamic var color: String?
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var measurementPeriod: Timing?
    public func upsert(measurementPeriod: Timing?) {
        upsert(prop: &self.measurementPeriod, val: measurementPeriod)
    }
    @objc public dynamic var operationalStatus: String?
    @objc public dynamic var parent: Reference?
    public func upsert(parent: Reference?) {
        upsert(prop: &self.parent, val: parent)
    }
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }
    @objc public dynamic var unit: CodeableConcept?
    public func upsert(unit: CodeableConcept?) {
        upsert(prop: &self.unit, val: unit)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(category: String, identifier: Identifier, type: CodeableConcept) {
        self.init()
        self.category = category
        self.identifier = identifier
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case calibration = "calibration"
        case category = "category"
        case color = "color"
        case identifier = "identifier"
        case measurementPeriod = "measurementPeriod"
        case operationalStatus = "operationalStatus"
        case parent = "parent"
        case source = "source"
        case type = "type"
        case unit = "unit"
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

        self.calibration.append(objectsIn: try container.decodeIfPresent([DeviceMetricCalibration].self, forKey: .calibration) ?? [])
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.color = try container.decodeIfPresent(String.self, forKey: .color)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.measurementPeriod = try container.decodeIfPresent(Timing.self, forKey: .measurementPeriod)
        self.operationalStatus = try container.decodeIfPresent(String.self, forKey: .operationalStatus)
        self.parent = try container.decodeIfPresent(Reference.self, forKey: .parent)
        self.source = try container.decodeIfPresent(Reference.self, forKey: .source)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
        self.unit = try container.decodeIfPresent(CodeableConcept.self, forKey: .unit)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.calibration), forKey: .calibration)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.color, forKey: .color)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.measurementPeriod, forKey: .measurementPeriod)
        try container.encodeIfPresent(self.operationalStatus, forKey: .operationalStatus)
        try container.encodeIfPresent(self.parent, forKey: .parent)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.unit, forKey: .unit)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DeviceMetric.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DeviceMetric. Will return empty instance: \(error))")
		}
		return DeviceMetric.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DeviceMetric else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populateList(&self.calibration, from: o.calibration)
        category = o.category
        color = o.color
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.measurementPeriod, from: o.measurementPeriod)
        operationalStatus = o.operationalStatus
        FireKit.populate(&self.parent, from: o.parent)
        FireKit.populate(&self.source, from: o.source)
        FireKit.populate(&self.type, from: o.type)
        FireKit.populate(&self.unit, from: o.unit)
    }
}


/**
 *  Describes the calibrations that have been performed or that are required to be performed.
 */
open class DeviceMetricCalibration: BackboneElement {
	override open class var resourceType: String {
		get { return "DeviceMetricCalibration" }
	}

    @objc public dynamic var state: String?
    @objc public dynamic var time: Instant?
    @objc public dynamic var type: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case state = "state"
        case time = "time"
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

        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.time = try container.decodeIfPresent(Instant.self, forKey: .time)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.time, forKey: .time)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DeviceMetricCalibration.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DeviceMetricCalibration. Will return empty instance: \(error))")
		}
		return DeviceMetricCalibration.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DeviceMetricCalibration else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        state = o.state
        time = o.time
        type = o.type
    }
}

