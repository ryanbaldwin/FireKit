//
//  Observation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Observation) on 2017-09-11.
//  2017, SMART Health IT.
//

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
/*
	
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
*/
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
/*
	
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
*/
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
/*
	
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
*/
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
/*
	
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
*/
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
}

