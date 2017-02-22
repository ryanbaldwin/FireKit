//
//  Observation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Observation) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
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
    
    public dynamic var bodySite: CodeableConcept?        
    public func upsert(bodySite: CodeableConcept?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }    
    public dynamic var category: CodeableConcept?        
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }    
    public dynamic var code: CodeableConcept?        
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }    
    public dynamic var comments: String?        
        
    public let component = RealmSwift.List<ObservationComponent>()    
    public dynamic var dataAbsentReason: CodeableConcept?        
    public func upsert(dataAbsentReason: CodeableConcept?) {
        upsert(prop: &self.dataAbsentReason, val: dataAbsentReason)
    }    
    public dynamic var device: Reference?        
    public func upsert(device: Reference?) {
        upsert(prop: &self.device, val: device)
    }    
    public dynamic var effectiveDateTime: DateTime?        
        
    public dynamic var effectivePeriod: Period?        
    public func upsert(effectivePeriod: Period?) {
        upsert(prop: &self.effectivePeriod, val: effectivePeriod)
    }    
    public dynamic var encounter: Reference?        
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }    
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var interpretation: CodeableConcept?        
    public func upsert(interpretation: CodeableConcept?) {
        upsert(prop: &self.interpretation, val: interpretation)
    }    
    public dynamic var issued: Instant?        
        
    public dynamic var method: CodeableConcept?        
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }    
    public let performer = RealmSwift.List<Reference>()    
    public let referenceRange = RealmSwift.List<ObservationReferenceRange>()    
    public let related = RealmSwift.List<ObservationRelated>()    
    public dynamic var specimen: Reference?        
    public func upsert(specimen: Reference?) {
        upsert(prop: &self.specimen, val: specimen)
    }    
    public dynamic var status: String?        
        
    public dynamic var subject: Reference?        
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }    
    public dynamic var valueAttachment: Attachment?        
    public func upsert(valueAttachment: Attachment?) {
        upsert(prop: &self.valueAttachment, val: valueAttachment)
    }    
    public dynamic var valueCodeableConcept: CodeableConcept?        
    public func upsert(valueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
    }    
    public dynamic var valueDateTime: DateTime?        
        
    public dynamic var valuePeriod: Period?        
    public func upsert(valuePeriod: Period?) {
        upsert(prop: &self.valuePeriod, val: valuePeriod)
    }    
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
    public dynamic var valueSampledData: SampledData?        
    public func upsert(valueSampledData: SampledData?) {
        upsert(prop: &self.valueSampledData, val: valueSampledData)
    }    
    public dynamic var valueString: String?        
        
    public dynamic var valueTime: FHIRTime?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, status: String) {
        self.init(json: nil)
        self.code = code
        self.status = status
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? FHIRJSON {
					upsert(bodySite: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					upsert(category: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
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
			if let exist = js["component"] {
				presentKeys.insert("component")
				if let val = exist as? [FHIRJSON] {
					if let vals = ObservationComponent.instantiate(fromArray: val, owner: self) as? [ObservationComponent] {
						if let realm = self.realm { realm.delete(self.component) }
						self.component.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "component", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["dataAbsentReason"] {
				presentKeys.insert("dataAbsentReason")
				if let val = exist as? FHIRJSON {
					upsert(dataAbsentReason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dataAbsentReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["device"] {
				presentKeys.insert("device")
				if let val = exist as? FHIRJSON {
					upsert(device: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "device", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["effectiveDateTime"] {
				presentKeys.insert("effectiveDateTime")
				if let val = exist as? String {
					self.effectiveDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "effectiveDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["effectivePeriod"] {
				presentKeys.insert("effectivePeriod")
				if let val = exist as? FHIRJSON {
					upsert(effectivePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "effectivePeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["interpretation"] {
				presentKeys.insert("interpretation")
				if let val = exist as? FHIRJSON {
					upsert(interpretation: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "interpretation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["issued"] {
				presentKeys.insert("issued")
				if let val = exist as? String {
					self.issued = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "issued", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? FHIRJSON {
					upsert(method: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.performer) }
						self.performer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["referenceRange"] {
				presentKeys.insert("referenceRange")
				if let val = exist as? [FHIRJSON] {
					if let vals = ObservationReferenceRange.instantiate(fromArray: val, owner: self) as? [ObservationReferenceRange] {
						if let realm = self.realm { realm.delete(self.referenceRange) }
						self.referenceRange.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "referenceRange", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["related"] {
				presentKeys.insert("related")
				if let val = exist as? [FHIRJSON] {
					if let vals = ObservationRelated.instantiate(fromArray: val, owner: self) as? [ObservationRelated] {
						if let realm = self.realm { realm.delete(self.related) }
						self.related.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "related", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["specimen"] {
				presentKeys.insert("specimen")
				if let val = exist as? FHIRJSON {
					upsert(specimen: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "specimen", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["valueCodeableConcept"] {
				presentKeys.insert("valueCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(valueCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["valuePeriod"] {
				presentKeys.insert("valuePeriod")
				if let val = exist as? FHIRJSON {
					upsert(valuePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valuePeriod", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["valueSampledData"] {
				presentKeys.insert("valueSampledData")
				if let val = exist as? FHIRJSON {
					upsert(valueSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueSampledData", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let bodySite = self.bodySite {
			json["bodySite"] = bodySite.asJSON()
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let comments = self.comments {
			json["comments"] = comments.asJSON()
		}
		if component.count > 0 {
			json["component"] = Array(component.map() { $0.asJSON() })
		}
		if let dataAbsentReason = self.dataAbsentReason {
			json["dataAbsentReason"] = dataAbsentReason.asJSON()
		}
		if let device = self.device {
			json["device"] = device.asJSON()
		}
		if let effectiveDateTime = self.effectiveDateTime {
			json["effectiveDateTime"] = effectiveDateTime.asJSON()
		}
		if let effectivePeriod = self.effectivePeriod {
			json["effectivePeriod"] = effectivePeriod.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let interpretation = self.interpretation {
			json["interpretation"] = interpretation.asJSON()
		}
		if let issued = self.issued {
			json["issued"] = issued.asJSON()
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if performer.count > 0 {
			json["performer"] = Array(performer.map() { $0.asJSON() })
		}
		if referenceRange.count > 0 {
			json["referenceRange"] = Array(referenceRange.map() { $0.asJSON() })
		}
		if related.count > 0 {
			json["related"] = Array(related.map() { $0.asJSON() })
		}
		if let specimen = self.specimen {
			json["specimen"] = specimen.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let valueAttachment = self.valueAttachment {
			json["valueAttachment"] = valueAttachment.asJSON()
		}
		if let valueCodeableConcept = self.valueCodeableConcept {
			json["valueCodeableConcept"] = valueCodeableConcept.asJSON()
		}
		if let valueDateTime = self.valueDateTime {
			json["valueDateTime"] = valueDateTime.asJSON()
		}
		if let valuePeriod = self.valuePeriod {
			json["valuePeriod"] = valuePeriod.asJSON()
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
		if let valueSampledData = self.valueSampledData {
			json["valueSampledData"] = valueSampledData.asJSON()
		}
		if let valueString = self.valueString {
			json["valueString"] = valueString.asJSON()
		}
		if let valueTime = self.valueTime {
			json["valueTime"] = valueTime.asJSON()
		}
		
		return json
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
    
    public dynamic var code: CodeableConcept?        
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }    
    public dynamic var dataAbsentReason: CodeableConcept?        
    public func upsert(dataAbsentReason: CodeableConcept?) {
        upsert(prop: &self.dataAbsentReason, val: dataAbsentReason)
    }    
    public let referenceRange = RealmSwift.List<ObservationReferenceRange>()    
    public dynamic var valueAttachment: Attachment?        
    public func upsert(valueAttachment: Attachment?) {
        upsert(prop: &self.valueAttachment, val: valueAttachment)
    }    
    public dynamic var valueCodeableConcept: CodeableConcept?        
    public func upsert(valueCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.valueCodeableConcept, val: valueCodeableConcept)
    }    
    public dynamic var valueDateTime: DateTime?        
        
    public dynamic var valuePeriod: Period?        
    public func upsert(valuePeriod: Period?) {
        upsert(prop: &self.valuePeriod, val: valuePeriod)
    }    
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
    public dynamic var valueSampledData: SampledData?        
    public func upsert(valueSampledData: SampledData?) {
        upsert(prop: &self.valueSampledData, val: valueSampledData)
    }    
    public dynamic var valueString: String?        
        
    public dynamic var valueTime: FHIRTime?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept) {
        self.init(json: nil)
        self.code = code
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["dataAbsentReason"] {
				presentKeys.insert("dataAbsentReason")
				if let val = exist as? FHIRJSON {
					upsert(dataAbsentReason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "dataAbsentReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["referenceRange"] {
				presentKeys.insert("referenceRange")
				if let val = exist as? [FHIRJSON] {
					if let vals = ObservationReferenceRange.instantiate(fromArray: val, owner: self) as? [ObservationReferenceRange] {
						if let realm = self.realm { realm.delete(self.referenceRange) }
						self.referenceRange.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "referenceRange", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["valueCodeableConcept"] {
				presentKeys.insert("valueCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(valueCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["valuePeriod"] {
				presentKeys.insert("valuePeriod")
				if let val = exist as? FHIRJSON {
					upsert(valuePeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valuePeriod", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["valueSampledData"] {
				presentKeys.insert("valueSampledData")
				if let val = exist as? FHIRJSON {
					upsert(valueSampledData: SampledData(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueSampledData", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let dataAbsentReason = self.dataAbsentReason {
			json["dataAbsentReason"] = dataAbsentReason.asJSON()
		}
		if referenceRange.count > 0 {
			json["referenceRange"] = Array(referenceRange.map() { $0.asJSON() })
		}
		if let valueAttachment = self.valueAttachment {
			json["valueAttachment"] = valueAttachment.asJSON()
		}
		if let valueCodeableConcept = self.valueCodeableConcept {
			json["valueCodeableConcept"] = valueCodeableConcept.asJSON()
		}
		if let valueDateTime = self.valueDateTime {
			json["valueDateTime"] = valueDateTime.asJSON()
		}
		if let valuePeriod = self.valuePeriod {
			json["valuePeriod"] = valuePeriod.asJSON()
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
		if let valueSampledData = self.valueSampledData {
			json["valueSampledData"] = valueSampledData.asJSON()
		}
		if let valueString = self.valueString {
			json["valueString"] = valueString.asJSON()
		}
		if let valueTime = self.valueTime {
			json["valueTime"] = valueTime.asJSON()
		}
		
		return json
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
    
    public dynamic var age: Range?        
    public func upsert(age: Range?) {
        upsert(prop: &self.age, val: age)
    }    
    public dynamic var high: Quantity?        
    public func upsert(high: Quantity?) {
        upsert(prop: &self.high, val: high)
    }    
    public dynamic var low: Quantity?        
    public func upsert(low: Quantity?) {
        upsert(prop: &self.low, val: low)
    }    
    public dynamic var meaning: CodeableConcept?        
    public func upsert(meaning: CodeableConcept?) {
        upsert(prop: &self.meaning, val: meaning)
    }    
    public dynamic var text: String?        
    

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["age"] {
				presentKeys.insert("age")
				if let val = exist as? FHIRJSON {
					upsert(age: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "age", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["high"] {
				presentKeys.insert("high")
				if let val = exist as? FHIRJSON {
					upsert(high: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "high", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["low"] {
				presentKeys.insert("low")
				if let val = exist as? FHIRJSON {
					upsert(low: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "low", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["meaning"] {
				presentKeys.insert("meaning")
				if let val = exist as? FHIRJSON {
					upsert(meaning: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "meaning", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let age = self.age {
			json["age"] = age.asJSON()
		}
		if let high = self.high {
			json["high"] = high.asJSON()
		}
		if let low = self.low {
			json["low"] = low.asJSON()
		}
		if let meaning = self.meaning {
			json["meaning"] = meaning.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
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
    
    public dynamic var target: Reference?        
    public func upsert(target: Reference?) {
        upsert(prop: &self.target, val: target)
    }    
    public dynamic var type: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(target: Reference) {
        self.init(json: nil)
        self.target = target
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					upsert(target: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "target"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

