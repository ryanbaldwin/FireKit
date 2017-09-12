//
//  DiagnosticReport.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DiagnosticReport) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A Diagnostic report - a combination of request information, atomic results, images, interpretation, as well as
 *  formatted reports.
 *
 *  The findings and interpretation of diagnostic  tests performed on patients, groups of patients, devices, and
 *  locations, and/or specimens derived from these. The report includes clinical context such as requesting and provider
 *  information, and some mix of atomic results, images, textual and coded interpretations, and formatted representation
 *  of diagnostic reports.
 */
open class DiagnosticReport: DomainResource {
	override open class var resourceType: String {
		get { return "DiagnosticReport" }
	}

    @objc public dynamic var category: CodeableConcept?
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }
    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let codedDiagnosis = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var conclusion: String?
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
    public let image = RealmSwift.List<DiagnosticReportImage>()
    public let imagingStudy = RealmSwift.List<Reference>()
    @objc public dynamic var issued: Instant?
    @objc public dynamic var performer: Reference?
    public func upsert(performer: Reference?) {
        upsert(prop: &self.performer, val: performer)
    }
    public let presentedForm = RealmSwift.List<Attachment>()
    public let request = RealmSwift.List<Reference>()
    public let result = RealmSwift.List<Reference>()
    public let specimen = RealmSwift.List<Reference>()
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: CodeableConcept, effectiveDateTime: DateTime, effectivePeriod: Period, issued: Instant, performer: Reference, status: String, subject: Reference) {
        self.init()
        self.code = code
        self.effectiveDateTime = effectiveDateTime
        self.effectivePeriod = effectivePeriod
        self.issued = issued
        self.performer = performer
        self.status = status
        self.subject = subject
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case code = "code"
        case codedDiagnosis = "codedDiagnosis"
        case conclusion = "conclusion"
        case effectiveDateTime = "effectiveDateTime"
        case effectivePeriod = "effectivePeriod"
        case encounter = "encounter"
        case identifier = "identifier"
        case image = "image"
        case imagingStudy = "imagingStudy"
        case issued = "issued"
        case performer = "performer"
        case presentedForm = "presentedForm"
        case request = "request"
        case result = "result"
        case specimen = "specimen"
        case status = "status"
        case subject = "subject"
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

        self.category = try container.decodeIfPresent(CodeableConcept.self, forKey: .category)
        self.code = try container.decodeIfPresent(CodeableConcept.self, forKey: .code)
        self.codedDiagnosis.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .codedDiagnosis) ?? [])
        self.conclusion = try container.decodeIfPresent(String.self, forKey: .conclusion)
        self.effectiveDateTime = try container.decodeIfPresent(DateTime.self, forKey: .effectiveDateTime)
        self.effectivePeriod = try container.decodeIfPresent(Period.self, forKey: .effectivePeriod)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.image.append(objectsIn: try container.decodeIfPresent([DiagnosticReportImage].self, forKey: .image) ?? [])
        self.imagingStudy.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .imagingStudy) ?? [])
        self.issued = try container.decodeIfPresent(Instant.self, forKey: .issued)
        self.performer = try container.decodeIfPresent(Reference.self, forKey: .performer)
        self.presentedForm.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .presentedForm) ?? [])
        self.request.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .request) ?? [])
        self.result.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .result) ?? [])
        self.specimen.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .specimen) ?? [])
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.codedDiagnosis), forKey: .codedDiagnosis)
        try container.encodeIfPresent(self.conclusion, forKey: .conclusion)
        try container.encodeIfPresent(self.effectiveDateTime, forKey: .effectiveDateTime)
        try container.encodeIfPresent(self.effectivePeriod, forKey: .effectivePeriod)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.image), forKey: .image)
        try container.encode(Array(self.imagingStudy), forKey: .imagingStudy)
        try container.encodeIfPresent(self.issued, forKey: .issued)
        try container.encodeIfPresent(self.performer, forKey: .performer)
        try container.encode(Array(self.presentedForm), forKey: .presentedForm)
        try container.encode(Array(self.request), forKey: .request)
        try container.encode(Array(self.result), forKey: .result)
        try container.encode(Array(self.specimen), forKey: .specimen)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["codedDiagnosis"] {
				presentKeys.insert("codedDiagnosis")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.codedDiagnosis) }
						self.codedDiagnosis.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "codedDiagnosis", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["conclusion"] {
				presentKeys.insert("conclusion")
				if let val = exist as? String {
					self.conclusion = val
				}
				else {
					errors.append(FHIRJSONError(key: "conclusion", wants: String.self, has: type(of: exist)))
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
			if let exist = js["image"] {
				presentKeys.insert("image")
				if let val = exist as? [FHIRJSON] {
					if let vals = DiagnosticReportImage.instantiate(fromArray: val, owner: self) as? [DiagnosticReportImage] {
						if let realm = self.realm { realm.delete(self.image) }
						self.image.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "image", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["imagingStudy"] {
				presentKeys.insert("imagingStudy")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.imagingStudy) }
						self.imagingStudy.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "imagingStudy", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "issued"))
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? FHIRJSON {
					upsert(performer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "performer"))
			}
			if let exist = js["presentedForm"] {
				presentKeys.insert("presentedForm")
				if let val = exist as? [FHIRJSON] {
					if let vals = Attachment.instantiate(fromArray: val, owner: self) as? [Attachment] {
						if let realm = self.realm { realm.delete(self.presentedForm) }
						self.presentedForm.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "presentedForm", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.request) }
						self.request.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["result"] {
				presentKeys.insert("result")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.result) }
						self.result.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "result", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["specimen"] {
				presentKeys.insert("specimen")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.specimen) }
						self.specimen.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "specimen", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "subject"))
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.effectiveDateTime && nil == self.effectivePeriod {
				errors.append(FHIRJSONError(key: "effective*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if codedDiagnosis.count > 0 {
			json["codedDiagnosis"] = Array(codedDiagnosis.map() { $0.asJSON() })
		}
		if let conclusion = self.conclusion {
			json["conclusion"] = conclusion.asJSON()
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
		if image.count > 0 {
			json["image"] = Array(image.map() { $0.asJSON() })
		}
		if imagingStudy.count > 0 {
			json["imagingStudy"] = Array(imagingStudy.map() { $0.asJSON() })
		}
		if let issued = self.issued {
			json["issued"] = issued.asJSON()
		}
		if let performer = self.performer {
			json["performer"] = performer.asJSON()
		}
		if presentedForm.count > 0 {
			json["presentedForm"] = Array(presentedForm.map() { $0.asJSON() })
		}
		if request.count > 0 {
			json["request"] = Array(request.map() { $0.asJSON() })
		}
		if result.count > 0 {
			json["result"] = Array(result.map() { $0.asJSON() })
		}
		if specimen.count > 0 {
			json["specimen"] = Array(specimen.map() { $0.asJSON() })
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DiagnosticReport.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DiagnosticReport. Will return empty instance: \(error))")
		}
		return DiagnosticReport.init()
	}
}


/**
 *  Key images associated with this report.
 *
 *  A list of key images associated with this report. The images are generally created during the diagnostic process,
 *  and may be directly of the patient, or of treated specimens (i.e. slides of interest).
 */
open class DiagnosticReportImage: BackboneElement {
	override open class var resourceType: String {
		get { return "DiagnosticReportImage" }
	}

    @objc public dynamic var comment: String?
    @objc public dynamic var link: Reference?
    public func upsert(link: Reference?) {
        upsert(prop: &self.link, val: link)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(link: Reference) {
        self.init()
        self.link = link
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case comment = "comment"
        case link = "link"
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

        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
        self.link = try container.decodeIfPresent(Reference.self, forKey: .link)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.comment, forKey: .comment)
        try container.encodeIfPresent(self.link, forKey: .link)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["comment"] {
				presentKeys.insert("comment")
				if let val = exist as? String {
					self.comment = val
				}
				else {
					errors.append(FHIRJSONError(key: "comment", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["link"] {
				presentKeys.insert("link")
				if let val = exist as? FHIRJSON {
					upsert(link: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "link", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "link"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let comment = self.comment {
			json["comment"] = comment.asJSON()
		}
		if let link = self.link {
			json["link"] = link.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(DiagnosticReportImage.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy DiagnosticReportImage. Will return empty instance: \(error))")
		}
		return DiagnosticReportImage.init()
	}
}

