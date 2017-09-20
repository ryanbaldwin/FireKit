//
//  ImagingObjectSelection.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImagingObjectSelection) on 2017-09-19.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-09-19
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

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

        self.author = try container.decodeIfPresent(Reference.self, forKey: .author)
        self.authoringTime = try container.decodeIfPresent(DateTime.self, forKey: .authoringTime)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.study.append(objectsIn: try container.decodeIfPresent([ImagingObjectSelectionStudy].self, forKey: .study) ?? [])
        self.title = try container.decodeIfPresent(CodeableConcept.self, forKey: .title)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.author, forKey: .author)
        try container.encodeIfPresent(self.authoringTime, forKey: .authoringTime)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(Array(self.study), forKey: .study)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.uid, forKey: .uid)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingObjectSelection.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingObjectSelection. Will return empty instance: \(error))")
		}
		return ImagingObjectSelection.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingObjectSelection else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.author, from: o.author)
        FireKit.populate(&self.authoringTime, from: o.authoringTime)
        description_fhir = o.description_fhir
        FireKit.populate(&self.patient, from: o.patient)

        for (index, t) in o.study.enumerated() {
            guard index < self.study.count else {
                self.study.append(t)
                continue
            }
            self.study[index].populate(from: t)
        }
    
        if self.study.count > o.study.count {
            for i in self.study.count...o.study.count {
                let objectToRemove = self.study[i]
                self.study.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        FireKit.populate(&self.title, from: o.title)
        uid = o.uid
    }
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

        self.imagingStudy = try container.decodeIfPresent(Reference.self, forKey: .imagingStudy)
        self.series.append(objectsIn: try container.decodeIfPresent([ImagingObjectSelectionStudySeries].self, forKey: .series) ?? [])
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.imagingStudy, forKey: .imagingStudy)
        try container.encode(Array(self.series), forKey: .series)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingObjectSelectionStudy.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingObjectSelectionStudy. Will return empty instance: \(error))")
		}
		return ImagingObjectSelectionStudy.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingObjectSelectionStudy else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.imagingStudy, from: o.imagingStudy)

        for (index, t) in o.series.enumerated() {
            guard index < self.series.count else {
                self.series.append(t)
                continue
            }
            self.series[index].populate(from: t)
        }
    
        if self.series.count > o.series.count {
            for i in self.series.count...o.series.count {
                let objectToRemove = self.series[i]
                self.series.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        uid = o.uid
        url = o.url
    }
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

        self.instance.append(objectsIn: try container.decodeIfPresent([ImagingObjectSelectionStudySeriesInstance].self, forKey: .instance) ?? [])
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.instance), forKey: .instance)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingObjectSelectionStudySeries.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingObjectSelectionStudySeries. Will return empty instance: \(error))")
		}
		return ImagingObjectSelectionStudySeries.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingObjectSelectionStudySeries else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.instance.enumerated() {
            guard index < self.instance.count else {
                self.instance.append(t)
                continue
            }
            self.instance[index].populate(from: t)
        }
    
        if self.instance.count > o.instance.count {
            for i in self.instance.count...o.instance.count {
                let objectToRemove = self.instance[i]
                self.instance.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        uid = o.uid
        url = o.url
    }
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

        self.frames.append(objectsIn: try container.decodeIfPresent([ImagingObjectSelectionStudySeriesInstanceFrames].self, forKey: .frames) ?? [])
        self.sopClass = try container.decodeIfPresent(String.self, forKey: .sopClass)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.frames), forKey: .frames)
        try container.encodeIfPresent(self.sopClass, forKey: .sopClass)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingObjectSelectionStudySeriesInstance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingObjectSelectionStudySeriesInstance. Will return empty instance: \(error))")
		}
		return ImagingObjectSelectionStudySeriesInstance.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingObjectSelectionStudySeriesInstance else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.frames.enumerated() {
            guard index < self.frames.count else {
                self.frames.append(t)
                continue
            }
            self.frames[index].populate(from: t)
        }
    
        if self.frames.count > o.frames.count {
            for i in self.frames.count...o.frames.count {
                let objectToRemove = self.frames[i]
                self.frames.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        sopClass = o.sopClass
        uid = o.uid
        url = o.url
    }
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

        self.frameNumbers.append(objectsIn: try container.decodeIfPresent([RealmInt].self, forKey: .frameNumbers) ?? [])
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.frameNumbers), forKey: .frameNumbers)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingObjectSelectionStudySeriesInstanceFrames.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingObjectSelectionStudySeriesInstanceFrames. Will return empty instance: \(error))")
		}
		return ImagingObjectSelectionStudySeriesInstanceFrames.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingObjectSelectionStudySeriesInstanceFrames else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.frameNumbers.enumerated() {
            guard index < self.frameNumbers.count else {
                self.frameNumbers.append(t)
                continue
            }
            self.frameNumbers[index].populate(from: t)
        }
    
        if self.frameNumbers.count > o.frameNumbers.count {
            for i in self.frameNumbers.count...o.frameNumbers.count {
                let objectToRemove = self.frameNumbers[i]
                self.frameNumbers.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
        url = o.url
    }
}

