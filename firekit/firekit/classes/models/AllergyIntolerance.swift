//
//  AllergyIntolerance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AllergyIntolerance) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
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

    @objc public dynamic var category: String?
    @objc public dynamic var criticality: String?
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var lastOccurence: DateTime?
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    @objc public dynamic var onset: DateTime?
    @objc public dynamic var patient: Reference?
    public func upsert(patient: Reference?) {
        upsert(prop: &self.patient, val: patient)
    }
    public let reaction = RealmSwift.List<AllergyIntoleranceReaction>()
    @objc public dynamic var recordedDate: DateTime?
    @objc public dynamic var recorder: Reference?
    public func upsert(recorder: Reference?) {
        upsert(prop: &self.recorder, val: recorder)
    }
    @objc public dynamic var reporter: Reference?
    public func upsert(reporter: Reference?) {
        upsert(prop: &self.reporter, val: reporter)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var substance: CodeableConcept?
    public func upsert(substance: CodeableConcept?) {
        upsert(prop: &self.substance, val: substance)
    }
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(patient: Reference, substance: CodeableConcept) {
        self.init()
        self.patient = patient
        self.substance = substance
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case category = "category"
        case criticality = "criticality"
        case identifier = "identifier"
        case lastOccurence = "lastOccurence"
        case note = "note"
        case onset = "onset"
        case patient = "patient"
        case reaction = "reaction"
        case recordedDate = "recordedDate"
        case recorder = "recorder"
        case reporter = "reporter"
        case status = "status"
        case substance = "substance"
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


        // String: String
        if let categoryVal = try container.decodeIfPresent(String.self, forKey: .category) {
          self.category = categoryVal
        }
        // String: String
        if let criticalityVal = try container.decodeIfPresent(String.self, forKey: .criticality) {
          self.criticality = criticalityVal
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        // DateTime: String
        if let lastOccurenceVal = try container.decodeIfPresent(DateTime.self, forKey: .lastOccurence) {
          self.lastOccurence = lastOccurenceVal
        }
        // Annotation: FHIRJSON
        if let noteVal = try container.decodeIfPresent(Annotation.self, forKey: .note) {
          self.note = noteVal
        }
        // DateTime: String
        if let onsetVal = try container.decodeIfPresent(DateTime.self, forKey: .onset) {
          self.onset = onsetVal
        }
        // Reference: FHIRJSON
        if let patientVal = try container.decodeIfPresent(Reference.self, forKey: .patient) {
          self.patient = patientVal
        }
        if let reactionVals = try container.decodeIfPresent([AllergyIntoleranceReaction].self, forKey: .reaction) {
          // AllergyIntoleranceReaction: FHIRJSON
        }
        // DateTime: String
        if let recordedDateVal = try container.decodeIfPresent(DateTime.self, forKey: .recordedDate) {
          self.recordedDate = recordedDateVal
        }
        // Reference: FHIRJSON
        if let recorderVal = try container.decodeIfPresent(Reference.self, forKey: .recorder) {
          self.recorder = recorderVal
        }
        // Reference: FHIRJSON
        if let reporterVal = try container.decodeIfPresent(Reference.self, forKey: .reporter) {
          self.reporter = reporterVal
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        // CodeableConcept: FHIRJSON
        if let substanceVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .substance) {
          self.substance = substanceVal
        }
        // String: String
        if let typeVal = try container.decodeIfPresent(String.self, forKey: .type) {
          self.type = typeVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.category, forKey: .category)
        try container.encodeIfPresent(self.criticality, forKey: .criticality)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.lastOccurence, forKey: .lastOccurence)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.onset, forKey: .onset)
        try container.encodeIfPresent(self.patient, forKey: .patient)
        try container.encode(self.reaction.flatMap { $0 }, forKey: .reaction)
        try container.encodeIfPresent(self.recordedDate, forKey: .recordedDate)
        try container.encodeIfPresent(self.recorder, forKey: .recorder)
        try container.encodeIfPresent(self.reporter, forKey: .reporter)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.substance, forKey: .substance)
        try container.encodeIfPresent(self.type, forKey: .type)
    }
/*
	
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
*/
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

    @objc public dynamic var certainty: String?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var exposureRoute: CodeableConcept?
    public func upsert(exposureRoute: CodeableConcept?) {
        upsert(prop: &self.exposureRoute, val: exposureRoute)
    }
    public let manifestation = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var note: Annotation?
    public func upsert(note: Annotation?) {
        upsert(prop: &self.note, val: note)
    }
    @objc public dynamic var onset: DateTime?
    @objc public dynamic var severity: String?
    @objc public dynamic var substance: CodeableConcept?
    public func upsert(substance: CodeableConcept?) {
        upsert(prop: &self.substance, val: substance)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(manifestation: [CodeableConcept]) {
        self.init()
        self.manifestation.append(objectsIn: manifestation)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case certainty = "certainty"
        case description_fhir = "description"
        case exposureRoute = "exposureRoute"
        case manifestation = "manifestation"
        case note = "note"
        case onset = "onset"
        case severity = "severity"
        case substance = "substance"
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


        // String: String
        if let certaintyVal = try container.decodeIfPresent(String.self, forKey: .certainty) {
          self.certainty = certaintyVal
        }
        // String: String
        if let description_fhirVal = try container.decodeIfPresent(String.self, forKey: .description_fhir) {
          self.description_fhir = description_fhirVal
        }
        // CodeableConcept: FHIRJSON
        if let exposureRouteVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .exposureRoute) {
          self.exposureRoute = exposureRouteVal
        }
        if let manifestationVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .manifestation) {
          // CodeableConcept: FHIRJSON
        }
        // Annotation: FHIRJSON
        if let noteVal = try container.decodeIfPresent(Annotation.self, forKey: .note) {
          self.note = noteVal
        }
        // DateTime: String
        if let onsetVal = try container.decodeIfPresent(DateTime.self, forKey: .onset) {
          self.onset = onsetVal
        }
        // String: String
        if let severityVal = try container.decodeIfPresent(String.self, forKey: .severity) {
          self.severity = severityVal
        }
        // CodeableConcept: FHIRJSON
        if let substanceVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .substance) {
          self.substance = substanceVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.certainty, forKey: .certainty)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.exposureRoute, forKey: .exposureRoute)
        try container.encode(self.manifestation.flatMap { $0 }, forKey: .manifestation)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.onset, forKey: .onset)
        try container.encodeIfPresent(self.severity, forKey: .severity)
        try container.encodeIfPresent(self.substance, forKey: .substance)
    }
/*
	
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
*/
}

