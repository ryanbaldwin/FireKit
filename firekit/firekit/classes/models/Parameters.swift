//
//  Parameters.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Parameters) on 2017-09-15.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-15
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  Operation Request or Response.
 *
 *  This special resource type is used to represent an operation request and response (operations.html). It has no other
 *  use, and there is no RESTful endpoint associated with it.
 */
open class Parameters: Resource {
	override open class var resourceType: String {
		get { return "Parameters" }
	}

    public let parameter = RealmSwift.List<ParametersParameter>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case parameter = "parameter"
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

        self.parameter.append(objectsIn: try container.decodeIfPresent([ParametersParameter].self, forKey: .parameter) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.parameter), forKey: .parameter)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Parameters.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Parameters. Will return empty instance: \(error))")
		}
		return Parameters.init()
	}
}


/**
 *  Operation Parameter.
 *
 *  A parameter passed to or received from the operation.
 */
open class ParametersParameter: BackboneElement {
	override open class var resourceType: String {
		get { return "ParametersParameter" }
	}

    @objc public dynamic var name: String?
    public let part = RealmSwift.List<ParametersParameter>()
    @objc public dynamic var resource: ContainedResource?
    @objc public dynamic var valueAddress: Address?
    public func upsert(valueAddress: Address?) {
        upsert(prop: &self.valueAddress, val: valueAddress)
    }
    @objc public dynamic var valueAnnotation: Annotation?
    public func upsert(valueAnnotation: Annotation?) {
        upsert(prop: &self.valueAnnotation, val: valueAnnotation)
    }
    @objc public dynamic var valueAttachment: Attachment?
    public func upsert(valueAttachment: Attachment?) {
        upsert(prop: &self.valueAttachment, val: valueAttachment)
    }
    @objc public dynamic var valueBase64Binary: Base64Binary?
    public let valueBoolean = RealmOptional<Bool>()
    @objc public dynamic var valueCode: String?
    @objc public dynamic var valueCodeableConcept: CodeableConcept?
    public func upsert(valueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
    }
    @objc public dynamic var valueCoding: Coding?
    public func upsert(valueCoding: Coding?) {
        upsert(prop: &self.valueCoding, val: valueCoding)
    }
    @objc public dynamic var valueContactPoint: ContactPoint?
    public func upsert(valueContactPoint: ContactPoint?) {
        upsert(prop: &self.valueContactPoint, val: valueContactPoint)
    }
    @objc public dynamic var valueDate: FHIRDate?
    @objc public dynamic var valueDateTime: DateTime?
    @objc public dynamic var valueDecimal: RealmDecimal?
    @objc public dynamic var valueHumanName: HumanName?
    public func upsert(valueHumanName: HumanName?) {
        upsert(prop: &self.valueHumanName, val: valueHumanName)
    }
    @objc public dynamic var valueId: String?
    @objc public dynamic var valueIdentifier: Identifier?
    public func upsert(valueIdentifier: Identifier?) {
        upsert(prop: &self.valueIdentifier, val: valueIdentifier)
    }
    @objc public dynamic var valueInstant: Instant?
    public let valueInteger = RealmOptional<Int>()
    @objc public dynamic var valueMarkdown: String?
    @objc public dynamic var valueMeta: Meta?
    public func upsert(valueMeta: Meta?) {
        upsert(prop: &self.valueMeta, val: valueMeta)
    }
    @objc public dynamic var valueOid: String?
    @objc public dynamic var valuePeriod: Period?
    public func upsert(valuePeriod: Period?) {
        upsert(prop: &self.valuePeriod, val: valuePeriod)
    }
    public let valuePositiveInt = RealmOptional<Int>()
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
    @objc public dynamic var valueReference: Reference?
    public func upsert(valueReference: Reference?) {
        upsert(prop: &self.valueReference, val: valueReference)
    }
    @objc public dynamic var valueSampledData: SampledData?
    public func upsert(valueSampledData: SampledData?) {
        upsert(prop: &self.valueSampledData, val: valueSampledData)
    }
    @objc public dynamic var valueSignature: Signature?
    public func upsert(valueSignature: Signature?) {
        upsert(prop: &self.valueSignature, val: valueSignature)
    }
    @objc public dynamic var valueString: String?
    @objc public dynamic var valueTime: FHIRTime?
    @objc public dynamic var valueTiming: Timing?
    public func upsert(valueTiming: Timing?) {
        upsert(prop: &self.valueTiming, val: valueTiming)
    }
    public let valueUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var valueUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String) {
        self.init()
        self.name = name
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case part = "part"
        case resource = "resource"
        case valueAddress = "valueAddress"
        case valueAnnotation = "valueAnnotation"
        case valueAttachment = "valueAttachment"
        case valueBase64Binary = "valueBase64Binary"
        case valueBoolean = "valueBoolean"
        case valueCode = "valueCode"
        case valueCodeableConcept = "valueCodeableConcept"
        case valueCoding = "valueCoding"
        case valueContactPoint = "valueContactPoint"
        case valueDate = "valueDate"
        case valueDateTime = "valueDateTime"
        case valueDecimal = "valueDecimal"
        case valueHumanName = "valueHumanName"
        case valueId = "valueId"
        case valueIdentifier = "valueIdentifier"
        case valueInstant = "valueInstant"
        case valueInteger = "valueInteger"
        case valueMarkdown = "valueMarkdown"
        case valueMeta = "valueMeta"
        case valueOid = "valueOid"
        case valuePeriod = "valuePeriod"
        case valuePositiveInt = "valuePositiveInt"
        case valueQuantity = "valueQuantity"
        case valueRange = "valueRange"
        case valueRatio = "valueRatio"
        case valueReference = "valueReference"
        case valueSampledData = "valueSampledData"
        case valueSignature = "valueSignature"
        case valueString = "valueString"
        case valueTime = "valueTime"
        case valueTiming = "valueTiming"
        case valueUnsignedInt = "valueUnsignedInt"
        case valueUri = "valueUri"
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

        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.part.append(objectsIn: try container.decodeIfPresent([ParametersParameter].self, forKey: .part) ?? [])

        if let resourceContained = try container.decodeIfPresent(ContainedResource.self, forKey: .resource),
           let resourceType = resourceContained.resourceType {
            let actualResource = try container.decodeFHIRAbstractBaseIfPresent(resourceType, forKey: .resource)
            resourceContained.json = try JSONEncoder().encode(actualResource)
            self.resource = resourceContained
        }
    
        self.valueAddress = try container.decodeIfPresent(Address.self, forKey: .valueAddress)
        self.valueAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .valueAnnotation)
        self.valueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .valueAttachment)
        self.valueBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .valueBase64Binary)
        self.valueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .valueBoolean)
        self.valueCode = try container.decodeIfPresent(String.self, forKey: .valueCode)
        self.valueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .valueCodeableConcept)
        self.valueCoding = try container.decodeIfPresent(Coding.self, forKey: .valueCoding)
        self.valueContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .valueContactPoint)
        self.valueDate = try container.decodeIfPresent(FHIRDate.self, forKey: .valueDate)
        self.valueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .valueDateTime)
        self.valueDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .valueDecimal)
        self.valueHumanName = try container.decodeIfPresent(HumanName.self, forKey: .valueHumanName)
        self.valueId = try container.decodeIfPresent(String.self, forKey: .valueId)
        self.valueIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .valueIdentifier)
        self.valueInstant = try container.decodeIfPresent(Instant.self, forKey: .valueInstant)
        self.valueInteger.value = try container.decodeIfPresent(Int.self, forKey: .valueInteger)
        self.valueMarkdown = try container.decodeIfPresent(String.self, forKey: .valueMarkdown)
        self.valueMeta = try container.decodeIfPresent(Meta.self, forKey: .valueMeta)
        self.valueOid = try container.decodeIfPresent(String.self, forKey: .valueOid)
        self.valuePeriod = try container.decodeIfPresent(Period.self, forKey: .valuePeriod)
        self.valuePositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .valuePositiveInt)
        self.valueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .valueQuantity)
        self.valueRange = try container.decodeIfPresent(Range.self, forKey: .valueRange)
        self.valueRatio = try container.decodeIfPresent(Ratio.self, forKey: .valueRatio)
        self.valueReference = try container.decodeIfPresent(Reference.self, forKey: .valueReference)
        self.valueSampledData = try container.decodeIfPresent(SampledData.self, forKey: .valueSampledData)
        self.valueSignature = try container.decodeIfPresent(Signature.self, forKey: .valueSignature)
        self.valueString = try container.decodeIfPresent(String.self, forKey: .valueString)
        self.valueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .valueTime)
        self.valueTiming = try container.decodeIfPresent(Timing.self, forKey: .valueTiming)
        self.valueUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .valueUnsignedInt)
        self.valueUri = try container.decodeIfPresent(String.self, forKey: .valueUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.part), forKey: .part)
        try container.encodeIfPresent(self.resource, forKey: .resource)
        try container.encodeIfPresent(self.valueAddress, forKey: .valueAddress)
        try container.encodeIfPresent(self.valueAnnotation, forKey: .valueAnnotation)
        try container.encodeIfPresent(self.valueAttachment, forKey: .valueAttachment)
        try container.encodeIfPresent(self.valueBase64Binary, forKey: .valueBase64Binary)
        try container.encodeIfPresent(self.valueBoolean.value, forKey: .valueBoolean)
        try container.encodeIfPresent(self.valueCode, forKey: .valueCode)
        try container.encodeIfPresent(self.valueCodeableConcept, forKey: .valueCodeableConcept)
        try container.encodeIfPresent(self.valueCoding, forKey: .valueCoding)
        try container.encodeIfPresent(self.valueContactPoint, forKey: .valueContactPoint)
        try container.encodeIfPresent(self.valueDate, forKey: .valueDate)
        try container.encodeIfPresent(self.valueDateTime, forKey: .valueDateTime)
        try container.encodeIfPresent(self.valueDecimal, forKey: .valueDecimal)
        try container.encodeIfPresent(self.valueHumanName, forKey: .valueHumanName)
        try container.encodeIfPresent(self.valueId, forKey: .valueId)
        try container.encodeIfPresent(self.valueIdentifier, forKey: .valueIdentifier)
        try container.encodeIfPresent(self.valueInstant, forKey: .valueInstant)
        try container.encodeIfPresent(self.valueInteger.value, forKey: .valueInteger)
        try container.encodeIfPresent(self.valueMarkdown, forKey: .valueMarkdown)
        try container.encodeIfPresent(self.valueMeta, forKey: .valueMeta)
        try container.encodeIfPresent(self.valueOid, forKey: .valueOid)
        try container.encodeIfPresent(self.valuePeriod, forKey: .valuePeriod)
        try container.encodeIfPresent(self.valuePositiveInt.value, forKey: .valuePositiveInt)
        try container.encodeIfPresent(self.valueQuantity, forKey: .valueQuantity)
        try container.encodeIfPresent(self.valueRange, forKey: .valueRange)
        try container.encodeIfPresent(self.valueRatio, forKey: .valueRatio)
        try container.encodeIfPresent(self.valueReference, forKey: .valueReference)
        try container.encodeIfPresent(self.valueSampledData, forKey: .valueSampledData)
        try container.encodeIfPresent(self.valueSignature, forKey: .valueSignature)
        try container.encodeIfPresent(self.valueString, forKey: .valueString)
        try container.encodeIfPresent(self.valueTime, forKey: .valueTime)
        try container.encodeIfPresent(self.valueTiming, forKey: .valueTiming)
        try container.encodeIfPresent(self.valueUnsignedInt.value, forKey: .valueUnsignedInt)
        try container.encodeIfPresent(self.valueUri, forKey: .valueUri)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ParametersParameter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ParametersParameter. Will return empty instance: \(error))")
		}
		return ParametersParameter.init()
	}
}

