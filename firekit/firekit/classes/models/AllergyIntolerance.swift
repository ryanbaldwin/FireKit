//
//  AllergyIntolerance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AllergyIntolerance) on 2017-04-03.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Allergy or Intolerance (generally: Risk Of Adverse reaction to a substance).
 *
 *  Risk of harmful or undesirable, physiological response which is unique to an individual and associated with exposure
 *  to a substance.
 */
open class AllergyIntolerance: DomainResource {
	override open class var resourceType: String {
		get { return "AllergyIntolerance" }
	}
    
    public dynamic var category: String?        
        
    public dynamic var criticality: String?        
        
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var lastOccurence: DateTime?        
        
    public dynamic var note: Annotation?        
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }    
    public dynamic var onset: DateTime?        
        
    public dynamic var patient: Reference?        
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }    
    public let reaction = RealmSwift.List<AllergyIntoleranceReaction>()    
    public dynamic var recordedDate: DateTime?        
        
    public dynamic var recorder: Reference?        
    public func upsert(recorder: Reference?) {
        upsert(prop: &self.recorder, val: recorder)
    }    
    public dynamic var reporter: Reference?        
    public func upsert(reporter: Reference?) {
        upsert(prop: &self.reporter, val: reporter)
    }    
    public dynamic var status: String?        
        
    public dynamic var substance: CodeableConcept?        
    public func upsert(substance: CodeableConcept?) {
        upsert(prop: &self.substance, val: substance)
    }    
    public dynamic var type: String?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, substance: CodeableConcept) {
        self.init(json: nil)
        self.patient = patient
        self.substance = substance
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? String {
					self.category = val
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["criticality"] {
				presentKeys.insert("criticality")
				if let val = exist as? String {
					self.criticality = val
				}
				else {
					errors.append(FHIRJSONError(key: "criticality", wants: String.self, has: type(of: exist)))
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
			if let exist = js["lastOccurence"] {
				presentKeys.insert("lastOccurence")
				if let val = exist as? String {
					self.lastOccurence = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "lastOccurence", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? FHIRJSON {
					upsert(note: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onset"] {
				presentKeys.insert("onset")
				if let val = exist as? String {
					self.onset = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "onset", wants: String.self, has: type(of: exist)))
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
			if let exist = js["reaction"] {
				presentKeys.insert("reaction")
				if let val = exist as? [FHIRJSON] {
					if let vals = AllergyIntoleranceReaction.instantiate(fromArray: val, owner: self) as? [AllergyIntoleranceReaction] {
						if let realm = self.realm { realm.delete(self.reaction) }
						self.reaction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reaction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["recordedDate"] {
				presentKeys.insert("recordedDate")
				if let val = exist as? String {
					self.recordedDate = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "recordedDate", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["recorder"] {
				presentKeys.insert("recorder")
				if let val = exist as? FHIRJSON {
					upsert(recorder: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "recorder", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reporter"] {
				presentKeys.insert("reporter")
				if let val = exist as? FHIRJSON {
					upsert(reporter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reporter", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["substance"] {
				presentKeys.insert("substance")
				if let val = exist as? FHIRJSON {
					upsert(substance: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "substance", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "substance"))
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
		
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let criticality = self.criticality {
			json["criticality"] = criticality.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let lastOccurence = self.lastOccurence {
			json["lastOccurence"] = lastOccurence.asJSON()
		}
		if let note = self.note {
			json["note"] = note.asJSON()
		}
		if let onset = self.onset {
			json["onset"] = onset.asJSON()
		}
		if let patient = self.patient {
			json["patient"] = patient.asJSON()
		}
		if reaction.count > 0 {
			json["reaction"] = Array(reaction.map() { $0.asJSON() })
		}
		if let recordedDate = self.recordedDate {
			json["recordedDate"] = recordedDate.asJSON()
		}
		if let recorder = self.recorder {
			json["recorder"] = recorder.asJSON()
		}
		if let reporter = self.reporter {
			json["reporter"] = reporter.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let substance = self.substance {
			json["substance"] = substance.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Adverse Reaction Events linked to exposure to substance.
 *
 *  Details about each adverse reaction event linked to exposure to the identified Substance.
 */
open class AllergyIntoleranceReaction: BackboneElement {
	override open class var resourceType: String {
		get { return "AllergyIntoleranceReaction" }
	}
    
    public dynamic var certainty: String?        
        
    public dynamic var description_fhir: String?        
        
    public dynamic var exposureRoute: CodeableConcept?        
    public func upsert(exposureRoute: CodeableConcept?) {
        upsert(prop: &self.exposureRoute, val: exposureRoute)
    }    
    public let manifestation = RealmSwift.List<CodeableConcept>()    
    public dynamic var note: Annotation?        
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }    
    public dynamic var onset: DateTime?        
        
    public dynamic var severity: String?        
        
    public dynamic var substance: CodeableConcept?        
    public func upsert(substance: CodeableConcept?) {
        upsert(prop: &self.substance, val: substance)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(manifestation: [CodeableConcept]) {
        self.init(json: nil)
        self.manifestation.append(objectsIn: manifestation)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["certainty"] {
				presentKeys.insert("certainty")
				if let val = exist as? String {
					self.certainty = val
				}
				else {
					errors.append(FHIRJSONError(key: "certainty", wants: String.self, has: type(of: exist)))
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
			if let exist = js["exposureRoute"] {
				presentKeys.insert("exposureRoute")
				if let val = exist as? FHIRJSON {
					upsert(exposureRoute: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "exposureRoute", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["manifestation"] {
				presentKeys.insert("manifestation")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.manifestation) }
						self.manifestation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "manifestation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "manifestation"))
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? FHIRJSON {
					upsert(note: Annotation(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["onset"] {
				presentKeys.insert("onset")
				if let val = exist as? String {
					self.onset = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "onset", wants: String.self, has: type(of: exist)))
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
			if let exist = js["substance"] {
				presentKeys.insert("substance")
				if let val = exist as? FHIRJSON {
					upsert(substance: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "substance", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let certainty = self.certainty {
			json["certainty"] = certainty.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let exposureRoute = self.exposureRoute {
			json["exposureRoute"] = exposureRoute.asJSON()
		}
		if manifestation.count > 0 {
			json["manifestation"] = Array(manifestation.map() { $0.asJSON() })
		}
		if let note = self.note {
			json["note"] = note.asJSON()
		}
		if let onset = self.onset {
			json["onset"] = onset.asJSON()
		}
		if let severity = self.severity {
			json["severity"] = severity.asJSON()
		}
		if let substance = self.substance {
			json["substance"] = substance.asJSON()
		}
		
		return json
	}
}

