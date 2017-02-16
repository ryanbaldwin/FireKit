//
//  Procedure.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Procedure) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  An action that is being or was performed on a patient.
 *
 *  An action that is or was performed on a patient. This can be a physical intervention like an operation, or less
 *  invasive like counseling or hypnotherapy.
 */
open class Procedure: DomainResource {
	override open class var resourceType: String {
		get { return "Procedure" }
	}

	public let bodySite = RealmSwift.List<CodeableConcept>()
	
	public dynamic var category: CodeableConcept?
	
	public dynamic var code: CodeableConcept?
	
	public let complication = RealmSwift.List<CodeableConcept>()
	
	public dynamic var encounter: Reference?
	
	public let focalDevice = RealmSwift.List<ProcedureFocalDevice>()
	
	public let followUp = RealmSwift.List<CodeableConcept>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var location: Reference?
	
	public let notPerformed = RealmOptional<Bool>()
	
	public let notes = RealmSwift.List<Annotation>()
	
	public dynamic var outcome: CodeableConcept?
	
	public dynamic var performedDateTime: DateTime?
	
	public dynamic var performedPeriod: Period?
	
	public let performer = RealmSwift.List<ProcedurePerformer>()
	
	public dynamic var reasonCodeableConcept: CodeableConcept?
	
	public let reasonNotPerformed = RealmSwift.List<CodeableConcept>()
	
	public dynamic var reasonReference: Reference?
	
	public let report = RealmSwift.List<Reference>()
	
	public dynamic var request: Reference?
	
	public dynamic var status: String?
	
	public dynamic var subject: Reference?
	
	public let used = RealmSwift.List<Reference>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: CodeableConcept, status: String, subject: Reference) {
		self.init(json: nil)
		self.code = code
		self.status = status
		self.subject = subject
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["bodySite"] {
				presentKeys.insert("bodySite")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.bodySite) }
						self.bodySite.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "bodySite", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					if let category = self.category {
                        errors.append(contentsOf: category.populate(from: val) ?? [])
                    } else {
                        self.category = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					if let code = self.code {
                        errors.append(contentsOf: code.populate(from: val) ?? [])
                    } else {
                        self.code = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["complication"] {
				presentKeys.insert("complication")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.complication) }
						self.complication.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "complication", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					if let encounter = self.encounter {
                        errors.append(contentsOf: encounter.populate(from: val) ?? [])
                    } else {
                        self.encounter = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["focalDevice"] {
				presentKeys.insert("focalDevice")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProcedureFocalDevice.instantiate(fromArray: val, owner: self) as? [ProcedureFocalDevice] {
						if let realm = self.realm { realm.delete(self.focalDevice) }
						self.focalDevice.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "focalDevice", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["followUp"] {
				presentKeys.insert("followUp")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.followUp) }
						self.followUp.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "followUp", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					if let location = self.location {
                        errors.append(contentsOf: location.populate(from: val) ?? [])
                    } else {
                        self.location = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["notPerformed"] {
				presentKeys.insert("notPerformed")
				if let val = exist as? Bool {
					self.notPerformed.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "notPerformed", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? [FHIRJSON] {
					if let vals = Annotation.instantiate(fromArray: val, owner: self) as? [Annotation] {
						if let realm = self.realm { realm.delete(self.notes) }
						self.notes.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? FHIRJSON {
					if let outcome = self.outcome {
                        errors.append(contentsOf: outcome.populate(from: val) ?? [])
                    } else {
                        self.outcome = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["performedDateTime"] {
				presentKeys.insert("performedDateTime")
				if let val = exist as? String {
					self.performedDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "performedDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["performedPeriod"] {
				presentKeys.insert("performedPeriod")
				if let val = exist as? FHIRJSON {
					if let performedPeriod = self.performedPeriod {
                        errors.append(contentsOf: performedPeriod.populate(from: val) ?? [])
                    } else {
                        self.performedPeriod = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "performedPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProcedurePerformer.instantiate(fromArray: val, owner: self) as? [ProcedurePerformer] {
						if let realm = self.realm { realm.delete(self.performer) }
						self.performer.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonCodeableConcept"] {
				presentKeys.insert("reasonCodeableConcept")
				if let val = exist as? FHIRJSON {
					if let reasonCodeableConcept = self.reasonCodeableConcept {
                        errors.append(contentsOf: reasonCodeableConcept.populate(from: val) ?? [])
                    } else {
                        self.reasonCodeableConcept = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "reasonCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonNotPerformed"] {
				presentKeys.insert("reasonNotPerformed")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reasonNotPerformed) }
						self.reasonNotPerformed.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reasonNotPerformed", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reasonReference"] {
				presentKeys.insert("reasonReference")
				if let val = exist as? FHIRJSON {
					if let reasonReference = self.reasonReference {
                        errors.append(contentsOf: reasonReference.populate(from: val) ?? [])
                    } else {
                        self.reasonReference = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "reasonReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["report"] {
				presentKeys.insert("report")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.report) }
						self.report.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "report", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					if let request = self.request {
                        errors.append(contentsOf: request.populate(from: val) ?? [])
                    } else {
                        self.request = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
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
					if let subject = self.subject {
                        errors.append(contentsOf: subject.populate(from: val) ?? [])
                    } else {
                        self.subject = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "subject"))
			}
			if let exist = js["used"] {
				presentKeys.insert("used")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.used) }
						self.used.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "used", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if bodySite.count > 0 {
			json["bodySite"] = Array(bodySite.map() { $0.asJSON() })
		}
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if complication.count > 0 {
			json["complication"] = Array(complication.map() { $0.asJSON() })
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if focalDevice.count > 0 {
			json["focalDevice"] = Array(focalDevice.map() { $0.asJSON() })
		}
		if followUp.count > 0 {
			json["followUp"] = Array(followUp.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let notPerformed = self.notPerformed.value {
			json["notPerformed"] = notPerformed.asJSON()
		}
		if notes.count > 0 {
			json["notes"] = Array(notes.map() { $0.asJSON() })
		}
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let performedDateTime = self.performedDateTime {
			json["performedDateTime"] = performedDateTime.asJSON()
		}
		if let performedPeriod = self.performedPeriod {
			json["performedPeriod"] = performedPeriod.asJSON()
		}
		if performer.count > 0 {
			json["performer"] = Array(performer.map() { $0.asJSON() })
		}
		if let reasonCodeableConcept = self.reasonCodeableConcept {
			json["reasonCodeableConcept"] = reasonCodeableConcept.asJSON()
		}
		if reasonNotPerformed.count > 0 {
			json["reasonNotPerformed"] = Array(reasonNotPerformed.map() { $0.asJSON() })
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.asJSON()
		}
		if report.count > 0 {
			json["report"] = Array(report.map() { $0.asJSON() })
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if used.count > 0 {
			json["used"] = Array(used.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Device changed in procedure.
 *
 *  A device that is implanted, removed or otherwise manipulated (calibration, battery replacement, fitting a
 *  prosthesis, attaching a wound-vac, etc.) as a focal portion of the Procedure.
 */
open class ProcedureFocalDevice: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcedureFocalDevice" }
	}

	public dynamic var action: CodeableConcept?
	
	public dynamic var manipulated: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(manipulated: Reference) {
		self.init(json: nil)
		self.manipulated = manipulated
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? FHIRJSON {
					if let action = self.action {
                        errors.append(contentsOf: action.populate(from: val) ?? [])
                    } else {
                        self.action = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["manipulated"] {
				presentKeys.insert("manipulated")
				if let val = exist as? FHIRJSON {
					if let manipulated = self.manipulated {
                        errors.append(contentsOf: manipulated.populate(from: val) ?? [])
                    } else {
                        self.manipulated = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "manipulated", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "manipulated"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let manipulated = self.manipulated {
			json["manipulated"] = manipulated.asJSON()
		}
		
		return json
	}
}


/**
 *  The people who performed the procedure.
 *
 *  Limited to 'real' people rather than equipment.
 */
open class ProcedurePerformer: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcedurePerformer" }
	}

	public dynamic var actor: Reference?
	
	public dynamic var role: CodeableConcept?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["actor"] {
				presentKeys.insert("actor")
				if let val = exist as? FHIRJSON {
					if let actor = self.actor {
                        errors.append(contentsOf: actor.populate(from: val) ?? [])
                    } else {
                        self.actor = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "actor", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? FHIRJSON {
					if let role = self.role {
                        errors.append(contentsOf: role.populate(from: val) ?? [])
                    } else {
                        self.role = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let actor = self.actor {
			json["actor"] = actor.asJSON()
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		
		return json
	}
}

