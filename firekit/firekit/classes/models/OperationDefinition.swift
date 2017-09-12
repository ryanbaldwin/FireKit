//
//  OperationDefinition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/OperationDefinition) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Definition of an operation or a named query.
 *
 *  A formal computable definition of an operation (on the RESTful interface) or a named query (using the search
 *  interaction).
 */
open class OperationDefinition: DomainResource {
	override open class var resourceType: String {
		get { return "OperationDefinition" }
	}

    @objc public dynamic var base: Reference?
    public func upsert(base: Reference?) {
        upsert(prop: &self.base, val: base)
    }
    @objc public dynamic var code: String?
    public let contact = RealmSwift.List<OperationDefinitionContact>()
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let experimental = RealmOptional<Bool>()
    public let idempotent = RealmOptional<Bool>()
    public let instance = RealmOptional<Bool>()
    @objc public dynamic var kind: String?
    @objc public dynamic var name: String?
    @objc public dynamic var notes: String?
    public let parameter = RealmSwift.List<OperationDefinitionParameter>()
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var status: String?
    public let system = RealmOptional<Bool>()
    public let type = RealmSwift.List<RealmString>()
    @objc public dynamic var url: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, instance: Bool, kind: String, name: String, status: String, system: Bool) {
        self.init()
        self.code = code
        self.instance.value = instance
        self.kind = kind
        self.name = name
        self.status = status
        self.system.value = system
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case base = "base"
        case code = "code"
        case contact = "contact"
        case date = "date"
        case description_fhir = "description"
        case experimental = "experimental"
        case idempotent = "idempotent"
        case instance = "instance"
        case kind = "kind"
        case name = "name"
        case notes = "notes"
        case parameter = "parameter"
        case publisher = "publisher"
        case requirements = "requirements"
        case status = "status"
        case system = "system"
        case type = "type"
        case url = "url"
        case version = "version"
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

        self.base = try container.decodeIfPresent(Reference.self, forKey: .base)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.contact.append(objectsIn: try container.decodeIfPresent([OperationDefinitionContact].self, forKey: .contact) ?? [])
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.idempotent.value = try container.decodeIfPresent(Bool.self, forKey: .idempotent)
        self.instance.value = try container.decodeIfPresent(Bool.self, forKey: .instance)
        self.kind = try container.decodeIfPresent(String.self, forKey: .kind)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.notes = try container.decodeIfPresent(String.self, forKey: .notes)
        self.parameter.append(objectsIn: try container.decodeIfPresent([OperationDefinitionParameter].self, forKey: .parameter) ?? [])
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.system.value = try container.decodeIfPresent(Bool.self, forKey: .system)
        self.type.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .type) ?? [])
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.idempotent.value, forKey: .idempotent)
        try container.encodeIfPresent(self.instance.value, forKey: .instance)
        try container.encodeIfPresent(self.kind, forKey: .kind)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.notes, forKey: .notes)
        try container.encode(Array(self.parameter), forKey: .parameter)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.system.value, forKey: .system)
        try container.encode(Array(self.type), forKey: .type)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["base"] {
				presentKeys.insert("base")
				if let val = exist as? FHIRJSON {
					upsert(base: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "base", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
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
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = OperationDefinitionContact.instantiate(fromArray: val, owner: self) as? [OperationDefinitionContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
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
			if let exist = js["idempotent"] {
				presentKeys.insert("idempotent")
				if let val = exist as? Bool {
					self.idempotent.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "idempotent", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["instance"] {
				presentKeys.insert("instance")
				if let val = exist as? Bool {
					self.instance.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "instance", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "instance"))
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
			if let exist = js["notes"] {
				presentKeys.insert("notes")
				if let val = exist as? String {
					self.notes = val
				}
				else {
					errors.append(FHIRJSONError(key: "notes", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["parameter"] {
				presentKeys.insert("parameter")
				if let val = exist as? [FHIRJSON] {
					if let vals = OperationDefinitionParameter.instantiate(fromArray: val, owner: self) as? [OperationDefinitionParameter] {
						if let realm = self.realm { realm.delete(self.parameter) }
						self.parameter.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "parameter", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["system"] {
				presentKeys.insert("system")
				if let val = exist as? Bool {
					self.system.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "system", wants: Bool.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "system"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [String] {
					self.type.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<String>.self, has: type(of: exist)))
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
		
		if let base = self.base {
			json["base"] = base.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let idempotent = self.idempotent.value {
			json["idempotent"] = idempotent.asJSON()
		}
		if let instance = self.instance.value {
			json["instance"] = instance.asJSON()
		}
		if let kind = self.kind {
			json["kind"] = kind.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let notes = self.notes {
			json["notes"] = notes.asJSON()
		}
		if parameter.count > 0 {
			json["parameter"] = Array(parameter.map() { $0.asJSON() })
		}
		if let publisher = self.publisher {
			json["publisher"] = publisher.asJSON()
		}
		if let requirements = self.requirements {
			json["requirements"] = requirements.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let system = self.system.value {
			json["system"] = system.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.value })
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinition.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinition. Will return empty instance: \(error))")
		}
		return OperationDefinition.init()
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class OperationDefinitionContact: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationDefinitionContact" }
	}

    @objc public dynamic var name: String?
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case telecom = "telecom"
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

        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }
/*
	
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
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinitionContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinitionContact. Will return empty instance: \(error))")
		}
		return OperationDefinitionContact.init()
	}
}


/**
 *  Parameters for the operation/query.
 *
 *  The parameters for the operation/query.
 */
open class OperationDefinitionParameter: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationDefinitionParameter" }
	}

    @objc public dynamic var binding: OperationDefinitionParameterBinding?
    public func upsert(binding: OperationDefinitionParameterBinding?) {
        upsert(prop: &self.binding, val: binding)
    }
    @objc public dynamic var documentation: String?
    @objc public dynamic var max: String?
    public let min = RealmOptional<Int>()
    @objc public dynamic var name: String?
    public let part = RealmSwift.List<OperationDefinitionParameter>()
    @objc public dynamic var profile: Reference?
    public func upsert(profile: Reference?) {
        upsert(prop: &self.profile, val: profile)
    }
    @objc public dynamic var type: String?
    @objc public dynamic var use: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(max: String, min: Int, name: String, use: String) {
        self.init()
        self.max = max
        self.min.value = min
        self.name = name
        self.use = use
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case binding = "binding"
        case documentation = "documentation"
        case max = "max"
        case min = "min"
        case name = "name"
        case part = "part"
        case profile = "profile"
        case type = "type"
        case use = "use"
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

        self.binding = try container.decodeIfPresent(OperationDefinitionParameterBinding.self, forKey: .binding)
        self.documentation = try container.decodeIfPresent(String.self, forKey: .documentation)
        self.max = try container.decodeIfPresent(String.self, forKey: .max)
        self.min.value = try container.decodeIfPresent(Int.self, forKey: .min)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.part.append(objectsIn: try container.decodeIfPresent([OperationDefinitionParameter].self, forKey: .part) ?? [])
        self.profile = try container.decodeIfPresent(Reference.self, forKey: .profile)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.use = try container.decodeIfPresent(String.self, forKey: .use)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.binding, forKey: .binding)
        try container.encodeIfPresent(self.documentation, forKey: .documentation)
        try container.encodeIfPresent(self.max, forKey: .max)
        try container.encodeIfPresent(self.min.value, forKey: .min)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(Array(self.part), forKey: .part)
        try container.encodeIfPresent(self.profile, forKey: .profile)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.use, forKey: .use)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["binding"] {
				presentKeys.insert("binding")
				if let val = exist as? FHIRJSON {
					upsert(binding: OperationDefinitionParameterBinding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "binding", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["max"] {
				presentKeys.insert("max")
				if let val = exist as? String {
					self.max = val
				}
				else {
					errors.append(FHIRJSONError(key: "max", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "max"))
			}
			if let exist = js["min"] {
				presentKeys.insert("min")
				if let val = exist as? Int {
					self.min.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "min", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "min"))
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
			if let exist = js["part"] {
				presentKeys.insert("part")
				if let val = exist as? [FHIRJSON] {
					if let vals = OperationDefinitionParameter.instantiate(fromArray: val, owner: self) as? [OperationDefinitionParameter] {
						if let realm = self.realm { realm.delete(self.part) }
						self.part.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "part", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? FHIRJSON {
					upsert(profile: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["use"] {
				presentKeys.insert("use")
				if let val = exist as? String {
					self.use = val
				}
				else {
					errors.append(FHIRJSONError(key: "use", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "use"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let binding = self.binding {
			json["binding"] = binding.asJSON()
		}
		if let documentation = self.documentation {
			json["documentation"] = documentation.asJSON()
		}
		if let max = self.max {
			json["max"] = max.asJSON()
		}
		if let min = self.min.value {
			json["min"] = min.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if part.count > 0 {
			json["part"] = Array(part.map() { $0.asJSON() })
		}
		if let profile = self.profile {
			json["profile"] = profile.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinitionParameter.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinitionParameter. Will return empty instance: \(error))")
		}
		return OperationDefinitionParameter.init()
	}
}


/**
 *  ValueSet details if this is coded.
 *
 *  Binds to a value set if this parameter is coded (code, Coding, CodeableConcept).
 */
open class OperationDefinitionParameterBinding: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationDefinitionParameterBinding" }
	}

    @objc public dynamic var strength: String?
    @objc public dynamic var valueSetReference: Reference?
    public func upsert(valueSetReference: Reference?) {
        upsert(prop: &self.valueSetReference, val: valueSetReference)
    }
    @objc public dynamic var valueSetUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(strength: String, valueSetReference: Reference, valueSetUri: String) {
        self.init()
        self.strength = strength
        self.valueSetReference = valueSetReference
        self.valueSetUri = valueSetUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case strength = "strength"
        case valueSetReference = "valueSetReference"
        case valueSetUri = "valueSetUri"
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

        self.strength = try container.decodeIfPresent(String.self, forKey: .strength)
        self.valueSetReference = try container.decodeIfPresent(Reference.self, forKey: .valueSetReference)
        self.valueSetUri = try container.decodeIfPresent(String.self, forKey: .valueSetUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.strength, forKey: .strength)
        try container.encodeIfPresent(self.valueSetReference, forKey: .valueSetReference)
        try container.encodeIfPresent(self.valueSetUri, forKey: .valueSetUri)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["strength"] {
				presentKeys.insert("strength")
				if let val = exist as? String {
					self.strength = val
				}
				else {
					errors.append(FHIRJSONError(key: "strength", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "strength"))
			}
			if let exist = js["valueSetReference"] {
				presentKeys.insert("valueSetReference")
				if let val = exist as? FHIRJSON {
					upsert(valueSetReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "valueSetReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueSetUri"] {
				presentKeys.insert("valueSetUri")
				if let val = exist as? String {
					self.valueSetUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueSetUri", wants: String.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.valueSetUri && nil == self.valueSetReference {
				errors.append(FHIRJSONError(key: "valueSet*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let strength = self.strength {
			json["strength"] = strength.asJSON()
		}
		if let valueSetReference = self.valueSetReference {
			json["valueSetReference"] = valueSetReference.asJSON()
		}
		if let valueSetUri = self.valueSetUri {
			json["valueSetUri"] = valueSetUri.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationDefinitionParameterBinding.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationDefinitionParameterBinding. Will return empty instance: \(error))")
		}
		return OperationDefinitionParameterBinding.init()
	}
}

