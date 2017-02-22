//
//  ElementDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ElementDefinition) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
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
    public dynamic var base: ElementDefinitionBase?        
    public func upsert(base: ElementDefinitionBase?) {
        upsert(prop: &self.base, val: base)
    }    
    public dynamic var binding: ElementDefinitionBinding?        
    public func upsert(binding: ElementDefinitionBinding?) {
        upsert(prop: &self.binding, val: binding)
    }    
    public let code = RealmSwift.List<Coding>()    
    public dynamic var comments: String?        
        
    public let condition = RealmSwift.List<RealmString>()    
    public let constraint = RealmSwift.List<ElementDefinitionConstraint>()    
    public dynamic var defaultValueAddress: Address?        
    public func upsert(defaultValueAddress: Address?) {
        upsert(prop: &self.defaultValueAddress, val: defaultValueAddress)
    }    
    public dynamic var defaultValueAnnotation: Annotation?        
    public func upsert(defaultValueAnnotation: Annotation?) {
        upsert(prop: &self.defaultValueAnnotation, val: defaultValueAnnotation)
    }    
    public dynamic var defaultValueAttachment: Attachment?        
    public func upsert(defaultValueAttachment: Attachment?) {
        upsert(prop: &self.defaultValueAttachment, val: defaultValueAttachment)
    }    
    public dynamic var defaultValueBase64Binary: Base64Binary?        
        
    public let defaultValueBoolean = RealmOptional<Bool>()    
    public dynamic var defaultValueCode: String?        
        
    public dynamic var defaultValueCodeableConcept: CodeableConcept?        
    public func upsert(defaultValueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.defaultValueCodeableConcept, val: defaultValueCodeableConcept)
    }    
    public dynamic var defaultValueCoding: Coding?        
    public func upsert(defaultValueCoding: Coding?) {
        upsert(prop: &self.defaultValueCoding, val: defaultValueCoding)
    }    
    public dynamic var defaultValueContactPoint: ContactPoint?        
    public func upsert(defaultValueContactPoint: ContactPoint?) {
        upsert(prop: &self.defaultValueContactPoint, val: defaultValueContactPoint)
    }    
    public dynamic var defaultValueDate: FHIRDate?        
        
    public dynamic var defaultValueDateTime: DateTime?        
        
    public dynamic var defaultValueDecimal: RealmDecimal?        
        
    public dynamic var defaultValueHumanName: HumanName?        
    public func upsert(defaultValueHumanName: HumanName?) {
        upsert(prop: &self.defaultValueHumanName, val: defaultValueHumanName)
    }    
    public dynamic var defaultValueId: String?        
        
    public dynamic var defaultValueIdentifier: Identifier?        
    public func upsert(defaultValueIdentifier: Identifier?) {
        upsert(prop: &self.defaultValueIdentifier, val: defaultValueIdentifier)
    }    
    public dynamic var defaultValueInstant: Instant?        
        
    public let defaultValueInteger = RealmOptional<Int>()    
    public dynamic var defaultValueMarkdown: String?        
        
    public dynamic var defaultValueMeta: Meta?        
    public func upsert(defaultValueMeta: Meta?) {
        upsert(prop: &self.defaultValueMeta, val: defaultValueMeta)
    }    
    public dynamic var defaultValueOid: String?        
        
    public dynamic var defaultValuePeriod: Period?        
    public func upsert(defaultValuePeriod: Period?) {
        upsert(prop: &self.defaultValuePeriod, val: defaultValuePeriod)
    }    
    public let defaultValuePositiveInt = RealmOptional<Int>()    
    public dynamic var defaultValueQuantity: Quantity?        
    public func upsert(defaultValueQuantity: Quantity?) {
        upsert(prop: &self.defaultValueQuantity, val: defaultValueQuantity)
    }    
    public dynamic var defaultValueRange: Range?        
    public func upsert(defaultValueRange: Range?) {
        upsert(prop: &self.defaultValueRange, val: defaultValueRange)
    }    
    public dynamic var defaultValueRatio: Ratio?        
    public func upsert(defaultValueRatio: Ratio?) {
        upsert(prop: &self.defaultValueRatio, val: defaultValueRatio)
    }    
    public dynamic var defaultValueReference: Reference?        
    public func upsert(defaultValueReference: Reference?) {
        upsert(prop: &self.defaultValueReference, val: defaultValueReference)
    }    
    public dynamic var defaultValueSampledData: SampledData?        
    public func upsert(defaultValueSampledData: SampledData?) {
        upsert(prop: &self.defaultValueSampledData, val: defaultValueSampledData)
    }    
    public dynamic var defaultValueSignature: Signature?        
    public func upsert(defaultValueSignature: Signature?) {
        upsert(prop: &self.defaultValueSignature, val: defaultValueSignature)
    }    
    public dynamic var defaultValueString: String?        
        
    public dynamic var defaultValueTime: FHIRTime?        
        
    public dynamic var defaultValueTiming: Timing?        
    public func upsert(defaultValueTiming: Timing?) {
        upsert(prop: &self.defaultValueTiming, val: defaultValueTiming)
    }    
    public let defaultValueUnsignedInt = RealmOptional<Int>()    
    public dynamic var defaultValueUri: String?        
        
    public dynamic var definition: String?        
        
    public dynamic var exampleAddress: Address?        
    public func upsert(exampleAddress: Address?) {
        upsert(prop: &self.exampleAddress, val: exampleAddress)
    }    
    public dynamic var exampleAnnotation: Annotation?        
    public func upsert(exampleAnnotation: Annotation?) {
        upsert(prop: &self.exampleAnnotation, val: exampleAnnotation)
    }    
    public dynamic var exampleAttachment: Attachment?        
    public func upsert(exampleAttachment: Attachment?) {
        upsert(prop: &self.exampleAttachment, val: exampleAttachment)
    }    
    public dynamic var exampleBase64Binary: Base64Binary?        
        
    public let exampleBoolean = RealmOptional<Bool>()    
    public dynamic var exampleCode: String?        
        
    public dynamic var exampleCodeableConcept: CodeableConcept?        
    public func upsert(exampleCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.exampleCodeableConcept, val: exampleCodeableConcept)
    }    
    public dynamic var exampleCoding: Coding?        
    public func upsert(exampleCoding: Coding?) {
        upsert(prop: &self.exampleCoding, val: exampleCoding)
    }    
    public dynamic var exampleContactPoint: ContactPoint?        
    public func upsert(exampleContactPoint: ContactPoint?) {
        upsert(prop: &self.exampleContactPoint, val: exampleContactPoint)
    }    
    public dynamic var exampleDate: FHIRDate?        
        
    public dynamic var exampleDateTime: DateTime?        
        
    public dynamic var exampleDecimal: RealmDecimal?        
        
    public dynamic var exampleHumanName: HumanName?        
    public func upsert(exampleHumanName: HumanName?) {
        upsert(prop: &self.exampleHumanName, val: exampleHumanName)
    }    
    public dynamic var exampleId: String?        
        
    public dynamic var exampleIdentifier: Identifier?        
    public func upsert(exampleIdentifier: Identifier?) {
        upsert(prop: &self.exampleIdentifier, val: exampleIdentifier)
    }    
    public dynamic var exampleInstant: Instant?        
        
    public let exampleInteger = RealmOptional<Int>()    
    public dynamic var exampleMarkdown: String?        
        
    public dynamic var exampleMeta: Meta?        
    public func upsert(exampleMeta: Meta?) {
        upsert(prop: &self.exampleMeta, val: exampleMeta)
    }    
    public dynamic var exampleOid: String?        
        
    public dynamic var examplePeriod: Period?        
    public func upsert(examplePeriod: Period?) {
        upsert(prop: &self.examplePeriod, val: examplePeriod)
    }    
    public let examplePositiveInt = RealmOptional<Int>()    
    public dynamic var exampleQuantity: Quantity?        
    public func upsert(exampleQuantity: Quantity?) {
        upsert(prop: &self.exampleQuantity, val: exampleQuantity)
    }    
    public dynamic var exampleRange: Range?        
    public func upsert(exampleRange: Range?) {
        upsert(prop: &self.exampleRange, val: exampleRange)
    }    
    public dynamic var exampleRatio: Ratio?        
    public func upsert(exampleRatio: Ratio?) {
        upsert(prop: &self.exampleRatio, val: exampleRatio)
    }    
    public dynamic var exampleReference: Reference?        
    public func upsert(exampleReference: Reference?) {
        upsert(prop: &self.exampleReference, val: exampleReference)
    }    
    public dynamic var exampleSampledData: SampledData?        
    public func upsert(exampleSampledData: SampledData?) {
        upsert(prop: &self.exampleSampledData, val: exampleSampledData)
    }    
    public dynamic var exampleSignature: Signature?        
    public func upsert(exampleSignature: Signature?) {
        upsert(prop: &self.exampleSignature, val: exampleSignature)
    }    
    public dynamic var exampleString: String?        
        
    public dynamic var exampleTime: FHIRTime?        
        
    public dynamic var exampleTiming: Timing?        
    public func upsert(exampleTiming: Timing?) {
        upsert(prop: &self.exampleTiming, val: exampleTiming)
    }    
    public let exampleUnsignedInt = RealmOptional<Int>()    
    public dynamic var exampleUri: String?        
        
    public dynamic var fixedAddress: Address?        
    public func upsert(fixedAddress: Address?) {
        upsert(prop: &self.fixedAddress, val: fixedAddress)
    }    
    public dynamic var fixedAnnotation: Annotation?        
    public func upsert(fixedAnnotation: Annotation?) {
        upsert(prop: &self.fixedAnnotation, val: fixedAnnotation)
    }    
    public dynamic var fixedAttachment: Attachment?        
    public func upsert(fixedAttachment: Attachment?) {
        upsert(prop: &self.fixedAttachment, val: fixedAttachment)
    }    
    public dynamic var fixedBase64Binary: Base64Binary?        
        
    public let fixedBoolean = RealmOptional<Bool>()    
    public dynamic var fixedCode: String?        
        
    public dynamic var fixedCodeableConcept: CodeableConcept?        
    public func upsert(fixedCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.fixedCodeableConcept, val: fixedCodeableConcept)
    }    
    public dynamic var fixedCoding: Coding?        
    public func upsert(fixedCoding: Coding?) {
        upsert(prop: &self.fixedCoding, val: fixedCoding)
    }    
    public dynamic var fixedContactPoint: ContactPoint?        
    public func upsert(fixedContactPoint: ContactPoint?) {
        upsert(prop: &self.fixedContactPoint, val: fixedContactPoint)
    }    
    public dynamic var fixedDate: FHIRDate?        
        
    public dynamic var fixedDateTime: DateTime?        
        
    public dynamic var fixedDecimal: RealmDecimal?        
        
    public dynamic var fixedHumanName: HumanName?        
    public func upsert(fixedHumanName: HumanName?) {
        upsert(prop: &self.fixedHumanName, val: fixedHumanName)
    }    
    public dynamic var fixedId: String?        
        
    public dynamic var fixedIdentifier: Identifier?        
    public func upsert(fixedIdentifier: Identifier?) {
        upsert(prop: &self.fixedIdentifier, val: fixedIdentifier)
    }    
    public dynamic var fixedInstant: Instant?        
        
    public let fixedInteger = RealmOptional<Int>()    
    public dynamic var fixedMarkdown: String?        
        
    public dynamic var fixedMeta: Meta?        
    public func upsert(fixedMeta: Meta?) {
        upsert(prop: &self.fixedMeta, val: fixedMeta)
    }    
    public dynamic var fixedOid: String?        
        
    public dynamic var fixedPeriod: Period?        
    public func upsert(fixedPeriod: Period?) {
        upsert(prop: &self.fixedPeriod, val: fixedPeriod)
    }    
    public let fixedPositiveInt = RealmOptional<Int>()    
    public dynamic var fixedQuantity: Quantity?        
    public func upsert(fixedQuantity: Quantity?) {
        upsert(prop: &self.fixedQuantity, val: fixedQuantity)
    }    
    public dynamic var fixedRange: Range?        
    public func upsert(fixedRange: Range?) {
        upsert(prop: &self.fixedRange, val: fixedRange)
    }    
    public dynamic var fixedRatio: Ratio?        
    public func upsert(fixedRatio: Ratio?) {
        upsert(prop: &self.fixedRatio, val: fixedRatio)
    }    
    public dynamic var fixedReference: Reference?        
    public func upsert(fixedReference: Reference?) {
        upsert(prop: &self.fixedReference, val: fixedReference)
    }    
    public dynamic var fixedSampledData: SampledData?        
    public func upsert(fixedSampledData: SampledData?) {
        upsert(prop: &self.fixedSampledData, val: fixedSampledData)
    }    
    public dynamic var fixedSignature: Signature?        
    public func upsert(fixedSignature: Signature?) {
        upsert(prop: &self.fixedSignature, val: fixedSignature)
    }    
    public dynamic var fixedString: String?        
        
    public dynamic var fixedTime: FHIRTime?        
        
    public dynamic var fixedTiming: Timing?        
    public func upsert(fixedTiming: Timing?) {
        upsert(prop: &self.fixedTiming, val: fixedTiming)
    }    
    public let fixedUnsignedInt = RealmOptional<Int>()    
    public dynamic var fixedUri: String?        
        
    public let isModifier = RealmOptional<Bool>()    
    public let isSummary = RealmOptional<Bool>()    
    public dynamic var label: String?        
        
    public let mapping = RealmSwift.List<ElementDefinitionMapping>()    
    public dynamic var max: String?        
        
    public let maxLength = RealmOptional<Int>()    
    public dynamic var maxValueAddress: Address?        
    public func upsert(maxValueAddress: Address?) {
        upsert(prop: &self.maxValueAddress, val: maxValueAddress)
    }    
    public dynamic var maxValueAnnotation: Annotation?        
    public func upsert(maxValueAnnotation: Annotation?) {
        upsert(prop: &self.maxValueAnnotation, val: maxValueAnnotation)
    }    
    public dynamic var maxValueAttachment: Attachment?        
    public func upsert(maxValueAttachment: Attachment?) {
        upsert(prop: &self.maxValueAttachment, val: maxValueAttachment)
    }    
    public dynamic var maxValueBase64Binary: Base64Binary?        
        
    public let maxValueBoolean = RealmOptional<Bool>()    
    public dynamic var maxValueCode: String?        
        
    public dynamic var maxValueCodeableConcept: CodeableConcept?        
    public func upsert(maxValueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.maxValueCodeableConcept, val: maxValueCodeableConcept)
    }    
    public dynamic var maxValueCoding: Coding?        
    public func upsert(maxValueCoding: Coding?) {
        upsert(prop: &self.maxValueCoding, val: maxValueCoding)
    }    
    public dynamic var maxValueContactPoint: ContactPoint?        
    public func upsert(maxValueContactPoint: ContactPoint?) {
        upsert(prop: &self.maxValueContactPoint, val: maxValueContactPoint)
    }    
    public dynamic var maxValueDate: FHIRDate?        
        
    public dynamic var maxValueDateTime: DateTime?        
        
    public dynamic var maxValueDecimal: RealmDecimal?        
        
    public dynamic var maxValueHumanName: HumanName?        
    public func upsert(maxValueHumanName: HumanName?) {
        upsert(prop: &self.maxValueHumanName, val: maxValueHumanName)
    }    
    public dynamic var maxValueId: String?        
        
    public dynamic var maxValueIdentifier: Identifier?        
    public func upsert(maxValueIdentifier: Identifier?) {
        upsert(prop: &self.maxValueIdentifier, val: maxValueIdentifier)
    }    
    public dynamic var maxValueInstant: Instant?        
        
    public let maxValueInteger = RealmOptional<Int>()    
    public dynamic var maxValueMarkdown: String?        
        
    public dynamic var maxValueMeta: Meta?        
    public func upsert(maxValueMeta: Meta?) {
        upsert(prop: &self.maxValueMeta, val: maxValueMeta)
    }    
    public dynamic var maxValueOid: String?        
        
    public dynamic var maxValuePeriod: Period?        
    public func upsert(maxValuePeriod: Period?) {
        upsert(prop: &self.maxValuePeriod, val: maxValuePeriod)
    }    
    public let maxValuePositiveInt = RealmOptional<Int>()    
    public dynamic var maxValueQuantity: Quantity?        
    public func upsert(maxValueQuantity: Quantity?) {
        upsert(prop: &self.maxValueQuantity, val: maxValueQuantity)
    }    
    public dynamic var maxValueRange: Range?        
    public func upsert(maxValueRange: Range?) {
        upsert(prop: &self.maxValueRange, val: maxValueRange)
    }    
    public dynamic var maxValueRatio: Ratio?        
    public func upsert(maxValueRatio: Ratio?) {
        upsert(prop: &self.maxValueRatio, val: maxValueRatio)
    }    
    public dynamic var maxValueReference: Reference?        
    public func upsert(maxValueReference: Reference?) {
        upsert(prop: &self.maxValueReference, val: maxValueReference)
    }    
    public dynamic var maxValueSampledData: SampledData?        
    public func upsert(maxValueSampledData: SampledData?) {
        upsert(prop: &self.maxValueSampledData, val: maxValueSampledData)
    }    
    public dynamic var maxValueSignature: Signature?        
    public func upsert(maxValueSignature: Signature?) {
        upsert(prop: &self.maxValueSignature, val: maxValueSignature)
    }    
    public dynamic var maxValueString: String?        
        
    public dynamic var maxValueTime: FHIRTime?        
        
    public dynamic var maxValueTiming: Timing?        
    public func upsert(maxValueTiming: Timing?) {
        upsert(prop: &self.maxValueTiming, val: maxValueTiming)
    }    
    public let maxValueUnsignedInt = RealmOptional<Int>()    
    public dynamic var maxValueUri: String?        
        
    public dynamic var meaningWhenMissing: String?        
        
    public let min = RealmOptional<Int>()    
    public dynamic var minValueAddress: Address?        
    public func upsert(minValueAddress: Address?) {
        upsert(prop: &self.minValueAddress, val: minValueAddress)
    }    
    public dynamic var minValueAnnotation: Annotation?        
    public func upsert(minValueAnnotation: Annotation?) {
        upsert(prop: &self.minValueAnnotation, val: minValueAnnotation)
    }    
    public dynamic var minValueAttachment: Attachment?        
    public func upsert(minValueAttachment: Attachment?) {
        upsert(prop: &self.minValueAttachment, val: minValueAttachment)
    }    
    public dynamic var minValueBase64Binary: Base64Binary?        
        
    public let minValueBoolean = RealmOptional<Bool>()    
    public dynamic var minValueCode: String?        
        
    public dynamic var minValueCodeableConcept: CodeableConcept?        
    public func upsert(minValueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.minValueCodeableConcept, val: minValueCodeableConcept)
    }    
    public dynamic var minValueCoding: Coding?        
    public func upsert(minValueCoding: Coding?) {
        upsert(prop: &self.minValueCoding, val: minValueCoding)
    }    
    public dynamic var minValueContactPoint: ContactPoint?        
    public func upsert(minValueContactPoint: ContactPoint?) {
        upsert(prop: &self.minValueContactPoint, val: minValueContactPoint)
    }    
    public dynamic var minValueDate: FHIRDate?        
        
    public dynamic var minValueDateTime: DateTime?        
        
    public dynamic var minValueDecimal: RealmDecimal?        
        
    public dynamic var minValueHumanName: HumanName?        
    public func upsert(minValueHumanName: HumanName?) {
        upsert(prop: &self.minValueHumanName, val: minValueHumanName)
    }    
    public dynamic var minValueId: String?        
        
    public dynamic var minValueIdentifier: Identifier?        
    public func upsert(minValueIdentifier: Identifier?) {
        upsert(prop: &self.minValueIdentifier, val: minValueIdentifier)
    }    
    public dynamic var minValueInstant: Instant?        
        
    public let minValueInteger = RealmOptional<Int>()    
    public dynamic var minValueMarkdown: String?        
        
    public dynamic var minValueMeta: Meta?        
    public func upsert(minValueMeta: Meta?) {
        upsert(prop: &self.minValueMeta, val: minValueMeta)
    }    
    public dynamic var minValueOid: String?        
        
    public dynamic var minValuePeriod: Period?        
    public func upsert(minValuePeriod: Period?) {
        upsert(prop: &self.minValuePeriod, val: minValuePeriod)
    }    
    public let minValuePositiveInt = RealmOptional<Int>()    
    public dynamic var minValueQuantity: Quantity?        
    public func upsert(minValueQuantity: Quantity?) {
        upsert(prop: &self.minValueQuantity, val: minValueQuantity)
    }    
    public dynamic var minValueRange: Range?        
    public func upsert(minValueRange: Range?) {
        upsert(prop: &self.minValueRange, val: minValueRange)
    }    
    public dynamic var minValueRatio: Ratio?        
    public func upsert(minValueRatio: Ratio?) {
        upsert(prop: &self.minValueRatio, val: minValueRatio)
    }    
    public dynamic var minValueReference: Reference?        
    public func upsert(minValueReference: Reference?) {
        upsert(prop: &self.minValueReference, val: minValueReference)
    }    
    public dynamic var minValueSampledData: SampledData?        
    public func upsert(minValueSampledData: SampledData?) {
        upsert(prop: &self.minValueSampledData, val: minValueSampledData)
    }    
    public dynamic var minValueSignature: Signature?        
    public func upsert(minValueSignature: Signature?) {
        upsert(prop: &self.minValueSignature, val: minValueSignature)
    }    
    public dynamic var minValueString: String?        
        
    public dynamic var minValueTime: FHIRTime?        
        
    public dynamic var minValueTiming: Timing?        
    public func upsert(minValueTiming: Timing?) {
        upsert(prop: &self.minValueTiming, val: minValueTiming)
    }    
    public let minValueUnsignedInt = RealmOptional<Int>()    
    public dynamic var minValueUri: String?        
        
    public let mustSupport = RealmOptional<Bool>()    
    public dynamic var name: String?        
        
    public dynamic var nameReference: String?        
        
    public dynamic var path: String?        
        
    public dynamic var patternAddress: Address?        
    public func upsert(patternAddress: Address?) {
        upsert(prop: &self.patternAddress, val: patternAddress)
    }    
    public dynamic var patternAnnotation: Annotation?        
    public func upsert(patternAnnotation: Annotation?) {
        upsert(prop: &self.patternAnnotation, val: patternAnnotation)
    }    
    public dynamic var patternAttachment: Attachment?        
    public func upsert(patternAttachment: Attachment?) {
        upsert(prop: &self.patternAttachment, val: patternAttachment)
    }    
    public dynamic var patternBase64Binary: Base64Binary?        
        
    public let patternBoolean = RealmOptional<Bool>()    
    public dynamic var patternCode: String?        
        
    public dynamic var patternCodeableConcept: CodeableConcept?        
    public func upsert(patternCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.patternCodeableConcept, val: patternCodeableConcept)
    }    
    public dynamic var patternCoding: Coding?        
    public func upsert(patternCoding: Coding?) {
        upsert(prop: &self.patternCoding, val: patternCoding)
    }    
    public dynamic var patternContactPoint: ContactPoint?        
    public func upsert(patternContactPoint: ContactPoint?) {
        upsert(prop: &self.patternContactPoint, val: patternContactPoint)
    }    
    public dynamic var patternDate: FHIRDate?        
        
    public dynamic var patternDateTime: DateTime?        
        
    public dynamic var patternDecimal: RealmDecimal?        
        
    public dynamic var patternHumanName: HumanName?        
    public func upsert(patternHumanName: HumanName?) {
        upsert(prop: &self.patternHumanName, val: patternHumanName)
    }    
    public dynamic var patternId: String?        
        
    public dynamic var patternIdentifier: Identifier?        
    public func upsert(patternIdentifier: Identifier?) {
        upsert(prop: &self.patternIdentifier, val: patternIdentifier)
    }    
    public dynamic var patternInstant: Instant?        
        
    public let patternInteger = RealmOptional<Int>()    
    public dynamic var patternMarkdown: String?        
        
    public dynamic var patternMeta: Meta?        
    public func upsert(patternMeta: Meta?) {
        upsert(prop: &self.patternMeta, val: patternMeta)
    }    
    public dynamic var patternOid: String?        
        
    public dynamic var patternPeriod: Period?        
    public func upsert(patternPeriod: Period?) {
        upsert(prop: &self.patternPeriod, val: patternPeriod)
    }    
    public let patternPositiveInt = RealmOptional<Int>()    
    public dynamic var patternQuantity: Quantity?        
    public func upsert(patternQuantity: Quantity?) {
        upsert(prop: &self.patternQuantity, val: patternQuantity)
    }    
    public dynamic var patternRange: Range?        
    public func upsert(patternRange: Range?) {
        upsert(prop: &self.patternRange, val: patternRange)
    }    
    public dynamic var patternRatio: Ratio?        
    public func upsert(patternRatio: Ratio?) {
        upsert(prop: &self.patternRatio, val: patternRatio)
    }    
    public dynamic var patternReference: Reference?        
    public func upsert(patternReference: Reference?) {
        upsert(prop: &self.patternReference, val: patternReference)
    }    
    public dynamic var patternSampledData: SampledData?        
    public func upsert(patternSampledData: SampledData?) {
        upsert(prop: &self.patternSampledData, val: patternSampledData)
    }    
    public dynamic var patternSignature: Signature?        
    public func upsert(patternSignature: Signature?) {
        upsert(prop: &self.patternSignature, val: patternSignature)
    }    
    public dynamic var patternString: String?        
        
    public dynamic var patternTime: FHIRTime?        
        
    public dynamic var patternTiming: Timing?        
    public func upsert(patternTiming: Timing?) {
        upsert(prop: &self.patternTiming, val: patternTiming)
    }    
    public let patternUnsignedInt = RealmOptional<Int>()    
    public dynamic var patternUri: String?        
        
    public let representation = RealmSwift.List<RealmString>()    
    public dynamic var requirements: String?        
        
    public dynamic var short: String?        
        
    public dynamic var slicing: ElementDefinitionSlicing?        
    public func upsert(slicing: ElementDefinitionSlicing?) {
        upsert(prop: &self.slicing, val: slicing)
    }    
    public let type = RealmSwift.List<ElementDefinitionType>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(path: String) {
        self.init(json: nil)
        self.path = path
    }

	
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
    
    public dynamic var max: String?        
        
    public let min = RealmOptional<Int>()    
    public dynamic var path: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(max: String, min: Int, path: String) {
        self.init(json: nil)
        self.max = max
        self.min.value = min
        self.path = path
    }

	
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
    
    public dynamic var description_fhir: String?        
        
    public dynamic var strength: String?        
        
    public dynamic var valueSetReference: Reference?        
    public func upsert(valueSetReference: Reference?) {
        upsert(prop: &self.valueSetReference, val: valueSetReference)
    }    
    public dynamic var valueSetUri: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(strength: String) {
        self.init(json: nil)
        self.strength = strength
    }

	
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
    
    public dynamic var human: String?        
        
    public dynamic var key: String?        
        
    public dynamic var requirements: String?        
        
    public dynamic var severity: String?        
        
    public dynamic var xpath: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(human: String, key: String, severity: String, xpath: String) {
        self.init(json: nil)
        self.human = human
        self.key = key
        self.severity = severity
        self.xpath = xpath
    }

	
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
    
    public dynamic var identity: String?        
        
    public dynamic var language: String?        
        
    public dynamic var map: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identity: String, map: String) {
        self.init(json: nil)
        self.identity = identity
        self.map = map
    }

	
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
    
    public dynamic var description_fhir: String?        
        
    public let discriminator = RealmSwift.List<RealmString>()    
    public let ordered = RealmOptional<Bool>()    
    public dynamic var rules: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(rules: String) {
        self.init(json: nil)
        self.rules = rules
    }

	
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
    public dynamic var code: String?        
        
    public let profile = RealmSwift.List<RealmString>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init(json: nil)
        self.code = code
    }

	
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
}

