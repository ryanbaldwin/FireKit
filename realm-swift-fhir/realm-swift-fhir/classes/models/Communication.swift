//
//  Communication.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Communication) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A record of information transmitted from a sender to a receiver.
 *
 *  An occurrence of information being transmitted; e.g. an alert that was sent to a responsible provider, a public
 *  health agency was notified about a reportable condition.
 */
open class Communication: DomainResource {
	override open class var resourceType: String {
		get { return "Communication" }
	}
    
    public dynamic var category: CodeableConcept?        
    public func upsert(category: CodeableConcept?) {
        upsert(prop: &self.category, val: category)
    }    
    public dynamic var encounter: Reference?        
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }    
    public let identifier = RealmSwift.List<Identifier>()    
    public let medium = RealmSwift.List<CodeableConcept>()    
    public let payload = RealmSwift.List<CommunicationPayload>()    
    public let reason = RealmSwift.List<CodeableConcept>()    
    public dynamic var received: DateTime?        
        
    public let recipient = RealmSwift.List<Reference>()    
    public dynamic var requestDetail: Reference?        
    public func upsert(requestDetail: Reference?) {
        upsert(prop: &self.requestDetail, val: requestDetail)
    }    
    public dynamic var sender: Reference?        
    public func upsert(sender: Reference?) {
        upsert(prop: &self.sender, val: sender)
    }    
    public dynamic var sent: DateTime?        
        
    public dynamic var status: String?        
        
    public dynamic var subject: Reference?        
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["category"] {
				presentKeys.insert("category")
				if let val = exist as? FHIRJSON {
					upsert(category: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "category", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
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
					if let vals = CommunicationPayload.instantiate(fromArray: val, owner: self) as? [CommunicationPayload] {
						if let realm = self.realm { realm.delete(self.payload) }
						self.payload.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "payload", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["received"] {
				presentKeys.insert("received")
				if let val = exist as? String {
					self.received = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "received", wants: String.self, has: type(of: exist)))
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
			if let exist = js["requestDetail"] {
				presentKeys.insert("requestDetail")
				if let val = exist as? FHIRJSON {
					upsert(requestDetail: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "requestDetail", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["sender"] {
				presentKeys.insert("sender")
				if let val = exist as? FHIRJSON {
					upsert(sender: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "sender", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["sent"] {
				presentKeys.insert("sent")
				if let val = exist as? String {
					self.sent = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "sent", wants: String.self, has: type(of: exist)))
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
					upsert(subject: Reference(json: val, owner: self))
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
		if reason.count > 0 {
			json["reason"] = Array(reason.map() { $0.asJSON() })
		}
		if let received = self.received {
			json["received"] = received.asJSON()
		}
		if recipient.count > 0 {
			json["recipient"] = Array(recipient.map() { $0.asJSON() })
		}
		if let requestDetail = self.requestDetail {
			json["requestDetail"] = requestDetail.asJSON()
		}
		if let sender = self.sender {
			json["sender"] = sender.asJSON()
		}
		if let sent = self.sent {
			json["sent"] = sent.asJSON()
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
 *  Text, attachment(s), or resource(s) that was communicated to the recipient.
 */
open class CommunicationPayload: BackboneElement {
	override open class var resourceType: String {
		get { return "CommunicationPayload" }
	}
    
    public dynamic var contentAttachment: Attachment?        
    public func upsert(contentAttachment: Attachment?) {
        upsert(prop: &self.contentAttachment, val: contentAttachment)
    }    
    public dynamic var contentReference: Reference?        
    public func upsert(contentReference: Reference?) {
        upsert(prop: &self.contentReference, val: contentReference)
    }    
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
					upsert(contentAttachment: Attachment(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contentAttachment", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contentReference"] {
				presentKeys.insert("contentReference")
				if let val = exist as? FHIRJSON {
					upsert(contentReference: Reference(json: val, owner: self))
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

