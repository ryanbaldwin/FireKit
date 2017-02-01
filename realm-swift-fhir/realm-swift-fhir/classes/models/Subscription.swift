//
//  Subscription.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Subscription) on 2017-02-01.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A server push subscription criteria.
 *
 *  The subscription resource is used to define a push based subscription from a server to another system. Once a
 *  subscription is registered with the server, the server checks every resource that is created or updated, and if the
 *  resource matches the given criteria, it sends a message on the defined "channel" so that another system is able to
 *  take an appropriate action.
 */
open class Subscription: DomainResource {
	override open class var resourceType: String {
		get { return "Subscription" }
	}

	public dynamic var channel: SubscriptionChannel?
	
	public let contact = RealmSwift.List<ContactPoint>()
	
	public dynamic var criteria: String?
	
	public dynamic var end: Instant?
	
	public dynamic var error: String?
	
	public dynamic var reason: String?
	
	public dynamic var status: String?
	
	public let tag = RealmSwift.List<Coding>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(channel: SubscriptionChannel, criteria: String, reason: String, status: String) {
		self.init(json: nil)
		self.channel = channel
		self.criteria = criteria
		self.reason = reason
		self.status = status
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["channel"] {
				presentKeys.insert("channel")
				if let val = exist as? FHIRJSON {
					self.channel = SubscriptionChannel(json: val, owner: self)
				}
				else {
					errors.append(FHIRJSONError(key: "channel", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "channel"))
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["criteria"] {
				presentKeys.insert("criteria")
				if let val = exist as? String {
					self.criteria = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "criteria", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "criteria"))
			}
			if let exist = js["end"] {
				presentKeys.insert("end")
				if let val = exist as? String {
					self.end = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "end", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["error"] {
				presentKeys.insert("error")
				if let val = exist as? String {
					self.error = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "error", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["reason"] {
				presentKeys.insert("reason")
				if let val = exist as? String {
					self.reason = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "reason", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "reason"))
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
			if let exist = js["tag"] {
				presentKeys.insert("tag")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						self.tag.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "tag", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let channel = self.channel {
			json["channel"] = channel.asJSON()
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let criteria = self.criteria {
			json["criteria"] = criteria.asJSON()
		}
		if let end = self.end {
			json["end"] = end.asJSON()
		}
		if let error = self.error {
			json["error"] = error.asJSON()
		}
		if let reason = self.reason {
			json["reason"] = reason.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if tag.count > 0 {
			json["tag"] = Array(tag.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  The channel on which to report matches to the criteria.
 *
 *  Details where to send notifications when resources are received that meet the criteria.
 */
open class SubscriptionChannel: BackboneElement {
	override open class var resourceType: String {
		get { return "SubscriptionChannel" }
	}

	public dynamic var endpoint: String?
	
	public dynamic var header: String?
	
	public dynamic var payload: String?
	
	public dynamic var type: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(payload: String, type: String) {
		self.init(json: nil)
		self.payload = payload
		self.type = type
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
			if let exist = js["header"] {
				presentKeys.insert("header")
				if let val = exist as? String {
					self.header = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "header", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["payload"] {
				presentKeys.insert("payload")
				if let val = exist as? String {
					self.payload = val
					
				}
				else {
					errors.append(FHIRJSONError(key: "payload", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "payload"))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let endpoint = self.endpoint {
			json["endpoint"] = endpoint.asJSON()
		}
		if let header = self.header {
			json["header"] = header.asJSON()
		}
		if let payload = self.payload {
			json["payload"] = payload.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

