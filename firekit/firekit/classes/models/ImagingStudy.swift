//
//  ImagingStudy.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImagingStudy) on 2017-10-06.
//  2017, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on 2017-10-06
// 	Copyright @ 2017 Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
import RealmSwift


/**
 *  A set of images produced in single study (one or more series of references images).
 *
 *  Representation of the content produced in a DICOM imaging study. A study comprises a set of series, each of which
 *  includes a set of Service-Object Pair Instances (SOP Instances - images or other data) acquired or produced in a
 *  common context.  A series is of only one modality (e.g. X-ray, CT, MR, ultrasound), but a study may have multiple
 *  series of different modalities.
 */
open class ImagingStudy: DomainResource {
	override open class var resourceType: String {
		get { return "ImagingStudy" }
	}

    @objc public dynamic var accession: Identifier?
    public func upsert(accession: Identifier?) {
        upsert(prop: &self.accession, val: accession)
    }
    @objc public dynamic var availability: String?
    @objc public dynamic var description_fhir: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var interpreter: Reference?
    public func upsert(interpreter: Reference?) {
        upsert(prop: &self.interpreter, val: interpreter)
    }
    public let modalityList = RealmSwift.List<Coding>()
    public let numberOfInstances = RealmOptional<Int>()
    public let numberOfSeries = RealmOptional<Int>()
    public let order = RealmSwift.List<Reference>()
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    public let procedure = RealmSwift.List<Reference>()
    @objc public dynamic var referrer: Reference?
    public func upsert(referrer: Reference?) {
        upsert(prop: &self.referrer, val: referrer)
    }
    public let series = RealmSwift.List<ImagingStudySeries>()
    @objc public dynamic var started: DateTime?
    @objc public dynamic var uid: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(numberOfInstances: Int, numberOfSeries: Int, patient: Reference, uid: String) {
        self.init()
        self.numberOfInstances.value = numberOfInstances
        self.numberOfSeries.value = numberOfSeries
        self.patient = patient
        self.uid = uid
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case accession = "accession"
        case availability = "availability"
        case description_fhir = "description"
        case identifier = "identifier"
        case interpreter = "interpreter"
        case modalityList = "modalityList"
        case numberOfInstances = "numberOfInstances"
        case numberOfSeries = "numberOfSeries"
        case order = "order"
        case patient = "patient"
        case procedure = "procedure"
        case referrer = "referrer"
        case series = "series"
        case started = "started"
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

        self.accession = try container.decodeIfPresent(Identifier.self, forKey: .accession)
        self.availability = try container.decodeIfPresent(String.self, forKey: .availability)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.interpreter = try container.decodeIfPresent(Reference.self, forKey: .interpreter)
        self.modalityList.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .modalityList) ?? [])
        self.numberOfInstances.value = try container.decodeIfPresent(Int.self, forKey: .numberOfInstances)
        self.numberOfSeries.value = try container.decodeIfPresent(Int.self, forKey: .numberOfSeries)
        self.order.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .order) ?? [])
        self.patient = try container.decodeIfPresent(Reference.self, forKey: .patient)
        self.procedure.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .procedure) ?? [])
        self.referrer = try container.decodeIfPresent(Reference.self, forKey: .referrer)
        self.series.append(objectsIn: try container.decodeIfPresent([ImagingStudySeries].self, forKey: .series) ?? [])
        self.started = try container.decodeIfPresent(DateTime.self, forKey: .started)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.accession, forKey: .accession)
        try container.encodeIfPresent(self.availability, forKey: .availability)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encodeIfPresent(self.interpreter, forKey: .interpreter)
        try container.encode(Array(self.modalityList), forKey: .modalityList)
        try container.encodeIfPresent(self.numberOfInstances.value, forKey: .numberOfInstances)
        try container.encodeIfPresent(self.numberOfSeries.value, forKey: .numberOfSeries)
        try container.encode(Array(self.order), forKey: .order)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(Array(self.procedure), forKey: .procedure)
        try container.encodeIfPresent(self.referrer, forKey: .referrer)
        try container.encode(Array(self.series), forKey: .series)
        try container.encodeIfPresent(self.started, forKey: .started)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingStudy.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingStudy. Will return empty instance: \(error))")
		}
		return ImagingStudy.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingStudy else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        FireKit.populate(&self.accession, from: o.accession)
        availability = o.availability
        description_fhir = o.description_fhir

        for (index, t) in o.identifier.enumerated() {
            guard index < self.identifier.count else {
                self.identifier.append(t)
                continue
            }
            self.identifier[index].populate(from: t)
        }
    
        while self.identifier.count > o.identifier.count {
            let objectToRemove = self.identifier.last!
            self.identifier.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.interpreter, from: o.interpreter)

        for (index, t) in o.modalityList.enumerated() {
            guard index < self.modalityList.count else {
                self.modalityList.append(t)
                continue
            }
            self.modalityList[index].populate(from: t)
        }
    
        while self.modalityList.count > o.modalityList.count {
            let objectToRemove = self.modalityList.last!
            self.modalityList.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        numberOfInstances.value = o.numberOfInstances.value
        numberOfSeries.value = o.numberOfSeries.value

        for (index, t) in o.order.enumerated() {
            guard index < self.order.count else {
                self.order.append(t)
                continue
            }
            self.order[index].populate(from: t)
        }
    
        while self.order.count > o.order.count {
            let objectToRemove = self.order.last!
            self.order.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.patient, from: o.patient)

        for (index, t) in o.procedure.enumerated() {
            guard index < self.procedure.count else {
                self.procedure.append(t)
                continue
            }
            self.procedure[index].populate(from: t)
        }
    
        while self.procedure.count > o.procedure.count {
            let objectToRemove = self.procedure.last!
            self.procedure.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.referrer, from: o.referrer)

        for (index, t) in o.series.enumerated() {
            guard index < self.series.count else {
                self.series.append(t)
                continue
            }
            self.series[index].populate(from: t)
        }
    
        while self.series.count > o.series.count {
            let objectToRemove = self.series.last!
            self.series.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.started, from: o.started)
        uid = o.uid
        url = o.url
    }
}


/**
 *  Each study has one or more series of instances.
 *
 *  Each study has one or more series of images or other content.
 */
open class ImagingStudySeries: BackboneElement {
	override open class var resourceType: String {
		get { return "ImagingStudySeries" }
	}

    @objc public dynamic var availability: String?
    @objc public dynamic var bodySite: Coding?
    public func upsert(bodySite: Coding?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }
    @objc public dynamic var description_fhir: String?
    public let instance = RealmSwift.List<ImagingStudySeriesInstance>()
    @objc public dynamic var laterality: Coding?
    public func upsert(laterality: Coding?) {
        upsert(prop: &self.laterality, val: laterality)
    }
    @objc public dynamic var modality: Coding?
    public func upsert(modality: Coding?) {
        upsert(prop: &self.modality, val: modality)
    }
    public let number = RealmOptional<Int>()
    public let numberOfInstances = RealmOptional<Int>()
    @objc public dynamic var started: DateTime?
    @objc public dynamic var uid: String?
    @objc public dynamic var url: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(modality: Coding, numberOfInstances: Int, uid: String) {
        self.init()
        self.modality = modality
        self.numberOfInstances.value = numberOfInstances
        self.uid = uid
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case availability = "availability"
        case bodySite = "bodySite"
        case description_fhir = "description"
        case instance = "instance"
        case laterality = "laterality"
        case modality = "modality"
        case number = "number"
        case numberOfInstances = "numberOfInstances"
        case started = "started"
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

        self.availability = try container.decodeIfPresent(String.self, forKey: .availability)
        self.bodySite = try container.decodeIfPresent(Coding.self, forKey: .bodySite)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.instance.append(objectsIn: try container.decodeIfPresent([ImagingStudySeriesInstance].self, forKey: .instance) ?? [])
        self.laterality = try container.decodeIfPresent(Coding.self, forKey: .laterality)
        self.modality = try container.decodeIfPresent(Coding.self, forKey: .modality)
        self.number.value = try container.decodeIfPresent(Int.self, forKey: .number)
        self.numberOfInstances.value = try container.decodeIfPresent(Int.self, forKey: .numberOfInstances)
        self.started = try container.decodeIfPresent(DateTime.self, forKey: .started)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.availability, forKey: .availability)
        try container.encodeIfPresent(self.bodySite, forKey: .bodySite)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(Array(self.instance), forKey: .instance)
        try container.encodeIfPresent(self.laterality, forKey: .laterality)
        try container.encodeIfPresent(self.modality, forKey: .modality)
        try container.encodeIfPresent(self.number.value, forKey: .number)
        try container.encodeIfPresent(self.numberOfInstances.value, forKey: .numberOfInstances)
        try container.encodeIfPresent(self.started, forKey: .started)
        try container.encodeIfPresent(self.uid, forKey: .uid)
        try container.encodeIfPresent(self.url, forKey: .url)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingStudySeries.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingStudySeries. Will return empty instance: \(error))")
		}
		return ImagingStudySeries.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingStudySeries else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)
        availability = o.availability
        FireKit.populate(&self.bodySite, from: o.bodySite)
        description_fhir = o.description_fhir

        for (index, t) in o.instance.enumerated() {
            guard index < self.instance.count else {
                self.instance.append(t)
                continue
            }
            self.instance[index].populate(from: t)
        }
    
        while self.instance.count > o.instance.count {
            let objectToRemove = self.instance.last!
            self.instance.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        FireKit.populate(&self.laterality, from: o.laterality)
        FireKit.populate(&self.modality, from: o.modality)
        number.value = o.number.value
        numberOfInstances.value = o.numberOfInstances.value
        FireKit.populate(&self.started, from: o.started)
        uid = o.uid
        url = o.url
    }
}


/**
 *  A single SOP instance from the series.
 *
 *  A single SOP Instance within the series, e.g. an image, or presentation state.
 */
open class ImagingStudySeriesInstance: BackboneElement {
	override open class var resourceType: String {
		get { return "ImagingStudySeriesInstance" }
	}

    public let content = RealmSwift.List<Attachment>()
    public let number = RealmOptional<Int>()
    @objc public dynamic var sopClass: String?
    @objc public dynamic var title: String?
    @objc public dynamic var type: String?
    @objc public dynamic var uid: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sopClass: String, uid: String) {
        self.init()
        self.sopClass = sopClass
        self.uid = uid
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case content = "content"
        case number = "number"
        case sopClass = "sopClass"
        case title = "title"
        case type = "type"
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

        self.content.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .content) ?? [])
        self.number.value = try container.decodeIfPresent(Int.self, forKey: .number)
        self.sopClass = try container.decodeIfPresent(String.self, forKey: .sopClass)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.uid = try container.decodeIfPresent(String.self, forKey: .uid)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.content), forKey: .content)
        try container.encodeIfPresent(self.number.value, forKey: .number)
        try container.encodeIfPresent(self.sopClass, forKey: .sopClass)
        try container.encodeIfPresent(self.title, forKey: .title)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.uid, forKey: .uid)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ImagingStudySeriesInstance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ImagingStudySeriesInstance. Will return empty instance: \(error))")
		}
		return ImagingStudySeriesInstance.init()
	}

    public override func populate(from other: Any) {
        guard let o = other as? ImagingStudySeriesInstance else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

        for (index, t) in o.content.enumerated() {
            guard index < self.content.count else {
                self.content.append(t)
                continue
            }
            self.content[index].populate(from: t)
        }
    
        while self.content.count > o.content.count {
            let objectToRemove = self.content.last!
            self.content.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
        }
        number.value = o.number.value
        sopClass = o.sopClass
        title = o.title
        type = o.type
        uid = o.uid
    }
}

