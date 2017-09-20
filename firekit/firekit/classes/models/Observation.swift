//
//  Observation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Observation) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Measurements and simple assertions.
 *
 *  Measurements and simple assertions made about a patient, device or other subject.
 */
open class Observation: DomainResource {
	override open class var resourceType: String {
		get { return "Observation" }
	}

    @objc public dynamic var bodySite: CodeableConcept?
    public func upsert(bodySite: CodeableConcept?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }
    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var comments: String?
    public let component = RealmSwift.List<ObservationComponent>()
    @objc public dynamic var dataAbsentReason: CodeableConcept?
    public func upsert(dataAbsentReason: CodeableConcept?) {
        upsert(prop: &self.dataAbsentReason, val: dataAbsentReason)
    }
    @objc public dynamic var device: Reference?
    public func upsert(device: Reference?) {
        upsert(prop: &self.device, val: device)
    }
    @objc public dynamic var effectiveDateTime: DateTime?
    @objc public dynamic var effectivePeriod: Period?
    public func upsert(effectivePeriod: Period?) {
        upsert(prop: &self.effectivePeriod, val: effectivePeriod)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var interpretation: CodeableConcept?
    public func upsert(interpretation: CodeableConcept?) {
        upsert(prop: &self.interpretation, val: interpretation)
    }
    @objc public dynamic var issued: Instant?
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    public let performer = RealmSwift.List<Reference>()
    public let referenceRange = RealmSwift.List<ObservationReferenceRange>()
    public let related = RealmSwift.List<ObservationRelated>()
    @objc public dynamic var specimen: Reference?
    public func upsert(specimen: Reference?) {
        upsert(prop: &self.specimen, val: specimen)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var valueAttachment: Attachment?
    public func upsert(valueAttachment: Attachment?) {
        upsert(prop: &self.valueAttachment, val: valueAttachment)
    }
    @objc public dynamic var valueCodeableConcept: CodeableConcept?
    public func upsert(valueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
    }
    @objc public dynamic var valueDateTime: DateTime?
    @objc public dynamic var valuePeriod: Period?
    public func upsert(valuePeriod: Period?) {
        upsert(prop: &self.valuePeriod, val: valuePeriod)
    }
    @objc public dynamic var valueQuantity: Quantity?
    public func upsert(valueQuantity: Quantity?) {
        upsert(prop: &self.valueQuantity, val: valueQuantity)
    }
    @objc public dynamic var valueRange: Range?
    public func upsert(valueRange: Range?) {
        upsert(prop: &self.valueRange, val: valueRange)
    }
    @objc public dynamic var valueRatio: Ratio?
    public func upsert(valueRatio: Ratio?) {
        upsert(prop: &self.valueRatio, val: valueRatio)
    }
    @objc public dynamic var valueSampledData: SampledData?
    public func upsert(valueSampledData: SampledData?) {
        upsert(prop: &self.valueSampledData, val: valueSampledData)
    }
    @objc public dynamic var valueString: String?
    @objc public dynamic var valueTime: FHIRTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, status: String) {
        self.init()
        self.code = code
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case bodySite = "bodySite"
        case category = "category"
        case code = "code"
        case comments = "comments"
        case component = "component"
        case dataAbsentReason = "dataAbsentReason"
        case device = "device"
        case effectiveDateTime = "effectiveDateTime"
        case effectivePeriod = "effectivePeriod"
        case encounter = "encounter"
        case identifier = "identifier"
        case interpretation = "interpretation"
        case issued = "issued"
        case method = "method"
        case performer = "performer"
        case referenceRange = "referenceRange"
        case related = "related"
        case specimen = "specimen"
        case status = "status"
        case subject = "subject"
        case valueAttachment = "valueAttachment"
        case valueCodeableConcept = "valueCodeableConcept"
        case valueDateTime = "valueDateTime"
        case valuePeriod = "valuePeriod"
        case valueQuantity = "valueQuantity"
        case valueRange = "valueRange"
        case valueRatio = "valueRatio"
        case valueSampledData = "valueSampledData"
        case valueString = "valueString"
        case valueTime = "valueTime"
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
        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.comments = try container.decodeIfPresent(String.self, forKey: .comments)
        self.component.append(objectsIn: try container.decodeIfPresent([ObservationComponent].self, forKey: .component) ?? [])
        self.dataAbsentReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .dataAbsentReason)
        self.device = try container.decodeIfPresent(Reference.self, forKey: .device)
        self.effectiveDateTime = try container.decodeIfPresent(DateTime.self, forKey: .effectiveDateTime)
        self.effectivePeriod = try container.decodeIfPresent(Period.self, forKey: .effectivePeriod)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.interpretation = try container.decodeIfPresent(CodeableConcept.self, forKey: .interpretation)
        self.issued = try container.decodeIfPresent(Instant.self, forKey: .issued)
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.performer.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .performer) ?? [])
        self.referenceRange.append(objectsIn: try container.decodeIfPresent([ObservationReferenceRange].self, forKey: .referenceRange) ?? [])
        self.related.append(objectsIn: try container.decodeIfPresent([ObservationRelated].self, forKey: .related) ?? [])
        self.specimen = try container.decodeIfPresent(Reference.self, forKey: .specimen)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
        self.valueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .valueAttachment)
        self.valueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .valueCodeableConcept)
        self.valueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .valueDateTime)
        self.valuePeriod = try container.decodeIfPresent(Period.self, forKey: .valuePeriod)
        self.valueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .valueQuantity)
        self.valueRange = try container.decodeIfPresent(Range.self, forKey: .valueRange)
        self.valueRatio = try container.decodeIfPresent(Ratio.self, forKey: .valueRatio)
        self.valueSampledData = try container.decodeIfPresent(SampledData.self, forKey: .valueSampledData)
        self.valueString = try container.decodeIfPresent(String.self, forKey: .valueString)
        self.valueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .valueTime)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.comments, forKey: .comments)
        try container.encode(Array(self.component), forKey: .component)
        try container.encodeIfPresent(self.dataAbsentReason, forKey: .dataAbsentReason)
        try container.encodeIfPresent(self.device, forKey: .device)
        try container.encodeIfPresent(self.effectiveDateTime, forKey: .effectiveDateTime)
        try container.encodeIfPresent(self.effectivePeriod, forKey: .effectivePeriod)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.interpretation, forKey: .interpretation)
        try container.encodeIfPresent(self.issued, forKey: .issued)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encode(Array(self.performer), forKey: .performer)
        try container.encode(Array(self.referenceRange), forKey: .referenceRange)
        try container.encode(Array(self.related), forKey: .related)
        try container.encodeIfPresent(self.specimen, forKey: .specimen)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.valueAttachment, forKey: .valueAttachment)
        try container.encodeIfPresent(self.valueCodeableConcept, forKey: .valueCodeableConcept)
        try container.encodeIfPresent(self.valueDateTime, forKey: .valueDateTime)
        try container.encodeIfPresent(self.valuePeriod, forKey: .valuePeriod)
        try container.encodeIfPresent(self.valueQuantity, forKey: .valueQuantity)
        try container.encodeIfPresent(self.valueRange, forKey: .valueRange)
        try container.encodeIfPresent(self.valueRatio, forKey: .valueRatio)
        try container.encodeIfPresent(self.valueSampledData, forKey: .valueSampledData)
        try container.encodeIfPresent(self.valueString, forKey: .valueString)
        try container.encodeIfPresent(self.valueTime, forKey: .valueTime)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Observation.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Observation. Will return empty instance: \(error))")
		}
		return Observation.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? Observation else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.bodySite, from: o.bodySite)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.code, from: o.code)
        comments = o.comments

        for (index, t) in o.component.enumerated() {
            guard index < self.component.count else {
                self.component.append(t)
                continue
            }
            self.component[index].populate(from: t)
        }
    
        if self.component.count > o.component.count {
            for i in self.component.count...o.component.count {
                let objectToRemove = self.component[i]
                self.component.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.dataAbsentReason, from: o.dataAbsentReason)
        FireKit.populate(&self.device, from: o.device)
        FireKit.populate(&self.effectiveDateTime, from: o.effectiveDateTime)
        FireKit.populate(&self.effectivePeriod, from: o.effectivePeriod)
        FireKit.populate(&self.encounter, from: o.encounter)

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
        FireKit.populate(&self.interpretation, from: o.interpretation)
        FireKit.populate(&self.issued, from: o.issued)
        FireKit.populate(&self.method, from: o.method)

        for (index, t) in o.performer.enumerated() {
            guard index < self.performer.count else {
                self.performer.append(t)
                continue
            }
            self.performer[index].populate(from: t)
        }
    
        if self.performer.count > o.performer.count {
            for i in self.performer.count...o.performer.count {
                let objectToRemove = self.performer[i]
                self.performer.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.referenceRange.enumerated() {
            guard index < self.referenceRange.count else {
                self.referenceRange.append(t)
                continue
            }
            self.referenceRange[index].populate(from: t)
        }
    
        if self.referenceRange.count > o.referenceRange.count {
            for i in self.referenceRange.count...o.referenceRange.count {
                let objectToRemove = self.referenceRange[i]
                self.referenceRange.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.related.enumerated() {
            guard index < self.related.count else {
                self.related.append(t)
                continue
            }
            self.related[index].populate(from: t)
        }
    
        if self.related.count > o.related.count {
            for i in self.related.count...o.related.count {
                let objectToRemove = self.related[i]
                self.related.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.specimen, from: o.specimen)
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
        FireKit.populate(&self.valueAttachment, from: o.valueAttachment)
        FireKit.populate(&self.valueCodeableConcept, from: o.valueCodeableConcept)
        FireKit.populate(&self.valueDateTime, from: o.valueDateTime)
        FireKit.populate(&self.valuePeriod, from: o.valuePeriod)
        FireKit.populate(&self.valueQuantity, from: o.valueQuantity)
        FireKit.populate(&self.valueRange, from: o.valueRange)
        FireKit.populate(&self.valueRatio, from: o.valueRatio)
        FireKit.populate(&self.valueSampledData, from: o.valueSampledData)
        valueString = o.valueString
        FireKit.populate(&self.valueTime, from: o.valueTime)
    }
}


/**
 *  Component results.
 *
 *  Some observations have multiple component observations.  These component observations are expressed as separate code
 *  value pairs that share the same attributes.  Examples include systolic and diastolic component observations for
 *  blood pressure measurement and multiple component observations for genetics observations.
 */
open class ObservationComponent: BackboneElement {
	override open class var resourceType: String {
		get { return "ObservationComponent" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var dataAbsentReason: CodeableConcept?
    public func upsert(dataAbsentReason: CodeableConcept?) {
        upsert(prop: &self.dataAbsentReason, val: dataAbsentReason)
    }
    public let referenceRange = RealmSwift.List<ObservationReferenceRange>()
    @objc public dynamic var valueAttachment: Attachment?
    public func upsert(valueAttachment: Attachment?) {
        upsert(prop: &self.valueAttachment, val: valueAttachment)
    }
    @objc public dynamic var valueCodeableConcept: CodeableConcept?
    public func upsert(valueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
    }
    @objc public dynamic var valueDateTime: DateTime?
    @objc public dynamic var valuePeriod: Period?
    public func upsert(valuePeriod: Period?) {
        upsert(prop: &self.valuePeriod, val: valuePeriod)
    }
    @objc public dynamic var valueQuantity: Quantity?
    public func upsert(valueQuantity: Quantity?) {
        upsert(prop: &self.valueQuantity, val: valueQuantity)
    }
    @objc public dynamic var valueRange: Range?
    public func upsert(valueRange: Range?) {
        upsert(prop: &self.valueRange, val: valueRange)
    }
    @objc public dynamic var valueRatio: Ratio?
    public func upsert(valueRatio: Ratio?) {
        upsert(prop: &self.valueRatio, val: valueRatio)
    }
    @objc public dynamic var valueSampledData: SampledData?
    public func upsert(valueSampledData: SampledData?) {
        upsert(prop: &self.valueSampledData, val: valueSampledData)
    }
    @objc public dynamic var valueString: String?
    @objc public dynamic var valueTime: FHIRTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case dataAbsentReason = "dataAbsentReason"
        case referenceRange = "referenceRange"
        case valueAttachment = "valueAttachment"
        case valueCodeableConcept = "valueCodeableConcept"
        case valueDateTime = "valueDateTime"
        case valuePeriod = "valuePeriod"
        case valueQuantity = "valueQuantity"
        case valueRange = "valueRange"
        case valueRatio = "valueRatio"
        case valueSampledData = "valueSampledData"
        case valueString = "valueString"
        case valueTime = "valueTime"
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
        self.dataAbsentReason = try container.decodeIfPresent(CodeableConcept.self, forKey: .dataAbsentReason)
        self.referenceRange.append(objectsIn: try container.decodeIfPresent([ObservationReferenceRange].self, forKey: .referenceRange) ?? [])
        self.valueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .valueAttachment)
        self.valueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .valueCodeableConcept)
        self.valueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .valueDateTime)
        self.valuePeriod = try container.decodeIfPresent(Period.self, forKey: .valuePeriod)
        self.valueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .valueQuantity)
        self.valueRange = try container.decodeIfPresent(Range.self, forKey: .valueRange)
        self.valueRatio = try container.decodeIfPresent(Ratio.self, forKey: .valueRatio)
        self.valueSampledData = try container.decodeIfPresent(SampledData.self, forKey: .valueSampledData)
        self.valueString = try container.decodeIfPresent(String.self, forKey: .valueString)
        self.valueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .valueTime)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.dataAbsentReason, forKey: .dataAbsentReason)
        try container.encode(Array(self.referenceRange), forKey: .referenceRange)
        try container.encodeIfPresent(self.valueAttachment, forKey: .valueAttachment)
        try container.encodeIfPresent(self.valueCodeableConcept, forKey: .valueCodeableConcept)
        try container.encodeIfPresent(self.valueDateTime, forKey: .valueDateTime)
        try container.encodeIfPresent(self.valuePeriod, forKey: .valuePeriod)
        try container.encodeIfPresent(self.valueQuantity, forKey: .valueQuantity)
        try container.encodeIfPresent(self.valueRange, forKey: .valueRange)
        try container.encodeIfPresent(self.valueRatio, forKey: .valueRatio)
        try container.encodeIfPresent(self.valueSampledData, forKey: .valueSampledData)
        try container.encodeIfPresent(self.valueString, forKey: .valueString)
        try container.encodeIfPresent(self.valueTime, forKey: .valueTime)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ObservationComponent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ObservationComponent. Will return empty instance: \(error))")
		}
		return ObservationComponent.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ObservationComponent else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.code, from: o.code)
        FireKit.populate(&self.dataAbsentReason, from: o.dataAbsentReason)

        for (index, t) in o.referenceRange.enumerated() {
            guard index < self.referenceRange.count else {
                self.referenceRange.append(t)
                continue
            }
            self.referenceRange[index].populate(from: t)
        }
    
        if self.referenceRange.count > o.referenceRange.count {
            for i in self.referenceRange.count...o.referenceRange.count {
                let objectToRemove = self.referenceRange[i]
                self.referenceRange.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.valueAttachment, from: o.valueAttachment)
        FireKit.populate(&self.valueCodeableConcept, from: o.valueCodeableConcept)
        FireKit.populate(&self.valueDateTime, from: o.valueDateTime)
        FireKit.populate(&self.valuePeriod, from: o.valuePeriod)
        FireKit.populate(&self.valueQuantity, from: o.valueQuantity)
        FireKit.populate(&self.valueRange, from: o.valueRange)
        FireKit.populate(&self.valueRatio, from: o.valueRatio)
        FireKit.populate(&self.valueSampledData, from: o.valueSampledData)
        valueString = o.valueString
        FireKit.populate(&self.valueTime, from: o.valueTime)
    }
}


/**
 *  Provides guide for interpretation.
 *
 *  Guidance on how to interpret the value by comparison to a normal or recommended range.
 */
open class ObservationReferenceRange: BackboneElement {
	override open class var resourceType: String {
		get { return "ObservationReferenceRange" }
	}

    @objc public dynamic var age: Range?
    public func upsert(age: Range?) {
        upsert(prop: &self.age, val: age)
    }
    @objc public dynamic var high: Quantity?
    public func upsert(high: Quantity?) {
        upsert(prop: &self.high, val: high)
    }
    @objc public dynamic var low: Quantity?
    public func upsert(low: Quantity?) {
        upsert(prop: &self.low, val: low)
    }
    @objc public dynamic var meaning: CodeableConcept?
    public func upsert(meaning: CodeableConcept?) {
        upsert(prop: &self.meaning, val: meaning)
    }
    @objc public dynamic var text: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case age = "age"
        case high = "high"
        case low = "low"
        case meaning = "meaning"
        case text = "text"
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

        self.age = try container.decodeIfPresent(Range.self, forKey: .age)
        self.high = try container.decodeIfPresent(Quantity.self, forKey: .high)
        self.low = try container.decodeIfPresent(Quantity.self, forKey: .low)
        self.meaning = try container.decodeIfPresent(CodeableConcept.self, forKey: .meaning)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.age, forKey: .age)
        try container.encodeIfPresent(self.high, forKey: .high)
        try container.encodeIfPresent(self.low, forKey: .low)
        try container.encodeIfPresent(self.meaning, forKey: .meaning)
        try container.encodeIfPresent(self.text, forKey: .text)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ObservationReferenceRange.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ObservationReferenceRange. Will return empty instance: \(error))")
		}
		return ObservationReferenceRange.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ObservationReferenceRange else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.age, from: o.age)
        FireKit.populate(&self.high, from: o.high)
        FireKit.populate(&self.low, from: o.low)
        FireKit.populate(&self.meaning, from: o.meaning)
        text = o.text
    }
}


/**
 *  Resource related to this observation.
 *
 *  A  reference to another resource (usually another Observation but could  also be a QuestionnaireAnswer) whose
 *  relationship is defined by the relationship type code.
 */
open class ObservationRelated: BackboneElement {
	override open class var resourceType: String {
		get { return "ObservationRelated" }
	}

    @objc public dynamic var target: Reference?
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(target: Reference) {
        self.init()
        self.target = target
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case target = "target"
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

        self.target = try container.decodeIfPresent(Reference.self, forKey: .target)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ObservationRelated.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ObservationRelated. Will return empty instance: \(error))")
		}
		return ObservationRelated.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ObservationRelated else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.target, from: o.target)
        type = o.type
    }
}

