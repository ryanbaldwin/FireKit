//
//  Conformance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Conformance) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A conformance statement.
 *
 *  A conformance statement is a set of capabilities of a FHIR Server that may be used as a statement of actual server
 *  functionality or a statement of required or desired server implementation.
 */
open class Conformance: DomainResource {
	override open class var resourceType: String {
		get { return "Conformance" }
	}

	public dynamic var acceptUnknown: String?
	
	public let contact = RealmSwift.List<ConformanceContact>()
	
	public dynamic var copyright: String?
	
	public dynamic var date: DateTime?
	
	public dynamic var description_fhir: String?
	
	public let document = RealmSwift.List<ConformanceDocument>()
	
	public let experimental = RealmOptional<Bool>()
	
	public dynamic var fhirVersion: String?
	
	public let format = RealmSwift.List<RealmString>()
	
	public dynamic var implementation: ConformanceImplementation?
	
	public dynamic var kind: String?
	
	public let messaging = RealmSwift.List<ConformanceMessaging>()
	
	public dynamic var name: String?
	
	public let profile = RealmSwift.List<Reference>()
	
	public dynamic var publisher: String?
	
	public dynamic var requirements: String?
	
	public let rest = RealmSwift.List<ConformanceRest>()
	
	public dynamic var software: ConformanceSoftware?
	
	public dynamic var status: String?
	
	public dynamic var url: String?
	
	public dynamic var version: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(acceptUnknown: String, date: DateTime, fhirVersion: String, format: [String], kind: String) {
		self.init(json: nil)
		self.acceptUnknown = acceptUnknown
		self.date = date
		self.fhirVersion = fhirVersion
		self.format.append(objectsIn: format.map{ RealmString(value: [$0]) })
		self.kind = kind
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["acceptUnknown"] {
				presentKeys.insert("acceptUnknown")
				if let val = exist as? String {
					self.acceptUnknown = val
				}
				else {
					errors.append(FHIRJSONError(key: "acceptUnknown", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "acceptUnknown"))
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceContact.instantiate(fromArray: val, owner: self) as? [ConformanceContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["copyright"] {
				presentKeys.insert("copyright")
				if let val = exist as? String {
					self.copyright = val
				}
				else {
					errors.append(FHIRJSONError(key: "copyright", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "date"))
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
			if let exist = js["document"] {
				presentKeys.insert("document")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceDocument.instantiate(fromArray: val, owner: self) as? [ConformanceDocument] {
						if let realm = self.realm { realm.delete(self.document) }
						self.document.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "document", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["experimental"] {
				presentKeys.insert("experimental")
				if let val = exist as? Bool {
					self.experimental.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "experimental", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["fhirVersion"] {
				presentKeys.insert("fhirVersion")
				if let val = exist as? String {
					self.fhirVersion = val
				}
				else {
					errors.append(FHIRJSONError(key: "fhirVersion", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "fhirVersion"))
			}
			if let exist = js["format"] {
				presentKeys.insert("format")
				if let val = exist as? [String] {
					self.format.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "format", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "format"))
			}
			if let exist = js["implementation"] {
				presentKeys.insert("implementation")
				if let val = exist as? FHIRJSON {
					if let implementation = self.implementation {
                        errors.append(contentsOf: implementation.populate(from: val) ?? [])
                    } else {
                        self.implementation = ConformanceImplementation(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "implementation", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["kind"] {
				presentKeys.insert("kind")
				if let val = exist as? String {
					self.kind = val
				}
				else {
					errors.append(FHIRJSONError(key: "kind", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "kind"))
			}
			if let exist = js["messaging"] {
				presentKeys.insert("messaging")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceMessaging.instantiate(fromArray: val, owner: self) as? [ConformanceMessaging] {
						if let realm = self.realm { realm.delete(self.messaging) }
						self.messaging.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "messaging", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.profile) }
						self.profile.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["publisher"] {
				presentKeys.insert("publisher")
				if let val = exist as? String {
					self.publisher = val
				}
				else {
					errors.append(FHIRJSONError(key: "publisher", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["requirements"] {
				presentKeys.insert("requirements")
				if let val = exist as? String {
					self.requirements = val
				}
				else {
					errors.append(FHIRJSONError(key: "requirements", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["rest"] {
				presentKeys.insert("rest")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRest.instantiate(fromArray: val, owner: self) as? [ConformanceRest] {
						if let realm = self.realm { realm.delete(self.rest) }
						self.rest.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "rest", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["software"] {
				presentKeys.insert("software")
				if let val = exist as? FHIRJSON {
					if let software = self.software {
                        errors.append(contentsOf: software.populate(from: val) ?? [])
                    } else {
                        self.software = ConformanceSoftware(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "software", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
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
		
		if let acceptUnknown = self.acceptUnknown {
			json["acceptUnknown"] = acceptUnknown.asJSON()
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let copyright = self.copyright {
			json["copyright"] = copyright.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if document.count > 0 {
			json["document"] = Array(document.map() { $0.asJSON() })
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let fhirVersion = self.fhirVersion {
			json["fhirVersion"] = fhirVersion.asJSON()
		}
		if format.count > 0 {
			json["format"] = Array(format.map() { $0.value })
		}
		if let implementation = self.implementation {
			json["implementation"] = implementation.asJSON()
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if messaging.count > 0 {
			json["messaging"] = Array(messaging.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if profile.count > 0 {
			json["profile"] = Array(profile.map() { $0.asJSON() })
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let requirements = self.requirements {
			json["requirements"] = requirements.asJSON()
		}
		if rest.count > 0 {
			json["rest"] = Array(rest.map() { $0.asJSON() })
		}
		if let software = self.software {
			json["software"] = software.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ConformanceContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceContact" }
	}

	public dynamic var name: String?
	
	public let telecom = RealmSwift.List<ContactPoint>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["telecom"] {
				presentKeys.insert("telecom")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.telecom) }
						self.telecom.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "telecom", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Document definition.
 *
 *  A document definition.
 */
open class ConformanceDocument: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceDocument" }
	}

	public dynamic var documentation: String?
	
	public dynamic var mode: String?
	
	public dynamic var profile: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(mode: String, profile: Reference) {
		self.init(json: nil)
		self.mode = mode
		self.profile = profile
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? String {
					self.mode = val
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "mode"))
			}
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? FHIRJSON {
					if let profile = self.profile {
                        errors.append(contentsOf: profile.populate(from: val) ?? [])
                    } else {
                        self.profile = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "profile"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if let profile = self.profile {
			json["profile"] = profile.asJSON()
		}
		
		return json
	}
}


/**
 *  If this describes a specific instance.
 *
 *  Identifies a specific implementation instance that is described by the conformance statement - i.e. a particular
 *  installation, rather than the capabilities of a software program.
 */
open class ConformanceImplementation: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceImplementation" }
	}

	public dynamic var description_fhir: String?
	
	public dynamic var url: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(description_fhir: String) {
		self.init(json: nil)
		self.description_fhir = description_fhir
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
			else {
				errors.append(FHIRJSONError(key: "description"))
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
		
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		
		return json
	}
}


/**
 *  If messaging is supported.
 *
 *  A description of the messaging capabilities of the solution.
 */
open class ConformanceMessaging: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceMessaging" }
	}

	public dynamic var documentation: String?
	
	public let endpoint = RealmSwift.List<ConformanceMessagingEndpoint>()
	
	public let event = RealmSwift.List<ConformanceMessagingEvent>()
	
	public let reliableCache = RealmOptional<Int>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(event: [ConformanceMessagingEvent]) {
		self.init(json: nil)
		self.event.append(objectsIn: event)
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["endpoint"] {
				presentKeys.insert("endpoint")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceMessagingEndpoint.instantiate(fromArray: val, owner: self) as? [ConformanceMessagingEndpoint] {
						if let realm = self.realm { realm.delete(self.endpoint) }
						self.endpoint.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "endpoint", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceMessagingEvent.instantiate(fromArray: val, owner: self) as? [ConformanceMessagingEvent] {
						if let realm = self.realm { realm.delete(self.event) }
						self.event.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "event"))
			}
			if let exist = js["reliableCache"] {
				presentKeys.insert("reliableCache")
				if let val = exist as? Int {
					self.reliableCache.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "reliableCache", wants: Int.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		if endpoint.count > 0 {
			json["endpoint"] = Array(endpoint.map() { $0.asJSON() })
		}
		if event.count > 0 {
			json["event"] = Array(event.map() { $0.asJSON() })
		}
		if let reliableCache = self.reliableCache.value {
			json["reliableCache"] = reliableCache.asJSON()
		}
		
		return json
	}
}


/**
 *  A messaging service end-point.
 *
 *  An endpoint (network accessible address) to which messages and/or replies are to be sent.
 */
open class ConformanceMessagingEndpoint: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceMessagingEndpoint" }
	}

	public dynamic var address: String?
	
	public dynamic var protocol_fhir: Coding?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(address: String, protocol_fhir: Coding) {
		self.init(json: nil)
		self.address = address
		self.protocol_fhir = protocol_fhir
	}
	
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
			else {
				errors.append(FHIRJSONError(key: "address"))
			}
			if let exist = js["protocol"] {
				presentKeys.insert("protocol")
				if let val = exist as? FHIRJSON {
					if let protocol_fhir = self.protocol_fhir {
                        errors.append(contentsOf: protocol_fhir.populate(from: val) ?? [])
                    } else {
                        self.protocol_fhir = Coding(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "protocol", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "protocol"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let protocol_fhir = self.protocol_fhir {
			json["protocol"] = protocol_fhir.asJSON()
		}
		
		return json
	}
}


/**
 *  Declare support for this event.
 *
 *  A description of the solution's support for an event at this end-point.
 */
open class ConformanceMessagingEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceMessagingEvent" }
	}

	public dynamic var category: String?
	
	public dynamic var code: Coding?
	
	public dynamic var documentation: String?
	
	public dynamic var focus: String?
	
	public dynamic var mode: String?
	
	public dynamic var request: Reference?
	
	public dynamic var response: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: Coding, focus: String, mode: String, request: Reference, response: Reference) {
		self.init(json: nil)
		self.code = code
		self.focus = focus
		self.mode = mode
		self.request = request
		self.response = response
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
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					if let code = self.code {
                        errors.append(contentsOf: code.populate(from: val) ?? [])
                    } else {
                        self.code = Coding(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["focus"] {
				presentKeys.insert("focus")
				if let val = exist as? String {
					self.focus = val
				}
				else {
					errors.append(FHIRJSONError(key: "focus", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "focus"))
			}
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? String {
					self.mode = val
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "mode"))
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
			else {
				errors.append(FHIRJSONError(key: "request"))
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? FHIRJSON {
					if let response = self.response {
                        errors.append(contentsOf: response.populate(from: val) ?? [])
                    } else {
                        self.response = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "response"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let category = self.category {
			json["category"] = category.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		if let focus = self.focus {
			json["focus"] = focus.asJSON()
		}
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		
		return json
	}
}


/**
 *  If the endpoint is a RESTful one.
 *
 *  A definition of the restful capabilities of the solution, if any.
 */
open class ConformanceRest: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRest" }
	}

	public let compartment = RealmSwift.List<RealmString>()
	
	public dynamic var documentation: String?
	
	public let interaction = RealmSwift.List<ConformanceRestInteraction>()
	
	public dynamic var mode: String?
	
	public let operation = RealmSwift.List<ConformanceRestOperation>()
	
	public let resource = RealmSwift.List<ConformanceRestResource>()
	
	public let searchParam = RealmSwift.List<ConformanceRestResourceSearchParam>()
	
	public dynamic var security: ConformanceRestSecurity?
	
	public dynamic var transactionMode: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(mode: String, resource: [ConformanceRestResource]) {
		self.init(json: nil)
		self.mode = mode
		self.resource.append(objectsIn: resource)
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["compartment"] {
				presentKeys.insert("compartment")
				if let val = exist as? [String] {
					self.compartment.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "compartment", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["interaction"] {
				presentKeys.insert("interaction")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestInteraction.instantiate(fromArray: val, owner: self) as? [ConformanceRestInteraction] {
						if let realm = self.realm { realm.delete(self.interaction) }
						self.interaction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "interaction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? String {
					self.mode = val
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "mode"))
			}
			if let exist = js["operation"] {
				presentKeys.insert("operation")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestOperation.instantiate(fromArray: val, owner: self) as? [ConformanceRestOperation] {
						if let realm = self.realm { realm.delete(self.operation) }
						self.operation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "operation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["resource"] {
				presentKeys.insert("resource")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestResource.instantiate(fromArray: val, owner: self) as? [ConformanceRestResource] {
						if let realm = self.realm { realm.delete(self.resource) }
						self.resource.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "resource", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "resource"))
			}
			if let exist = js["searchParam"] {
				presentKeys.insert("searchParam")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestResourceSearchParam.instantiate(fromArray: val, owner: self) as? [ConformanceRestResourceSearchParam] {
						if let realm = self.realm { realm.delete(self.searchParam) }
						self.searchParam.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "searchParam", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["security"] {
				presentKeys.insert("security")
				if let val = exist as? FHIRJSON {
					if let security = self.security {
                        errors.append(contentsOf: security.populate(from: val) ?? [])
                    } else {
                        self.security = ConformanceRestSecurity(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "security", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["transactionMode"] {
				presentKeys.insert("transactionMode")
				if let val = exist as? String {
					self.transactionMode = val
				}
				else {
					errors.append(FHIRJSONError(key: "transactionMode", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if compartment.count > 0 {
			json["compartment"] = Array(compartment.map() { $0.value })
		}
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		if interaction.count > 0 {
			json["interaction"] = Array(interaction.map() { $0.asJSON() })
		}
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if operation.count > 0 {
			json["operation"] = Array(operation.map() { $0.asJSON() })
		}
		if resource.count > 0 {
			json["resource"] = Array(resource.map() { $0.asJSON() })
		}
		if searchParam.count > 0 {
			json["searchParam"] = Array(searchParam.map() { $0.asJSON() })
		}
		if let security = self.security {
			json["security"] = security.asJSON()
		}
		if let transactionMode = self.transactionMode {
			json["transactionMode"] = transactionMode.asJSON()
		}
		
		return json
	}
}


/**
 *  What operations are supported?.
 *
 *  A specification of restful operations supported by the system.
 */
open class ConformanceRestInteraction: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestInteraction" }
	}

	public dynamic var code: String?
	
	public dynamic var documentation: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: String) {
		self.init(json: nil)
		self.code = code
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
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		
		return json
	}
}


/**
 *  Definition of an operation or a custom query.
 *
 *  Definition of an operation or a named query and with its parameters and their meaning and type.
 */
open class ConformanceRestOperation: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestOperation" }
	}

	public dynamic var definition: Reference?
	
	public dynamic var name: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(definition: Reference, name: String) {
		self.init(json: nil)
		self.definition = definition
		self.name = name
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["definition"] {
				presentKeys.insert("definition")
				if let val = exist as? FHIRJSON {
					if let definition = self.definition {
                        errors.append(contentsOf: definition.populate(from: val) ?? [])
                    } else {
                        self.definition = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "definition", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "definition"))
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
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let definition = self.definition {
			json["definition"] = definition.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		
		return json
	}
}


/**
 *  Resource served on the REST interface.
 *
 *  A specification of the restful capabilities of the solution for a specific resource type.
 */
open class ConformanceRestResource: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestResource" }
	}

	public let conditionalCreate = RealmOptional<Bool>()
	
	public dynamic var conditionalDelete: String?
	
	public let conditionalUpdate = RealmOptional<Bool>()
	
	public let interaction = RealmSwift.List<ConformanceRestResourceInteraction>()
	
	public dynamic var profile: Reference?
	
	public let readHistory = RealmOptional<Bool>()
	
	public let searchInclude = RealmSwift.List<RealmString>()
	
	public let searchParam = RealmSwift.List<ConformanceRestResourceSearchParam>()
	
	public let searchRevInclude = RealmSwift.List<RealmString>()
	
	public dynamic var type: String?
	
	public let updateCreate = RealmOptional<Bool>()
	
	public dynamic var versioning: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(interaction: [ConformanceRestResourceInteraction], type: String) {
		self.init(json: nil)
		self.interaction.append(objectsIn: interaction)
		self.type = type
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["conditionalCreate"] {
				presentKeys.insert("conditionalCreate")
				if let val = exist as? Bool {
					self.conditionalCreate.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "conditionalCreate", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["conditionalDelete"] {
				presentKeys.insert("conditionalDelete")
				if let val = exist as? String {
					self.conditionalDelete = val
				}
				else {
					errors.append(FHIRJSONError(key: "conditionalDelete", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["conditionalUpdate"] {
				presentKeys.insert("conditionalUpdate")
				if let val = exist as? Bool {
					self.conditionalUpdate.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "conditionalUpdate", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["interaction"] {
				presentKeys.insert("interaction")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestResourceInteraction.instantiate(fromArray: val, owner: self) as? [ConformanceRestResourceInteraction] {
						if let realm = self.realm { realm.delete(self.interaction) }
						self.interaction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "interaction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "interaction"))
			}
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? FHIRJSON {
					if let profile = self.profile {
                        errors.append(contentsOf: profile.populate(from: val) ?? [])
                    } else {
                        self.profile = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["readHistory"] {
				presentKeys.insert("readHistory")
				if let val = exist as? Bool {
					self.readHistory.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "readHistory", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["searchInclude"] {
				presentKeys.insert("searchInclude")
				if let val = exist as? [String] {
					self.searchInclude.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "searchInclude", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["searchParam"] {
				presentKeys.insert("searchParam")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestResourceSearchParam.instantiate(fromArray: val, owner: self) as? [ConformanceRestResourceSearchParam] {
						if let realm = self.realm { realm.delete(self.searchParam) }
						self.searchParam.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "searchParam", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["searchRevInclude"] {
				presentKeys.insert("searchRevInclude")
				if let val = exist as? [String] {
					self.searchRevInclude.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "searchRevInclude", wants: Array<String>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["updateCreate"] {
				presentKeys.insert("updateCreate")
				if let val = exist as? Bool {
					self.updateCreate.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "updateCreate", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["versioning"] {
				presentKeys.insert("versioning")
				if let val = exist as? String {
					self.versioning = val
				}
				else {
					errors.append(FHIRJSONError(key: "versioning", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let conditionalCreate = self.conditionalCreate.value {
			json["conditionalCreate"] = conditionalCreate.asJSON()
		}
		if let conditionalDelete = self.conditionalDelete {
			json["conditionalDelete"] = conditionalDelete.asJSON()
		}
		if let conditionalUpdate = self.conditionalUpdate.value {
			json["conditionalUpdate"] = conditionalUpdate.asJSON()
		}
		if interaction.count > 0 {
			json["interaction"] = Array(interaction.map() { $0.asJSON() })
		}
		if let profile = self.profile {
			json["profile"] = profile.asJSON()
		}
		if let readHistory = self.readHistory.value {
			json["readHistory"] = readHistory.asJSON()
		}
		if searchInclude.count > 0 {
			json["searchInclude"] = Array(searchInclude.map() { $0.value })
		}
		if searchParam.count > 0 {
			json["searchParam"] = Array(searchParam.map() { $0.asJSON() })
		}
		if searchRevInclude.count > 0 {
			json["searchRevInclude"] = Array(searchRevInclude.map() { $0.value })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let updateCreate = self.updateCreate.value {
			json["updateCreate"] = updateCreate.asJSON()
		}
		if let versioning = self.versioning {
			json["versioning"] = versioning.asJSON()
		}
		
		return json
	}
}


/**
 *  What operations are supported?.
 *
 *  Identifies a restful operation supported by the solution.
 */
open class ConformanceRestResourceInteraction: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestResourceInteraction" }
	}

	public dynamic var code: String?
	
	public dynamic var documentation: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: String) {
		self.init(json: nil)
		self.code = code
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
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		
		return json
	}
}


/**
 *  Search params supported by implementation.
 *
 *  Search parameters for implementations to support and/or make use of - either references to ones defined in the
 *  specification, or additional ones defined for/by the implementation.
 */
open class ConformanceRestResourceSearchParam: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestResourceSearchParam" }
	}

	public let chain = RealmSwift.List<RealmString>()
	
	public dynamic var definition: String?
	
	public dynamic var documentation: String?
	
	public let modifier = RealmSwift.List<RealmString>()
	
	public dynamic var name: String?
	
	public let target = RealmSwift.List<RealmString>()
	
	public dynamic var type: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(name: String, type: String) {
		self.init(json: nil)
		self.name = name
		self.type = type
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["chain"] {
				presentKeys.insert("chain")
				if let val = exist as? [String] {
					self.chain.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "chain", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["definition"] {
				presentKeys.insert("definition")
				if let val = exist as? String {
					self.definition = val
				}
				else {
					errors.append(FHIRJSONError(key: "definition", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["documentation"] {
				presentKeys.insert("documentation")
				if let val = exist as? String {
					self.documentation = val
				}
				else {
					errors.append(FHIRJSONError(key: "documentation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["modifier"] {
				presentKeys.insert("modifier")
				if let val = exist as? [String] {
					self.modifier.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "modifier", wants: Array<String>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? [String] {
					self.target.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: Array<String>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if chain.count > 0 {
			json["chain"] = Array(chain.map() { $0.value })
		}
		if let definition = self.definition {
			json["definition"] = definition.asJSON()
		}
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		if modifier.count > 0 {
			json["modifier"] = Array(modifier.map() { $0.value })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if target.count > 0 {
			json["target"] = Array(target.map() { $0.value })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Information about security of implementation.
 *
 *  Information about security implementation from an interface perspective - what a client needs to know.
 */
open class ConformanceRestSecurity: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestSecurity" }
	}

	public let certificate = RealmSwift.List<ConformanceRestSecurityCertificate>()
	
	public let cors = RealmOptional<Bool>()
	
	public dynamic var description_fhir: String?
	
	public let service = RealmSwift.List<CodeableConcept>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["certificate"] {
				presentKeys.insert("certificate")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConformanceRestSecurityCertificate.instantiate(fromArray: val, owner: self) as? [ConformanceRestSecurityCertificate] {
						if let realm = self.realm { realm.delete(self.certificate) }
						self.certificate.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "certificate", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["cors"] {
				presentKeys.insert("cors")
				if let val = exist as? Bool {
					self.cors.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "cors", wants: Bool.self, has: type(of: exist)))
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
			if let exist = js["service"] {
				presentKeys.insert("service")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.service) }
						self.service.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "service", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if certificate.count > 0 {
			json["certificate"] = Array(certificate.map() { $0.asJSON() })
		}
		if let cors = self.cors.value {
			json["cors"] = cors.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if service.count > 0 {
			json["service"] = Array(service.map() { $0.asJSON() })
		}
		
		return json
	}
}


/**
 *  Certificates associated with security profiles.
 */
open class ConformanceRestSecurityCertificate: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceRestSecurityCertificate" }
	}

	public dynamic var blob: Base64Binary?
	
	public dynamic var type: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["blob"] {
				presentKeys.insert("blob")
				if let val = exist as? String {
					self.blob = Base64Binary(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "blob", wants: String.self, has: type(of: exist)))
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
		
		if let blob = self.blob {
			json["blob"] = blob.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Software that is covered by this conformance statement.
 *
 *  Software that is covered by this conformance statement.  It is used when the conformance statement describes the
 *  capabilities of a particular software version, independent of an installation.
 */
open class ConformanceSoftware: BackboneElement {
	override open class var resourceType: String {
		get { return "ConformanceSoftware" }
	}

	public dynamic var name: String?
	
	public dynamic var releaseDate: DateTime?
	
	public dynamic var version: String?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(name: String) {
		self.init(json: nil)
		self.name = name
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["releaseDate"] {
				presentKeys.insert("releaseDate")
				if let val = exist as? String {
					self.releaseDate = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "releaseDate", wants: String.self, has: type(of: exist)))
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
		
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let releaseDate = self.releaseDate {
			json["releaseDate"] = releaseDate.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
}

