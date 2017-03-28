//
//  AuditEvent.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/AuditEvent) on 2017-03-28.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Event record kept for security purposes.
 *
 *  A record of an event made for purposes of maintaining a security log. Typical uses include detection of intrusion
 *  attempts and monitoring for inappropriate usage.
 */
open class AuditEvent: DomainResource {
	override open class var resourceType: String {
		get { return "AuditEvent" }
	}
    
    public dynamic var event: AuditEventEvent?        
    public func upsert(event: AuditEventEvent?) {
        upsert(prop: &self.event, val: event)
    }    
    public let object = RealmSwift.List<AuditEventObject>()    
    public let participant = RealmSwift.List<AuditEventParticipant>()    
    public dynamic var source: AuditEventSource?        
    public func upsert(source: AuditEventSource?) {
        upsert(prop: &self.source, val: source)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(event: AuditEventEvent, participant: [AuditEventParticipant], source: AuditEventSource) {
        self.init(json: nil)
        self.event = event
        self.participant.append(objectsIn: participant)
        self.source = source
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? FHIRJSON {
					upsert(event: AuditEventEvent(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "event"))
			}
			if let exist = js["object"] {
				presentKeys.insert("object")
				if let val = exist as? [FHIRJSON] {
					if let vals = AuditEventObject.instantiate(fromArray: val, owner: self) as? [AuditEventObject] {
						if let realm = self.realm { realm.delete(self.object) }
						self.object.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "object", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["participant"] {
				presentKeys.insert("participant")
				if let val = exist as? [FHIRJSON] {
					if let vals = AuditEventParticipant.instantiate(fromArray: val, owner: self) as? [AuditEventParticipant] {
						if let realm = self.realm { realm.delete(self.participant) }
						self.participant.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "participant", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "participant"))
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: AuditEventSource(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "source"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let event = self.event {
			json["event"] = event.asJSON()
		}
		if object.count > 0 {
			json["object"] = Array(object.map() { $0.asJSON() })
		}
		if participant.count > 0 {
			json["participant"] = Array(participant.map() { $0.asJSON() })
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		
		return json
	}
}


/**
 *  What was done.
 *
 *  Identifies the name, action type, time, and disposition of the audited event.
 */
open class AuditEventEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventEvent" }
	}
    
    public dynamic var action: String?        
        
    public dynamic var dateTime: Instant?        
        
    public dynamic var outcome: String?        
        
    public dynamic var outcomeDesc: String?        
        
    public let purposeOfEvent = RealmSwift.List<Coding>()    
    public let subtype = RealmSwift.List<Coding>()    
    public dynamic var type: Coding?        
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(dateTime: Instant, type: Coding) {
        self.init(json: nil)
        self.dateTime = dateTime
        self.type = type
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? String {
					self.action = val
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dateTime"] {
				presentKeys.insert("dateTime")
				if let val = exist as? String {
					self.dateTime = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "dateTime", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "dateTime"))
			}
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? String {
					self.outcome = val
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["outcomeDesc"] {
				presentKeys.insert("outcomeDesc")
				if let val = exist as? String {
					self.outcomeDesc = val
				}
				else {
					errors.append(FHIRJSONError(key: "outcomeDesc", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["purposeOfEvent"] {
				presentKeys.insert("purposeOfEvent")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.purposeOfEvent) }
						self.purposeOfEvent.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "purposeOfEvent", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subtype"] {
				presentKeys.insert("subtype")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.subtype) }
						self.subtype.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "subtype", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let dateTime = self.dateTime {
			json["dateTime"] = dateTime.asJSON()
		}
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let outcomeDesc = self.outcomeDesc {
			json["outcomeDesc"] = outcomeDesc.asJSON()
		}
		if purposeOfEvent.count > 0 {
			json["purposeOfEvent"] = Array(purposeOfEvent.map() { $0.asJSON() })
		}
		if subtype.count > 0 {
			json["subtype"] = Array(subtype.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Specific instances of data or objects that have been accessed.
 */
open class AuditEventObject: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventObject" }
	}
    
    public dynamic var description_fhir: String?        
        
    public let detail = RealmSwift.List<AuditEventObjectDetail>()    
    public dynamic var identifier: Identifier?        
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }    
    public dynamic var lifecycle: Coding?        
    public func upsert(lifecycle: Coding?) {
        upsert(prop: &self.lifecycle, val: lifecycle)
    }    
    public dynamic var name: String?        
        
    public dynamic var query: Base64Binary?        
        
    public dynamic var reference: Reference?        
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }    
    public dynamic var role: Coding?        
    public func upsert(role: Coding?) {
        upsert(prop: &self.role, val: role)
    }    
    public let securityLabel = RealmSwift.List<Coding>()    
    public dynamic var type: Coding?        
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = AuditEventObjectDetail.instantiate(fromArray: val, owner: self) as? [AuditEventObjectDetail] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["lifecycle"] {
				presentKeys.insert("lifecycle")
				if let val = exist as? FHIRJSON {
					upsert(lifecycle: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "lifecycle", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["query"] {
				presentKeys.insert("query")
				if let val = exist as? String {
					self.query = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "query", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? FHIRJSON {
					upsert(reference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? FHIRJSON {
					upsert(role: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["securityLabel"] {
				presentKeys.insert("securityLabel")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.securityLabel) }
						self.securityLabel.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "securityLabel", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let lifecycle = self.lifecycle {
			json["lifecycle"] = lifecycle.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let query = self.query {
			json["query"] = query.asJSON()
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let role = self.role {
			json["role"] = role.asJSON()
		}
		if securityLabel.count > 0 {
			json["securityLabel"] = Array(securityLabel.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Additional Information about the Object.
 */
open class AuditEventObjectDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventObjectDetail" }
	}
    
    public dynamic var type: String?        
        
    public dynamic var value: Base64Binary?        
    

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: String, val: Base64Binary) {
        self.init(json: nil)
        self.type = type
        self.value = val
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? String {
					self.type = val
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "value", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "value"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
}


/**
 *  A person, a hardware device or software process.
 */
open class AuditEventParticipant: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventParticipant" }
	}
    
    public dynamic var altId: String?        
        
    public dynamic var location: Reference?        
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }    
    public dynamic var media: Coding?        
    public func upsert(media: Coding?) {
        upsert(prop: &self.media, val: media)
    }    
    public dynamic var name: String?        
        
    public dynamic var network: AuditEventParticipantNetwork?        
    public func upsert(network: AuditEventParticipantNetwork?) {
        upsert(prop: &self.network, val: network)
    }    
    public let policy = RealmSwift.List<RealmString>()    
    public let purposeOfUse = RealmSwift.List<Coding>()    
    public dynamic var reference: Reference?        
    public func upsert(reference: Reference?) {
        upsert(prop: &self.reference, val: reference)
    }    
    public let requestor = RealmOptional<Bool>()    
    public let role = RealmSwift.List<CodeableConcept>()    
    public dynamic var userId: Identifier?        
    public func upsert(userId: Identifier?) {
        upsert(prop: &self.userId, val: userId)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(requestor: Bool) {
        self.init(json: nil)
        self.requestor.value = requestor
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["altId"] {
				presentKeys.insert("altId")
				if let val = exist as? String {
					self.altId = val
				}
				else {
					errors.append(FHIRJSONError(key: "altId", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? FHIRJSON {
					upsert(location: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["media"] {
				presentKeys.insert("media")
				if let val = exist as? FHIRJSON {
					upsert(media: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "media", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["network"] {
				presentKeys.insert("network")
				if let val = exist as? FHIRJSON {
					upsert(network: AuditEventParticipantNetwork(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "network", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["policy"] {
				presentKeys.insert("policy")
				if let val = exist as? [String] {
					self.policy.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "policy", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["purposeOfUse"] {
				presentKeys.insert("purposeOfUse")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.purposeOfUse) }
						self.purposeOfUse.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "purposeOfUse", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? FHIRJSON {
					upsert(reference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestor"] {
				presentKeys.insert("requestor")
				if let val = exist as? Bool {
					self.requestor.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "requestor", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "requestor"))
			}
			if let exist = js["role"] {
				presentKeys.insert("role")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.role) }
						self.role.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "role", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["userId"] {
				presentKeys.insert("userId")
				if let val = exist as? FHIRJSON {
					upsert(userId: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "userId", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let altId = self.altId {
			json["altId"] = altId.asJSON()
		}
		if let location = self.location {
			json["location"] = location.asJSON()
		}
		if let media = self.media {
			json["media"] = media.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let network = self.network {
			json["network"] = network.asJSON()
		}
		if policy.count > 0 {
			json["policy"] = Array(policy.map() { $0.value })
		}
		if purposeOfUse.count > 0 {
			json["purposeOfUse"] = Array(purposeOfUse.map() { $0.asJSON() })
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let requestor = self.requestor.value {
			json["requestor"] = requestor.asJSON()
		}
		if role.count > 0 {
			json["role"] = Array(role.map() { $0.asJSON() })
		}
		if let userId = self.userId {
			json["userId"] = userId.asJSON()
		}
		
		return json
	}
}


/**
 *  Logical network location for application activity.
 *
 *  Logical network location for application activity, if the activity has a network location.
 */
open class AuditEventParticipantNetwork: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventParticipantNetwork" }
	}
    
    public dynamic var address: String?        
        
    public dynamic var type: String?        
    

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? String {
					self.address = val
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: String.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Application systems and processes.
 */
open class AuditEventSource: BackboneElement {
	override open class var resourceType: String {
		get { return "AuditEventSource" }
	}
    
    public dynamic var identifier: Identifier?        
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }    
    public dynamic var site: String?        
        
    public let type = RealmSwift.List<Coding>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: Identifier) {
        self.init(json: nil)
        self.identifier = identifier
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identifier"))
			}
			if let exist = js["site"] {
				presentKeys.insert("site")
				if let val = exist as? String {
					self.site = val
				}
				else {
					errors.append(FHIRJSONError(key: "site", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let site = self.site {
			json["site"] = site.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		
		return json
	}
}

