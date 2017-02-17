//
//  Extension.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Extension) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  None.
 *
 *  Optional Extensions Element - found in all resources.
 */
open class Extension: Element {
	override open class var resourceType: String {
		get { return "Extension" }
	}

	public dynamic var url: String?						
		
		
	
	public dynamic var valueAddress: Address?						
		
		
			public func upsert(valueAddress: Address?) {
				upsert(prop: &self.valueAddress, val: valueAddress)
			}
	
	public dynamic var valueAnnotation: Annotation?						
		
		
			public func upsert(valueAnnotation: Annotation?) {
				upsert(prop: &self.valueAnnotation, val: valueAnnotation)
			}
	
	public dynamic var valueAttachment: Attachment?						
		
		
			public func upsert(valueAttachment: Attachment?) {
				upsert(prop: &self.valueAttachment, val: valueAttachment)
			}
	
	public dynamic var valueBase64Binary: Base64Binary?						
		
		
	
	public let valueBoolean = RealmOptional<Bool>()
	
	public dynamic var valueCode: String?						
		
		
	
	public dynamic var valueCodeableConcept: CodeableConcept?						
		
		
			public func upsert(valueCodeableConcept: CodeableConcept?) {
				upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
			}
	
	public dynamic var valueCoding: Coding?						
		
		
			public func upsert(valueCoding: Coding?) {
				upsert(prop: &self.valueCoding, val: valueCoding)
			}
	
	public dynamic var valueContactPoint: ContactPoint?						
		
		
			public func upsert(valueContactPoint: ContactPoint?) {
				upsert(prop: &self.valueContactPoint, val: valueContactPoint)
			}
	
	public dynamic var valueDate: FHIRDate?						
		
		
	
	public dynamic var valueDateTime: DateTime?						
		
		
	
	public dynamic var valueDecimal: RealmDecimal?						
		
		
	
	public dynamic var valueHumanName: HumanName?						
		
		
			public func upsert(valueHumanName: HumanName?) {
				upsert(prop: &self.valueHumanName, val: valueHumanName)
			}
	
	public dynamic var valueId: String?						
		
		
	
	public dynamic var valueIdentifier: Identifier?						
		
		
			public func upsert(valueIdentifier: Identifier?) {
				upsert(prop: &self.valueIdentifier, val: valueIdentifier)
			}
	
	public dynamic var valueInstant: Instant?						
		
		
	
	public let valueInteger = RealmOptional<Int>()
	
	public dynamic var valueMarkdown: String?						
		
		
	
	public dynamic var valueMeta: Meta?						
		
		
			public func upsert(valueMeta: Meta?) {
				upsert(prop: &self.valueMeta, val: valueMeta)
			}
	
	public dynamic var valueOid: String?						
		
		
	
	public dynamic var valuePeriod: Period?						
		
		
			public func upsert(valuePeriod: Period?) {
				upsert(prop: &self.valuePeriod, val: valuePeriod)
			}
	
	public let valuePositiveInt = RealmOptional<Int>()
	
	public dynamic var valueQuantity: Quantity?						
		
		
			public func upsert(valueQuantity: Quantity?) {
				upsert(prop: &self.valueQuantity, val: valueQuantity)
			}
	
	public dynamic var valueRange: Range?						
		
		
			public func upsert(valueRange: Range?) {
				upsert(prop: &self.valueRange, val: valueRange)
			}
	
	public dynamic var valueRatio: Ratio?						
		
		
			public func upsert(valueRatio: Ratio?) {
				upsert(prop: &self.valueRatio, val: valueRatio)
			}
	
	public dynamic var valueReference: Reference?						
		
		
			public func upsert(valueReference: Reference?) {
				upsert(prop: &self.valueReference, val: valueReference)
			}
	
	public dynamic var valueSampledData: SampledData?						
		
		
			public func upsert(valueSampledData: SampledData?) {
				upsert(prop: &self.valueSampledData, val: valueSampledData)
			}
	
	public dynamic var valueSignature: Signature?						
		
		
			public func upsert(valueSignature: Signature?) {
				upsert(prop: &self.valueSignature, val: valueSignature)
			}
	
	public dynamic var valueString: String?						
		
		
	
	public dynamic var valueTime: FHIRTime?						
		
		
	
	public dynamic var valueTiming: Timing?						
		
		
			public func upsert(valueTiming: Timing?) {
				upsert(prop: &self.valueTiming, val: valueTiming)
			}
	
	public let valueUnsignedInt = RealmOptional<Int>()
	
	public dynamic var valueUri: String?						
		
		
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(url: String) {
		self.init(json: nil)
		self.url = url
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "url"))
			}
			if let exist = js["valueAddress"] {
				presentKeys.insert("valueAddress")
				if let val = exist as? FHIRJSON {
					upsert(valueAddress: Address(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueAddress", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueAnnotation"] {
				presentKeys.insert("valueAnnotation")
				if let val = exist as? FHIRJSON {
					upsert(valueAnnotation: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueAnnotation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueAttachment"] {
				presentKeys.insert("valueAttachment")
				if let val = exist as? FHIRJSON {
					upsert(valueAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueBase64Binary"] {
				presentKeys.insert("valueBase64Binary")
				if let val = exist as? String {
					self.valueBase64Binary = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueBase64Binary", wants: String.self, has: type(of: exist)))
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
			if let exist = js["valueCode"] {
				presentKeys.insert("valueCode")
				if let val = exist as? String {
					self.valueCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueCode", wants: String.self, has: type(of: exist)))
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
			if let exist = js["valueCoding"] {
				presentKeys.insert("valueCoding")
				if let val = exist as? FHIRJSON {
					upsert(valueCoding: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueCoding", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueContactPoint"] {
				presentKeys.insert("valueContactPoint")
				if let val = exist as? FHIRJSON {
					upsert(valueContactPoint: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueContactPoint", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDate"] {
				presentKeys.insert("valueDate")
				if let val = exist as? String {
					self.valueDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDateTime"] {
				presentKeys.insert("valueDateTime")
				if let val = exist as? String {
					self.valueDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDecimal"] {
				presentKeys.insert("valueDecimal")
				if let val = exist as? NSNumber {
					self.valueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueHumanName"] {
				presentKeys.insert("valueHumanName")
				if let val = exist as? FHIRJSON {
					upsert(valueHumanName: HumanName(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueHumanName", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueId"] {
				presentKeys.insert("valueId")
				if let val = exist as? String {
					self.valueId = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueIdentifier"] {
				presentKeys.insert("valueIdentifier")
				if let val = exist as? FHIRJSON {
					upsert(valueIdentifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueIdentifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInstant"] {
				presentKeys.insert("valueInstant")
				if let val = exist as? String {
					self.valueInstant = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueInstant", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInteger"] {
				presentKeys.insert("valueInteger")
				if let val = exist as? Int {
					self.valueInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueMarkdown"] {
				presentKeys.insert("valueMarkdown")
				if let val = exist as? String {
					self.valueMarkdown = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueMarkdown", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueMeta"] {
				presentKeys.insert("valueMeta")
				if let val = exist as? FHIRJSON {
					upsert(valueMeta: Meta(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueMeta", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueOid"] {
				presentKeys.insert("valueOid")
				if let val = exist as? String {
					self.valueOid = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueOid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valuePeriod"] {
				presentKeys.insert("valuePeriod")
				if let val = exist as? FHIRJSON {
					upsert(valuePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valuePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valuePositiveInt"] {
				presentKeys.insert("valuePositiveInt")
				if let val = exist as? Int {
					self.valuePositiveInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valuePositiveInt", wants: Int.self, has: type(of: exist)))
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
			if let exist = js["valueRatio"] {
				presentKeys.insert("valueRatio")
				if let val = exist as? FHIRJSON {
					upsert(valueRatio: Ratio(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueRatio", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueReference"] {
				presentKeys.insert("valueReference")
				if let val = exist as? FHIRJSON {
					upsert(valueReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueSampledData"] {
				presentKeys.insert("valueSampledData")
				if let val = exist as? FHIRJSON {
					upsert(valueSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueSampledData", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueSignature"] {
				presentKeys.insert("valueSignature")
				if let val = exist as? FHIRJSON {
					upsert(valueSignature: Signature(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueSignature", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueString"] {
				presentKeys.insert("valueString")
				if let val = exist as? String {
					self.valueString = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueTime"] {
				presentKeys.insert("valueTime")
				if let val = exist as? String {
					self.valueTime = FHIRTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueTiming"] {
				presentKeys.insert("valueTiming")
				if let val = exist as? FHIRJSON {
					upsert(valueTiming: Timing(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueTiming", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueUnsignedInt"] {
				presentKeys.insert("valueUnsignedInt")
				if let val = exist as? Int {
					self.valueUnsignedInt.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueUnsignedInt", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueUri"] {
				presentKeys.insert("valueUri")
				if let val = exist as? String {
					self.valueUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueUri", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if let valueAddress = self.valueAddress {
			json["valueAddress"] = valueAddress.asJSON()
		}
		if let valueAnnotation = self.valueAnnotation {
			json["valueAnnotation"] = valueAnnotation.asJSON()
		}
		if let valueAttachment = self.valueAttachment {
			json["valueAttachment"] = valueAttachment.asJSON()
		}
		if let valueBase64Binary = self.valueBase64Binary {
			json["valueBase64Binary"] = valueBase64Binary.asJSON()
		}
		if let valueBoolean = self.valueBoolean.value {
			json["valueBoolean"] = valueBoolean.asJSON()
		}
		if let valueCode = self.valueCode {
			json["valueCode"] = valueCode.asJSON()
		}
		if let valueCodeableConcept = self.valueCodeableConcept {
			json["valueCodeableConcept"] = valueCodeableConcept.asJSON()
		}
		if let valueCoding = self.valueCoding {
			json["valueCoding"] = valueCoding.asJSON()
		}
		if let valueContactPoint = self.valueContactPoint {
			json["valueContactPoint"] = valueContactPoint.asJSON()
		}
		if let valueDate = self.valueDate {
			json["valueDate"] = valueDate.asJSON()
		}
		if let valueDateTime = self.valueDateTime {
			json["valueDateTime"] = valueDateTime.asJSON()
		}
		if let valueDecimal = self.valueDecimal {
			json["valueDecimal"] = valueDecimal.asJSON()
		}
		if let valueHumanName = self.valueHumanName {
			json["valueHumanName"] = valueHumanName.asJSON()
		}
		if let valueId = self.valueId {
			json["valueId"] = valueId.asJSON()
		}
		if let valueIdentifier = self.valueIdentifier {
			json["valueIdentifier"] = valueIdentifier.asJSON()
		}
		if let valueInstant = self.valueInstant {
			json["valueInstant"] = valueInstant.asJSON()
		}
		if let valueInteger = self.valueInteger.value {
			json["valueInteger"] = valueInteger.asJSON()
		}
		if let valueMarkdown = self.valueMarkdown {
			json["valueMarkdown"] = valueMarkdown.asJSON()
		}
		if let valueMeta = self.valueMeta {
			json["valueMeta"] = valueMeta.asJSON()
		}
		if let valueOid = self.valueOid {
			json["valueOid"] = valueOid.asJSON()
		}
		if let valuePeriod = self.valuePeriod {
			json["valuePeriod"] = valuePeriod.asJSON()
		}
		if let valuePositiveInt = self.valuePositiveInt.value {
			json["valuePositiveInt"] = valuePositiveInt.asJSON()
		}
		if let valueQuantity = self.valueQuantity {
			json["valueQuantity"] = valueQuantity.asJSON()
		}
		if let valueRange = self.valueRange {
			json["valueRange"] = valueRange.asJSON()
		}
		if let valueRatio = self.valueRatio {
			json["valueRatio"] = valueRatio.asJSON()
		}
		if let valueReference = self.valueReference {
			json["valueReference"] = valueReference.asJSON()
		}
		if let valueSampledData = self.valueSampledData {
			json["valueSampledData"] = valueSampledData.asJSON()
		}
		if let valueSignature = self.valueSignature {
			json["valueSignature"] = valueSignature.asJSON()
		}
		if let valueString = self.valueString {
			json["valueString"] = valueString.asJSON()
		}
		if let valueTime = self.valueTime {
			json["valueTime"] = valueTime.asJSON()
		}
		if let valueTiming = self.valueTiming {
			json["valueTiming"] = valueTiming.asJSON()
		}
		if let valueUnsignedInt = self.valueUnsignedInt.value {
			json["valueUnsignedInt"] = valueUnsignedInt.asJSON()
		}
		if let valueUri = self.valueUri {
			json["valueUri"] = valueUri.asJSON()
		}
		
		return json
	}
}

