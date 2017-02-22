//
//  ImagingStudy.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ImagingStudy) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
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
    
    public dynamic var accession: Identifier?        
    public func upsert(accession: Identifier?) {
        upsert(prop: &self.accession, val: accession)
    }    
    public dynamic var availability: String?        
        
    public dynamic var description_fhir: String?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var interpreter: Reference?        
    public func upsert(interpreter: Reference?) {
        upsert(prop: &self.interpreter, val: interpreter)
    }    
    public let modalityList = RealmSwift.List<Coding>()    
    public let numberOfInstances = RealmOptional<Int>()    
    public let numberOfSeries = RealmOptional<Int>()    
    public let order = RealmSwift.List<Reference>()    
    public dynamic var patient: Reference?        
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }    
    public let procedure = RealmSwift.List<Reference>()    
    public dynamic var referrer: Reference?        
    public func upsert(referrer: Reference?) {
        upsert(prop: &self.referrer, val: referrer)
    }    
    public let series = RealmSwift.List<ImagingStudySeries>()    
    public dynamic var started: DateTime?        
        
    public dynamic var uid: String?        
        
    public dynamic var url: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(numberOfInstances: Int, numberOfSeries: Int, patient: Reference, uid: String) {
        self.init(json: nil)
        self.numberOfInstances.value = numberOfInstances
        self.numberOfSeries.value = numberOfSeries
        self.patient = patient
        self.uid = uid
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["accession"] {
				presentKeys.insert("accession")
				if let val = exist as? FHIRJSON {
					upsert(accession: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "accession", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["availability"] {
				presentKeys.insert("availability")
				if let val = exist as? String {
					self.availability = val
				}
				else {
					errors.append(FHIRJSONError(key: "availability", wants: String.self, has: type(of: exist)))
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
			if let exist = js["interpreter"] {
				presentKeys.insert("interpreter")
				if let val = exist as? FHIRJSON {
					upsert(interpreter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "interpreter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["modalityList"] {
				presentKeys.insert("modalityList")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.modalityList) }
						self.modalityList.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "modalityList", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["numberOfInstances"] {
				presentKeys.insert("numberOfInstances")
				if let val = exist as? Int {
					self.numberOfInstances.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "numberOfInstances", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "numberOfInstances"))
			}
			if let exist = js["numberOfSeries"] {
				presentKeys.insert("numberOfSeries")
				if let val = exist as? Int {
					self.numberOfSeries.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "numberOfSeries", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "numberOfSeries"))
			}
			if let exist = js["order"] {
				presentKeys.insert("order")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.order) }
						self.order.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "order", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["procedure"] {
				presentKeys.insert("procedure")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.procedure) }
						self.procedure.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "procedure", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["referrer"] {
				presentKeys.insert("referrer")
				if let val = exist as? FHIRJSON {
					upsert(referrer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "referrer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["series"] {
				presentKeys.insert("series")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImagingStudySeries.instantiate(fromArray: val, owner: self) as? [ImagingStudySeries] {
						if let realm = self.realm { realm.delete(self.series) }
						self.series.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "series", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["started"] {
				presentKeys.insert("started")
				if let val = exist as? String {
					self.started = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "started", wants: String.self, has: type(of: exist)))
				}
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
		
		if let accession = self.accession {
			json["accession"] = accession.asJSON()
		}
		if let availability = self.availability {
			json["availability"] = availability.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let interpreter = self.interpreter {
			json["interpreter"] = interpreter.asJSON()
		}
		if modalityList.count > 0 {
			json["modalityList"] = Array(modalityList.map() { $0.asJSON() })
		}
		if let numberOfInstances = self.numberOfInstances.value {
			json["numberOfInstances"] = numberOfInstances.asJSON()
		}
		if let numberOfSeries = self.numberOfSeries.value {
			json["numberOfSeries"] = numberOfSeries.asJSON()
		}
		if order.count > 0 {
			json["order"] = Array(order.map() { $0.asJSON() })
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if procedure.count > 0 {
			json["procedure"] = Array(procedure.map() { $0.asJSON() })
		}
		if let referrer = self.referrer {
			json["referrer"] = referrer.asJSON()
		}
		if series.count > 0 {
			json["series"] = Array(series.map() { $0.asJSON() })
		}
		if let started = self.started {
			json["started"] = started.asJSON()
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
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
    
    public dynamic var availability: String?        
        
    public dynamic var bodySite: Coding?        
    public func upsert(bodySite: Coding?) {
        upsert(prop: &self.bodySite, val: bodySite)
    }    
    public dynamic var description_fhir: String?        
        
    public let instance = RealmSwift.List<ImagingStudySeriesInstance>()    
    public dynamic var laterality: Coding?        
    public func upsert(laterality: Coding?) {
        upsert(prop: &self.laterality, val: laterality)
    }    
    public dynamic var modality: Coding?        
    public func upsert(modality: Coding?) {
        upsert(prop: &self.modality, val: modality)
    }    
    public let number = RealmOptional<Int>()    
    public let numberOfInstances = RealmOptional<Int>()    
    public dynamic var started: DateTime?        
        
    public dynamic var uid: String?        
        
    public dynamic var url: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(modality: Coding, numberOfInstances: Int, uid: String) {
        self.init(json: nil)
        self.modality = modality
        self.numberOfInstances.value = numberOfInstances
        self.uid = uid
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["availability"] {
				presentKeys.insert("availability")
				if let val = exist as? String {
					self.availability = val
				}
				else {
					errors.append(FHIRJSONError(key: "availability", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? FHIRJSON {
					upsert(bodySite: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["instance"] {
				presentKeys.insert("instance")
				if let val = exist as? [FHIRJSON] {
					if let vals = ImagingStudySeriesInstance.instantiate(fromArray: val, owner: self) as? [ImagingStudySeriesInstance] {
						if let realm = self.realm { realm.delete(self.instance) }
						self.instance.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "instance", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["laterality"] {
				presentKeys.insert("laterality")
				if let val = exist as? FHIRJSON {
					upsert(laterality: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "laterality", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["modality"] {
				presentKeys.insert("modality")
				if let val = exist as? FHIRJSON {
					upsert(modality: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "modality", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "modality"))
			}
			if let exist = js["number"] {
				presentKeys.insert("number")
				if let val = exist as? Int {
					self.number.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "number", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["numberOfInstances"] {
				presentKeys.insert("numberOfInstances")
				if let val = exist as? Int {
					self.numberOfInstances.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "numberOfInstances", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "numberOfInstances"))
			}
			if let exist = js["started"] {
				presentKeys.insert("started")
				if let val = exist as? String {
					self.started = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "started", wants: String.self, has: type(of: exist)))
				}
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
		
		if let availability = self.availability {
			json["availability"] = availability.asJSON()
		}
		if let bodySite = self.bodySite {
			json["bodySite"] = bodySite.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if instance.count > 0 {
			json["instance"] = Array(instance.map() { $0.asJSON() })
		}
		if let laterality = self.laterality {
			json["laterality"] = laterality.asJSON()
		}
		if let modality = self.modality {
			json["modality"] = modality.asJSON()
		}
		if let number = self.number.value {
			json["number"] = number.asJSON()
		}
		if let numberOfInstances = self.numberOfInstances.value {
			json["numberOfInstances"] = numberOfInstances.asJSON()
		}
		if let started = self.started {
			json["started"] = started.asJSON()
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
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
    public dynamic var sopClass: String?        
        
    public dynamic var title: String?        
        
    public dynamic var type: String?        
        
    public dynamic var uid: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sopClass: String, uid: String) {
        self.init(json: nil)
        self.sopClass = sopClass
        self.uid = uid
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["content"] {
				presentKeys.insert("content")
				if let val = exist as? [FHIRJSON] {
					if let vals = Attachment.instantiate(fromArray: val, owner: self) as? [Attachment] {
						if let realm = self.realm { realm.delete(self.content) }
						self.content.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "content", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["number"] {
				presentKeys.insert("number")
				if let val = exist as? Int {
					self.number.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "number", wants: Int.self, has: type(of: exist)))
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
			if let exist = js["title"] {
				presentKeys.insert("title")
				if let val = exist as? String {
					self.title = val
				}
				else {
					errors.append(FHIRJSONError(key: "title", wants: String.self, has: type(of: exist)))
				}
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
		
		if content.count > 0 {
			json["content"] = Array(content.map() { $0.asJSON() })
		}
		if let number = self.number.value {
			json["number"] = number.asJSON()
		}
		if let sopClass = self.sopClass {
			json["sopClass"] = sopClass.asJSON()
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let uid = self.uid {
			json["uid"] = uid.asJSON()
		}
		
		return json
	}
}

