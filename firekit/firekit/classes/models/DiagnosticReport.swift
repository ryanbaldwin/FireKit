//
//  DiagnosticReport.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DiagnosticReport) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

    public override func populate(from other: Any) {
        guard let o = other as? DiagnosticReport else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.category, from: o.category)
        FireKit.populate(&self.code, from: o.code)

        for (index, t) in o.codedDiagnosis.enumerated() {
            guard index < self.codedDiagnosis.count else {
                self.codedDiagnosis.append(t)
                continue
            }
            self.codedDiagnosis[index].populate(from: t)
        }
    
        if self.codedDiagnosis.count > o.codedDiagnosis.count {
            for i in self.codedDiagnosis.count...o.codedDiagnosis.count {
                let objectToRemove = self.codedDiagnosis[i]
                self.codedDiagnosis.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        conclusion = o.conclusion
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

        for (index, t) in o.image.enumerated() {
            guard index < self.image.count else {
                self.image.append(t)
                continue
            }
            self.image[index].populate(from: t)
        }
    
        if self.image.count > o.image.count {
            for i in self.image.count...o.image.count {
                let objectToRemove = self.image[i]
                self.image.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.imagingStudy.enumerated() {
            guard index < self.imagingStudy.count else {
                self.imagingStudy.append(t)
                continue
            }
            self.imagingStudy[index].populate(from: t)
        }
    
        if self.imagingStudy.count > o.imagingStudy.count {
            for i in self.imagingStudy.count...o.imagingStudy.count {
                let objectToRemove = self.imagingStudy[i]
                self.imagingStudy.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.issued, from: o.issued)
        FireKit.populate(&self.performer, from: o.performer)

        for (index, t) in o.presentedForm.enumerated() {
            guard index < self.presentedForm.count else {
                self.presentedForm.append(t)
                continue
            }
            self.presentedForm[index].populate(from: t)
        }
    
        if self.presentedForm.count > o.presentedForm.count {
            for i in self.presentedForm.count...o.presentedForm.count {
                let objectToRemove = self.presentedForm[i]
                self.presentedForm.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.request.enumerated() {
            guard index < self.request.count else {
                self.request.append(t)
                continue
            }
            self.request[index].populate(from: t)
        }
    
        if self.request.count > o.request.count {
            for i in self.request.count...o.request.count {
                let objectToRemove = self.request[i]
                self.request.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.result.enumerated() {
            guard index < self.result.count else {
                self.result.append(t)
                continue
            }
            self.result[index].populate(from: t)
        }
    
        if self.result.count > o.result.count {
            for i in self.result.count...o.result.count {
                let objectToRemove = self.result[i]
                self.result.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }

        for (index, t) in o.specimen.enumerated() {
            guard index < self.specimen.count else {
                self.specimen.append(t)
                continue
            }
            self.specimen[index].populate(from: t)
        }
    
        if self.specimen.count > o.specimen.count {
            for i in self.specimen.count...o.specimen.count {
                let objectToRemove = self.specimen[i]
                self.specimen.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        status = o.status
        FireKit.populate(&self.subject, from: o.subject)
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

    public override func populate(from other: Any) {
        guard let o = other as? DiagnosticReportImage else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        comment = o.comment
        FireKit.populate(&self.link, from: o.link)
    }
}

