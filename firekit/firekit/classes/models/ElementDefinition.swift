//
//  ElementDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ElementDefinition) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Definition of an element in a resource or extension.
 *
 *  Captures constraints on each element within the resource, profile, or extension.
 */
open class ElementDefinition: Element {
	override open class var resourceType: String {
		get { return "ElementDefinition" }
	}

    public let alias = RealmSwift.List<RealmString>()
    @objc public dynamic var base: ElementDefinitionBase?
    public func upsert(base: ElementDefinitionBase?) {
        upsert(prop: &self.base, val: base)
    }
    @objc public dynamic var binding: ElementDefinitionBinding?
    public func upsert(binding: ElementDefinitionBinding?) {
        upsert(prop: &self.binding, val: binding)
    }
    public let code = RealmSwift.List<Coding>()
    @objc public dynamic var comments: String?
    public let condition = RealmSwift.List<RealmString>()
    public let constraint = RealmSwift.List<ElementDefinitionConstraint>()
    @objc public dynamic var defaultValueAddress: Address?
    public func upsert(defaultValueAddress: Address?) {
        upsert(prop: &self.defaultValueAddress, val: defaultValueAddress)
    }
    @objc public dynamic var defaultValueAnnotation: Annotation?
    public func upsert(defaultValueAnnotation: Annotation?) {
        upsert(prop: &self.defaultValueAnnotation, val: defaultValueAnnotation)
    }
    @objc public dynamic var defaultValueAttachment: Attachment?
    public func upsert(defaultValueAttachment: Attachment?) {
        upsert(prop: &self.defaultValueAttachment, val: defaultValueAttachment)
    }
    @objc public dynamic var defaultValueBase64Binary: Base64Binary?
    public let defaultValueBoolean = RealmOptional<Bool>()
    @objc public dynamic var defaultValueCode: String?
    @objc public dynamic var defaultValueCodeableConcept: CodeableConcept?
    public func upsert(defaultValueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.defaultValueCodeableConcept, val: defaultValueCodeableConcept)
    }
    @objc public dynamic var defaultValueCoding: Coding?
    public func upsert(defaultValueCoding: Coding?) {
        upsert(prop: &self.defaultValueCoding, val: defaultValueCoding)
    }
    @objc public dynamic var defaultValueContactPoint: ContactPoint?
    public func upsert(defaultValueContactPoint: ContactPoint?) {
        upsert(prop: &self.defaultValueContactPoint, val: defaultValueContactPoint)
    }
    @objc public dynamic var defaultValueDate: FHIRDate?
    @objc public dynamic var defaultValueDateTime: DateTime?
    @objc public dynamic var defaultValueDecimal: RealmDecimal?
    @objc public dynamic var defaultValueHumanName: HumanName?
    public func upsert(defaultValueHumanName: HumanName?) {
        upsert(prop: &self.defaultValueHumanName, val: defaultValueHumanName)
    }
    @objc public dynamic var defaultValueId: String?
    @objc public dynamic var defaultValueIdentifier: Identifier?
    public func upsert(defaultValueIdentifier: Identifier?) {
        upsert(prop: &self.defaultValueIdentifier, val: defaultValueIdentifier)
    }
    @objc public dynamic var defaultValueInstant: Instant?
    public let defaultValueInteger = RealmOptional<Int>()
    @objc public dynamic var defaultValueMarkdown: String?
    @objc public dynamic var defaultValueMeta: Meta?
    public func upsert(defaultValueMeta: Meta?) {
        upsert(prop: &self.defaultValueMeta, val: defaultValueMeta)
    }
    @objc public dynamic var defaultValueOid: String?
    @objc public dynamic var defaultValuePeriod: Period?
    public func upsert(defaultValuePeriod: Period?) {
        upsert(prop: &self.defaultValuePeriod, val: defaultValuePeriod)
    }
    public let defaultValuePositiveInt = RealmOptional<Int>()
    @objc public dynamic var defaultValueQuantity: Quantity?
    public func upsert(defaultValueQuantity: Quantity?) {
        upsert(prop: &self.defaultValueQuantity, val: defaultValueQuantity)
    }
    @objc public dynamic var defaultValueRange: Range?
    public func upsert(defaultValueRange: Range?) {
        upsert(prop: &self.defaultValueRange, val: defaultValueRange)
    }
    @objc public dynamic var defaultValueRatio: Ratio?
    public func upsert(defaultValueRatio: Ratio?) {
        upsert(prop: &self.defaultValueRatio, val: defaultValueRatio)
    }
    @objc public dynamic var defaultValueReference: Reference?
    public func upsert(defaultValueReference: Reference?) {
        upsert(prop: &self.defaultValueReference, val: defaultValueReference)
    }
    @objc public dynamic var defaultValueSampledData: SampledData?
    public func upsert(defaultValueSampledData: SampledData?) {
        upsert(prop: &self.defaultValueSampledData, val: defaultValueSampledData)
    }
    @objc public dynamic var defaultValueSignature: Signature?
    public func upsert(defaultValueSignature: Signature?) {
        upsert(prop: &self.defaultValueSignature, val: defaultValueSignature)
    }
    @objc public dynamic var defaultValueString: String?
    @objc public dynamic var defaultValueTime: FHIRTime?
    @objc public dynamic var defaultValueTiming: Timing?
    public func upsert(defaultValueTiming: Timing?) {
        upsert(prop: &self.defaultValueTiming, val: defaultValueTiming)
    }
    public let defaultValueUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var defaultValueUri: String?
    @objc public dynamic var definition: String?
    @objc public dynamic var exampleAddress: Address?
    public func upsert(exampleAddress: Address?) {
        upsert(prop: &self.exampleAddress, val: exampleAddress)
    }
    @objc public dynamic var exampleAnnotation: Annotation?
    public func upsert(exampleAnnotation: Annotation?) {
        upsert(prop: &self.exampleAnnotation, val: exampleAnnotation)
    }
    @objc public dynamic var exampleAttachment: Attachment?
    public func upsert(exampleAttachment: Attachment?) {
        upsert(prop: &self.exampleAttachment, val: exampleAttachment)
    }
    @objc public dynamic var exampleBase64Binary: Base64Binary?
    public let exampleBoolean = RealmOptional<Bool>()
    @objc public dynamic var exampleCode: String?
    @objc public dynamic var exampleCodeableConcept: CodeableConcept?
    public func upsert(exampleCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.exampleCodeableConcept, val: exampleCodeableConcept)
    }
    @objc public dynamic var exampleCoding: Coding?
    public func upsert(exampleCoding: Coding?) {
        upsert(prop: &self.exampleCoding, val: exampleCoding)
    }
    @objc public dynamic var exampleContactPoint: ContactPoint?
    public func upsert(exampleContactPoint: ContactPoint?) {
        upsert(prop: &self.exampleContactPoint, val: exampleContactPoint)
    }
    @objc public dynamic var exampleDate: FHIRDate?
    @objc public dynamic var exampleDateTime: DateTime?
    @objc public dynamic var exampleDecimal: RealmDecimal?
    @objc public dynamic var exampleHumanName: HumanName?
    public func upsert(exampleHumanName: HumanName?) {
        upsert(prop: &self.exampleHumanName, val: exampleHumanName)
    }
    @objc public dynamic var exampleId: String?
    @objc public dynamic var exampleIdentifier: Identifier?
    public func upsert(exampleIdentifier: Identifier?) {
        upsert(prop: &self.exampleIdentifier, val: exampleIdentifier)
    }
    @objc public dynamic var exampleInstant: Instant?
    public let exampleInteger = RealmOptional<Int>()
    @objc public dynamic var exampleMarkdown: String?
    @objc public dynamic var exampleMeta: Meta?
    public func upsert(exampleMeta: Meta?) {
        upsert(prop: &self.exampleMeta, val: exampleMeta)
    }
    @objc public dynamic var exampleOid: String?
    @objc public dynamic var examplePeriod: Period?
    public func upsert(examplePeriod: Period?) {
        upsert(prop: &self.examplePeriod, val: examplePeriod)
    }
    public let examplePositiveInt = RealmOptional<Int>()
    @objc public dynamic var exampleQuantity: Quantity?
    public func upsert(exampleQuantity: Quantity?) {
        upsert(prop: &self.exampleQuantity, val: exampleQuantity)
    }
    @objc public dynamic var exampleRange: Range?
    public func upsert(exampleRange: Range?) {
        upsert(prop: &self.exampleRange, val: exampleRange)
    }
    @objc public dynamic var exampleRatio: Ratio?
    public func upsert(exampleRatio: Ratio?) {
        upsert(prop: &self.exampleRatio, val: exampleRatio)
    }
    @objc public dynamic var exampleReference: Reference?
    public func upsert(exampleReference: Reference?) {
        upsert(prop: &self.exampleReference, val: exampleReference)
    }
    @objc public dynamic var exampleSampledData: SampledData?
    public func upsert(exampleSampledData: SampledData?) {
        upsert(prop: &self.exampleSampledData, val: exampleSampledData)
    }
    @objc public dynamic var exampleSignature: Signature?
    public func upsert(exampleSignature: Signature?) {
        upsert(prop: &self.exampleSignature, val: exampleSignature)
    }
    @objc public dynamic var exampleString: String?
    @objc public dynamic var exampleTime: FHIRTime?
    @objc public dynamic var exampleTiming: Timing?
    public func upsert(exampleTiming: Timing?) {
        upsert(prop: &self.exampleTiming, val: exampleTiming)
    }
    public let exampleUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var exampleUri: String?
    @objc public dynamic var fixedAddress: Address?
    public func upsert(fixedAddress: Address?) {
        upsert(prop: &self.fixedAddress, val: fixedAddress)
    }
    @objc public dynamic var fixedAnnotation: Annotation?
    public func upsert(fixedAnnotation: Annotation?) {
        upsert(prop: &self.fixedAnnotation, val: fixedAnnotation)
    }
    @objc public dynamic var fixedAttachment: Attachment?
    public func upsert(fixedAttachment: Attachment?) {
        upsert(prop: &self.fixedAttachment, val: fixedAttachment)
    }
    @objc public dynamic var fixedBase64Binary: Base64Binary?
    public let fixedBoolean = RealmOptional<Bool>()
    @objc public dynamic var fixedCode: String?
    @objc public dynamic var fixedCodeableConcept: CodeableConcept?
    public func upsert(fixedCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.fixedCodeableConcept, val: fixedCodeableConcept)
    }
    @objc public dynamic var fixedCoding: Coding?
    public func upsert(fixedCoding: Coding?) {
        upsert(prop: &self.fixedCoding, val: fixedCoding)
    }
    @objc public dynamic var fixedContactPoint: ContactPoint?
    public func upsert(fixedContactPoint: ContactPoint?) {
        upsert(prop: &self.fixedContactPoint, val: fixedContactPoint)
    }
    @objc public dynamic var fixedDate: FHIRDate?
    @objc public dynamic var fixedDateTime: DateTime?
    @objc public dynamic var fixedDecimal: RealmDecimal?
    @objc public dynamic var fixedHumanName: HumanName?
    public func upsert(fixedHumanName: HumanName?) {
        upsert(prop: &self.fixedHumanName, val: fixedHumanName)
    }
    @objc public dynamic var fixedId: String?
    @objc public dynamic var fixedIdentifier: Identifier?
    public func upsert(fixedIdentifier: Identifier?) {
        upsert(prop: &self.fixedIdentifier, val: fixedIdentifier)
    }
    @objc public dynamic var fixedInstant: Instant?
    public let fixedInteger = RealmOptional<Int>()
    @objc public dynamic var fixedMarkdown: String?
    @objc public dynamic var fixedMeta: Meta?
    public func upsert(fixedMeta: Meta?) {
        upsert(prop: &self.fixedMeta, val: fixedMeta)
    }
    @objc public dynamic var fixedOid: String?
    @objc public dynamic var fixedPeriod: Period?
    public func upsert(fixedPeriod: Period?) {
        upsert(prop: &self.fixedPeriod, val: fixedPeriod)
    }
    public let fixedPositiveInt = RealmOptional<Int>()
    @objc public dynamic var fixedQuantity: Quantity?
    public func upsert(fixedQuantity: Quantity?) {
        upsert(prop: &self.fixedQuantity, val: fixedQuantity)
    }
    @objc public dynamic var fixedRange: Range?
    public func upsert(fixedRange: Range?) {
        upsert(prop: &self.fixedRange, val: fixedRange)
    }
    @objc public dynamic var fixedRatio: Ratio?
    public func upsert(fixedRatio: Ratio?) {
        upsert(prop: &self.fixedRatio, val: fixedRatio)
    }
    @objc public dynamic var fixedReference: Reference?
    public func upsert(fixedReference: Reference?) {
        upsert(prop: &self.fixedReference, val: fixedReference)
    }
    @objc public dynamic var fixedSampledData: SampledData?
    public func upsert(fixedSampledData: SampledData?) {
        upsert(prop: &self.fixedSampledData, val: fixedSampledData)
    }
    @objc public dynamic var fixedSignature: Signature?
    public func upsert(fixedSignature: Signature?) {
        upsert(prop: &self.fixedSignature, val: fixedSignature)
    }
    @objc public dynamic var fixedString: String?
    @objc public dynamic var fixedTime: FHIRTime?
    @objc public dynamic var fixedTiming: Timing?
    public func upsert(fixedTiming: Timing?) {
        upsert(prop: &self.fixedTiming, val: fixedTiming)
    }
    public let fixedUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var fixedUri: String?
    public let isModifier = RealmOptional<Bool>()
    public let isSummary = RealmOptional<Bool>()
    @objc public dynamic var label: String?
    public let mapping = RealmSwift.List<ElementDefinitionMapping>()
    @objc public dynamic var max: String?
    public let maxLength = RealmOptional<Int>()
    @objc public dynamic var maxValueAddress: Address?
    public func upsert(maxValueAddress: Address?) {
        upsert(prop: &self.maxValueAddress, val: maxValueAddress)
    }
    @objc public dynamic var maxValueAnnotation: Annotation?
    public func upsert(maxValueAnnotation: Annotation?) {
        upsert(prop: &self.maxValueAnnotation, val: maxValueAnnotation)
    }
    @objc public dynamic var maxValueAttachment: Attachment?
    public func upsert(maxValueAttachment: Attachment?) {
        upsert(prop: &self.maxValueAttachment, val: maxValueAttachment)
    }
    @objc public dynamic var maxValueBase64Binary: Base64Binary?
    public let maxValueBoolean = RealmOptional<Bool>()
    @objc public dynamic var maxValueCode: String?
    @objc public dynamic var maxValueCodeableConcept: CodeableConcept?
    public func upsert(maxValueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.maxValueCodeableConcept, val: maxValueCodeableConcept)
    }
    @objc public dynamic var maxValueCoding: Coding?
    public func upsert(maxValueCoding: Coding?) {
        upsert(prop: &self.maxValueCoding, val: maxValueCoding)
    }
    @objc public dynamic var maxValueContactPoint: ContactPoint?
    public func upsert(maxValueContactPoint: ContactPoint?) {
        upsert(prop: &self.maxValueContactPoint, val: maxValueContactPoint)
    }
    @objc public dynamic var maxValueDate: FHIRDate?
    @objc public dynamic var maxValueDateTime: DateTime?
    @objc public dynamic var maxValueDecimal: RealmDecimal?
    @objc public dynamic var maxValueHumanName: HumanName?
    public func upsert(maxValueHumanName: HumanName?) {
        upsert(prop: &self.maxValueHumanName, val: maxValueHumanName)
    }
    @objc public dynamic var maxValueId: String?
    @objc public dynamic var maxValueIdentifier: Identifier?
    public func upsert(maxValueIdentifier: Identifier?) {
        upsert(prop: &self.maxValueIdentifier, val: maxValueIdentifier)
    }
    @objc public dynamic var maxValueInstant: Instant?
    public let maxValueInteger = RealmOptional<Int>()
    @objc public dynamic var maxValueMarkdown: String?
    @objc public dynamic var maxValueMeta: Meta?
    public func upsert(maxValueMeta: Meta?) {
        upsert(prop: &self.maxValueMeta, val: maxValueMeta)
    }
    @objc public dynamic var maxValueOid: String?
    @objc public dynamic var maxValuePeriod: Period?
    public func upsert(maxValuePeriod: Period?) {
        upsert(prop: &self.maxValuePeriod, val: maxValuePeriod)
    }
    public let maxValuePositiveInt = RealmOptional<Int>()
    @objc public dynamic var maxValueQuantity: Quantity?
    public func upsert(maxValueQuantity: Quantity?) {
        upsert(prop: &self.maxValueQuantity, val: maxValueQuantity)
    }
    @objc public dynamic var maxValueRange: Range?
    public func upsert(maxValueRange: Range?) {
        upsert(prop: &self.maxValueRange, val: maxValueRange)
    }
    @objc public dynamic var maxValueRatio: Ratio?
    public func upsert(maxValueRatio: Ratio?) {
        upsert(prop: &self.maxValueRatio, val: maxValueRatio)
    }
    @objc public dynamic var maxValueReference: Reference?
    public func upsert(maxValueReference: Reference?) {
        upsert(prop: &self.maxValueReference, val: maxValueReference)
    }
    @objc public dynamic var maxValueSampledData: SampledData?
    public func upsert(maxValueSampledData: SampledData?) {
        upsert(prop: &self.maxValueSampledData, val: maxValueSampledData)
    }
    @objc public dynamic var maxValueSignature: Signature?
    public func upsert(maxValueSignature: Signature?) {
        upsert(prop: &self.maxValueSignature, val: maxValueSignature)
    }
    @objc public dynamic var maxValueString: String?
    @objc public dynamic var maxValueTime: FHIRTime?
    @objc public dynamic var maxValueTiming: Timing?
    public func upsert(maxValueTiming: Timing?) {
        upsert(prop: &self.maxValueTiming, val: maxValueTiming)
    }
    public let maxValueUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var maxValueUri: String?
    @objc public dynamic var meaningWhenMissing: String?
    public let min = RealmOptional<Int>()
    @objc public dynamic var minValueAddress: Address?
    public func upsert(minValueAddress: Address?) {
        upsert(prop: &self.minValueAddress, val: minValueAddress)
    }
    @objc public dynamic var minValueAnnotation: Annotation?
    public func upsert(minValueAnnotation: Annotation?) {
        upsert(prop: &self.minValueAnnotation, val: minValueAnnotation)
    }
    @objc public dynamic var minValueAttachment: Attachment?
    public func upsert(minValueAttachment: Attachment?) {
        upsert(prop: &self.minValueAttachment, val: minValueAttachment)
    }
    @objc public dynamic var minValueBase64Binary: Base64Binary?
    public let minValueBoolean = RealmOptional<Bool>()
    @objc public dynamic var minValueCode: String?
    @objc public dynamic var minValueCodeableConcept: CodeableConcept?
    public func upsert(minValueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.minValueCodeableConcept, val: minValueCodeableConcept)
    }
    @objc public dynamic var minValueCoding: Coding?
    public func upsert(minValueCoding: Coding?) {
        upsert(prop: &self.minValueCoding, val: minValueCoding)
    }
    @objc public dynamic var minValueContactPoint: ContactPoint?
    public func upsert(minValueContactPoint: ContactPoint?) {
        upsert(prop: &self.minValueContactPoint, val: minValueContactPoint)
    }
    @objc public dynamic var minValueDate: FHIRDate?
    @objc public dynamic var minValueDateTime: DateTime?
    @objc public dynamic var minValueDecimal: RealmDecimal?
    @objc public dynamic var minValueHumanName: HumanName?
    public func upsert(minValueHumanName: HumanName?) {
        upsert(prop: &self.minValueHumanName, val: minValueHumanName)
    }
    @objc public dynamic var minValueId: String?
    @objc public dynamic var minValueIdentifier: Identifier?
    public func upsert(minValueIdentifier: Identifier?) {
        upsert(prop: &self.minValueIdentifier, val: minValueIdentifier)
    }
    @objc public dynamic var minValueInstant: Instant?
    public let minValueInteger = RealmOptional<Int>()
    @objc public dynamic var minValueMarkdown: String?
    @objc public dynamic var minValueMeta: Meta?
    public func upsert(minValueMeta: Meta?) {
        upsert(prop: &self.minValueMeta, val: minValueMeta)
    }
    @objc public dynamic var minValueOid: String?
    @objc public dynamic var minValuePeriod: Period?
    public func upsert(minValuePeriod: Period?) {
        upsert(prop: &self.minValuePeriod, val: minValuePeriod)
    }
    public let minValuePositiveInt = RealmOptional<Int>()
    @objc public dynamic var minValueQuantity: Quantity?
    public func upsert(minValueQuantity: Quantity?) {
        upsert(prop: &self.minValueQuantity, val: minValueQuantity)
    }
    @objc public dynamic var minValueRange: Range?
    public func upsert(minValueRange: Range?) {
        upsert(prop: &self.minValueRange, val: minValueRange)
    }
    @objc public dynamic var minValueRatio: Ratio?
    public func upsert(minValueRatio: Ratio?) {
        upsert(prop: &self.minValueRatio, val: minValueRatio)
    }
    @objc public dynamic var minValueReference: Reference?
    public func upsert(minValueReference: Reference?) {
        upsert(prop: &self.minValueReference, val: minValueReference)
    }
    @objc public dynamic var minValueSampledData: SampledData?
    public func upsert(minValueSampledData: SampledData?) {
        upsert(prop: &self.minValueSampledData, val: minValueSampledData)
    }
    @objc public dynamic var minValueSignature: Signature?
    public func upsert(minValueSignature: Signature?) {
        upsert(prop: &self.minValueSignature, val: minValueSignature)
    }
    @objc public dynamic var minValueString: String?
    @objc public dynamic var minValueTime: FHIRTime?
    @objc public dynamic var minValueTiming: Timing?
    public func upsert(minValueTiming: Timing?) {
        upsert(prop: &self.minValueTiming, val: minValueTiming)
    }
    public let minValueUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var minValueUri: String?
    public let mustSupport = RealmOptional<Bool>()
    @objc public dynamic var name: String?
    @objc public dynamic var nameReference: String?
    @objc public dynamic var path: String?
    @objc public dynamic var patternAddress: Address?
    public func upsert(patternAddress: Address?) {
        upsert(prop: &self.patternAddress, val: patternAddress)
    }
    @objc public dynamic var patternAnnotation: Annotation?
    public func upsert(patternAnnotation: Annotation?) {
        upsert(prop: &self.patternAnnotation, val: patternAnnotation)
    }
    @objc public dynamic var patternAttachment: Attachment?
    public func upsert(patternAttachment: Attachment?) {
        upsert(prop: &self.patternAttachment, val: patternAttachment)
    }
    @objc public dynamic var patternBase64Binary: Base64Binary?
    public let patternBoolean = RealmOptional<Bool>()
    @objc public dynamic var patternCode: String?
    @objc public dynamic var patternCodeableConcept: CodeableConcept?
    public func upsert(patternCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.patternCodeableConcept, val: patternCodeableConcept)
    }
    @objc public dynamic var patternCoding: Coding?
    public func upsert(patternCoding: Coding?) {
        upsert(prop: &self.patternCoding, val: patternCoding)
    }
    @objc public dynamic var patternContactPoint: ContactPoint?
    public func upsert(patternContactPoint: ContactPoint?) {
        upsert(prop: &self.patternContactPoint, val: patternContactPoint)
    }
    @objc public dynamic var patternDate: FHIRDate?
    @objc public dynamic var patternDateTime: DateTime?
    @objc public dynamic var patternDecimal: RealmDecimal?
    @objc public dynamic var patternHumanName: HumanName?
    public func upsert(patternHumanName: HumanName?) {
        upsert(prop: &self.patternHumanName, val: patternHumanName)
    }
    @objc public dynamic var patternId: String?
    @objc public dynamic var patternIdentifier: Identifier?
    public func upsert(patternIdentifier: Identifier?) {
        upsert(prop: &self.patternIdentifier, val: patternIdentifier)
    }
    @objc public dynamic var patternInstant: Instant?
    public let patternInteger = RealmOptional<Int>()
    @objc public dynamic var patternMarkdown: String?
    @objc public dynamic var patternMeta: Meta?
    public func upsert(patternMeta: Meta?) {
        upsert(prop: &self.patternMeta, val: patternMeta)
    }
    @objc public dynamic var patternOid: String?
    @objc public dynamic var patternPeriod: Period?
    public func upsert(patternPeriod: Period?) {
        upsert(prop: &self.patternPeriod, val: patternPeriod)
    }
    public let patternPositiveInt = RealmOptional<Int>()
    @objc public dynamic var patternQuantity: Quantity?
    public func upsert(patternQuantity: Quantity?) {
        upsert(prop: &self.patternQuantity, val: patternQuantity)
    }
    @objc public dynamic var patternRange: Range?
    public func upsert(patternRange: Range?) {
        upsert(prop: &self.patternRange, val: patternRange)
    }
    @objc public dynamic var patternRatio: Ratio?
    public func upsert(patternRatio: Ratio?) {
        upsert(prop: &self.patternRatio, val: patternRatio)
    }
    @objc public dynamic var patternReference: Reference?
    public func upsert(patternReference: Reference?) {
        upsert(prop: &self.patternReference, val: patternReference)
    }
    @objc public dynamic var patternSampledData: SampledData?
    public func upsert(patternSampledData: SampledData?) {
        upsert(prop: &self.patternSampledData, val: patternSampledData)
    }
    @objc public dynamic var patternSignature: Signature?
    public func upsert(patternSignature: Signature?) {
        upsert(prop: &self.patternSignature, val: patternSignature)
    }
    @objc public dynamic var patternString: String?
    @objc public dynamic var patternTime: FHIRTime?
    @objc public dynamic var patternTiming: Timing?
    public func upsert(patternTiming: Timing?) {
        upsert(prop: &self.patternTiming, val: patternTiming)
    }
    public let patternUnsignedInt = RealmOptional<Int>()
    @objc public dynamic var patternUri: String?
    public let representation = RealmSwift.List<RealmString>()
    @objc public dynamic var requirements: String?
    @objc public dynamic var short: String?
    @objc public dynamic var slicing: ElementDefinitionSlicing?
    public func upsert(slicing: ElementDefinitionSlicing?) {
        upsert(prop: &self.slicing, val: slicing)
    }
    public let type = RealmSwift.List<ElementDefinitionType>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(path: String) {
        self.init()
        self.path = path
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case alias = "alias"
        case base = "base"
        case binding = "binding"
        case code = "code"
        case comments = "comments"
        case condition = "condition"
        case constraint = "constraint"
        case defaultValueAddress = "defaultValueAddress"
        case defaultValueAnnotation = "defaultValueAnnotation"
        case defaultValueAttachment = "defaultValueAttachment"
        case defaultValueBase64Binary = "defaultValueBase64Binary"
        case defaultValueBoolean = "defaultValueBoolean"
        case defaultValueCode = "defaultValueCode"
        case defaultValueCodeableConcept = "defaultValueCodeableConcept"
        case defaultValueCoding = "defaultValueCoding"
        case defaultValueContactPoint = "defaultValueContactPoint"
        case defaultValueDate = "defaultValueDate"
        case defaultValueDateTime = "defaultValueDateTime"
        case defaultValueDecimal = "defaultValueDecimal"
        case defaultValueHumanName = "defaultValueHumanName"
        case defaultValueId = "defaultValueId"
        case defaultValueIdentifier = "defaultValueIdentifier"
        case defaultValueInstant = "defaultValueInstant"
        case defaultValueInteger = "defaultValueInteger"
        case defaultValueMarkdown = "defaultValueMarkdown"
        case defaultValueMeta = "defaultValueMeta"
        case defaultValueOid = "defaultValueOid"
        case defaultValuePeriod = "defaultValuePeriod"
        case defaultValuePositiveInt = "defaultValuePositiveInt"
        case defaultValueQuantity = "defaultValueQuantity"
        case defaultValueRange = "defaultValueRange"
        case defaultValueRatio = "defaultValueRatio"
        case defaultValueReference = "defaultValueReference"
        case defaultValueSampledData = "defaultValueSampledData"
        case defaultValueSignature = "defaultValueSignature"
        case defaultValueString = "defaultValueString"
        case defaultValueTime = "defaultValueTime"
        case defaultValueTiming = "defaultValueTiming"
        case defaultValueUnsignedInt = "defaultValueUnsignedInt"
        case defaultValueUri = "defaultValueUri"
        case definition = "definition"
        case exampleAddress = "exampleAddress"
        case exampleAnnotation = "exampleAnnotation"
        case exampleAttachment = "exampleAttachment"
        case exampleBase64Binary = "exampleBase64Binary"
        case exampleBoolean = "exampleBoolean"
        case exampleCode = "exampleCode"
        case exampleCodeableConcept = "exampleCodeableConcept"
        case exampleCoding = "exampleCoding"
        case exampleContactPoint = "exampleContactPoint"
        case exampleDate = "exampleDate"
        case exampleDateTime = "exampleDateTime"
        case exampleDecimal = "exampleDecimal"
        case exampleHumanName = "exampleHumanName"
        case exampleId = "exampleId"
        case exampleIdentifier = "exampleIdentifier"
        case exampleInstant = "exampleInstant"
        case exampleInteger = "exampleInteger"
        case exampleMarkdown = "exampleMarkdown"
        case exampleMeta = "exampleMeta"
        case exampleOid = "exampleOid"
        case examplePeriod = "examplePeriod"
        case examplePositiveInt = "examplePositiveInt"
        case exampleQuantity = "exampleQuantity"
        case exampleRange = "exampleRange"
        case exampleRatio = "exampleRatio"
        case exampleReference = "exampleReference"
        case exampleSampledData = "exampleSampledData"
        case exampleSignature = "exampleSignature"
        case exampleString = "exampleString"
        case exampleTime = "exampleTime"
        case exampleTiming = "exampleTiming"
        case exampleUnsignedInt = "exampleUnsignedInt"
        case exampleUri = "exampleUri"
        case fixedAddress = "fixedAddress"
        case fixedAnnotation = "fixedAnnotation"
        case fixedAttachment = "fixedAttachment"
        case fixedBase64Binary = "fixedBase64Binary"
        case fixedBoolean = "fixedBoolean"
        case fixedCode = "fixedCode"
        case fixedCodeableConcept = "fixedCodeableConcept"
        case fixedCoding = "fixedCoding"
        case fixedContactPoint = "fixedContactPoint"
        case fixedDate = "fixedDate"
        case fixedDateTime = "fixedDateTime"
        case fixedDecimal = "fixedDecimal"
        case fixedHumanName = "fixedHumanName"
        case fixedId = "fixedId"
        case fixedIdentifier = "fixedIdentifier"
        case fixedInstant = "fixedInstant"
        case fixedInteger = "fixedInteger"
        case fixedMarkdown = "fixedMarkdown"
        case fixedMeta = "fixedMeta"
        case fixedOid = "fixedOid"
        case fixedPeriod = "fixedPeriod"
        case fixedPositiveInt = "fixedPositiveInt"
        case fixedQuantity = "fixedQuantity"
        case fixedRange = "fixedRange"
        case fixedRatio = "fixedRatio"
        case fixedReference = "fixedReference"
        case fixedSampledData = "fixedSampledData"
        case fixedSignature = "fixedSignature"
        case fixedString = "fixedString"
        case fixedTime = "fixedTime"
        case fixedTiming = "fixedTiming"
        case fixedUnsignedInt = "fixedUnsignedInt"
        case fixedUri = "fixedUri"
        case isModifier = "isModifier"
        case isSummary = "isSummary"
        case label = "label"
        case mapping = "mapping"
        case max = "max"
        case maxLength = "maxLength"
        case maxValueAddress = "maxValueAddress"
        case maxValueAnnotation = "maxValueAnnotation"
        case maxValueAttachment = "maxValueAttachment"
        case maxValueBase64Binary = "maxValueBase64Binary"
        case maxValueBoolean = "maxValueBoolean"
        case maxValueCode = "maxValueCode"
        case maxValueCodeableConcept = "maxValueCodeableConcept"
        case maxValueCoding = "maxValueCoding"
        case maxValueContactPoint = "maxValueContactPoint"
        case maxValueDate = "maxValueDate"
        case maxValueDateTime = "maxValueDateTime"
        case maxValueDecimal = "maxValueDecimal"
        case maxValueHumanName = "maxValueHumanName"
        case maxValueId = "maxValueId"
        case maxValueIdentifier = "maxValueIdentifier"
        case maxValueInstant = "maxValueInstant"
        case maxValueInteger = "maxValueInteger"
        case maxValueMarkdown = "maxValueMarkdown"
        case maxValueMeta = "maxValueMeta"
        case maxValueOid = "maxValueOid"
        case maxValuePeriod = "maxValuePeriod"
        case maxValuePositiveInt = "maxValuePositiveInt"
        case maxValueQuantity = "maxValueQuantity"
        case maxValueRange = "maxValueRange"
        case maxValueRatio = "maxValueRatio"
        case maxValueReference = "maxValueReference"
        case maxValueSampledData = "maxValueSampledData"
        case maxValueSignature = "maxValueSignature"
        case maxValueString = "maxValueString"
        case maxValueTime = "maxValueTime"
        case maxValueTiming = "maxValueTiming"
        case maxValueUnsignedInt = "maxValueUnsignedInt"
        case maxValueUri = "maxValueUri"
        case meaningWhenMissing = "meaningWhenMissing"
        case min = "min"
        case minValueAddress = "minValueAddress"
        case minValueAnnotation = "minValueAnnotation"
        case minValueAttachment = "minValueAttachment"
        case minValueBase64Binary = "minValueBase64Binary"
        case minValueBoolean = "minValueBoolean"
        case minValueCode = "minValueCode"
        case minValueCodeableConcept = "minValueCodeableConcept"
        case minValueCoding = "minValueCoding"
        case minValueContactPoint = "minValueContactPoint"
        case minValueDate = "minValueDate"
        case minValueDateTime = "minValueDateTime"
        case minValueDecimal = "minValueDecimal"
        case minValueHumanName = "minValueHumanName"
        case minValueId = "minValueId"
        case minValueIdentifier = "minValueIdentifier"
        case minValueInstant = "minValueInstant"
        case minValueInteger = "minValueInteger"
        case minValueMarkdown = "minValueMarkdown"
        case minValueMeta = "minValueMeta"
        case minValueOid = "minValueOid"
        case minValuePeriod = "minValuePeriod"
        case minValuePositiveInt = "minValuePositiveInt"
        case minValueQuantity = "minValueQuantity"
        case minValueRange = "minValueRange"
        case minValueRatio = "minValueRatio"
        case minValueReference = "minValueReference"
        case minValueSampledData = "minValueSampledData"
        case minValueSignature = "minValueSignature"
        case minValueString = "minValueString"
        case minValueTime = "minValueTime"
        case minValueTiming = "minValueTiming"
        case minValueUnsignedInt = "minValueUnsignedInt"
        case minValueUri = "minValueUri"
        case mustSupport = "mustSupport"
        case name = "name"
        case nameReference = "nameReference"
        case path = "path"
        case patternAddress = "patternAddress"
        case patternAnnotation = "patternAnnotation"
        case patternAttachment = "patternAttachment"
        case patternBase64Binary = "patternBase64Binary"
        case patternBoolean = "patternBoolean"
        case patternCode = "patternCode"
        case patternCodeableConcept = "patternCodeableConcept"
        case patternCoding = "patternCoding"
        case patternContactPoint = "patternContactPoint"
        case patternDate = "patternDate"
        case patternDateTime = "patternDateTime"
        case patternDecimal = "patternDecimal"
        case patternHumanName = "patternHumanName"
        case patternId = "patternId"
        case patternIdentifier = "patternIdentifier"
        case patternInstant = "patternInstant"
        case patternInteger = "patternInteger"
        case patternMarkdown = "patternMarkdown"
        case patternMeta = "patternMeta"
        case patternOid = "patternOid"
        case patternPeriod = "patternPeriod"
        case patternPositiveInt = "patternPositiveInt"
        case patternQuantity = "patternQuantity"
        case patternRange = "patternRange"
        case patternRatio = "patternRatio"
        case patternReference = "patternReference"
        case patternSampledData = "patternSampledData"
        case patternSignature = "patternSignature"
        case patternString = "patternString"
        case patternTime = "patternTime"
        case patternTiming = "patternTiming"
        case patternUnsignedInt = "patternUnsignedInt"
        case patternUri = "patternUri"
        case representation = "representation"
        case requirements = "requirements"
        case short = "short"
        case slicing = "slicing"
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

        self.alias.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .alias) ?? [])
        self.base = try container.decodeIfPresent(ElementDefinitionBase.self, forKey: .base)
        self.binding = try container.decodeIfPresent(ElementDefinitionBinding.self, forKey: .binding)
        self.code.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .code) ?? [])
        self.comments = try container.decodeIfPresent(String.self, forKey: .comments)
        self.condition.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .condition) ?? [])
        self.constraint.append(objectsIn: try container.decodeIfPresent([ElementDefinitionConstraint].self, forKey: .constraint) ?? [])
        self.defaultValueAddress = try container.decodeIfPresent(Address.self, forKey: .defaultValueAddress)
        self.defaultValueAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .defaultValueAnnotation)
        self.defaultValueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .defaultValueAttachment)
        self.defaultValueBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .defaultValueBase64Binary)
        self.defaultValueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .defaultValueBoolean)
        self.defaultValueCode = try container.decodeIfPresent(String.self, forKey: .defaultValueCode)
        self.defaultValueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .defaultValueCodeableConcept)
        self.defaultValueCoding = try container.decodeIfPresent(Coding.self, forKey: .defaultValueCoding)
        self.defaultValueContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .defaultValueContactPoint)
        self.defaultValueDate = try container.decodeIfPresent(FHIRDate.self, forKey: .defaultValueDate)
        self.defaultValueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .defaultValueDateTime)
        self.defaultValueDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .defaultValueDecimal)
        self.defaultValueHumanName = try container.decodeIfPresent(HumanName.self, forKey: .defaultValueHumanName)
        self.defaultValueId = try container.decodeIfPresent(String.self, forKey: .defaultValueId)
        self.defaultValueIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .defaultValueIdentifier)
        self.defaultValueInstant = try container.decodeIfPresent(Instant.self, forKey: .defaultValueInstant)
        self.defaultValueInteger.value = try container.decodeIfPresent(Int.self, forKey: .defaultValueInteger)
        self.defaultValueMarkdown = try container.decodeIfPresent(String.self, forKey: .defaultValueMarkdown)
        self.defaultValueMeta = try container.decodeIfPresent(Meta.self, forKey: .defaultValueMeta)
        self.defaultValueOid = try container.decodeIfPresent(String.self, forKey: .defaultValueOid)
        self.defaultValuePeriod = try container.decodeIfPresent(Period.self, forKey: .defaultValuePeriod)
        self.defaultValuePositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .defaultValuePositiveInt)
        self.defaultValueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .defaultValueQuantity)
        self.defaultValueRange = try container.decodeIfPresent(Range.self, forKey: .defaultValueRange)
        self.defaultValueRatio = try container.decodeIfPresent(Ratio.self, forKey: .defaultValueRatio)
        self.defaultValueReference = try container.decodeIfPresent(Reference.self, forKey: .defaultValueReference)
        self.defaultValueSampledData = try container.decodeIfPresent(SampledData.self, forKey: .defaultValueSampledData)
        self.defaultValueSignature = try container.decodeIfPresent(Signature.self, forKey: .defaultValueSignature)
        self.defaultValueString = try container.decodeIfPresent(String.self, forKey: .defaultValueString)
        self.defaultValueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .defaultValueTime)
        self.defaultValueTiming = try container.decodeIfPresent(Timing.self, forKey: .defaultValueTiming)
        self.defaultValueUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .defaultValueUnsignedInt)
        self.defaultValueUri = try container.decodeIfPresent(String.self, forKey: .defaultValueUri)
        self.definition = try container.decodeIfPresent(String.self, forKey: .definition)
        self.exampleAddress = try container.decodeIfPresent(Address.self, forKey: .exampleAddress)
        self.exampleAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .exampleAnnotation)
        self.exampleAttachment = try container.decodeIfPresent(Attachment.self, forKey: .exampleAttachment)
        self.exampleBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .exampleBase64Binary)
        self.exampleBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .exampleBoolean)
        self.exampleCode = try container.decodeIfPresent(String.self, forKey: .exampleCode)
        self.exampleCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .exampleCodeableConcept)
        self.exampleCoding = try container.decodeIfPresent(Coding.self, forKey: .exampleCoding)
        self.exampleContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .exampleContactPoint)
        self.exampleDate = try container.decodeIfPresent(FHIRDate.self, forKey: .exampleDate)
        self.exampleDateTime = try container.decodeIfPresent(DateTime.self, forKey: .exampleDateTime)
        self.exampleDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .exampleDecimal)
        self.exampleHumanName = try container.decodeIfPresent(HumanName.self, forKey: .exampleHumanName)
        self.exampleId = try container.decodeIfPresent(String.self, forKey: .exampleId)
        self.exampleIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .exampleIdentifier)
        self.exampleInstant = try container.decodeIfPresent(Instant.self, forKey: .exampleInstant)
        self.exampleInteger.value = try container.decodeIfPresent(Int.self, forKey: .exampleInteger)
        self.exampleMarkdown = try container.decodeIfPresent(String.self, forKey: .exampleMarkdown)
        self.exampleMeta = try container.decodeIfPresent(Meta.self, forKey: .exampleMeta)
        self.exampleOid = try container.decodeIfPresent(String.self, forKey: .exampleOid)
        self.examplePeriod = try container.decodeIfPresent(Period.self, forKey: .examplePeriod)
        self.examplePositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .examplePositiveInt)
        self.exampleQuantity = try container.decodeIfPresent(Quantity.self, forKey: .exampleQuantity)
        self.exampleRange = try container.decodeIfPresent(Range.self, forKey: .exampleRange)
        self.exampleRatio = try container.decodeIfPresent(Ratio.self, forKey: .exampleRatio)
        self.exampleReference = try container.decodeIfPresent(Reference.self, forKey: .exampleReference)
        self.exampleSampledData = try container.decodeIfPresent(SampledData.self, forKey: .exampleSampledData)
        self.exampleSignature = try container.decodeIfPresent(Signature.self, forKey: .exampleSignature)
        self.exampleString = try container.decodeIfPresent(String.self, forKey: .exampleString)
        self.exampleTime = try container.decodeIfPresent(FHIRTime.self, forKey: .exampleTime)
        self.exampleTiming = try container.decodeIfPresent(Timing.self, forKey: .exampleTiming)
        self.exampleUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .exampleUnsignedInt)
        self.exampleUri = try container.decodeIfPresent(String.self, forKey: .exampleUri)
        self.fixedAddress = try container.decodeIfPresent(Address.self, forKey: .fixedAddress)
        self.fixedAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .fixedAnnotation)
        self.fixedAttachment = try container.decodeIfPresent(Attachment.self, forKey: .fixedAttachment)
        self.fixedBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .fixedBase64Binary)
        self.fixedBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .fixedBoolean)
        self.fixedCode = try container.decodeIfPresent(String.self, forKey: .fixedCode)
        self.fixedCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .fixedCodeableConcept)
        self.fixedCoding = try container.decodeIfPresent(Coding.self, forKey: .fixedCoding)
        self.fixedContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .fixedContactPoint)
        self.fixedDate = try container.decodeIfPresent(FHIRDate.self, forKey: .fixedDate)
        self.fixedDateTime = try container.decodeIfPresent(DateTime.self, forKey: .fixedDateTime)
        self.fixedDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .fixedDecimal)
        self.fixedHumanName = try container.decodeIfPresent(HumanName.self, forKey: .fixedHumanName)
        self.fixedId = try container.decodeIfPresent(String.self, forKey: .fixedId)
        self.fixedIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .fixedIdentifier)
        self.fixedInstant = try container.decodeIfPresent(Instant.self, forKey: .fixedInstant)
        self.fixedInteger.value = try container.decodeIfPresent(Int.self, forKey: .fixedInteger)
        self.fixedMarkdown = try container.decodeIfPresent(String.self, forKey: .fixedMarkdown)
        self.fixedMeta = try container.decodeIfPresent(Meta.self, forKey: .fixedMeta)
        self.fixedOid = try container.decodeIfPresent(String.self, forKey: .fixedOid)
        self.fixedPeriod = try container.decodeIfPresent(Period.self, forKey: .fixedPeriod)
        self.fixedPositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .fixedPositiveInt)
        self.fixedQuantity = try container.decodeIfPresent(Quantity.self, forKey: .fixedQuantity)
        self.fixedRange = try container.decodeIfPresent(Range.self, forKey: .fixedRange)
        self.fixedRatio = try container.decodeIfPresent(Ratio.self, forKey: .fixedRatio)
        self.fixedReference = try container.decodeIfPresent(Reference.self, forKey: .fixedReference)
        self.fixedSampledData = try container.decodeIfPresent(SampledData.self, forKey: .fixedSampledData)
        self.fixedSignature = try container.decodeIfPresent(Signature.self, forKey: .fixedSignature)
        self.fixedString = try container.decodeIfPresent(String.self, forKey: .fixedString)
        self.fixedTime = try container.decodeIfPresent(FHIRTime.self, forKey: .fixedTime)
        self.fixedTiming = try container.decodeIfPresent(Timing.self, forKey: .fixedTiming)
        self.fixedUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .fixedUnsignedInt)
        self.fixedUri = try container.decodeIfPresent(String.self, forKey: .fixedUri)
        self.isModifier.value = try container.decodeIfPresent(Bool.self, forKey: .isModifier)
        self.isSummary.value = try container.decodeIfPresent(Bool.self, forKey: .isSummary)
        self.label = try container.decodeIfPresent(String.self, forKey: .label)
        self.mapping.append(objectsIn: try container.decodeIfPresent([ElementDefinitionMapping].self, forKey: .mapping) ?? [])
        self.max = try container.decodeIfPresent(String.self, forKey: .max)
        self.maxLength.value = try container.decodeIfPresent(Int.self, forKey: .maxLength)
        self.maxValueAddress = try container.decodeIfPresent(Address.self, forKey: .maxValueAddress)
        self.maxValueAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .maxValueAnnotation)
        self.maxValueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .maxValueAttachment)
        self.maxValueBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .maxValueBase64Binary)
        self.maxValueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .maxValueBoolean)
        self.maxValueCode = try container.decodeIfPresent(String.self, forKey: .maxValueCode)
        self.maxValueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .maxValueCodeableConcept)
        self.maxValueCoding = try container.decodeIfPresent(Coding.self, forKey: .maxValueCoding)
        self.maxValueContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .maxValueContactPoint)
        self.maxValueDate = try container.decodeIfPresent(FHIRDate.self, forKey: .maxValueDate)
        self.maxValueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .maxValueDateTime)
        self.maxValueDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .maxValueDecimal)
        self.maxValueHumanName = try container.decodeIfPresent(HumanName.self, forKey: .maxValueHumanName)
        self.maxValueId = try container.decodeIfPresent(String.self, forKey: .maxValueId)
        self.maxValueIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .maxValueIdentifier)
        self.maxValueInstant = try container.decodeIfPresent(Instant.self, forKey: .maxValueInstant)
        self.maxValueInteger.value = try container.decodeIfPresent(Int.self, forKey: .maxValueInteger)
        self.maxValueMarkdown = try container.decodeIfPresent(String.self, forKey: .maxValueMarkdown)
        self.maxValueMeta = try container.decodeIfPresent(Meta.self, forKey: .maxValueMeta)
        self.maxValueOid = try container.decodeIfPresent(String.self, forKey: .maxValueOid)
        self.maxValuePeriod = try container.decodeIfPresent(Period.self, forKey: .maxValuePeriod)
        self.maxValuePositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .maxValuePositiveInt)
        self.maxValueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .maxValueQuantity)
        self.maxValueRange = try container.decodeIfPresent(Range.self, forKey: .maxValueRange)
        self.maxValueRatio = try container.decodeIfPresent(Ratio.self, forKey: .maxValueRatio)
        self.maxValueReference = try container.decodeIfPresent(Reference.self, forKey: .maxValueReference)
        self.maxValueSampledData = try container.decodeIfPresent(SampledData.self, forKey: .maxValueSampledData)
        self.maxValueSignature = try container.decodeIfPresent(Signature.self, forKey: .maxValueSignature)
        self.maxValueString = try container.decodeIfPresent(String.self, forKey: .maxValueString)
        self.maxValueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .maxValueTime)
        self.maxValueTiming = try container.decodeIfPresent(Timing.self, forKey: .maxValueTiming)
        self.maxValueUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .maxValueUnsignedInt)
        self.maxValueUri = try container.decodeIfPresent(String.self, forKey: .maxValueUri)
        self.meaningWhenMissing = try container.decodeIfPresent(String.self, forKey: .meaningWhenMissing)
        self.min.value = try container.decodeIfPresent(Int.self, forKey: .min)
        self.minValueAddress = try container.decodeIfPresent(Address.self, forKey: .minValueAddress)
        self.minValueAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .minValueAnnotation)
        self.minValueAttachment = try container.decodeIfPresent(Attachment.self, forKey: .minValueAttachment)
        self.minValueBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .minValueBase64Binary)
        self.minValueBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .minValueBoolean)
        self.minValueCode = try container.decodeIfPresent(String.self, forKey: .minValueCode)
        self.minValueCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .minValueCodeableConcept)
        self.minValueCoding = try container.decodeIfPresent(Coding.self, forKey: .minValueCoding)
        self.minValueContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .minValueContactPoint)
        self.minValueDate = try container.decodeIfPresent(FHIRDate.self, forKey: .minValueDate)
        self.minValueDateTime = try container.decodeIfPresent(DateTime.self, forKey: .minValueDateTime)
        self.minValueDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .minValueDecimal)
        self.minValueHumanName = try container.decodeIfPresent(HumanName.self, forKey: .minValueHumanName)
        self.minValueId = try container.decodeIfPresent(String.self, forKey: .minValueId)
        self.minValueIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .minValueIdentifier)
        self.minValueInstant = try container.decodeIfPresent(Instant.self, forKey: .minValueInstant)
        self.minValueInteger.value = try container.decodeIfPresent(Int.self, forKey: .minValueInteger)
        self.minValueMarkdown = try container.decodeIfPresent(String.self, forKey: .minValueMarkdown)
        self.minValueMeta = try container.decodeIfPresent(Meta.self, forKey: .minValueMeta)
        self.minValueOid = try container.decodeIfPresent(String.self, forKey: .minValueOid)
        self.minValuePeriod = try container.decodeIfPresent(Period.self, forKey: .minValuePeriod)
        self.minValuePositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .minValuePositiveInt)
        self.minValueQuantity = try container.decodeIfPresent(Quantity.self, forKey: .minValueQuantity)
        self.minValueRange = try container.decodeIfPresent(Range.self, forKey: .minValueRange)
        self.minValueRatio = try container.decodeIfPresent(Ratio.self, forKey: .minValueRatio)
        self.minValueReference = try container.decodeIfPresent(Reference.self, forKey: .minValueReference)
        self.minValueSampledData = try container.decodeIfPresent(SampledData.self, forKey: .minValueSampledData)
        self.minValueSignature = try container.decodeIfPresent(Signature.self, forKey: .minValueSignature)
        self.minValueString = try container.decodeIfPresent(String.self, forKey: .minValueString)
        self.minValueTime = try container.decodeIfPresent(FHIRTime.self, forKey: .minValueTime)
        self.minValueTiming = try container.decodeIfPresent(Timing.self, forKey: .minValueTiming)
        self.minValueUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .minValueUnsignedInt)
        self.minValueUri = try container.decodeIfPresent(String.self, forKey: .minValueUri)
        self.mustSupport.value = try container.decodeIfPresent(Bool.self, forKey: .mustSupport)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.nameReference = try container.decodeIfPresent(String.self, forKey: .nameReference)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
        self.patternAddress = try container.decodeIfPresent(Address.self, forKey: .patternAddress)
        self.patternAnnotation = try container.decodeIfPresent(Annotation.self, forKey: .patternAnnotation)
        self.patternAttachment = try container.decodeIfPresent(Attachment.self, forKey: .patternAttachment)
        self.patternBase64Binary = try container.decodeIfPresent(Base64Binary.self, forKey: .patternBase64Binary)
        self.patternBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .patternBoolean)
        self.patternCode = try container.decodeIfPresent(String.self, forKey: .patternCode)
        self.patternCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .patternCodeableConcept)
        self.patternCoding = try container.decodeIfPresent(Coding.self, forKey: .patternCoding)
        self.patternContactPoint = try container.decodeIfPresent(ContactPoint.self, forKey: .patternContactPoint)
        self.patternDate = try container.decodeIfPresent(FHIRDate.self, forKey: .patternDate)
        self.patternDateTime = try container.decodeIfPresent(DateTime.self, forKey: .patternDateTime)
        self.patternDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .patternDecimal)
        self.patternHumanName = try container.decodeIfPresent(HumanName.self, forKey: .patternHumanName)
        self.patternId = try container.decodeIfPresent(String.self, forKey: .patternId)
        self.patternIdentifier = try container.decodeIfPresent(Identifier.self, forKey: .patternIdentifier)
        self.patternInstant = try container.decodeIfPresent(Instant.self, forKey: .patternInstant)
        self.patternInteger.value = try container.decodeIfPresent(Int.self, forKey: .patternInteger)
        self.patternMarkdown = try container.decodeIfPresent(String.self, forKey: .patternMarkdown)
        self.patternMeta = try container.decodeIfPresent(Meta.self, forKey: .patternMeta)
        self.patternOid = try container.decodeIfPresent(String.self, forKey: .patternOid)
        self.patternPeriod = try container.decodeIfPresent(Period.self, forKey: .patternPeriod)
        self.patternPositiveInt.value = try container.decodeIfPresent(Int.self, forKey: .patternPositiveInt)
        self.patternQuantity = try container.decodeIfPresent(Quantity.self, forKey: .patternQuantity)
        self.patternRange = try container.decodeIfPresent(Range.self, forKey: .patternRange)
        self.patternRatio = try container.decodeIfPresent(Ratio.self, forKey: .patternRatio)
        self.patternReference = try container.decodeIfPresent(Reference.self, forKey: .patternReference)
        self.patternSampledData = try container.decodeIfPresent(SampledData.self, forKey: .patternSampledData)
        self.patternSignature = try container.decodeIfPresent(Signature.self, forKey: .patternSignature)
        self.patternString = try container.decodeIfPresent(String.self, forKey: .patternString)
        self.patternTime = try container.decodeIfPresent(FHIRTime.self, forKey: .patternTime)
        self.patternTiming = try container.decodeIfPresent(Timing.self, forKey: .patternTiming)
        self.patternUnsignedInt.value = try container.decodeIfPresent(Int.self, forKey: .patternUnsignedInt)
        self.patternUri = try container.decodeIfPresent(String.self, forKey: .patternUri)
        self.representation.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .representation) ?? [])
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.short = try container.decodeIfPresent(String.self, forKey: .short)
        self.slicing = try container.decodeIfPresent(ElementDefinitionSlicing.self, forKey: .slicing)
        self.type.append(objectsIn: try container.decodeIfPresent([ElementDefinitionType].self, forKey: .type) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.alias), forKey: .alias)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encodeIfPresent(self.binding, forKey: .binding)
        try container.encode(Array(self.code), forKey: .code)
        try container.encodeIfPresent(self.comments, forKey: .comments)
        try container.encode(Array(self.condition), forKey: .condition)
        try container.encode(Array(self.constraint), forKey: .constraint)
        try container.encodeIfPresent(self.defaultValueAddress, forKey: .defaultValueAddress)
        try container.encodeIfPresent(self.defaultValueAnnotation, forKey: .defaultValueAnnotation)
        try container.encodeIfPresent(self.defaultValueAttachment, forKey: .defaultValueAttachment)
        try container.encodeIfPresent(self.defaultValueBase64Binary, forKey: .defaultValueBase64Binary)
        try container.encodeIfPresent(self.defaultValueBoolean.value, forKey: .defaultValueBoolean)
        try container.encodeIfPresent(self.defaultValueCode, forKey: .defaultValueCode)
        try container.encodeIfPresent(self.defaultValueCodeableConcept, forKey: .defaultValueCodeableConcept)
        try container.encodeIfPresent(self.defaultValueCoding, forKey: .defaultValueCoding)
        try container.encodeIfPresent(self.defaultValueContactPoint, forKey: .defaultValueContactPoint)
        try container.encodeIfPresent(self.defaultValueDate, forKey: .defaultValueDate)
        try container.encodeIfPresent(self.defaultValueDateTime, forKey: .defaultValueDateTime)
        try container.encodeIfPresent(self.defaultValueDecimal, forKey: .defaultValueDecimal)
        try container.encodeIfPresent(self.defaultValueHumanName, forKey: .defaultValueHumanName)
        try container.encodeIfPresent(self.defaultValueId, forKey: .defaultValueId)
        try container.encodeIfPresent(self.defaultValueIdentifier, forKey: .defaultValueIdentifier)
        try container.encodeIfPresent(self.defaultValueInstant, forKey: .defaultValueInstant)
        try container.encodeIfPresent(self.defaultValueInteger.value, forKey: .defaultValueInteger)
        try container.encodeIfPresent(self.defaultValueMarkdown, forKey: .defaultValueMarkdown)
        try container.encodeIfPresent(self.defaultValueMeta, forKey: .defaultValueMeta)
        try container.encodeIfPresent(self.defaultValueOid, forKey: .defaultValueOid)
        try container.encodeIfPresent(self.defaultValuePeriod, forKey: .defaultValuePeriod)
        try container.encodeIfPresent(self.defaultValuePositiveInt.value, forKey: .defaultValuePositiveInt)
        try container.encodeIfPresent(self.defaultValueQuantity, forKey: .defaultValueQuantity)
        try container.encodeIfPresent(self.defaultValueRange, forKey: .defaultValueRange)
        try container.encodeIfPresent(self.defaultValueRatio, forKey: .defaultValueRatio)
        try container.encodeIfPresent(self.defaultValueReference, forKey: .defaultValueReference)
        try container.encodeIfPresent(self.defaultValueSampledData, forKey: .defaultValueSampledData)
        try container.encodeIfPresent(self.defaultValueSignature, forKey: .defaultValueSignature)
        try container.encodeIfPresent(self.defaultValueString, forKey: .defaultValueString)
        try container.encodeIfPresent(self.defaultValueTime, forKey: .defaultValueTime)
        try container.encodeIfPresent(self.defaultValueTiming, forKey: .defaultValueTiming)
        try container.encodeIfPresent(self.defaultValueUnsignedInt.value, forKey: .defaultValueUnsignedInt)
        try container.encodeIfPresent(self.defaultValueUri, forKey: .defaultValueUri)
        try container.encodeIfPresent(self.definition, forKey: .definition)
        try container.encodeIfPresent(self.exampleAddress, forKey: .exampleAddress)
        try container.encodeIfPresent(self.exampleAnnotation, forKey: .exampleAnnotation)
        try container.encodeIfPresent(self.exampleAttachment, forKey: .exampleAttachment)
        try container.encodeIfPresent(self.exampleBase64Binary, forKey: .exampleBase64Binary)
        try container.encodeIfPresent(self.exampleBoolean.value, forKey: .exampleBoolean)
        try container.encodeIfPresent(self.exampleCode, forKey: .exampleCode)
        try container.encodeIfPresent(self.exampleCodeableConcept, forKey: .exampleCodeableConcept)
        try container.encodeIfPresent(self.exampleCoding, forKey: .exampleCoding)
        try container.encodeIfPresent(self.exampleContactPoint, forKey: .exampleContactPoint)
        try container.encodeIfPresent(self.exampleDate, forKey: .exampleDate)
        try container.encodeIfPresent(self.exampleDateTime, forKey: .exampleDateTime)
        try container.encodeIfPresent(self.exampleDecimal, forKey: .exampleDecimal)
        try container.encodeIfPresent(self.exampleHumanName, forKey: .exampleHumanName)
        try container.encodeIfPresent(self.exampleId, forKey: .exampleId)
        try container.encodeIfPresent(self.exampleIdentifier, forKey: .exampleIdentifier)
        try container.encodeIfPresent(self.exampleInstant, forKey: .exampleInstant)
        try container.encodeIfPresent(self.exampleInteger.value, forKey: .exampleInteger)
        try container.encodeIfPresent(self.exampleMarkdown, forKey: .exampleMarkdown)
        try container.encodeIfPresent(self.exampleMeta, forKey: .exampleMeta)
        try container.encodeIfPresent(self.exampleOid, forKey: .exampleOid)
        try container.encodeIfPresent(self.examplePeriod, forKey: .examplePeriod)
        try container.encodeIfPresent(self.examplePositiveInt.value, forKey: .examplePositiveInt)
        try container.encodeIfPresent(self.exampleQuantity, forKey: .exampleQuantity)
        try container.encodeIfPresent(self.exampleRange, forKey: .exampleRange)
        try container.encodeIfPresent(self.exampleRatio, forKey: .exampleRatio)
        try container.encodeIfPresent(self.exampleReference, forKey: .exampleReference)
        try container.encodeIfPresent(self.exampleSampledData, forKey: .exampleSampledData)
        try container.encodeIfPresent(self.exampleSignature, forKey: .exampleSignature)
        try container.encodeIfPresent(self.exampleString, forKey: .exampleString)
        try container.encodeIfPresent(self.exampleTime, forKey: .exampleTime)
        try container.encodeIfPresent(self.exampleTiming, forKey: .exampleTiming)
        try container.encodeIfPresent(self.exampleUnsignedInt.value, forKey: .exampleUnsignedInt)
        try container.encodeIfPresent(self.exampleUri, forKey: .exampleUri)
        try container.encodeIfPresent(self.fixedAddress, forKey: .fixedAddress)
        try container.encodeIfPresent(self.fixedAnnotation, forKey: .fixedAnnotation)
        try container.encodeIfPresent(self.fixedAttachment, forKey: .fixedAttachment)
        try container.encodeIfPresent(self.fixedBase64Binary, forKey: .fixedBase64Binary)
        try container.encodeIfPresent(self.fixedBoolean.value, forKey: .fixedBoolean)
        try container.encodeIfPresent(self.fixedCode, forKey: .fixedCode)
        try container.encodeIfPresent(self.fixedCodeableConcept, forKey: .fixedCodeableConcept)
        try container.encodeIfPresent(self.fixedCoding, forKey: .fixedCoding)
        try container.encodeIfPresent(self.fixedContactPoint, forKey: .fixedContactPoint)
        try container.encodeIfPresent(self.fixedDate, forKey: .fixedDate)
        try container.encodeIfPresent(self.fixedDateTime, forKey: .fixedDateTime)
        try container.encodeIfPresent(self.fixedDecimal, forKey: .fixedDecimal)
        try container.encodeIfPresent(self.fixedHumanName, forKey: .fixedHumanName)
        try container.encodeIfPresent(self.fixedId, forKey: .fixedId)
        try container.encodeIfPresent(self.fixedIdentifier, forKey: .fixedIdentifier)
        try container.encodeIfPresent(self.fixedInstant, forKey: .fixedInstant)
        try container.encodeIfPresent(self.fixedInteger.value, forKey: .fixedInteger)
        try container.encodeIfPresent(self.fixedMarkdown, forKey: .fixedMarkdown)
        try container.encodeIfPresent(self.fixedMeta, forKey: .fixedMeta)
        try container.encodeIfPresent(self.fixedOid, forKey: .fixedOid)
        try container.encodeIfPresent(self.fixedPeriod, forKey: .fixedPeriod)
        try container.encodeIfPresent(self.fixedPositiveInt.value, forKey: .fixedPositiveInt)
        try container.encodeIfPresent(self.fixedQuantity, forKey: .fixedQuantity)
        try container.encodeIfPresent(self.fixedRange, forKey: .fixedRange)
        try container.encodeIfPresent(self.fixedRatio, forKey: .fixedRatio)
        try container.encodeIfPresent(self.fixedReference, forKey: .fixedReference)
        try container.encodeIfPresent(self.fixedSampledData, forKey: .fixedSampledData)
        try container.encodeIfPresent(self.fixedSignature, forKey: .fixedSignature)
        try container.encodeIfPresent(self.fixedString, forKey: .fixedString)
        try container.encodeIfPresent(self.fixedTime, forKey: .fixedTime)
        try container.encodeIfPresent(self.fixedTiming, forKey: .fixedTiming)
        try container.encodeIfPresent(self.fixedUnsignedInt.value, forKey: .fixedUnsignedInt)
        try container.encodeIfPresent(self.fixedUri, forKey: .fixedUri)
        try container.encodeIfPresent(self.isModifier.value, forKey: .isModifier)
        try container.encodeIfPresent(self.isSummary.value, forKey: .isSummary)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encode(Array(self.mapping), forKey: .mapping)
        try container.encodeIfPresent(self.max, forKey: .max)
        try container.encodeIfPresent(self.maxLength.value, forKey: .maxLength)
        try container.encodeIfPresent(self.maxValueAddress, forKey: .maxValueAddress)
        try container.encodeIfPresent(self.maxValueAnnotation, forKey: .maxValueAnnotation)
        try container.encodeIfPresent(self.maxValueAttachment, forKey: .maxValueAttachment)
        try container.encodeIfPresent(self.maxValueBase64Binary, forKey: .maxValueBase64Binary)
        try container.encodeIfPresent(self.maxValueBoolean.value, forKey: .maxValueBoolean)
        try container.encodeIfPresent(self.maxValueCode, forKey: .maxValueCode)
        try container.encodeIfPresent(self.maxValueCodeableConcept, forKey: .maxValueCodeableConcept)
        try container.encodeIfPresent(self.maxValueCoding, forKey: .maxValueCoding)
        try container.encodeIfPresent(self.maxValueContactPoint, forKey: .maxValueContactPoint)
        try container.encodeIfPresent(self.maxValueDate, forKey: .maxValueDate)
        try container.encodeIfPresent(self.maxValueDateTime, forKey: .maxValueDateTime)
        try container.encodeIfPresent(self.maxValueDecimal, forKey: .maxValueDecimal)
        try container.encodeIfPresent(self.maxValueHumanName, forKey: .maxValueHumanName)
        try container.encodeIfPresent(self.maxValueId, forKey: .maxValueId)
        try container.encodeIfPresent(self.maxValueIdentifier, forKey: .maxValueIdentifier)
        try container.encodeIfPresent(self.maxValueInstant, forKey: .maxValueInstant)
        try container.encodeIfPresent(self.maxValueInteger.value, forKey: .maxValueInteger)
        try container.encodeIfPresent(self.maxValueMarkdown, forKey: .maxValueMarkdown)
        try container.encodeIfPresent(self.maxValueMeta, forKey: .maxValueMeta)
        try container.encodeIfPresent(self.maxValueOid, forKey: .maxValueOid)
        try container.encodeIfPresent(self.maxValuePeriod, forKey: .maxValuePeriod)
        try container.encodeIfPresent(self.maxValuePositiveInt.value, forKey: .maxValuePositiveInt)
        try container.encodeIfPresent(self.maxValueQuantity, forKey: .maxValueQuantity)
        try container.encodeIfPresent(self.maxValueRange, forKey: .maxValueRange)
        try container.encodeIfPresent(self.maxValueRatio, forKey: .maxValueRatio)
        try container.encodeIfPresent(self.maxValueReference, forKey: .maxValueReference)
        try container.encodeIfPresent(self.maxValueSampledData, forKey: .maxValueSampledData)
        try container.encodeIfPresent(self.maxValueSignature, forKey: .maxValueSignature)
        try container.encodeIfPresent(self.maxValueString, forKey: .maxValueString)
        try container.encodeIfPresent(self.maxValueTime, forKey: .maxValueTime)
        try container.encodeIfPresent(self.maxValueTiming, forKey: .maxValueTiming)
        try container.encodeIfPresent(self.maxValueUnsignedInt.value, forKey: .maxValueUnsignedInt)
        try container.encodeIfPresent(self.maxValueUri, forKey: .maxValueUri)
        try container.encodeIfPresent(self.meaningWhenMissing, forKey: .meaningWhenMissing)
        try container.encodeIfPresent(self.min.value, forKey: .min)
        try container.encodeIfPresent(self.minValueAddress, forKey: .minValueAddress)
        try container.encodeIfPresent(self.minValueAnnotation, forKey: .minValueAnnotation)
        try container.encodeIfPresent(self.minValueAttachment, forKey: .minValueAttachment)
        try container.encodeIfPresent(self.minValueBase64Binary, forKey: .minValueBase64Binary)
        try container.encodeIfPresent(self.minValueBoolean.value, forKey: .minValueBoolean)
        try container.encodeIfPresent(self.minValueCode, forKey: .minValueCode)
        try container.encodeIfPresent(self.minValueCodeableConcept, forKey: .minValueCodeableConcept)
        try container.encodeIfPresent(self.minValueCoding, forKey: .minValueCoding)
        try container.encodeIfPresent(self.minValueContactPoint, forKey: .minValueContactPoint)
        try container.encodeIfPresent(self.minValueDate, forKey: .minValueDate)
        try container.encodeIfPresent(self.minValueDateTime, forKey: .minValueDateTime)
        try container.encodeIfPresent(self.minValueDecimal, forKey: .minValueDecimal)
        try container.encodeIfPresent(self.minValueHumanName, forKey: .minValueHumanName)
        try container.encodeIfPresent(self.minValueId, forKey: .minValueId)
        try container.encodeIfPresent(self.minValueIdentifier, forKey: .minValueIdentifier)
        try container.encodeIfPresent(self.minValueInstant, forKey: .minValueInstant)
        try container.encodeIfPresent(self.minValueInteger.value, forKey: .minValueInteger)
        try container.encodeIfPresent(self.minValueMarkdown, forKey: .minValueMarkdown)
        try container.encodeIfPresent(self.minValueMeta, forKey: .minValueMeta)
        try container.encodeIfPresent(self.minValueOid, forKey: .minValueOid)
        try container.encodeIfPresent(self.minValuePeriod, forKey: .minValuePeriod)
        try container.encodeIfPresent(self.minValuePositiveInt.value, forKey: .minValuePositiveInt)
        try container.encodeIfPresent(self.minValueQuantity, forKey: .minValueQuantity)
        try container.encodeIfPresent(self.minValueRange, forKey: .minValueRange)
        try container.encodeIfPresent(self.minValueRatio, forKey: .minValueRatio)
        try container.encodeIfPresent(self.minValueReference, forKey: .minValueReference)
        try container.encodeIfPresent(self.minValueSampledData, forKey: .minValueSampledData)
        try container.encodeIfPresent(self.minValueSignature, forKey: .minValueSignature)
        try container.encodeIfPresent(self.minValueString, forKey: .minValueString)
        try container.encodeIfPresent(self.minValueTime, forKey: .minValueTime)
        try container.encodeIfPresent(self.minValueTiming, forKey: .minValueTiming)
        try container.encodeIfPresent(self.minValueUnsignedInt.value, forKey: .minValueUnsignedInt)
        try container.encodeIfPresent(self.minValueUri, forKey: .minValueUri)
        try container.encodeIfPresent(self.mustSupport.value, forKey: .mustSupport)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.nameReference, forKey: .nameReference)
        try container.encodeIfPresent(self.path, forKey: .path)
        try container.encodeIfPresent(self.patternAddress, forKey: .patternAddress)
        try container.encodeIfPresent(self.patternAnnotation, forKey: .patternAnnotation)
        try container.encodeIfPresent(self.patternAttachment, forKey: .patternAttachment)
        try container.encodeIfPresent(self.patternBase64Binary, forKey: .patternBase64Binary)
        try container.encodeIfPresent(self.patternBoolean.value, forKey: .patternBoolean)
        try container.encodeIfPresent(self.patternCode, forKey: .patternCode)
        try container.encodeIfPresent(self.patternCodeableConcept, forKey: .patternCodeableConcept)
        try container.encodeIfPresent(self.patternCoding, forKey: .patternCoding)
        try container.encodeIfPresent(self.patternContactPoint, forKey: .patternContactPoint)
        try container.encodeIfPresent(self.patternDate, forKey: .patternDate)
        try container.encodeIfPresent(self.patternDateTime, forKey: .patternDateTime)
        try container.encodeIfPresent(self.patternDecimal, forKey: .patternDecimal)
        try container.encodeIfPresent(self.patternHumanName, forKey: .patternHumanName)
        try container.encodeIfPresent(self.patternId, forKey: .patternId)
        try container.encodeIfPresent(self.patternIdentifier, forKey: .patternIdentifier)
        try container.encodeIfPresent(self.patternInstant, forKey: .patternInstant)
        try container.encodeIfPresent(self.patternInteger.value, forKey: .patternInteger)
        try container.encodeIfPresent(self.patternMarkdown, forKey: .patternMarkdown)
        try container.encodeIfPresent(self.patternMeta, forKey: .patternMeta)
        try container.encodeIfPresent(self.patternOid, forKey: .patternOid)
        try container.encodeIfPresent(self.patternPeriod, forKey: .patternPeriod)
        try container.encodeIfPresent(self.patternPositiveInt.value, forKey: .patternPositiveInt)
        try container.encodeIfPresent(self.patternQuantity, forKey: .patternQuantity)
        try container.encodeIfPresent(self.patternRange, forKey: .patternRange)
        try container.encodeIfPresent(self.patternRatio, forKey: .patternRatio)
        try container.encodeIfPresent(self.patternReference, forKey: .patternReference)
        try container.encodeIfPresent(self.patternSampledData, forKey: .patternSampledData)
        try container.encodeIfPresent(self.patternSignature, forKey: .patternSignature)
        try container.encodeIfPresent(self.patternString, forKey: .patternString)
        try container.encodeIfPresent(self.patternTime, forKey: .patternTime)
        try container.encodeIfPresent(self.patternTiming, forKey: .patternTiming)
        try container.encodeIfPresent(self.patternUnsignedInt.value, forKey: .patternUnsignedInt)
        try container.encodeIfPresent(self.patternUri, forKey: .patternUri)
        try container.encode(Array(self.representation), forKey: .representation)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.short, forKey: .short)
        try container.encodeIfPresent(self.slicing, forKey: .slicing)
        try container.encode(Array(self.type), forKey: .type)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["alias"] {
				presentKeys.insert("alias")
				if let val = exist as? [String] {
					self.alias.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "alias", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["base"] {
				presentKeys.insert("base")
				if let val = exist as? FHIRJSON {
					upsert(base: ElementDefinitionBase(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "base", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["binding"] {
				presentKeys.insert("binding")
				if let val = exist as? FHIRJSON {
					upsert(binding: ElementDefinitionBinding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "binding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.code) }
						self.code.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["comments"] {
				presentKeys.insert("comments")
				if let val = exist as? String {
					self.comments = val
				}
				else {
					errors.append(FHIRJSONError(key: "comments", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["condition"] {
				presentKeys.insert("condition")
				if let val = exist as? [String] {
					self.condition.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "condition", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["constraint"] {
				presentKeys.insert("constraint")
				if let val = exist as? [FHIRJSON] {
					if let vals = ElementDefinitionConstraint.instantiate(fromArray: val, owner: self) as? [ElementDefinitionConstraint] {
						if let realm = self.realm { realm.delete(self.constraint) }
						self.constraint.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "constraint", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueAddress"] {
				presentKeys.insert("defaultValueAddress")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueAnnotation"] {
				presentKeys.insert("defaultValueAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueAttachment"] {
				presentKeys.insert("defaultValueAttachment")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueBase64Binary"] {
				presentKeys.insert("defaultValueBase64Binary")
				if let val = exist as? String {
					self.defaultValueBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueBase64Binary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueBoolean"] {
				presentKeys.insert("defaultValueBoolean")
				if let val = exist as? Bool {
					self.defaultValueBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueCode"] {
				presentKeys.insert("defaultValueCode")
				if let val = exist as? String {
					self.defaultValueCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueCodeableConcept"] {
				presentKeys.insert("defaultValueCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueCoding"] {
				presentKeys.insert("defaultValueCoding")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueContactPoint"] {
				presentKeys.insert("defaultValueContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueDate"] {
				presentKeys.insert("defaultValueDate")
				if let val = exist as? String {
					self.defaultValueDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueDateTime"] {
				presentKeys.insert("defaultValueDateTime")
				if let val = exist as? String {
					self.defaultValueDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueDecimal"] {
				presentKeys.insert("defaultValueDecimal")
				if let val = exist as? NSNumber {
					self.defaultValueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueHumanName"] {
				presentKeys.insert("defaultValueHumanName")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueId"] {
				presentKeys.insert("defaultValueId")
				if let val = exist as? String {
					self.defaultValueId = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueIdentifier"] {
				presentKeys.insert("defaultValueIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueInstant"] {
				presentKeys.insert("defaultValueInstant")
				if let val = exist as? String {
					self.defaultValueInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueInteger"] {
				presentKeys.insert("defaultValueInteger")
				if let val = exist as? Int {
					self.defaultValueInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueMarkdown"] {
				presentKeys.insert("defaultValueMarkdown")
				if let val = exist as? String {
					self.defaultValueMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueMeta"] {
				presentKeys.insert("defaultValueMeta")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueOid"] {
				presentKeys.insert("defaultValueOid")
				if let val = exist as? String {
					self.defaultValueOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValuePeriod"] {
				presentKeys.insert("defaultValuePeriod")
				if let val = exist as? FHIRJSON {
					upsert(defaultValuePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValuePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValuePositiveInt"] {
				presentKeys.insert("defaultValuePositiveInt")
				if let val = exist as? Int {
					self.defaultValuePositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValuePositiveInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueQuantity"] {
				presentKeys.insert("defaultValueQuantity")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueRange"] {
				presentKeys.insert("defaultValueRange")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueRatio"] {
				presentKeys.insert("defaultValueRatio")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueReference"] {
				presentKeys.insert("defaultValueReference")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueSampledData"] {
				presentKeys.insert("defaultValueSampledData")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueSignature"] {
				presentKeys.insert("defaultValueSignature")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueString"] {
				presentKeys.insert("defaultValueString")
				if let val = exist as? String {
					self.defaultValueString = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueTime"] {
				presentKeys.insert("defaultValueTime")
				if let val = exist as? String {
					self.defaultValueTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueTiming"] {
				presentKeys.insert("defaultValueTiming")
				if let val = exist as? FHIRJSON {
					upsert(defaultValueTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueUnsignedInt"] {
				presentKeys.insert("defaultValueUnsignedInt")
				if let val = exist as? Int {
					self.defaultValueUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["defaultValueUri"] {
				presentKeys.insert("defaultValueUri")
				if let val = exist as? String {
					self.defaultValueUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "defaultValueUri", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["definition"] {
				presentKeys.insert("definition")
				if let val = exist as? String {
					self.definition = val
				}
				else {
					errors.append(FHIRJSONError(key: "definition", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleAddress"] {
				presentKeys.insert("exampleAddress")
				if let val = exist as? FHIRJSON {
					upsert(exampleAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleAnnotation"] {
				presentKeys.insert("exampleAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(exampleAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleAttachment"] {
				presentKeys.insert("exampleAttachment")
				if let val = exist as? FHIRJSON {
					upsert(exampleAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleBase64Binary"] {
				presentKeys.insert("exampleBase64Binary")
				if let val = exist as? String {
					self.exampleBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "exampleBase64Binary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleBoolean"] {
				presentKeys.insert("exampleBoolean")
				if let val = exist as? Bool {
					self.exampleBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleCode"] {
				presentKeys.insert("exampleCode")
				if let val = exist as? String {
					self.exampleCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleCodeableConcept"] {
				presentKeys.insert("exampleCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(exampleCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleCoding"] {
				presentKeys.insert("exampleCoding")
				if let val = exist as? FHIRJSON {
					upsert(exampleCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleContactPoint"] {
				presentKeys.insert("exampleContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(exampleContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleDate"] {
				presentKeys.insert("exampleDate")
				if let val = exist as? String {
					self.exampleDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "exampleDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleDateTime"] {
				presentKeys.insert("exampleDateTime")
				if let val = exist as? String {
					self.exampleDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "exampleDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleDecimal"] {
				presentKeys.insert("exampleDecimal")
				if let val = exist as? NSNumber {
					self.exampleDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "exampleDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleHumanName"] {
				presentKeys.insert("exampleHumanName")
				if let val = exist as? FHIRJSON {
					upsert(exampleHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleId"] {
				presentKeys.insert("exampleId")
				if let val = exist as? String {
					self.exampleId = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleIdentifier"] {
				presentKeys.insert("exampleIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(exampleIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleInstant"] {
				presentKeys.insert("exampleInstant")
				if let val = exist as? String {
					self.exampleInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "exampleInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleInteger"] {
				presentKeys.insert("exampleInteger")
				if let val = exist as? Int {
					self.exampleInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleMarkdown"] {
				presentKeys.insert("exampleMarkdown")
				if let val = exist as? String {
					self.exampleMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleMeta"] {
				presentKeys.insert("exampleMeta")
				if let val = exist as? FHIRJSON {
					upsert(exampleMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleOid"] {
				presentKeys.insert("exampleOid")
				if let val = exist as? String {
					self.exampleOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["examplePeriod"] {
				presentKeys.insert("examplePeriod")
				if let val = exist as? FHIRJSON {
					upsert(examplePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "examplePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["examplePositiveInt"] {
				presentKeys.insert("examplePositiveInt")
				if let val = exist as? Int {
					self.examplePositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "examplePositiveInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleQuantity"] {
				presentKeys.insert("exampleQuantity")
				if let val = exist as? FHIRJSON {
					upsert(exampleQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleRange"] {
				presentKeys.insert("exampleRange")
				if let val = exist as? FHIRJSON {
					upsert(exampleRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleRatio"] {
				presentKeys.insert("exampleRatio")
				if let val = exist as? FHIRJSON {
					upsert(exampleRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleReference"] {
				presentKeys.insert("exampleReference")
				if let val = exist as? FHIRJSON {
					upsert(exampleReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleSampledData"] {
				presentKeys.insert("exampleSampledData")
				if let val = exist as? FHIRJSON {
					upsert(exampleSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleSignature"] {
				presentKeys.insert("exampleSignature")
				if let val = exist as? FHIRJSON {
					upsert(exampleSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleString"] {
				presentKeys.insert("exampleString")
				if let val = exist as? String {
					self.exampleString = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleTime"] {
				presentKeys.insert("exampleTime")
				if let val = exist as? String {
					self.exampleTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "exampleTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleTiming"] {
				presentKeys.insert("exampleTiming")
				if let val = exist as? FHIRJSON {
					upsert(exampleTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exampleTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleUnsignedInt"] {
				presentKeys.insert("exampleUnsignedInt")
				if let val = exist as? Int {
					self.exampleUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["exampleUri"] {
				presentKeys.insert("exampleUri")
				if let val = exist as? String {
					self.exampleUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "exampleUri", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedAddress"] {
				presentKeys.insert("fixedAddress")
				if let val = exist as? FHIRJSON {
					upsert(fixedAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedAnnotation"] {
				presentKeys.insert("fixedAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(fixedAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedAttachment"] {
				presentKeys.insert("fixedAttachment")
				if let val = exist as? FHIRJSON {
					upsert(fixedAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedBase64Binary"] {
				presentKeys.insert("fixedBase64Binary")
				if let val = exist as? String {
					self.fixedBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "fixedBase64Binary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedBoolean"] {
				presentKeys.insert("fixedBoolean")
				if let val = exist as? Bool {
					self.fixedBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedCode"] {
				presentKeys.insert("fixedCode")
				if let val = exist as? String {
					self.fixedCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedCodeableConcept"] {
				presentKeys.insert("fixedCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(fixedCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedCoding"] {
				presentKeys.insert("fixedCoding")
				if let val = exist as? FHIRJSON {
					upsert(fixedCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedContactPoint"] {
				presentKeys.insert("fixedContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(fixedContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedDate"] {
				presentKeys.insert("fixedDate")
				if let val = exist as? String {
					self.fixedDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "fixedDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedDateTime"] {
				presentKeys.insert("fixedDateTime")
				if let val = exist as? String {
					self.fixedDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "fixedDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedDecimal"] {
				presentKeys.insert("fixedDecimal")
				if let val = exist as? NSNumber {
					self.fixedDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "fixedDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedHumanName"] {
				presentKeys.insert("fixedHumanName")
				if let val = exist as? FHIRJSON {
					upsert(fixedHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedId"] {
				presentKeys.insert("fixedId")
				if let val = exist as? String {
					self.fixedId = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedIdentifier"] {
				presentKeys.insert("fixedIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(fixedIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedInstant"] {
				presentKeys.insert("fixedInstant")
				if let val = exist as? String {
					self.fixedInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "fixedInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedInteger"] {
				presentKeys.insert("fixedInteger")
				if let val = exist as? Int {
					self.fixedInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedMarkdown"] {
				presentKeys.insert("fixedMarkdown")
				if let val = exist as? String {
					self.fixedMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedMeta"] {
				presentKeys.insert("fixedMeta")
				if let val = exist as? FHIRJSON {
					upsert(fixedMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedOid"] {
				presentKeys.insert("fixedOid")
				if let val = exist as? String {
					self.fixedOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedPeriod"] {
				presentKeys.insert("fixedPeriod")
				if let val = exist as? FHIRJSON {
					upsert(fixedPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedPositiveInt"] {
				presentKeys.insert("fixedPositiveInt")
				if let val = exist as? Int {
					self.fixedPositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedPositiveInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedQuantity"] {
				presentKeys.insert("fixedQuantity")
				if let val = exist as? FHIRJSON {
					upsert(fixedQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedRange"] {
				presentKeys.insert("fixedRange")
				if let val = exist as? FHIRJSON {
					upsert(fixedRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedRatio"] {
				presentKeys.insert("fixedRatio")
				if let val = exist as? FHIRJSON {
					upsert(fixedRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedReference"] {
				presentKeys.insert("fixedReference")
				if let val = exist as? FHIRJSON {
					upsert(fixedReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedSampledData"] {
				presentKeys.insert("fixedSampledData")
				if let val = exist as? FHIRJSON {
					upsert(fixedSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedSignature"] {
				presentKeys.insert("fixedSignature")
				if let val = exist as? FHIRJSON {
					upsert(fixedSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedString"] {
				presentKeys.insert("fixedString")
				if let val = exist as? String {
					self.fixedString = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedTime"] {
				presentKeys.insert("fixedTime")
				if let val = exist as? String {
					self.fixedTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "fixedTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedTiming"] {
				presentKeys.insert("fixedTiming")
				if let val = exist as? FHIRJSON {
					upsert(fixedTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "fixedTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedUnsignedInt"] {
				presentKeys.insert("fixedUnsignedInt")
				if let val = exist as? Int {
					self.fixedUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["fixedUri"] {
				presentKeys.insert("fixedUri")
				if let val = exist as? String {
					self.fixedUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "fixedUri", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["isModifier"] {
				presentKeys.insert("isModifier")
				if let val = exist as? Bool {
					self.isModifier.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "isModifier", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["isSummary"] {
				presentKeys.insert("isSummary")
				if let val = exist as? Bool {
					self.isSummary.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "isSummary", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["label"] {
				presentKeys.insert("label")
				if let val = exist as? String {
					self.label = val
				}
				else {
					errors.append(FHIRJSONError(key: "label", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["mapping"] {
				presentKeys.insert("mapping")
				if let val = exist as? [FHIRJSON] {
					if let vals = ElementDefinitionMapping.instantiate(fromArray: val, owner: self) as? [ElementDefinitionMapping] {
						if let realm = self.realm { realm.delete(self.mapping) }
						self.mapping.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "mapping", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["max"] {
				presentKeys.insert("max")
				if let val = exist as? String {
					self.max = val
				}
				else {
					errors.append(FHIRJSONError(key: "max", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxLength"] {
				presentKeys.insert("maxLength")
				if let val = exist as? Int {
					self.maxLength.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxLength", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueAddress"] {
				presentKeys.insert("maxValueAddress")
				if let val = exist as? FHIRJSON {
					upsert(maxValueAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueAnnotation"] {
				presentKeys.insert("maxValueAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(maxValueAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueAttachment"] {
				presentKeys.insert("maxValueAttachment")
				if let val = exist as? FHIRJSON {
					upsert(maxValueAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueBase64Binary"] {
				presentKeys.insert("maxValueBase64Binary")
				if let val = exist as? String {
					self.maxValueBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueBase64Binary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueBoolean"] {
				presentKeys.insert("maxValueBoolean")
				if let val = exist as? Bool {
					self.maxValueBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueCode"] {
				presentKeys.insert("maxValueCode")
				if let val = exist as? String {
					self.maxValueCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueCodeableConcept"] {
				presentKeys.insert("maxValueCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(maxValueCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueCoding"] {
				presentKeys.insert("maxValueCoding")
				if let val = exist as? FHIRJSON {
					upsert(maxValueCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueContactPoint"] {
				presentKeys.insert("maxValueContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(maxValueContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueDate"] {
				presentKeys.insert("maxValueDate")
				if let val = exist as? String {
					self.maxValueDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueDateTime"] {
				presentKeys.insert("maxValueDateTime")
				if let val = exist as? String {
					self.maxValueDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueDecimal"] {
				presentKeys.insert("maxValueDecimal")
				if let val = exist as? NSNumber {
					self.maxValueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueHumanName"] {
				presentKeys.insert("maxValueHumanName")
				if let val = exist as? FHIRJSON {
					upsert(maxValueHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueId"] {
				presentKeys.insert("maxValueId")
				if let val = exist as? String {
					self.maxValueId = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueIdentifier"] {
				presentKeys.insert("maxValueIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(maxValueIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueInstant"] {
				presentKeys.insert("maxValueInstant")
				if let val = exist as? String {
					self.maxValueInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueInteger"] {
				presentKeys.insert("maxValueInteger")
				if let val = exist as? Int {
					self.maxValueInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueMarkdown"] {
				presentKeys.insert("maxValueMarkdown")
				if let val = exist as? String {
					self.maxValueMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueMeta"] {
				presentKeys.insert("maxValueMeta")
				if let val = exist as? FHIRJSON {
					upsert(maxValueMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueOid"] {
				presentKeys.insert("maxValueOid")
				if let val = exist as? String {
					self.maxValueOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValuePeriod"] {
				presentKeys.insert("maxValuePeriod")
				if let val = exist as? FHIRJSON {
					upsert(maxValuePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValuePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValuePositiveInt"] {
				presentKeys.insert("maxValuePositiveInt")
				if let val = exist as? Int {
					self.maxValuePositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValuePositiveInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueQuantity"] {
				presentKeys.insert("maxValueQuantity")
				if let val = exist as? FHIRJSON {
					upsert(maxValueQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueRange"] {
				presentKeys.insert("maxValueRange")
				if let val = exist as? FHIRJSON {
					upsert(maxValueRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueRatio"] {
				presentKeys.insert("maxValueRatio")
				if let val = exist as? FHIRJSON {
					upsert(maxValueRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueReference"] {
				presentKeys.insert("maxValueReference")
				if let val = exist as? FHIRJSON {
					upsert(maxValueReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueSampledData"] {
				presentKeys.insert("maxValueSampledData")
				if let val = exist as? FHIRJSON {
					upsert(maxValueSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueSignature"] {
				presentKeys.insert("maxValueSignature")
				if let val = exist as? FHIRJSON {
					upsert(maxValueSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueString"] {
				presentKeys.insert("maxValueString")
				if let val = exist as? String {
					self.maxValueString = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueTime"] {
				presentKeys.insert("maxValueTime")
				if let val = exist as? String {
					self.maxValueTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueTiming"] {
				presentKeys.insert("maxValueTiming")
				if let val = exist as? FHIRJSON {
					upsert(maxValueTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueUnsignedInt"] {
				presentKeys.insert("maxValueUnsignedInt")
				if let val = exist as? Int {
					self.maxValueUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["maxValueUri"] {
				presentKeys.insert("maxValueUri")
				if let val = exist as? String {
					self.maxValueUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "maxValueUri", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["meaningWhenMissing"] {
				presentKeys.insert("meaningWhenMissing")
				if let val = exist as? String {
					self.meaningWhenMissing = val
				}
				else {
					errors.append(FHIRJSONError(key: "meaningWhenMissing", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["min"] {
				presentKeys.insert("min")
				if let val = exist as? Int {
					self.min.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "min", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueAddress"] {
				presentKeys.insert("minValueAddress")
				if let val = exist as? FHIRJSON {
					upsert(minValueAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueAnnotation"] {
				presentKeys.insert("minValueAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(minValueAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueAttachment"] {
				presentKeys.insert("minValueAttachment")
				if let val = exist as? FHIRJSON {
					upsert(minValueAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueBase64Binary"] {
				presentKeys.insert("minValueBase64Binary")
				if let val = exist as? String {
					self.minValueBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "minValueBase64Binary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueBoolean"] {
				presentKeys.insert("minValueBoolean")
				if let val = exist as? Bool {
					self.minValueBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueCode"] {
				presentKeys.insert("minValueCode")
				if let val = exist as? String {
					self.minValueCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueCodeableConcept"] {
				presentKeys.insert("minValueCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(minValueCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueCoding"] {
				presentKeys.insert("minValueCoding")
				if let val = exist as? FHIRJSON {
					upsert(minValueCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueContactPoint"] {
				presentKeys.insert("minValueContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(minValueContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueDate"] {
				presentKeys.insert("minValueDate")
				if let val = exist as? String {
					self.minValueDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "minValueDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueDateTime"] {
				presentKeys.insert("minValueDateTime")
				if let val = exist as? String {
					self.minValueDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "minValueDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueDecimal"] {
				presentKeys.insert("minValueDecimal")
				if let val = exist as? NSNumber {
					self.minValueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "minValueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueHumanName"] {
				presentKeys.insert("minValueHumanName")
				if let val = exist as? FHIRJSON {
					upsert(minValueHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueId"] {
				presentKeys.insert("minValueId")
				if let val = exist as? String {
					self.minValueId = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueIdentifier"] {
				presentKeys.insert("minValueIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(minValueIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueInstant"] {
				presentKeys.insert("minValueInstant")
				if let val = exist as? String {
					self.minValueInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "minValueInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueInteger"] {
				presentKeys.insert("minValueInteger")
				if let val = exist as? Int {
					self.minValueInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueMarkdown"] {
				presentKeys.insert("minValueMarkdown")
				if let val = exist as? String {
					self.minValueMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueMeta"] {
				presentKeys.insert("minValueMeta")
				if let val = exist as? FHIRJSON {
					upsert(minValueMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueOid"] {
				presentKeys.insert("minValueOid")
				if let val = exist as? String {
					self.minValueOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValuePeriod"] {
				presentKeys.insert("minValuePeriod")
				if let val = exist as? FHIRJSON {
					upsert(minValuePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValuePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValuePositiveInt"] {
				presentKeys.insert("minValuePositiveInt")
				if let val = exist as? Int {
					self.minValuePositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValuePositiveInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueQuantity"] {
				presentKeys.insert("minValueQuantity")
				if let val = exist as? FHIRJSON {
					upsert(minValueQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueRange"] {
				presentKeys.insert("minValueRange")
				if let val = exist as? FHIRJSON {
					upsert(minValueRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueRatio"] {
				presentKeys.insert("minValueRatio")
				if let val = exist as? FHIRJSON {
					upsert(minValueRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueReference"] {
				presentKeys.insert("minValueReference")
				if let val = exist as? FHIRJSON {
					upsert(minValueReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueSampledData"] {
				presentKeys.insert("minValueSampledData")
				if let val = exist as? FHIRJSON {
					upsert(minValueSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueSignature"] {
				presentKeys.insert("minValueSignature")
				if let val = exist as? FHIRJSON {
					upsert(minValueSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueString"] {
				presentKeys.insert("minValueString")
				if let val = exist as? String {
					self.minValueString = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueTime"] {
				presentKeys.insert("minValueTime")
				if let val = exist as? String {
					self.minValueTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "minValueTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueTiming"] {
				presentKeys.insert("minValueTiming")
				if let val = exist as? FHIRJSON {
					upsert(minValueTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "minValueTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueUnsignedInt"] {
				presentKeys.insert("minValueUnsignedInt")
				if let val = exist as? Int {
					self.minValueUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["minValueUri"] {
				presentKeys.insert("minValueUri")
				if let val = exist as? String {
					self.minValueUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "minValueUri", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["mustSupport"] {
				presentKeys.insert("mustSupport")
				if let val = exist as? Bool {
					self.mustSupport.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "mustSupport", wants: Bool.self, has: type(of: exist)))
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
			if let exist = js["nameReference"] {
				presentKeys.insert("nameReference")
				if let val = exist as? String {
					self.nameReference = val
				}
				else {
					errors.append(FHIRJSONError(key: "nameReference", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["path"] {
				presentKeys.insert("path")
				if let val = exist as? String {
					self.path = val
				}
				else {
					errors.append(FHIRJSONError(key: "path", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "path"))
			}
			if let exist = js["patternAddress"] {
				presentKeys.insert("patternAddress")
				if let val = exist as? FHIRJSON {
					upsert(patternAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternAnnotation"] {
				presentKeys.insert("patternAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(patternAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternAttachment"] {
				presentKeys.insert("patternAttachment")
				if let val = exist as? FHIRJSON {
					upsert(patternAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternBase64Binary"] {
				presentKeys.insert("patternBase64Binary")
				if let val = exist as? String {
					self.patternBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "patternBase64Binary", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternBoolean"] {
				presentKeys.insert("patternBoolean")
				if let val = exist as? Bool {
					self.patternBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternCode"] {
				presentKeys.insert("patternCode")
				if let val = exist as? String {
					self.patternCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternCodeableConcept"] {
				presentKeys.insert("patternCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(patternCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternCoding"] {
				presentKeys.insert("patternCoding")
				if let val = exist as? FHIRJSON {
					upsert(patternCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternContactPoint"] {
				presentKeys.insert("patternContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(patternContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternDate"] {
				presentKeys.insert("patternDate")
				if let val = exist as? String {
					self.patternDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "patternDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternDateTime"] {
				presentKeys.insert("patternDateTime")
				if let val = exist as? String {
					self.patternDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "patternDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternDecimal"] {
				presentKeys.insert("patternDecimal")
				if let val = exist as? NSNumber {
					self.patternDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "patternDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternHumanName"] {
				presentKeys.insert("patternHumanName")
				if let val = exist as? FHIRJSON {
					upsert(patternHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternId"] {
				presentKeys.insert("patternId")
				if let val = exist as? String {
					self.patternId = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternIdentifier"] {
				presentKeys.insert("patternIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(patternIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternInstant"] {
				presentKeys.insert("patternInstant")
				if let val = exist as? String {
					self.patternInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "patternInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternInteger"] {
				presentKeys.insert("patternInteger")
				if let val = exist as? Int {
					self.patternInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternMarkdown"] {
				presentKeys.insert("patternMarkdown")
				if let val = exist as? String {
					self.patternMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternMeta"] {
				presentKeys.insert("patternMeta")
				if let val = exist as? FHIRJSON {
					upsert(patternMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternOid"] {
				presentKeys.insert("patternOid")
				if let val = exist as? String {
					self.patternOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternPeriod"] {
				presentKeys.insert("patternPeriod")
				if let val = exist as? FHIRJSON {
					upsert(patternPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternPositiveInt"] {
				presentKeys.insert("patternPositiveInt")
				if let val = exist as? Int {
					self.patternPositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternPositiveInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternQuantity"] {
				presentKeys.insert("patternQuantity")
				if let val = exist as? FHIRJSON {
					upsert(patternQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternRange"] {
				presentKeys.insert("patternRange")
				if let val = exist as? FHIRJSON {
					upsert(patternRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternRatio"] {
				presentKeys.insert("patternRatio")
				if let val = exist as? FHIRJSON {
					upsert(patternRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternReference"] {
				presentKeys.insert("patternReference")
				if let val = exist as? FHIRJSON {
					upsert(patternReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternSampledData"] {
				presentKeys.insert("patternSampledData")
				if let val = exist as? FHIRJSON {
					upsert(patternSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternSignature"] {
				presentKeys.insert("patternSignature")
				if let val = exist as? FHIRJSON {
					upsert(patternSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternString"] {
				presentKeys.insert("patternString")
				if let val = exist as? String {
					self.patternString = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternTime"] {
				presentKeys.insert("patternTime")
				if let val = exist as? String {
					self.patternTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "patternTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternTiming"] {
				presentKeys.insert("patternTiming")
				if let val = exist as? FHIRJSON {
					upsert(patternTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patternTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternUnsignedInt"] {
				presentKeys.insert("patternUnsignedInt")
				if let val = exist as? Int {
					self.patternUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["patternUri"] {
				presentKeys.insert("patternUri")
				if let val = exist as? String {
					self.patternUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "patternUri", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["representation"] {
				presentKeys.insert("representation")
				if let val = exist as? [String] {
					self.representation.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "representation", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["requirements"] {
				presentKeys.insert("requirements")
				if let val = exist as? String {
					self.requirements = val
				}
				else {
					errors.append(FHIRJSONError(key: "requirements", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["short"] {
				presentKeys.insert("short")
				if let val = exist as? String {
					self.short = val
				}
				else {
					errors.append(FHIRJSONError(key: "short", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["slicing"] {
				presentKeys.insert("slicing")
				if let val = exist as? FHIRJSON {
					upsert(slicing: ElementDefinitionSlicing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "slicing", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = ElementDefinitionType.instantiate(fromArray: val, owner: self) as? [ElementDefinitionType] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if alias.count > 0 {
			json["alias"] = Array(alias.map() { $0.value })
		}
		if let base = self.base {
			json["base"] = base.asJSON()
		}
		if let binding = self.binding {
			json["binding"] = binding.asJSON()
		}
		if code.count > 0 {
			json["code"] = Array(code.map() { $0.asJSON() })
		}
		if let comments = self.comments {
			json["comments"] = comments.asJSON()
		}
		if condition.count > 0 {
			json["condition"] = Array(condition.map() { $0.value })
		}
		if constraint.count > 0 {
			json["constraint"] = Array(constraint.map() { $0.asJSON() })
		}
		if let defaultValueAddress = self.defaultValueAddress {
			json["defaultValueAddress"] = defaultValueAddress.asJSON()
		}
		if let defaultValueAnnotation = self.defaultValueAnnotation {
			json["defaultValueAnnotation"] = defaultValueAnnotation.asJSON()
		}
		if let defaultValueAttachment = self.defaultValueAttachment {
			json["defaultValueAttachment"] = defaultValueAttachment.asJSON()
		}
		if let defaultValueBase64Binary = self.defaultValueBase64Binary {
			json["defaultValueBase64Binary"] = defaultValueBase64Binary.asJSON()
		}
		if let defaultValueBoolean = self.defaultValueBoolean.value {
			json["defaultValueBoolean"] = defaultValueBoolean.asJSON()
		}
		if let defaultValueCode = self.defaultValueCode {
			json["defaultValueCode"] = defaultValueCode.asJSON()
		}
		if let defaultValueCodeableConcept = self.defaultValueCodeableConcept {
			json["defaultValueCodeableConcept"] = defaultValueCodeableConcept.asJSON()
		}
		if let defaultValueCoding = self.defaultValueCoding {
			json["defaultValueCoding"] = defaultValueCoding.asJSON()
		}
		if let defaultValueContactPoint = self.defaultValueContactPoint {
			json["defaultValueContactPoint"] = defaultValueContactPoint.asJSON()
		}
		if let defaultValueDate = self.defaultValueDate {
			json["defaultValueDate"] = defaultValueDate.asJSON()
		}
		if let defaultValueDateTime = self.defaultValueDateTime {
			json["defaultValueDateTime"] = defaultValueDateTime.asJSON()
		}
		if let defaultValueDecimal = self.defaultValueDecimal {
			json["defaultValueDecimal"] = defaultValueDecimal.asJSON()
		}
		if let defaultValueHumanName = self.defaultValueHumanName {
			json["defaultValueHumanName"] = defaultValueHumanName.asJSON()
		}
		if let defaultValueId = self.defaultValueId {
			json["defaultValueId"] = defaultValueId.asJSON()
		}
		if let defaultValueIdentifier = self.defaultValueIdentifier {
			json["defaultValueIdentifier"] = defaultValueIdentifier.asJSON()
		}
		if let defaultValueInstant = self.defaultValueInstant {
			json["defaultValueInstant"] = defaultValueInstant.asJSON()
		}
		if let defaultValueInteger = self.defaultValueInteger.value {
			json["defaultValueInteger"] = defaultValueInteger.asJSON()
		}
		if let defaultValueMarkdown = self.defaultValueMarkdown {
			json["defaultValueMarkdown"] = defaultValueMarkdown.asJSON()
		}
		if let defaultValueMeta = self.defaultValueMeta {
			json["defaultValueMeta"] = defaultValueMeta.asJSON()
		}
		if let defaultValueOid = self.defaultValueOid {
			json["defaultValueOid"] = defaultValueOid.asJSON()
		}
		if let defaultValuePeriod = self.defaultValuePeriod {
			json["defaultValuePeriod"] = defaultValuePeriod.asJSON()
		}
		if let defaultValuePositiveInt = self.defaultValuePositiveInt.value {
			json["defaultValuePositiveInt"] = defaultValuePositiveInt.asJSON()
		}
		if let defaultValueQuantity = self.defaultValueQuantity {
			json["defaultValueQuantity"] = defaultValueQuantity.asJSON()
		}
		if let defaultValueRange = self.defaultValueRange {
			json["defaultValueRange"] = defaultValueRange.asJSON()
		}
		if let defaultValueRatio = self.defaultValueRatio {
			json["defaultValueRatio"] = defaultValueRatio.asJSON()
		}
		if let defaultValueReference = self.defaultValueReference {
			json["defaultValueReference"] = defaultValueReference.asJSON()
		}
		if let defaultValueSampledData = self.defaultValueSampledData {
			json["defaultValueSampledData"] = defaultValueSampledData.asJSON()
		}
		if let defaultValueSignature = self.defaultValueSignature {
			json["defaultValueSignature"] = defaultValueSignature.asJSON()
		}
		if let defaultValueString = self.defaultValueString {
			json["defaultValueString"] = defaultValueString.asJSON()
		}
		if let defaultValueTime = self.defaultValueTime {
			json["defaultValueTime"] = defaultValueTime.asJSON()
		}
		if let defaultValueTiming = self.defaultValueTiming {
			json["defaultValueTiming"] = defaultValueTiming.asJSON()
		}
		if let defaultValueUnsignedInt = self.defaultValueUnsignedInt.value {
			json["defaultValueUnsignedInt"] = defaultValueUnsignedInt.asJSON()
		}
		if let defaultValueUri = self.defaultValueUri {
			json["defaultValueUri"] = defaultValueUri.asJSON()
		}
		if let definition = self.definition {
			json["definition"] = definition.asJSON()
		}
		if let exampleAddress = self.exampleAddress {
			json["exampleAddress"] = exampleAddress.asJSON()
		}
		if let exampleAnnotation = self.exampleAnnotation {
			json["exampleAnnotation"] = exampleAnnotation.asJSON()
		}
		if let exampleAttachment = self.exampleAttachment {
			json["exampleAttachment"] = exampleAttachment.asJSON()
		}
		if let exampleBase64Binary = self.exampleBase64Binary {
			json["exampleBase64Binary"] = exampleBase64Binary.asJSON()
		}
		if let exampleBoolean = self.exampleBoolean.value {
			json["exampleBoolean"] = exampleBoolean.asJSON()
		}
		if let exampleCode = self.exampleCode {
			json["exampleCode"] = exampleCode.asJSON()
		}
		if let exampleCodeableConcept = self.exampleCodeableConcept {
			json["exampleCodeableConcept"] = exampleCodeableConcept.asJSON()
		}
		if let exampleCoding = self.exampleCoding {
			json["exampleCoding"] = exampleCoding.asJSON()
		}
		if let exampleContactPoint = self.exampleContactPoint {
			json["exampleContactPoint"] = exampleContactPoint.asJSON()
		}
		if let exampleDate = self.exampleDate {
			json["exampleDate"] = exampleDate.asJSON()
		}
		if let exampleDateTime = self.exampleDateTime {
			json["exampleDateTime"] = exampleDateTime.asJSON()
		}
		if let exampleDecimal = self.exampleDecimal {
			json["exampleDecimal"] = exampleDecimal.asJSON()
		}
		if let exampleHumanName = self.exampleHumanName {
			json["exampleHumanName"] = exampleHumanName.asJSON()
		}
		if let exampleId = self.exampleId {
			json["exampleId"] = exampleId.asJSON()
		}
		if let exampleIdentifier = self.exampleIdentifier {
			json["exampleIdentifier"] = exampleIdentifier.asJSON()
		}
		if let exampleInstant = self.exampleInstant {
			json["exampleInstant"] = exampleInstant.asJSON()
		}
		if let exampleInteger = self.exampleInteger.value {
			json["exampleInteger"] = exampleInteger.asJSON()
		}
		if let exampleMarkdown = self.exampleMarkdown {
			json["exampleMarkdown"] = exampleMarkdown.asJSON()
		}
		if let exampleMeta = self.exampleMeta {
			json["exampleMeta"] = exampleMeta.asJSON()
		}
		if let exampleOid = self.exampleOid {
			json["exampleOid"] = exampleOid.asJSON()
		}
		if let examplePeriod = self.examplePeriod {
			json["examplePeriod"] = examplePeriod.asJSON()
		}
		if let examplePositiveInt = self.examplePositiveInt.value {
			json["examplePositiveInt"] = examplePositiveInt.asJSON()
		}
		if let exampleQuantity = self.exampleQuantity {
			json["exampleQuantity"] = exampleQuantity.asJSON()
		}
		if let exampleRange = self.exampleRange {
			json["exampleRange"] = exampleRange.asJSON()
		}
		if let exampleRatio = self.exampleRatio {
			json["exampleRatio"] = exampleRatio.asJSON()
		}
		if let exampleReference = self.exampleReference {
			json["exampleReference"] = exampleReference.asJSON()
		}
		if let exampleSampledData = self.exampleSampledData {
			json["exampleSampledData"] = exampleSampledData.asJSON()
		}
		if let exampleSignature = self.exampleSignature {
			json["exampleSignature"] = exampleSignature.asJSON()
		}
		if let exampleString = self.exampleString {
			json["exampleString"] = exampleString.asJSON()
		}
		if let exampleTime = self.exampleTime {
			json["exampleTime"] = exampleTime.asJSON()
		}
		if let exampleTiming = self.exampleTiming {
			json["exampleTiming"] = exampleTiming.asJSON()
		}
		if let exampleUnsignedInt = self.exampleUnsignedInt.value {
			json["exampleUnsignedInt"] = exampleUnsignedInt.asJSON()
		}
		if let exampleUri = self.exampleUri {
			json["exampleUri"] = exampleUri.asJSON()
		}
		if let fixedAddress = self.fixedAddress {
			json["fixedAddress"] = fixedAddress.asJSON()
		}
		if let fixedAnnotation = self.fixedAnnotation {
			json["fixedAnnotation"] = fixedAnnotation.asJSON()
		}
		if let fixedAttachment = self.fixedAttachment {
			json["fixedAttachment"] = fixedAttachment.asJSON()
		}
		if let fixedBase64Binary = self.fixedBase64Binary {
			json["fixedBase64Binary"] = fixedBase64Binary.asJSON()
		}
		if let fixedBoolean = self.fixedBoolean.value {
			json["fixedBoolean"] = fixedBoolean.asJSON()
		}
		if let fixedCode = self.fixedCode {
			json["fixedCode"] = fixedCode.asJSON()
		}
		if let fixedCodeableConcept = self.fixedCodeableConcept {
			json["fixedCodeableConcept"] = fixedCodeableConcept.asJSON()
		}
		if let fixedCoding = self.fixedCoding {
			json["fixedCoding"] = fixedCoding.asJSON()
		}
		if let fixedContactPoint = self.fixedContactPoint {
			json["fixedContactPoint"] = fixedContactPoint.asJSON()
		}
		if let fixedDate = self.fixedDate {
			json["fixedDate"] = fixedDate.asJSON()
		}
		if let fixedDateTime = self.fixedDateTime {
			json["fixedDateTime"] = fixedDateTime.asJSON()
		}
		if let fixedDecimal = self.fixedDecimal {
			json["fixedDecimal"] = fixedDecimal.asJSON()
		}
		if let fixedHumanName = self.fixedHumanName {
			json["fixedHumanName"] = fixedHumanName.asJSON()
		}
		if let fixedId = self.fixedId {
			json["fixedId"] = fixedId.asJSON()
		}
		if let fixedIdentifier = self.fixedIdentifier {
			json["fixedIdentifier"] = fixedIdentifier.asJSON()
		}
		if let fixedInstant = self.fixedInstant {
			json["fixedInstant"] = fixedInstant.asJSON()
		}
		if let fixedInteger = self.fixedInteger.value {
			json["fixedInteger"] = fixedInteger.asJSON()
		}
		if let fixedMarkdown = self.fixedMarkdown {
			json["fixedMarkdown"] = fixedMarkdown.asJSON()
		}
		if let fixedMeta = self.fixedMeta {
			json["fixedMeta"] = fixedMeta.asJSON()
		}
		if let fixedOid = self.fixedOid {
			json["fixedOid"] = fixedOid.asJSON()
		}
		if let fixedPeriod = self.fixedPeriod {
			json["fixedPeriod"] = fixedPeriod.asJSON()
		}
		if let fixedPositiveInt = self.fixedPositiveInt.value {
			json["fixedPositiveInt"] = fixedPositiveInt.asJSON()
		}
		if let fixedQuantity = self.fixedQuantity {
			json["fixedQuantity"] = fixedQuantity.asJSON()
		}
		if let fixedRange = self.fixedRange {
			json["fixedRange"] = fixedRange.asJSON()
		}
		if let fixedRatio = self.fixedRatio {
			json["fixedRatio"] = fixedRatio.asJSON()
		}
		if let fixedReference = self.fixedReference {
			json["fixedReference"] = fixedReference.asJSON()
		}
		if let fixedSampledData = self.fixedSampledData {
			json["fixedSampledData"] = fixedSampledData.asJSON()
		}
		if let fixedSignature = self.fixedSignature {
			json["fixedSignature"] = fixedSignature.asJSON()
		}
		if let fixedString = self.fixedString {
			json["fixedString"] = fixedString.asJSON()
		}
		if let fixedTime = self.fixedTime {
			json["fixedTime"] = fixedTime.asJSON()
		}
		if let fixedTiming = self.fixedTiming {
			json["fixedTiming"] = fixedTiming.asJSON()
		}
		if let fixedUnsignedInt = self.fixedUnsignedInt.value {
			json["fixedUnsignedInt"] = fixedUnsignedInt.asJSON()
		}
		if let fixedUri = self.fixedUri {
			json["fixedUri"] = fixedUri.asJSON()
		}
		if let isModifier = self.isModifier.value {
			json["isModifier"] = isModifier.asJSON()
		}
		if let isSummary = self.isSummary.value {
			json["isSummary"] = isSummary.asJSON()
		}
		if let label = self.label {
			json["label"] = label.asJSON()
		}
		if mapping.count > 0 {
			json["mapping"] = Array(mapping.map() { $0.asJSON() })
		}
		if let max = self.max {
			json["max"] = max.asJSON()
		}
		if let maxLength = self.maxLength.value {
			json["maxLength"] = maxLength.asJSON()
		}
		if let maxValueAddress = self.maxValueAddress {
			json["maxValueAddress"] = maxValueAddress.asJSON()
		}
		if let maxValueAnnotation = self.maxValueAnnotation {
			json["maxValueAnnotation"] = maxValueAnnotation.asJSON()
		}
		if let maxValueAttachment = self.maxValueAttachment {
			json["maxValueAttachment"] = maxValueAttachment.asJSON()
		}
		if let maxValueBase64Binary = self.maxValueBase64Binary {
			json["maxValueBase64Binary"] = maxValueBase64Binary.asJSON()
		}
		if let maxValueBoolean = self.maxValueBoolean.value {
			json["maxValueBoolean"] = maxValueBoolean.asJSON()
		}
		if let maxValueCode = self.maxValueCode {
			json["maxValueCode"] = maxValueCode.asJSON()
		}
		if let maxValueCodeableConcept = self.maxValueCodeableConcept {
			json["maxValueCodeableConcept"] = maxValueCodeableConcept.asJSON()
		}
		if let maxValueCoding = self.maxValueCoding {
			json["maxValueCoding"] = maxValueCoding.asJSON()
		}
		if let maxValueContactPoint = self.maxValueContactPoint {
			json["maxValueContactPoint"] = maxValueContactPoint.asJSON()
		}
		if let maxValueDate = self.maxValueDate {
			json["maxValueDate"] = maxValueDate.asJSON()
		}
		if let maxValueDateTime = self.maxValueDateTime {
			json["maxValueDateTime"] = maxValueDateTime.asJSON()
		}
		if let maxValueDecimal = self.maxValueDecimal {
			json["maxValueDecimal"] = maxValueDecimal.asJSON()
		}
		if let maxValueHumanName = self.maxValueHumanName {
			json["maxValueHumanName"] = maxValueHumanName.asJSON()
		}
		if let maxValueId = self.maxValueId {
			json["maxValueId"] = maxValueId.asJSON()
		}
		if let maxValueIdentifier = self.maxValueIdentifier {
			json["maxValueIdentifier"] = maxValueIdentifier.asJSON()
		}
		if let maxValueInstant = self.maxValueInstant {
			json["maxValueInstant"] = maxValueInstant.asJSON()
		}
		if let maxValueInteger = self.maxValueInteger.value {
			json["maxValueInteger"] = maxValueInteger.asJSON()
		}
		if let maxValueMarkdown = self.maxValueMarkdown {
			json["maxValueMarkdown"] = maxValueMarkdown.asJSON()
		}
		if let maxValueMeta = self.maxValueMeta {
			json["maxValueMeta"] = maxValueMeta.asJSON()
		}
		if let maxValueOid = self.maxValueOid {
			json["maxValueOid"] = maxValueOid.asJSON()
		}
		if let maxValuePeriod = self.maxValuePeriod {
			json["maxValuePeriod"] = maxValuePeriod.asJSON()
		}
		if let maxValuePositiveInt = self.maxValuePositiveInt.value {
			json["maxValuePositiveInt"] = maxValuePositiveInt.asJSON()
		}
		if let maxValueQuantity = self.maxValueQuantity {
			json["maxValueQuantity"] = maxValueQuantity.asJSON()
		}
		if let maxValueRange = self.maxValueRange {
			json["maxValueRange"] = maxValueRange.asJSON()
		}
		if let maxValueRatio = self.maxValueRatio {
			json["maxValueRatio"] = maxValueRatio.asJSON()
		}
		if let maxValueReference = self.maxValueReference {
			json["maxValueReference"] = maxValueReference.asJSON()
		}
		if let maxValueSampledData = self.maxValueSampledData {
			json["maxValueSampledData"] = maxValueSampledData.asJSON()
		}
		if let maxValueSignature = self.maxValueSignature {
			json["maxValueSignature"] = maxValueSignature.asJSON()
		}
		if let maxValueString = self.maxValueString {
			json["maxValueString"] = maxValueString.asJSON()
		}
		if let maxValueTime = self.maxValueTime {
			json["maxValueTime"] = maxValueTime.asJSON()
		}
		if let maxValueTiming = self.maxValueTiming {
			json["maxValueTiming"] = maxValueTiming.asJSON()
		}
		if let maxValueUnsignedInt = self.maxValueUnsignedInt.value {
			json["maxValueUnsignedInt"] = maxValueUnsignedInt.asJSON()
		}
		if let maxValueUri = self.maxValueUri {
			json["maxValueUri"] = maxValueUri.asJSON()
		}
		if let meaningWhenMissing = self.meaningWhenMissing {
			json["meaningWhenMissing"] = meaningWhenMissing.asJSON()
		}
		if let min = self.min.value {
			json["min"] = min.asJSON()
		}
		if let minValueAddress = self.minValueAddress {
			json["minValueAddress"] = minValueAddress.asJSON()
		}
		if let minValueAnnotation = self.minValueAnnotation {
			json["minValueAnnotation"] = minValueAnnotation.asJSON()
		}
		if let minValueAttachment = self.minValueAttachment {
			json["minValueAttachment"] = minValueAttachment.asJSON()
		}
		if let minValueBase64Binary = self.minValueBase64Binary {
			json["minValueBase64Binary"] = minValueBase64Binary.asJSON()
		}
		if let minValueBoolean = self.minValueBoolean.value {
			json["minValueBoolean"] = minValueBoolean.asJSON()
		}
		if let minValueCode = self.minValueCode {
			json["minValueCode"] = minValueCode.asJSON()
		}
		if let minValueCodeableConcept = self.minValueCodeableConcept {
			json["minValueCodeableConcept"] = minValueCodeableConcept.asJSON()
		}
		if let minValueCoding = self.minValueCoding {
			json["minValueCoding"] = minValueCoding.asJSON()
		}
		if let minValueContactPoint = self.minValueContactPoint {
			json["minValueContactPoint"] = minValueContactPoint.asJSON()
		}
		if let minValueDate = self.minValueDate {
			json["minValueDate"] = minValueDate.asJSON()
		}
		if let minValueDateTime = self.minValueDateTime {
			json["minValueDateTime"] = minValueDateTime.asJSON()
		}
		if let minValueDecimal = self.minValueDecimal {
			json["minValueDecimal"] = minValueDecimal.asJSON()
		}
		if let minValueHumanName = self.minValueHumanName {
			json["minValueHumanName"] = minValueHumanName.asJSON()
		}
		if let minValueId = self.minValueId {
			json["minValueId"] = minValueId.asJSON()
		}
		if let minValueIdentifier = self.minValueIdentifier {
			json["minValueIdentifier"] = minValueIdentifier.asJSON()
		}
		if let minValueInstant = self.minValueInstant {
			json["minValueInstant"] = minValueInstant.asJSON()
		}
		if let minValueInteger = self.minValueInteger.value {
			json["minValueInteger"] = minValueInteger.asJSON()
		}
		if let minValueMarkdown = self.minValueMarkdown {
			json["minValueMarkdown"] = minValueMarkdown.asJSON()
		}
		if let minValueMeta = self.minValueMeta {
			json["minValueMeta"] = minValueMeta.asJSON()
		}
		if let minValueOid = self.minValueOid {
			json["minValueOid"] = minValueOid.asJSON()
		}
		if let minValuePeriod = self.minValuePeriod {
			json["minValuePeriod"] = minValuePeriod.asJSON()
		}
		if let minValuePositiveInt = self.minValuePositiveInt.value {
			json["minValuePositiveInt"] = minValuePositiveInt.asJSON()
		}
		if let minValueQuantity = self.minValueQuantity {
			json["minValueQuantity"] = minValueQuantity.asJSON()
		}
		if let minValueRange = self.minValueRange {
			json["minValueRange"] = minValueRange.asJSON()
		}
		if let minValueRatio = self.minValueRatio {
			json["minValueRatio"] = minValueRatio.asJSON()
		}
		if let minValueReference = self.minValueReference {
			json["minValueReference"] = minValueReference.asJSON()
		}
		if let minValueSampledData = self.minValueSampledData {
			json["minValueSampledData"] = minValueSampledData.asJSON()
		}
		if let minValueSignature = self.minValueSignature {
			json["minValueSignature"] = minValueSignature.asJSON()
		}
		if let minValueString = self.minValueString {
			json["minValueString"] = minValueString.asJSON()
		}
		if let minValueTime = self.minValueTime {
			json["minValueTime"] = minValueTime.asJSON()
		}
		if let minValueTiming = self.minValueTiming {
			json["minValueTiming"] = minValueTiming.asJSON()
		}
		if let minValueUnsignedInt = self.minValueUnsignedInt.value {
			json["minValueUnsignedInt"] = minValueUnsignedInt.asJSON()
		}
		if let minValueUri = self.minValueUri {
			json["minValueUri"] = minValueUri.asJSON()
		}
		if let mustSupport = self.mustSupport.value {
			json["mustSupport"] = mustSupport.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let nameReference = self.nameReference {
			json["nameReference"] = nameReference.asJSON()
		}
		if let path = self.path {
			json["path"] = path.asJSON()
		}
		if let patternAddress = self.patternAddress {
			json["patternAddress"] = patternAddress.asJSON()
		}
		if let patternAnnotation = self.patternAnnotation {
			json["patternAnnotation"] = patternAnnotation.asJSON()
		}
		if let patternAttachment = self.patternAttachment {
			json["patternAttachment"] = patternAttachment.asJSON()
		}
		if let patternBase64Binary = self.patternBase64Binary {
			json["patternBase64Binary"] = patternBase64Binary.asJSON()
		}
		if let patternBoolean = self.patternBoolean.value {
			json["patternBoolean"] = patternBoolean.asJSON()
		}
		if let patternCode = self.patternCode {
			json["patternCode"] = patternCode.asJSON()
		}
		if let patternCodeableConcept = self.patternCodeableConcept {
			json["patternCodeableConcept"] = patternCodeableConcept.asJSON()
		}
		if let patternCoding = self.patternCoding {
			json["patternCoding"] = patternCoding.asJSON()
		}
		if let patternContactPoint = self.patternContactPoint {
			json["patternContactPoint"] = patternContactPoint.asJSON()
		}
		if let patternDate = self.patternDate {
			json["patternDate"] = patternDate.asJSON()
		}
		if let patternDateTime = self.patternDateTime {
			json["patternDateTime"] = patternDateTime.asJSON()
		}
		if let patternDecimal = self.patternDecimal {
			json["patternDecimal"] = patternDecimal.asJSON()
		}
		if let patternHumanName = self.patternHumanName {
			json["patternHumanName"] = patternHumanName.asJSON()
		}
		if let patternId = self.patternId {
			json["patternId"] = patternId.asJSON()
		}
		if let patternIdentifier = self.patternIdentifier {
			json["patternIdentifier"] = patternIdentifier.asJSON()
		}
		if let patternInstant = self.patternInstant {
			json["patternInstant"] = patternInstant.asJSON()
		}
		if let patternInteger = self.patternInteger.value {
			json["patternInteger"] = patternInteger.asJSON()
		}
		if let patternMarkdown = self.patternMarkdown {
			json["patternMarkdown"] = patternMarkdown.asJSON()
		}
		if let patternMeta = self.patternMeta {
			json["patternMeta"] = patternMeta.asJSON()
		}
		if let patternOid = self.patternOid {
			json["patternOid"] = patternOid.asJSON()
		}
		if let patternPeriod = self.patternPeriod {
			json["patternPeriod"] = patternPeriod.asJSON()
		}
		if let patternPositiveInt = self.patternPositiveInt.value {
			json["patternPositiveInt"] = patternPositiveInt.asJSON()
		}
		if let patternQuantity = self.patternQuantity {
			json["patternQuantity"] = patternQuantity.asJSON()
		}
		if let patternRange = self.patternRange {
			json["patternRange"] = patternRange.asJSON()
		}
		if let patternRatio = self.patternRatio {
			json["patternRatio"] = patternRatio.asJSON()
		}
		if let patternReference = self.patternReference {
			json["patternReference"] = patternReference.asJSON()
		}
		if let patternSampledData = self.patternSampledData {
			json["patternSampledData"] = patternSampledData.asJSON()
		}
		if let patternSignature = self.patternSignature {
			json["patternSignature"] = patternSignature.asJSON()
		}
		if let patternString = self.patternString {
			json["patternString"] = patternString.asJSON()
		}
		if let patternTime = self.patternTime {
			json["patternTime"] = patternTime.asJSON()
		}
		if let patternTiming = self.patternTiming {
			json["patternTiming"] = patternTiming.asJSON()
		}
		if let patternUnsignedInt = self.patternUnsignedInt.value {
			json["patternUnsignedInt"] = patternUnsignedInt.asJSON()
		}
		if let patternUri = self.patternUri {
			json["patternUri"] = patternUri.asJSON()
		}
		if representation.count > 0 {
			json["representation"] = Array(representation.map() { $0.value })
		}
		if let requirements = self.requirements {
			json["requirements"] = requirements.asJSON()
		}
		if let short = self.short {
			json["short"] = short.asJSON()
		}
		if let slicing = self.slicing {
			json["slicing"] = slicing.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinition. Will return empty instance: \(error))")
		}
		return ElementDefinition.init()
	}
}


/**
 *  Base definition information for tools.
 *
 *  Information about the base definition of the element, provided to make it unncessary for tools to trace the
 *  deviation of the element through the derived and related profiles. This information is only provided where the
 *  element definition represents a constraint on another element definition, and must be present if there is a base
 *  element definition.
 */
open class ElementDefinitionBase: Element {
	override open class var resourceType: String {
		get { return "ElementDefinitionBase" }
	}

    @objc public dynamic var max: String?
    public let min = RealmOptional<Int>()
    @objc public dynamic var path: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(max: String, min: Int, path: String) {
        self.init()
        self.max = max
        self.min.value = min
        self.path = path
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case max = "max"
        case min = "min"
        case path = "path"
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

        self.max = try container.decodeIfPresent(String.self, forKey: .max)
        self.min.value = try container.decodeIfPresent(Int.self, forKey: .min)
        self.path = try container.decodeIfPresent(String.self, forKey: .path)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.max, forKey: .max)
        try container.encodeIfPresent(self.min.value, forKey: .min)
        try container.encodeIfPresent(self.path, forKey: .path)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["max"] {
				presentKeys.insert("max")
				if let val = exist as? String {
					self.max = val
				}
				else {
					errors.append(FHIRJSONError(key: "max", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "max"))
			}
			if let exist = js["min"] {
				presentKeys.insert("min")
				if let val = exist as? Int {
					self.min.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "min", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "min"))
			}
			if let exist = js["path"] {
				presentKeys.insert("path")
				if let val = exist as? String {
					self.path = val
				}
				else {
					errors.append(FHIRJSONError(key: "path", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "path"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let max = self.max {
			json["max"] = max.asJSON()
		}
		if let min = self.min.value {
			json["min"] = min.asJSON()
		}
		if let path = self.path {
			json["path"] = path.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinitionBase.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinitionBase. Will return empty instance: \(error))")
		}
		return ElementDefinitionBase.init()
	}
}


/**
 *  ValueSet details if this is coded.
 *
 *  Binds to a value set if this element is coded (code, Coding, CodeableConcept).
 */
open class ElementDefinitionBinding: Element {
	override open class var resourceType: String {
		get { return "ElementDefinitionBinding" }
	}

    @objc public dynamic var description_fhir: String?
    @objc public dynamic var strength: String?
    @objc public dynamic var valueSetReference: Reference?
    public func upsert(valueSetReference: Reference?) {
        upsert(prop: &self.valueSetReference, val: valueSetReference)
    }
    @objc public dynamic var valueSetUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(strength: String) {
        self.init()
        self.strength = strength
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case strength = "strength"
        case valueSetReference = "valueSetReference"
        case valueSetUri = "valueSetUri"
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

        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.strength = try container.decodeIfPresent(String.self, forKey: .strength)
        self.valueSetReference = try container.decodeIfPresent(Reference.self, forKey: .valueSetReference)
        self.valueSetUri = try container.decodeIfPresent(String.self, forKey: .valueSetUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.strength, forKey: .strength)
        try container.encodeIfPresent(self.valueSetReference, forKey: .valueSetReference)
        try container.encodeIfPresent(self.valueSetUri, forKey: .valueSetUri)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["strength"] {
				presentKeys.insert("strength")
				if let val = exist as? String {
					self.strength = val
				}
				else {
					errors.append(FHIRJSONError(key: "strength", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "strength"))
			}
			if let exist = js["valueSetReference"] {
				presentKeys.insert("valueSetReference")
				if let val = exist as? FHIRJSON {
					upsert(valueSetReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueSetReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueSetUri"] {
				presentKeys.insert("valueSetUri")
				if let val = exist as? String {
					self.valueSetUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueSetUri", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let strength = self.strength {
			json["strength"] = strength.asJSON()
		}
		if let valueSetReference = self.valueSetReference {
			json["valueSetReference"] = valueSetReference.asJSON()
		}
		if let valueSetUri = self.valueSetUri {
			json["valueSetUri"] = valueSetUri.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinitionBinding.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinitionBinding. Will return empty instance: \(error))")
		}
		return ElementDefinitionBinding.init()
	}
}


/**
 *  Condition that must evaluate to true.
 *
 *  Formal constraints such as co-occurrence and other constraints that can be computationally evaluated within the
 *  context of the instance.
 */
open class ElementDefinitionConstraint: Element {
	override open class var resourceType: String {
		get { return "ElementDefinitionConstraint" }
	}

    @objc public dynamic var human: String?
    @objc public dynamic var key: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var severity: String?
    @objc public dynamic var xpath: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(human: String, key: String, severity: String, xpath: String) {
        self.init()
        self.human = human
        self.key = key
        self.severity = severity
        self.xpath = xpath
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case human = "human"
        case key = "key"
        case requirements = "requirements"
        case severity = "severity"
        case xpath = "xpath"
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

        self.human = try container.decodeIfPresent(String.self, forKey: .human)
        self.key = try container.decodeIfPresent(String.self, forKey: .key)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
        self.xpath = try container.decodeIfPresent(String.self, forKey: .xpath)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.human, forKey: .human)
        try container.encodeIfPresent(self.key, forKey: .key)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.severity, forKey: .severity)
        try container.encodeIfPresent(self.xpath, forKey: .xpath)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["human"] {
				presentKeys.insert("human")
				if let val = exist as? String {
					self.human = val
				}
				else {
					errors.append(FHIRJSONError(key: "human", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "human"))
			}
			if let exist = js["key"] {
				presentKeys.insert("key")
				if let val = exist as? String {
					self.key = val
				}
				else {
					errors.append(FHIRJSONError(key: "key", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "key"))
			}
			if let exist = js["requirements"] {
				presentKeys.insert("requirements")
				if let val = exist as? String {
					self.requirements = val
				}
				else {
					errors.append(FHIRJSONError(key: "requirements", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["severity"] {
				presentKeys.insert("severity")
				if let val = exist as? String {
					self.severity = val
				}
				else {
					errors.append(FHIRJSONError(key: "severity", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "severity"))
			}
			if let exist = js["xpath"] {
				presentKeys.insert("xpath")
				if let val = exist as? String {
					self.xpath = val
				}
				else {
					errors.append(FHIRJSONError(key: "xpath", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "xpath"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let human = self.human {
			json["human"] = human.asJSON()
		}
		if let key = self.key {
			json["key"] = key.asJSON()
		}
		if let requirements = self.requirements {
			json["requirements"] = requirements.asJSON()
		}
		if let severity = self.severity {
			json["severity"] = severity.asJSON()
		}
		if let xpath = self.xpath {
			json["xpath"] = xpath.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinitionConstraint.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinitionConstraint. Will return empty instance: \(error))")
		}
		return ElementDefinitionConstraint.init()
	}
}


/**
 *  Map element to another set of definitions.
 *
 *  Identifies a concept from an external specification that roughly corresponds to this element.
 */
open class ElementDefinitionMapping: Element {
	override open class var resourceType: String {
		get { return "ElementDefinitionMapping" }
	}

    @objc public dynamic var identity: String?
    @objc public dynamic var language: String?
    @objc public dynamic var map: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identity: String, map: String) {
        self.init()
        self.identity = identity
        self.map = map
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case identity = "identity"
        case language = "language"
        case map = "map"
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

        self.identity = try container.decodeIfPresent(String.self, forKey: .identity)
        self.language = try container.decodeIfPresent(String.self, forKey: .language)
        self.map = try container.decodeIfPresent(String.self, forKey: .map)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.identity, forKey: .identity)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.map, forKey: .map)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["identity"] {
				presentKeys.insert("identity")
				if let val = exist as? String {
					self.identity = val
				}
				else {
					errors.append(FHIRJSONError(key: "identity", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identity"))
			}
			if let exist = js["language"] {
				presentKeys.insert("language")
				if let val = exist as? String {
					self.language = val
				}
				else {
					errors.append(FHIRJSONError(key: "language", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["map"] {
				presentKeys.insert("map")
				if let val = exist as? String {
					self.map = val
				}
				else {
					errors.append(FHIRJSONError(key: "map", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "map"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let identity = self.identity {
			json["identity"] = identity.asJSON()
		}
		if let language = self.language {
			json["language"] = language.asJSON()
		}
		if let map = self.map {
			json["map"] = map.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinitionMapping.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinitionMapping. Will return empty instance: \(error))")
		}
		return ElementDefinitionMapping.init()
	}
}


/**
 *  This element is sliced - slices follow.
 *
 *  Indicates that the element is sliced into a set of alternative definitions (i.e. in a structure definition, there
 *  are multiple different constraints on a single element in the base resource). Slicing can be used in any resource
 *  that has cardinality ..* on the base resource, or any resource with a choice of types. The set of slices is any
 *  elements that come after this in the element sequence that have the same path, until a shorter path occurs (the
 *  shorter path terminates the set).
 */
open class ElementDefinitionSlicing: Element {
	override open class var resourceType: String {
		get { return "ElementDefinitionSlicing" }
	}

    @objc public dynamic var description_fhir: String?
    public let discriminator = RealmSwift.List<RealmString>()
    public let ordered = RealmOptional<Bool>()
    @objc public dynamic var rules: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(rules: String) {
        self.init()
        self.rules = rules
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case description_fhir = "description"
        case discriminator = "discriminator"
        case ordered = "ordered"
        case rules = "rules"
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

        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.discriminator.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .discriminator) ?? [])
        self.ordered.value = try container.decodeIfPresent(Bool.self, forKey: .ordered)
        self.rules = try container.decodeIfPresent(String.self, forKey: .rules)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.discriminator), forKey: .discriminator)
        try container.encodeIfPresent(self.ordered.value, forKey: .ordered)
        try container.encodeIfPresent(self.rules, forKey: .rules)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["discriminator"] {
				presentKeys.insert("discriminator")
				if let val = exist as? [String] {
					self.discriminator.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "discriminator", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["ordered"] {
				presentKeys.insert("ordered")
				if let val = exist as? Bool {
					self.ordered.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "ordered", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["rules"] {
				presentKeys.insert("rules")
				if let val = exist as? String {
					self.rules = val
				}
				else {
					errors.append(FHIRJSONError(key: "rules", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "rules"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if discriminator.count > 0 {
			json["discriminator"] = Array(discriminator.map() { $0.value })
		}
		if let ordered = self.ordered.value {
			json["ordered"] = ordered.asJSON()
		}
		if let rules = self.rules {
			json["rules"] = rules.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinitionSlicing.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinitionSlicing. Will return empty instance: \(error))")
		}
		return ElementDefinitionSlicing.init()
	}
}


/**
 *  Data type and Profile for this element.
 *
 *  The data type or resource that the value of this element is permitted to be.
 */
open class ElementDefinitionType: Element {
	override open class var resourceType: String {
		get { return "ElementDefinitionType" }
	}

    public let aggregation = RealmSwift.List<RealmString>()
    @objc public dynamic var code: String?
    public let profile = RealmSwift.List<RealmString>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case aggregation = "aggregation"
        case code = "code"
        case profile = "profile"
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

        self.aggregation.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .aggregation) ?? [])
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.profile.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .profile) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.aggregation), forKey: .aggregation)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.profile), forKey: .profile)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["aggregation"] {
				presentKeys.insert("aggregation")
				if let val = exist as? [String] {
					self.aggregation.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "aggregation", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? String {
					self.code = val
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? [String] {
					self.profile.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: Array<String>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if aggregation.count > 0 {
			json["aggregation"] = Array(aggregation.map() { $0.value })
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if profile.count > 0 {
			json["profile"] = Array(profile.map() { $0.value })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ElementDefinitionType.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ElementDefinitionType. Will return empty instance: \(error))")
		}
		return ElementDefinitionType.init()
	}
}

