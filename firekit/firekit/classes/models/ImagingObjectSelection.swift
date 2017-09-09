//
//  ImagingObjectSelection.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImagingObjectSelection) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Key Object Selection.
 *
 *  A manifest of a set of DICOM Service-Object Pair Instances (SOP Instances).  The referenced SOP Instances (images or
 *  other content) are for a single patient, and may be from one or more studies. The referenced SOP Instances have been
 *  selected for a purpose, such as quality assurance, conference, or consult. Reflecting that range of purposes,
 *  typical ImagingObjectSelection resources may include all SOP Instances in a study (perhaps for sharing through a
 *  Health Information Exchange); key images from multiple studies (for reference by a referring or treating physician);
 *  a multi-frame ultrasound instance ("cine" video clip) and a set of measurements taken from that instance (for
 *  inclusion in a teaching file); and so on.
 */
open class ImagingObjectSelection: DomainResource {
	override open class var resourceType: String {
		get { return "ImagingObjectSelection" }
	}

    @objc public dynamic var author: Reference?
    public func upsert(author: Reference?) {
        upsert(prop: &self.author, val: author)
    }
    @objc public dynamic var authoringTime: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    public let study = RealmSwift.List<ImagingObjectSelectionStudy>()
    @objc public dynamic var title: CodeableConcept?
    public func upsert(title: CodeableConcept?) {
        upsert(prop: &self.title, val: title)
    }
    @objc public dynamic var uid: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, study: [ImagingObjectSelectionStudy], title: CodeableConcept, uid: String) {
        self.init()
        self.patient = patient
        self.study.append(objectsIn: study)
        self.title = title
        self.uid = uid
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case author = "author"
        case authoringTime = "authoringTime"
        case description_fhir = "description"
        case patient = "patient"
        case study = "study"
        case title = "title"
        case uid = "uid"
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
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.authoringTime, forKey: .authoringTime)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(self.study.flatMap { $0 }, forKey: .study)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.uid, forKey: .uid)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					upsert(author: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["authoringTime"] {
				presentKeys.insert("authoringTime")
				if let val = exist as? String {
					self.authoringTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "authoringTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["patient"] {
				presentKeys.insert("patient")
				if let val = exist as? FHIRJSON {
					upsert(patient: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "patient", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "patient"))
			}
			if let exist = js["study"] {
				presentKeys.insert("study")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImagingObjectSelectionStudy.instantiate(fromArray: val, owner: self) as? [ImagingObjectSelectionStudy] {
						if let realm = self.realm { realm.delete(self.study) }
						self.study.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "study", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "study"))
			}
			if let exist = js["title"] {
				presentKeys.insert("title")
				if let val = exist as? FHIRJSON {
					upsert(title: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "title", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "title"))
			}
			if let exist = js["uid"] {
				presentKeys.insert("uid")
				if let val = exist as? String {
					self.uid = val
				}
				else {
					errors.append(FHIRJSONError(key: "uid", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "uid"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if let authoringTime = self.authoringTime {
			json["authoringTime"] = authoringTime.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if study.count > 0 {
			json["study"] = Array(study.map() { $0.asJSON() })
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Study identity of the selected instances.
 *
 *  Study identity and locating information of the DICOM SOP instances in the selection.
 */
open class ImagingObjectSelectionStudy: BackboneElement {
	override open class var resourceType: String {
		get { return "ImagingObjectSelectionStudy" }
	}

    @objc public dynamic var imagingStudy: Reference?
    public func upsert(imagingStudy: Reference?) {
        upsert(prop: &self.imagingStudy, val: imagingStudy)
    }
    public let series = RealmSwift.List<ImagingObjectSelectionStudySeries>()
    @objc public dynamic var uid: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(series: [ImagingObjectSelectionStudySeries], uid: String) {
        self.init()
        self.series.append(objectsIn: series)
        self.uid = uid
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case imagingStudy = "imagingStudy"
        case series = "series"
        case uid = "uid"
        case url = "url"
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
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.imagingStudy, forKey: .imagingStudy)
        try container.encode(self.series.flatMap { $0 }, forKey: .series)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["imagingStudy"] {
				presentKeys.insert("imagingStudy")
				if let val = exist as? FHIRJSON {
					upsert(imagingStudy: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "imagingStudy", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["series"] {
				presentKeys.insert("series")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImagingObjectSelectionStudySeries.instantiate(fromArray: val, owner: self) as? [ImagingObjectSelectionStudySeries] {
						if let realm = self.realm { realm.delete(self.series) }
						self.series.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "series", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "series"))
			}
			if let exist = js["uid"] {
				presentKeys.insert("uid")
				if let val = exist as? String {
					self.uid = val
				}
				else {
					errors.append(FHIRJSONError(key: "uid", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "uid"))
			}
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let imagingStudy = self.imagingStudy {
			json["imagingStudy"] = imagingStudy.asJSON()
		}
		if series.count > 0 {
			json["series"] = Array(series.map() { $0.asJSON() })
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Series identity of the selected instances.
 *
 *  Series identity and locating information of the DICOM SOP instances in the selection.
 */
open class ImagingObjectSelectionStudySeries: BackboneElement {
	override open class var resourceType: String {
		get { return "ImagingObjectSelectionStudySeries" }
	}

    public let instance = RealmSwift.List<ImagingObjectSelectionStudySeriesInstance>()
    @objc public dynamic var uid: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(instance: [ImagingObjectSelectionStudySeriesInstance]) {
        self.init()
        self.instance.append(objectsIn: instance)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case instance = "instance"
        case uid = "uid"
        case url = "url"
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
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.instance.flatMap { $0 }, forKey: .instance)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["instance"] {
				presentKeys.insert("instance")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImagingObjectSelectionStudySeriesInstance.instantiate(fromArray: val, owner: self) as? [ImagingObjectSelectionStudySeriesInstance] {
						if let realm = self.realm { realm.delete(self.instance) }
						self.instance.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "instance", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "instance"))
			}
			if let exist = js["uid"] {
				presentKeys.insert("uid")
				if let val = exist as? String {
					self.uid = val
				}
				else {
					errors.append(FHIRJSONError(key: "uid", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if instance.count > 0 {
			json["instance"] = Array(instance.map() { $0.asJSON() })
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  The selected instance.
 *
 *  Identity and locating information of the selected DICOM SOP instances.
 */
open class ImagingObjectSelectionStudySeriesInstance: BackboneElement {
	override open class var resourceType: String {
		get { return "ImagingObjectSelectionStudySeriesInstance" }
	}

    public let frames = RealmSwift.List<ImagingObjectSelectionStudySeriesInstanceFrames>()
    @objc public dynamic var sopClass: String?
    @objc public dynamic var uid: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sopClass: String, uid: String, url: String) {
        self.init()
        self.sopClass = sopClass
        self.uid = uid
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case frames = "frames"
        case sopClass = "sopClass"
        case uid = "uid"
        case url = "url"
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
        self.sopClass = try container.decodeIfPresent(String.self, forKey: .sopClass)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.frames.flatMap { $0 }, forKey: .frames)
        try container.encodeIfPresent(self.sopClass, forKey: .sopClass)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["frames"] {
				presentKeys.insert("frames")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImagingObjectSelectionStudySeriesInstanceFrames.instantiate(fromArray: val, owner: self) as? [ImagingObjectSelectionStudySeriesInstanceFrames] {
						if let realm = self.realm { realm.delete(self.frames) }
						self.frames.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "frames", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["sopClass"] {
				presentKeys.insert("sopClass")
				if let val = exist as? String {
					self.sopClass = val
				}
				else {
					errors.append(FHIRJSONError(key: "sopClass", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sopClass"))
			}
			if let exist = js["uid"] {
				presentKeys.insert("uid")
				if let val = exist as? String {
					self.uid = val
				}
				else {
					errors.append(FHIRJSONError(key: "uid", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "uid"))
			}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if frames.count > 0 {
			json["frames"] = Array(frames.map() { $0.asJSON() })
		}
		if let sopClass = self.sopClass {
			json["sopClass"] = sopClass.asJSON()
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  The frame set.
 *
 *  Identity and location information of the frames in the selected instance.
 */
open class ImagingObjectSelectionStudySeriesInstanceFrames: BackboneElement {
	override open class var resourceType: String {
		get { return "ImagingObjectSelectionStudySeriesInstanceFrames" }
	}

    public let frameNumbers = RealmSwift.List<RealmInt>()
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(frameNumbers: [Int], url: String) {
        self.init()
        self.frameNumbers.append(objectsIn: frameNumbers.map{ RealmInt(value: [$0]) })
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case frameNumbers = "frameNumbers"
        case url = "url"
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
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.frameNumbers.flatMap { $0.value }, forKey: .frameNumbers)
        try container.encodeIfPresent(self.url, forKey: .url)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["frameNumbers"] {
				presentKeys.insert("frameNumbers")
				if let val = exist as? [Int] {
					self.frameNumbers.append(objectsIn: val.map{ RealmInt(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "frameNumbers", wants: Array<Int>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "frameNumbers"))
			}
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if frameNumbers.count > 0 {
			json["frameNumbers"] = Array(frameNumbers.map() { $0.value })
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
*/
}

