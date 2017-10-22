//
//  DeviceComponent.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceComponent) on 2017-10-22.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-22
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  An instance of a medical-related component of a medical device.
 *
 *  Describes the characteristics, operational status and capabilities of a medical-related component of a medical
 *  device.
 */
open class DeviceComponent: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceComponent" }
	}

    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var languageCode: CodeableConcept?
    public func upsert(languageCode: CodeableConcept?) {
        upsert(prop: &self.languageCode, val: languageCode)
    }
    @objc public dynamic var lastSystemChange: Instant?
    @objc public dynamic var measurementPrinciple: String?
    public let operationalStatus = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var parameterGroup: CodeableConcept?
    public func upsert(parameterGroup: CodeableConcept?) {
        upsert(prop: &self.parameterGroup, val: parameterGroup)
    }
    @objc public dynamic var parent: Reference?
    public func upsert(parent: Reference?) {
        upsert(prop: &self.parent, val: parent)
    }
    public let productionSpecification = RealmSwift.List<DeviceComponentProductionSpecification>()
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: Identifier, lastSystemChange: Instant, type: CodeableConcept) {
        self.init()
        self.identifier = identifier
        self.lastSystemChange = lastSystemChange
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identifier = "identifier"
        case languageCode = "languageCode"
        case lastSystemChange = "lastSystemChange"
        case measurementPrinciple = "measurementPrinciple"
        case operationalStatus = "operationalStatus"
        case parameterGroup = "parameterGroup"
        case parent = "parent"
        case productionSpecification = "productionSpecification"
        case source = "source"
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

        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.languageCode = try container.decodeIfPresent(CodeableConcept.self, forKey: .languageCode)
        self.lastSystemChange = try container.decodeIfPresent(Instant.self, forKey: .lastSystemChange)
        self.measurementPrinciple = try container.decodeIfPresent(String.self, forKey: .measurementPrinciple)
        self.operationalStatus.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .operationalStatus) ?? [])
        self.parameterGroup = try container.decodeIfPresent(CodeableConcept.self, forKey: .parameterGroup)
        self.parent = try container.decodeIfPresent(Reference.self, forKey: .parent)
        self.productionSpecification.append(objectsIn: try container.decodeIfPresent([DeviceComponentProductionSpecification].self, forKey: .productionSpecification) ?? [])
        self.source = try container.decodeIfPresent(Reference.self, forKey: .source)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.languageCode, forKey: .languageCode)
        try container.encodeIfPresent(self.lastSystemChange, forKey: .lastSystemChange)
        try container.encodeIfPresent(self.measurementPrinciple, forKey: .measurementPrinciple)
        try container.encode(Array(self.operationalStatus), forKey: .operationalStatus)
        try container.encodeIfPresent(self.parameterGroup, forKey: .parameterGroup)
        try container.encodeIfPresent(self.parent, forKey: .parent)
        try container.encode(Array(self.productionSpecification), forKey: .productionSpecification)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DeviceComponent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DeviceComponent. Will return empty instance: \(error))")
		}
		return DeviceComponent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DeviceComponent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.identifier, from: o.identifier)
        FireKit.populate(&self.languageCode, from: o.languageCode)
        FireKit.populate(&self.lastSystemChange, from: o.lastSystemChange)
        measurementPrinciple = o.measurementPrinciple

        for (index, t) in o.operationalStatus.enumerated() {
            guard index < self.operationalStatus.count else {
                self.operationalStatus.append(t)
                continue
            }
            self.operationalStatus[index].populate(from: t)
        }
    
        while self.operationalStatus.count > o.operationalStatus.count {
            let objectToRemove = self.operationalStatus.last!
            self.operationalStatus.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.parameterGroup, from: o.parameterGroup)
        FireKit.populate(&self.parent, from: o.parent)

        for (index, t) in o.productionSpecification.enumerated() {
            guard index < self.productionSpecification.count else {
                self.productionSpecification.append(t)
                continue
            }
            self.productionSpecification[index].populate(from: t)
        }
    
        while self.productionSpecification.count > o.productionSpecification.count {
            let objectToRemove = self.productionSpecification.last!
            self.productionSpecification.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.source, from: o.source)
        FireKit.populate(&self.type, from: o.type)
    }
}


/**
 *  Production specification of the component.
 *
 *  Describes the production specification such as component revision, serial number, etc.
 */
open class DeviceComponentProductionSpecification: BackboneElement {
	override open class var resourceType: String {
		get { return "DeviceComponentProductionSpecification" }
	}

    @objc public dynamic var componentId: Identifier?
    public func upsert(componentId: Identifier?) {
        upsert(prop: &self.componentId, val: componentId)
    }
    @objc public dynamic var productionSpec: String?
    @objc public dynamic var specType: CodeableConcept?
    public func upsert(specType: CodeableConcept?) {
        upsert(prop: &self.specType, val: specType)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case componentId = "componentId"
        case productionSpec = "productionSpec"
        case specType = "specType"
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

        self.componentId = try container.decodeIfPresent(Identifier.self, forKey: .componentId)
        self.productionSpec = try container.decodeIfPresent(String.self, forKey: .productionSpec)
        self.specType = try container.decodeIfPresent(CodeableConcept.self, forKey: .specType)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.componentId, forKey: .componentId)
        try container.encodeIfPresent(self.productionSpec, forKey: .productionSpec)
        try container.encodeIfPresent(self.specType, forKey: .specType)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DeviceComponentProductionSpecification.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DeviceComponentProductionSpecification. Will return empty instance: \(error))")
		}
		return DeviceComponentProductionSpecification.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? DeviceComponentProductionSpecification else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.componentId, from: o.componentId)
        productionSpec = o.productionSpec
        FireKit.populate(&self.specType, from: o.specType)
    }
}

