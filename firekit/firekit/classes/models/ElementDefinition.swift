//
//  ElementDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ElementDefinition) on 2017-09-18.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-18
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

