//
//  CommunicationRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/CommunicationRequest) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A request for information to be sent to a receiver.
 *
 *  A request to convey information; e.g. the CDS system proposes that an alert be sent to a responsible provider, the
 *  CDS system proposes that the public health agency be notified about a reportable condition.
 */
open class CommunicationRequest: DomainResource {
	override open class var resourceType: String {
		get { return "CommunicationRequest" }
	}

	public dynamic var category: CodeableConcept?
	
	public dynamic var encounter: Reference?
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public let medium = RealmSwift.List<CodeableConcept>()
	
	public let payload = RealmSwift.List<CommunicationRequestPayload>()
	
	public dynamic var priority: CodeableConcept?
	
	public let reason = RealmSwift.List<CodeableConcept>()
	
	public let recipient = RealmSwift.List<Reference>()
	
	public dynamic var requestedOn: DateTime?
	
	public dynamic var requester: Reference?
	
	public dynamic var scheduledDateTime: DateTime?
	
	public dynamic var scheduledPeriod: Period?
	
	public dynamic var sender: Reference?
	
	public dynamic var status: String?
	
	public dynamic var subject: Reference?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["medium"] {
				presentKeys.insert("medium")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.medium) }
						self.medium.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "medium", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["payload"] {
				presentKeys.insert("payload")
				if let val = exist as? [FHIRJSON] {
					if let vals = CommunicationRequestPayload.instantiate(fromArray: val, owner: self) as? [CommunicationRequestPayload] {
						if let realm = self.realm { realm.delete(self.payload) }
						self.payload.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "payload", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["priority"] {
				presentKeys.insert("priority")
				if let val = exist as? FHIRJSON {
					if let priority = self.priority {
                        errors.append(contentsOf: priority.populate(from: val) ?? [])
                    } else {
                        self.priority = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "priority", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.reason) }
						self.reason.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["recipient"] {
				presentKeys.insert("recipient")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.recipient) }
						self.recipient.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "recipient", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestedOn"] {
				presentKeys.insert("requestedOn")
				if let val = exist as? String {
					self.requestedOn = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "requestedOn", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["requester"] {
				presentKeys.insert("requester")
				if let val = exist as? FHIRJSON {
					if let requester = self.requester {
                        errors.append(contentsOf: requester.populate(from: val) ?? [])
                    } else {
                        self.requester = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "requester", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["sender"] {
				presentKeys.insert("sender")
				if let val = exist as? FHIRJSON {
					if let sender = self.sender {
                        errors.append(contentsOf: sender.populate(from: val) ?? [])
                    } else {
                        self.sender = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "sender", wants: FHIRJSON.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if medium.count > 0 {
			json["medium"] = Array(medium.map() { $0.asJSON() })
		}
		if payload.count > 0 {
			json["payload"] = Array(payload.map() { $0.asJSON() })
		}
		if let priority = self.priority {
			json["priority"] = priority.asJSON()
		}
		if reason.count > 0 {
			json["reason"] = Array(reason.map() { $0.asJSON() })
		}
		if recipient.count > 0 {
			json["recipient"] = Array(recipient.map() { $0.asJSON() })
		}
		if let requestedOn = self.requestedOn {
			json["requestedOn"] = requestedOn.asJSON()
		}
		if let requester = self.requester {
			json["requester"] = requester.asJSON()
		}
		if let scheduledDateTime = self.scheduledDateTime {
			json["scheduledDateTime"] = scheduledDateTime.asJSON()
		}
		if let scheduledPeriod = self.scheduledPeriod {
			json["scheduledPeriod"] = scheduledPeriod.asJSON()
		}
		if let sender = self.sender {
			json["sender"] = sender.asJSON()
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


/**
 *  Message payload.
 *
 *  Text, attachment(s), or resource(s) to be communicated to the recipient.
 */
open class CommunicationRequestPayload: BackboneElement {
	override open class var resourceType: String {
		get { return "CommunicationRequestPayload" }
	}

	public dynamic var contentAttachment: Attachment?
	
	public dynamic var contentReference: Reference?
	
	public dynamic var contentString: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(contentAttachment: Attachment, contentReference: Reference, contentString: String) {
		self.init(json: nil)
		self.contentAttachment = contentAttachment
		self.contentReference = contentReference
		self.contentString = contentString
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contentAttachment"] {
				presentKeys.insert("contentAttachment")
				if let val = exist as? FHIRJSON {
					if let contentAttachment = self.contentAttachment {
                        errors.append(contentsOf: contentAttachment.populate(from: val) ?? [])
                    } else {
                        self.contentAttachment = Attachment(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "contentAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentReference"] {
				presentKeys.insert("contentReference")
				if let val = exist as? FHIRJSON {
					if let contentReference = self.contentReference {
                        errors.append(contentsOf: contentReference.populate(from: val) ?? [])
                    } else {
                        self.contentReference = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "contentReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentString"] {
				presentKeys.insert("contentString")
				if let val = exist as? String {
					self.contentString = val
				}
				else {
					errors.append(FHIRJSONError(key: "contentString", wants: String.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.contentString && nil == self.contentAttachment && nil == self.contentReference {
				errors.append(FHIRJSONError(key: "content*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contentAttachment = self.contentAttachment {
			json["contentAttachment"] = contentAttachment.asJSON()
		}
		if let contentReference = self.contentReference {
			json["contentReference"] = contentReference.asJSON()
		}
		if let contentString = self.contentString {
			json["contentString"] = contentString.asJSON()
		}
		
		return json
	}
}

