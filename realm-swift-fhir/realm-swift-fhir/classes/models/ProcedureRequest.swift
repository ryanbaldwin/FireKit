//
//  ProcedureRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ProcedureRequest) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A request for a procedure to be performed.
 *
 *  A request for a procedure to be performed. May be a proposal or an order.
 */
open class ProcedureRequest: DomainResource {
	override open class var resourceType: String {
		get { return "ProcedureRequest" }
	}

	public let asNeededBoolean = RealmOptional<Bool>()
	
	public dynamic var asNeededCodeableConcept: CodeableConcept?
	
	public let bodySite = RealmSwift.List<CodeableConcept>()
	
	public dynamic var code: CodeableConcept?
	
	public dynamic var encounter: Reference?
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public let notes = RealmSwift.List<Annotation>()
	
	public dynamic var orderedOn: DateTime?
	
	public dynamic var orderer: Reference?
	
	public dynamic var performer: Reference?
	
	public dynamic var priority: String?
	
	public dynamic var reasonCodeableConcept: CodeableConcept?
	
	public dynamic var reasonReference: Reference?
	
	public dynamic var scheduledDateTime: DateTime?
	
	public dynamic var scheduledPeriod: Period?
	
	public dynamic var scheduledTiming: Timing?
	
	public dynamic var status: String?
	
	public dynamic var subject: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: CodeableConcept, subject: Reference) {
		self.init(json: nil)
		self.code = code
		self.subject = subject
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["asNeededBoolean"] {
				presentKeys.insert("asNeededBoolean")
				if let val = exist as? Bool {
					self.asNeededBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "asNeededBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["asNeededCodeableConcept"] {
				presentKeys.insert("asNeededCodeableConcept")
				if let val = exist as? FHIRJSON {
					if let asNeededCodeableConcept = self.asNeededCodeableConcept {
                        errors.append(contentsOf: asNeededCodeableConcept.populate(from: val) ?? [])
                    } else {
                        self.asNeededCodeableConcept = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "asNeededCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
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
			if let exist = js["orderedOn"] {
				presentKeys.insert("orderedOn")
				if let val = exist as? String {
					self.orderedOn = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "orderedOn", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["orderer"] {
				presentKeys.insert("orderer")
				if let val = exist as? FHIRJSON {
					if let orderer = self.orderer {
                        errors.append(contentsOf: orderer.populate(from: val) ?? [])
                    } else {
                        self.orderer = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "orderer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? FHIRJSON {
					if let performer = self.performer {
                        errors.append(contentsOf: performer.populate(from: val) ?? [])
                    } else {
                        self.performer = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? String {
					self.priority = val
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: String.self, has: type(of: exist)))
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
			if let exist = js["scheduledDateTime"] {
				presentKeys.insert("scheduledDateTime")
				if let val = exist as? String {
					self.scheduledDateTime = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "scheduledDateTime", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["scheduledPeriod"] {
				presentKeys.insert("scheduledPeriod")
				if let val = exist as? FHIRJSON {
					if let scheduledPeriod = self.scheduledPeriod {
                        errors.append(contentsOf: scheduledPeriod.populate(from: val) ?? [])
                    } else {
                        self.scheduledPeriod = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "scheduledPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["scheduledTiming"] {
				presentKeys.insert("scheduledTiming")
				if let val = exist as? FHIRJSON {
					if let scheduledTiming = self.scheduledTiming {
                        errors.append(contentsOf: scheduledTiming.populate(from: val) ?? [])
                    } else {
                        self.scheduledTiming = Timing(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "scheduledTiming", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let asNeededBoolean = self.asNeededBoolean.value {
			json["asNeededBoolean"] = asNeededBoolean.asJSON()
		}
		if let asNeededCodeableConcept = self.asNeededCodeableConcept {
			json["asNeededCodeableConcept"] = asNeededCodeableConcept.asJSON()
		}
		if bodySite.count > 0 {
			json["bodySite"] = Array(bodySite.map() { $0.asJSON() })
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if notes.count > 0 {
			json["notes"] = Array(notes.map() { $0.asJSON() })
		}
		if let orderedOn = self.orderedOn {
			json["orderedOn"] = orderedOn.asJSON()
		}
		if let orderer = self.orderer {
			json["orderer"] = orderer.asJSON()
		}
		if let performer = self.performer {
			json["performer"] = performer.asJSON()
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if let reasonCodeableConcept = self.reasonCodeableConcept {
			json["reasonCodeableConcept"] = reasonCodeableConcept.asJSON()
		}
		if let reasonReference = self.reasonReference {
			json["reasonReference"] = reasonReference.asJSON()
		}
		if let scheduledDateTime = self.scheduledDateTime {
			json["scheduledDateTime"] = scheduledDateTime.asJSON()
		}
		if let scheduledPeriod = self.scheduledPeriod {
			json["scheduledPeriod"] = scheduledPeriod.asJSON()
		}
		if let scheduledTiming = self.scheduledTiming {
			json["scheduledTiming"] = scheduledTiming.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
}

