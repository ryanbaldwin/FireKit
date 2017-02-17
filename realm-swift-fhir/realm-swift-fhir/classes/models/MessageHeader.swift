//
//  MessageHeader.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/MessageHeader) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A resource that describes a message that is exchanged between systems.
 *
 *  The header for a message exchange that is either requesting or responding to an action.  The reference(s) that are
 *  the subject of the action as well as other information related to the action are typically transmitted in a bundle
 *  in which the MessageHeader resource instance is the first resource in the bundle.
 */
open class MessageHeader: DomainResource {
	override open class var resourceType: String {
		get { return "MessageHeader" }
	}

	public dynamic var author: Reference?						
		
		
			public func upsert(author: Reference?) {
				upsert(prop: &self.author, val: author)
			}
	
	public let data = RealmSwift.List<Reference>()
	
	public let destination = RealmSwift.List<MessageHeaderDestination>()
	
	public dynamic var enterer: Reference?						
		
		
			public func upsert(enterer: Reference?) {
				upsert(prop: &self.enterer, val: enterer)
			}
	
	public dynamic var event: Coding?						
		
		
			public func upsert(event: Coding?) {
				upsert(prop: &self.event, val: event)
			}
	
	public dynamic var reason: CodeableConcept?						
		
		
			public func upsert(reason: CodeableConcept?) {
				upsert(prop: &self.reason, val: reason)
			}
	
	public dynamic var receiver: Reference?						
		
		
			public func upsert(receiver: Reference?) {
				upsert(prop: &self.receiver, val: receiver)
			}
	
	public dynamic var response: MessageHeaderResponse?						
		
		
			public func upsert(response: MessageHeaderResponse?) {
				upsert(prop: &self.response, val: response)
			}
	
	public dynamic var responsible: Reference?						
		
		
			public func upsert(responsible: Reference?) {
				upsert(prop: &self.responsible, val: responsible)
			}
	
	public dynamic var source: MessageHeaderSource?						
		
		
			public func upsert(source: MessageHeaderSource?) {
				upsert(prop: &self.source, val: source)
			}
	
	public dynamic var timestamp: Instant?						
		
		
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(event: Coding, source: MessageHeaderSource, timestamp: Instant) {
		self.init(json: nil)
		self.event = event
		self.source = source
		self.timestamp = timestamp
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					upsert(author: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["data"] {
				presentKeys.insert("data")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.data) }
						self.data.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "data", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["destination"] {
				presentKeys.insert("destination")
				if let val = exist as? [FHIRJSON] {
					if let vals = MessageHeaderDestination.instantiate(fromArray: val, owner: self) as? [MessageHeaderDestination] {
						if let realm = self.realm { realm.delete(self.destination) }
						self.destination.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "destination", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["enterer"] {
				presentKeys.insert("enterer")
				if let val = exist as? FHIRJSON {
					upsert(enterer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "enterer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? FHIRJSON {
					upsert(event: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "event"))
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? FHIRJSON {
					upsert(reason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["receiver"] {
				presentKeys.insert("receiver")
				if let val = exist as? FHIRJSON {
					upsert(receiver: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "receiver", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? FHIRJSON {
					upsert(response: MessageHeaderResponse(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["responsible"] {
				presentKeys.insert("responsible")
				if let val = exist as? FHIRJSON {
					upsert(responsible: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "responsible", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: MessageHeaderSource(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "source"))
			}
			if let exist = js["timestamp"] {
				presentKeys.insert("timestamp")
				if let val = exist as? String {
					self.timestamp = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "timestamp", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "timestamp"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if data.count > 0 {
			json["data"] = Array(data.map() { $0.asJSON() })
		}
		if destination.count > 0 {
			json["destination"] = Array(destination.map() { $0.asJSON() })
		}
		if let enterer = self.enterer {
			json["enterer"] = enterer.asJSON()
		}
		if let event = self.event {
			json["event"] = event.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if let receiver = self.receiver {
			json["receiver"] = receiver.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		if let responsible = self.responsible {
			json["responsible"] = responsible.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let timestamp = self.timestamp {
			json["timestamp"] = timestamp.asJSON()
		}
		
		return json
	}
}


/**
 *  Message Destination Application(s).
 *
 *  The destination application which the message is intended for.
 */
open class MessageHeaderDestination: BackboneElement {
	override open class var resourceType: String {
		get { return "MessageHeaderDestination" }
	}

	public dynamic var endpoint: String?						
		
		
	
	public dynamic var name: String?						
		
		
	
	public dynamic var target: Reference?						
		
		
			public func upsert(target: Reference?) {
				upsert(prop: &self.target, val: target)
			}
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(endpoint: String) {
		self.init(json: nil)
		self.endpoint = endpoint
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["endpoint"] {
				presentKeys.insert("endpoint")
				if let val = exist as? String {
					self.endpoint = val
				}
				else {
					errors.append(FHIRJSONError(key: "endpoint", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "endpoint"))
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
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					upsert(target: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let endpoint = self.endpoint {
			json["endpoint"] = endpoint.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		
		return json
	}
}


/**
 *  If this is a reply to prior message.
 *
 *  Information about the message that this message is a response to.  Only present if this message is a response.
 */
open class MessageHeaderResponse: BackboneElement {
	override open class var resourceType: String {
		get { return "MessageHeaderResponse" }
	}

	public dynamic var code: String?						
		
		
	
	public dynamic var details: Reference?						
		
		
			public func upsert(details: Reference?) {
				upsert(prop: &self.details, val: details)
			}
	
	public dynamic var identifier: String?						
		
		
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: String, identifier: String) {
		self.init(json: nil)
		self.code = code
		self.identifier = identifier
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? String {
					self.code = val
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["details"] {
				presentKeys.insert("details")
				if let val = exist as? FHIRJSON {
					upsert(details: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "details", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? String {
					self.identifier = val
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identifier"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let details = self.details {
			json["details"] = details.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		
		return json
	}
}


/**
 *  Message Source Application.
 *
 *  The source application from which this message originated.
 */
open class MessageHeaderSource: BackboneElement {
	override open class var resourceType: String {
		get { return "MessageHeaderSource" }
	}

	public dynamic var contact: ContactPoint?						
		
		
			public func upsert(contact: ContactPoint?) {
				upsert(prop: &self.contact, val: contact)
			}
	
	public dynamic var endpoint: String?						
		
		
	
	public dynamic var name: String?						
		
		
	
	public dynamic var software: String?						
		
		
	
	public dynamic var version: String?						
		
		
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(endpoint: String) {
		self.init(json: nil)
		self.endpoint = endpoint
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? FHIRJSON {
					upsert(contact: ContactPoint(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["endpoint"] {
				presentKeys.insert("endpoint")
				if let val = exist as? String {
					self.endpoint = val
				}
				else {
					errors.append(FHIRJSONError(key: "endpoint", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "endpoint"))
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
			if let exist = js["software"] {
				presentKeys.insert("software")
				if let val = exist as? String {
					self.software = val
				}
				else {
					errors.append(FHIRJSONError(key: "software", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["version"] {
				presentKeys.insert("version")
				if let val = exist as? String {
					self.version = val
				}
				else {
					errors.append(FHIRJSONError(key: "version", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let contact = self.contact {
			json["contact"] = contact.asJSON()
		}
		if let endpoint = self.endpoint {
			json["endpoint"] = endpoint.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let software = self.software {
			json["software"] = software.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
}

