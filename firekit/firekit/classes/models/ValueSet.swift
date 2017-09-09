//
//  ValueSet.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ValueSet) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A set of codes drawn from one or more code systems.
 *
 *  A value set specifies a set of codes drawn from one or more code systems.
 */
open class ValueSet: DomainResource {
	override open class var resourceType: String {
		get { return "ValueSet" }
	}

    @objc public dynamic var codeSystem: ValueSetCodeSystem?
    public func upsert(codeSystem: ValueSetCodeSystem?) {
        upsert(prop: &self.codeSystem, val: codeSystem)
    }
    @objc public dynamic var compose: ValueSetCompose?
    public func upsert(compose: ValueSetCompose?) {
        upsert(prop: &self.compose, val: compose)
    }
    public let contact = RealmSwift.List<ValueSetContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    @objc public dynamic var expansion: ValueSetExpansion?
    public func upsert(expansion: ValueSetExpansion?) {
        upsert(prop: &self.expansion, val: expansion)
    }
    public let experimental = RealmOptional<Bool>()
    public let extensible = RealmOptional<Bool>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    public let immutable = RealmOptional<Bool>()
    @objc public dynamic var lockedDate: FHIRDate?
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var status: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(status: String) {
        self.init()
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case codeSystem = "codeSystem"
        case compose = "compose"
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case expansion = "expansion"
        case experimental = "experimental"
        case extensible = "extensible"
        case identifier = "identifier"
        case immutable = "immutable"
        case lockedDate = "lockedDate"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case status = "status"
        case url = "url"
        case useContext = "useContext"
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


        // ValueSetCodeSystem: FHIRJSON
        if let codeSystemVal = try container.decodeIfPresent(ValueSetCodeSystem.self, forKey: .codeSystem) {
          self.codeSystem = codeSystemVal
        }
        // ValueSetCompose: FHIRJSON
        if let composeVal = try container.decodeIfPresent(ValueSetCompose.self, forKey: .compose) {
          self.compose = composeVal
        }
        if let contactVals = try container.decodeIfPresent([ValueSetContact].self, forKey: .contact) {
          // ValueSetContact: FHIRJSON
        }
        // String: String
        if let copyrightVal = try container.decodeIfPresent(String.self, forKey: .copyright) {
          self.copyright = copyrightVal
        }
        // DateTime: String
        if let dateVal = try container.decodeIfPresent(DateTime.self, forKey: .date) {
          self.date = dateVal
        }
        // String: String
        if let description_fhirVal = try container.decodeIfPresent(String.self, forKey: .description_fhir) {
          self.description_fhir = description_fhirVal
        }
        // ValueSetExpansion: FHIRJSON
        if let expansionVal = try container.decodeIfPresent(ValueSetExpansion.self, forKey: .expansion) {
          self.expansion = expansionVal
        }
        // Bool: Bool
        if let experimentalVal = try container.decodeIfPresent(Bool.self, forKey: .experimental) {
          self.experimental.value = experimentalVal
        }
        // Bool: Bool
        if let extensibleVal = try container.decodeIfPresent(Bool.self, forKey: .extensible) {
          self.extensible.value = extensibleVal
        }
        // Identifier: FHIRJSON
        if let identifierVal = try container.decodeIfPresent(Identifier.self, forKey: .identifier) {
          self.identifier = identifierVal
        }
        // Bool: Bool
        if let immutableVal = try container.decodeIfPresent(Bool.self, forKey: .immutable) {
          self.immutable.value = immutableVal
        }
        // FHIRDate: String
        if let lockedDateVal = try container.decodeIfPresent(FHIRDate.self, forKey: .lockedDate) {
          self.lockedDate = lockedDateVal
        }
        // String: String
        if let nameVal = try container.decodeIfPresent(String.self, forKey: .name) {
          self.name = nameVal
        }
        // String: String
        if let publisherVal = try container.decodeIfPresent(String.self, forKey: .publisher) {
          self.publisher = publisherVal
        }
        // String: String
        if let requirementsVal = try container.decodeIfPresent(String.self, forKey: .requirements) {
          self.requirements = requirementsVal
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        // String: String
        if let urlVal = try container.decodeIfPresent(String.self, forKey: .url) {
          self.url = urlVal
        }
        if let useContextVals = try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) {
          // CodeableConcept: FHIRJSON
        }
        // String: String
        if let versionVal = try container.decodeIfPresent(String.self, forKey: .version) {
          self.version = versionVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encodeIfPresent(self.compose, forKey: .compose)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.expansion, forKey: .expansion)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.extensible.value, forKey: .extensible)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.immutable.value, forKey: .immutable)
        try container.encodeIfPresent(self.lockedDate, forKey: .lockedDate)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(self.useContext.flatMap { $0 }, forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["codeSystem"] {
				presentKeys.insert("codeSystem")
				if let val = exist as? FHIRJSON {
					upsert(codeSystem: ValueSetCodeSystem(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "codeSystem", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["compose"] {
				presentKeys.insert("compose")
				if let val = exist as? FHIRJSON {
					upsert(compose: ValueSetCompose(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "compose", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetContact.instantiate(fromArray: val, owner: self) as? [ValueSetContact] {
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
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["expansion"] {
				presentKeys.insert("expansion")
				if let val = exist as? FHIRJSON {
					upsert(expansion: ValueSetExpansion(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "expansion", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["extensible"] {
				presentKeys.insert("extensible")
				if let val = exist as? Bool {
					self.extensible.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "extensible", wants: Bool.self, has: type(of: exist)))
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
			if let exist = js["immutable"] {
				presentKeys.insert("immutable")
				if let val = exist as? Bool {
					self.immutable.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "immutable", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["lockedDate"] {
				presentKeys.insert("lockedDate")
				if let val = exist as? String {
					self.lockedDate = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "lockedDate", wants: String.self, has: type(of: exist)))
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
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["useContext"] {
				presentKeys.insert("useContext")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.useContext) }
						self.useContext.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "useContext", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		
		if let codeSystem = self.codeSystem {
			json["codeSystem"] = codeSystem.asJSON()
		}
		if let compose = self.compose {
			json["compose"] = compose.asJSON()
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
		if let expansion = self.expansion {
			json["expansion"] = expansion.asJSON()
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let extensible = self.extensible.value {
			json["extensible"] = extensible.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let immutable = self.immutable.value {
			json["immutable"] = immutable.asJSON()
		}
		if let lockedDate = self.lockedDate {
			json["lockedDate"] = lockedDate.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
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
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if useContext.count > 0 {
			json["useContext"] = Array(useContext.map() { $0.asJSON() })
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  An inline code system, which is part of this value set.
 *
 *  A definition of a code system, inlined into the value set (as a packaging convenience). Note that the inline code
 *  system may be used from other value sets by referring to its (codeSystem.system) directly.
 */
open class ValueSetCodeSystem: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCodeSystem" }
	}

    public let caseSensitive = RealmOptional<Bool>()
    public let concept = RealmSwift.List<ValueSetCodeSystemConcept>()
    @objc public dynamic var system: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(concept: [ValueSetCodeSystemConcept], system: String) {
        self.init()
        self.concept.append(objectsIn: concept)
        self.system = system
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case caseSensitive = "caseSensitive"
        case concept = "concept"
        case system = "system"
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


        // Bool: Bool
        if let caseSensitiveVal = try container.decodeIfPresent(Bool.self, forKey: .caseSensitive) {
          self.caseSensitive.value = caseSensitiveVal
        }
        if let conceptVals = try container.decodeIfPresent([ValueSetCodeSystemConcept].self, forKey: .concept) {
          // ValueSetCodeSystemConcept: FHIRJSON
        }
        // String: String
        if let systemVal = try container.decodeIfPresent(String.self, forKey: .system) {
          self.system = systemVal
        }
        // String: String
        if let versionVal = try container.decodeIfPresent(String.self, forKey: .version) {
          self.version = versionVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.caseSensitive.value, forKey: .caseSensitive)
        try container.encode(self.concept.flatMap { $0 }, forKey: .concept)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["caseSensitive"] {
				presentKeys.insert("caseSensitive")
				if let val = exist as? Bool {
					self.caseSensitive.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "caseSensitive", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["concept"] {
				presentKeys.insert("concept")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetCodeSystemConcept.instantiate(fromArray: val, owner: self) as? [ValueSetCodeSystemConcept] {
						if let realm = self.realm { realm.delete(self.concept) }
						self.concept.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "concept", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "concept"))
			}
			if let exist = js["system"] {
				presentKeys.insert("system")
				if let val = exist as? String {
					self.system = val
				}
				else {
					errors.append(FHIRJSONError(key: "system", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "system"))
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
		
		if let caseSensitive = self.caseSensitive.value {
			json["caseSensitive"] = caseSensitive.asJSON()
		}
		if concept.count > 0 {
			json["concept"] = Array(concept.map() { $0.asJSON() })
		}
		if let system = self.system {
			json["system"] = system.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Concepts in the code system.
 *
 *  Concepts that are in the code system. The concept definitions are inherently hierarchical, but the definitions must
 *  be consulted to determine what the meaning of the hierarchical relationships are.
 */
open class ValueSetCodeSystemConcept: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCodeSystemConcept" }
	}

    public let abstract = RealmOptional<Bool>()
    @objc public dynamic var code: String?
    public let concept = RealmSwift.List<ValueSetCodeSystemConcept>()
    @objc public dynamic var definition: String?
    public let designation = RealmSwift.List<ValueSetCodeSystemConceptDesignation>()
    @objc public dynamic var display: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case abstract = "abstract"
        case code = "code"
        case concept = "concept"
        case definition = "definition"
        case designation = "designation"
        case display = "display"
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


        // Bool: Bool
        if let abstractVal = try container.decodeIfPresent(Bool.self, forKey: .abstract) {
          self.abstract.value = abstractVal
        }
        // String: String
        if let codeVal = try container.decodeIfPresent(String.self, forKey: .code) {
          self.code = codeVal
        }
        if let conceptVals = try container.decodeIfPresent([ValueSetCodeSystemConcept].self, forKey: .concept) {
          // ValueSetCodeSystemConcept: FHIRJSON
        }
        // String: String
        if let definitionVal = try container.decodeIfPresent(String.self, forKey: .definition) {
          self.definition = definitionVal
        }
        if let designationVals = try container.decodeIfPresent([ValueSetCodeSystemConceptDesignation].self, forKey: .designation) {
          // ValueSetCodeSystemConceptDesignation: FHIRJSON
        }
        // String: String
        if let displayVal = try container.decodeIfPresent(String.self, forKey: .display) {
          self.display = displayVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abstract.value, forKey: .abstract)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.concept.flatMap { $0 }, forKey: .concept)
        try container.encodeIfPresent(self.definition, forKey: .definition)
        try container.encode(self.designation.flatMap { $0 }, forKey: .designation)
        try container.encodeIfPresent(self.display, forKey: .display)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["abstract"] {
				presentKeys.insert("abstract")
				if let val = exist as? Bool {
					self.abstract.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "abstract", wants: Bool.self, has: type(of: exist)))
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
			if let exist = js["concept"] {
				presentKeys.insert("concept")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetCodeSystemConcept.instantiate(fromArray: val, owner: self) as? [ValueSetCodeSystemConcept] {
						if let realm = self.realm { realm.delete(self.concept) }
						self.concept.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "concept", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["designation"] {
				presentKeys.insert("designation")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetCodeSystemConceptDesignation.instantiate(fromArray: val, owner: self) as? [ValueSetCodeSystemConceptDesignation] {
						if let realm = self.realm { realm.delete(self.designation) }
						self.designation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "designation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["display"] {
				presentKeys.insert("display")
				if let val = exist as? String {
					self.display = val
				}
				else {
					errors.append(FHIRJSONError(key: "display", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let abstract = self.abstract.value {
			json["abstract"] = abstract.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if concept.count > 0 {
			json["concept"] = Array(concept.map() { $0.asJSON() })
		}
		if let definition = self.definition {
			json["definition"] = definition.asJSON()
		}
		if designation.count > 0 {
			json["designation"] = Array(designation.map() { $0.asJSON() })
		}
		if let display = self.display {
			json["display"] = display.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Additional representations for the concept.
 *
 *  Additional representations for the concept - other languages, aliases, specialized purposes, used for particular
 *  purposes, etc.
 */
open class ValueSetCodeSystemConceptDesignation: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCodeSystemConceptDesignation" }
	}

    @objc public dynamic var language: String?
    @objc public dynamic var use: Coding?
    public func upsert(use: Coding?) {
        upsert(prop: &self.use, val: use)
    }
    @objc public dynamic var value: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(val: String) {
        self.init()
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case language = "language"
        case use = "use"
        case value = "value"
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
        if let languageVal = try container.decodeIfPresent(String.self, forKey: .language) {
          self.language = languageVal
        }
        // Coding: FHIRJSON
        if let useVal = try container.decodeIfPresent(Coding.self, forKey: .use) {
          self.use = useVal
        }
        // String: String
        if let valueVal = try container.decodeIfPresent(String.self, forKey: .value) {
          self.value = valueVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.use, forKey: .use)
        try container.encodeIfPresent(self.value, forKey: .value)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["language"] {
				presentKeys.insert("language")
				if let val = exist as? String {
					self.language = val
				}
				else {
					errors.append(FHIRJSONError(key: "language", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["use"] {
				presentKeys.insert("use")
				if let val = exist as? FHIRJSON {
					upsert(use: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "use", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = val
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
		
		if let language = self.language {
			json["language"] = language.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  When value set includes codes from elsewhere.
 *
 *  A set of criteria that provide the content logical definition of the value set by including or excluding codes from
 *  outside this value set.
 */
open class ValueSetCompose: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetCompose" }
	}

    public let exclude = RealmSwift.List<ValueSetComposeInclude>()
    public let import_fhir = RealmSwift.List<RealmString>()
    public let include = RealmSwift.List<ValueSetComposeInclude>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case exclude = "exclude"
        case import_fhir = "import"
        case include = "include"
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


        if let excludeVals = try container.decodeIfPresent([ValueSetComposeInclude].self, forKey: .exclude) {
          // ValueSetComposeInclude: FHIRJSON
        }
        if let import_fhirVals = try container.decodeIfPresent([String].self, forKey: .import_fhir) {
          // String: String
        }
        if let includeVals = try container.decodeIfPresent([ValueSetComposeInclude].self, forKey: .include) {
          // ValueSetComposeInclude: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.exclude.flatMap { $0 }, forKey: .exclude)
        try container.encode(self.import_fhir.flatMap { $0.value }, forKey: .import_fhir)
        try container.encode(self.include.flatMap { $0 }, forKey: .include)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["exclude"] {
				presentKeys.insert("exclude")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetComposeInclude.instantiate(fromArray: val, owner: self) as? [ValueSetComposeInclude] {
						if let realm = self.realm { realm.delete(self.exclude) }
						self.exclude.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "exclude", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["import"] {
				presentKeys.insert("import")
				if let val = exist as? [String] {
					self.import_fhir.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "import", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["include"] {
				presentKeys.insert("include")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetComposeInclude.instantiate(fromArray: val, owner: self) as? [ValueSetComposeInclude] {
						if let realm = self.realm { realm.delete(self.include) }
						self.include.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "include", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if exclude.count > 0 {
			json["exclude"] = Array(exclude.map() { $0.asJSON() })
		}
		if import_fhir.count > 0 {
			json["import"] = Array(import_fhir.map() { $0.value })
		}
		if include.count > 0 {
			json["include"] = Array(include.map() { $0.asJSON() })
		}
		
		return json
	}
*/
}


/**
 *  Include one or more codes from a code system.
 */
open class ValueSetComposeInclude: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetComposeInclude" }
	}

    public let concept = RealmSwift.List<ValueSetComposeIncludeConcept>()
    public let filter = RealmSwift.List<ValueSetComposeIncludeFilter>()
    @objc public dynamic var system: String?
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(system: String) {
        self.init()
        self.system = system
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case concept = "concept"
        case filter = "filter"
        case system = "system"
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


        if let conceptVals = try container.decodeIfPresent([ValueSetComposeIncludeConcept].self, forKey: .concept) {
          // ValueSetComposeIncludeConcept: FHIRJSON
        }
        if let filterVals = try container.decodeIfPresent([ValueSetComposeIncludeFilter].self, forKey: .filter) {
          // ValueSetComposeIncludeFilter: FHIRJSON
        }
        // String: String
        if let systemVal = try container.decodeIfPresent(String.self, forKey: .system) {
          self.system = systemVal
        }
        // String: String
        if let versionVal = try container.decodeIfPresent(String.self, forKey: .version) {
          self.version = versionVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.concept.flatMap { $0 }, forKey: .concept)
        try container.encode(self.filter.flatMap { $0 }, forKey: .filter)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["concept"] {
				presentKeys.insert("concept")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetComposeIncludeConcept.instantiate(fromArray: val, owner: self) as? [ValueSetComposeIncludeConcept] {
						if let realm = self.realm { realm.delete(self.concept) }
						self.concept.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "concept", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["filter"] {
				presentKeys.insert("filter")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetComposeIncludeFilter.instantiate(fromArray: val, owner: self) as? [ValueSetComposeIncludeFilter] {
						if let realm = self.realm { realm.delete(self.filter) }
						self.filter.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "filter", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["system"] {
				presentKeys.insert("system")
				if let val = exist as? String {
					self.system = val
				}
				else {
					errors.append(FHIRJSONError(key: "system", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "system"))
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
		
		if concept.count > 0 {
			json["concept"] = Array(concept.map() { $0.asJSON() })
		}
		if filter.count > 0 {
			json["filter"] = Array(filter.map() { $0.asJSON() })
		}
		if let system = self.system {
			json["system"] = system.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  A concept defined in the system.
 *
 *  Specifies a concept to be included or excluded.
 */
open class ValueSetComposeIncludeConcept: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetComposeIncludeConcept" }
	}

    @objc public dynamic var code: String?
    public let designation = RealmSwift.List<ValueSetCodeSystemConceptDesignation>()
    @objc public dynamic var display: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String) {
        self.init()
        self.code = code
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case designation = "designation"
        case display = "display"
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
        if let codeVal = try container.decodeIfPresent(String.self, forKey: .code) {
          self.code = codeVal
        }
        if let designationVals = try container.decodeIfPresent([ValueSetCodeSystemConceptDesignation].self, forKey: .designation) {
          // ValueSetCodeSystemConceptDesignation: FHIRJSON
        }
        // String: String
        if let displayVal = try container.decodeIfPresent(String.self, forKey: .display) {
          self.display = displayVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.designation.flatMap { $0 }, forKey: .designation)
        try container.encodeIfPresent(self.display, forKey: .display)
    }
/*
	
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
			if let exist = js["designation"] {
				presentKeys.insert("designation")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetCodeSystemConceptDesignation.instantiate(fromArray: val, owner: self) as? [ValueSetCodeSystemConceptDesignation] {
						if let realm = self.realm { realm.delete(self.designation) }
						self.designation.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "designation", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["display"] {
				presentKeys.insert("display")
				if let val = exist as? String {
					self.display = val
				}
				else {
					errors.append(FHIRJSONError(key: "display", wants: String.self, has: type(of: exist)))
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
		if designation.count > 0 {
			json["designation"] = Array(designation.map() { $0.asJSON() })
		}
		if let display = self.display {
			json["display"] = display.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Select codes/concepts by their properties (including relationships).
 *
 *  Select concepts by specify a matching criteria based on the properties (including relationships) defined by the
 *  system. If multiple filters are specified, they SHALL all be true.
 */
open class ValueSetComposeIncludeFilter: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetComposeIncludeFilter" }
	}

    @objc public dynamic var op: String?
    @objc public dynamic var property: String?
    @objc public dynamic var value: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(op: String, property: String, val: String) {
        self.init()
        self.op = op
        self.property = property
        self.value = val
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case op = "op"
        case property = "property"
        case value = "value"
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
        if let opVal = try container.decodeIfPresent(String.self, forKey: .op) {
          self.op = opVal
        }
        // String: String
        if let propertyVal = try container.decodeIfPresent(String.self, forKey: .property) {
          self.property = propertyVal
        }
        // String: String
        if let valueVal = try container.decodeIfPresent(String.self, forKey: .value) {
          self.value = valueVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.op, forKey: .op)
        try container.encodeIfPresent(self.property, forKey: .property)
        try container.encodeIfPresent(self.value, forKey: .value)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["op"] {
				presentKeys.insert("op")
				if let val = exist as? String {
					self.op = val
				}
				else {
					errors.append(FHIRJSONError(key: "op", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "op"))
			}
			if let exist = js["property"] {
				presentKeys.insert("property")
				if let val = exist as? String {
					self.property = val
				}
				else {
					errors.append(FHIRJSONError(key: "property", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "property"))
			}
			if let exist = js["value"] {
				presentKeys.insert("value")
				if let val = exist as? String {
					self.value = val
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
		
		if let op = self.op {
			json["op"] = op.asJSON()
		}
		if let property = self.property {
			json["property"] = property.asJSON()
		}
		if let value = self.value {
			json["value"] = value.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ValueSetContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetContact" }
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


        // String: String
        if let nameVal = try container.decodeIfPresent(String.self, forKey: .name) {
          self.name = nameVal
        }
        if let telecomVals = try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) {
          // ContactPoint: FHIRJSON
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encode(self.telecom.flatMap { $0 }, forKey: .telecom)
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
}


/**
 *  Used when the value set is "expanded".
 *
 *  A value set can also be "expanded", where the value set is turned into a simple collection of enumerated codes. This
 *  element holds the expansion, if it has been performed.
 */
open class ValueSetExpansion: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetExpansion" }
	}

    public let contains = RealmSwift.List<ValueSetExpansionContains>()
    @objc public dynamic var identifier: String?
    public let offset = RealmOptional<Int>()
    public let parameter = RealmSwift.List<ValueSetExpansionParameter>()
    @objc public dynamic var timestamp: DateTime?
    public let total = RealmOptional<Int>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: String, timestamp: DateTime) {
        self.init()
        self.identifier = identifier
        self.timestamp = timestamp
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contains = "contains"
        case identifier = "identifier"
        case offset = "offset"
        case parameter = "parameter"
        case timestamp = "timestamp"
        case total = "total"
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


        if let containsVals = try container.decodeIfPresent([ValueSetExpansionContains].self, forKey: .contains) {
          // ValueSetExpansionContains: FHIRJSON
        }
        // String: String
        if let identifierVal = try container.decodeIfPresent(String.self, forKey: .identifier) {
          self.identifier = identifierVal
        }
        // Int: Int
        if let offsetVal = try container.decodeIfPresent(Int.self, forKey: .offset) {
          self.offset.value = offsetVal
        }
        if let parameterVals = try container.decodeIfPresent([ValueSetExpansionParameter].self, forKey: .parameter) {
          // ValueSetExpansionParameter: FHIRJSON
        }
        // DateTime: String
        if let timestampVal = try container.decodeIfPresent(DateTime.self, forKey: .timestamp) {
          self.timestamp = timestampVal
        }
        // Int: Int
        if let totalVal = try container.decodeIfPresent(Int.self, forKey: .total) {
          self.total.value = totalVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.contains.flatMap { $0 }, forKey: .contains)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.offset.value, forKey: .offset)
        try container.encode(self.parameter.flatMap { $0 }, forKey: .parameter)
        try container.encodeIfPresent(self.timestamp, forKey: .timestamp)
        try container.encodeIfPresent(self.total.value, forKey: .total)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contains"] {
				presentKeys.insert("contains")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetExpansionContains.instantiate(fromArray: val, owner: self) as? [ValueSetExpansionContains] {
						if let realm = self.realm { realm.delete(self.contains) }
						self.contains.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contains", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["offset"] {
				presentKeys.insert("offset")
				if let val = exist as? Int {
					self.offset.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "offset", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["parameter"] {
				presentKeys.insert("parameter")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetExpansionParameter.instantiate(fromArray: val, owner: self) as? [ValueSetExpansionParameter] {
						if let realm = self.realm { realm.delete(self.parameter) }
						self.parameter.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "parameter", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["timestamp"] {
				presentKeys.insert("timestamp")
				if let val = exist as? String {
					self.timestamp = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "timestamp", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "timestamp"))
			}
			if let exist = js["total"] {
				presentKeys.insert("total")
				if let val = exist as? Int {
					self.total.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "total", wants: Int.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if contains.count > 0 {
			json["contains"] = Array(contains.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let offset = self.offset.value {
			json["offset"] = offset.asJSON()
		}
		if parameter.count > 0 {
			json["parameter"] = Array(parameter.map() { $0.asJSON() })
		}
		if let timestamp = self.timestamp {
			json["timestamp"] = timestamp.asJSON()
		}
		if let total = self.total.value {
			json["total"] = total.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Codes in the value set.
 *
 *  The codes that are contained in the value set expansion.
 */
open class ValueSetExpansionContains: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetExpansionContains" }
	}

    public let abstract = RealmOptional<Bool>()
    @objc public dynamic var code: String?
    public let contains = RealmSwift.List<ValueSetExpansionContains>()
    @objc public dynamic var display: String?
    @objc public dynamic var system: String?
    @objc public dynamic var version: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case abstract = "abstract"
        case code = "code"
        case contains = "contains"
        case display = "display"
        case system = "system"
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


        // Bool: Bool
        if let abstractVal = try container.decodeIfPresent(Bool.self, forKey: .abstract) {
          self.abstract.value = abstractVal
        }
        // String: String
        if let codeVal = try container.decodeIfPresent(String.self, forKey: .code) {
          self.code = codeVal
        }
        if let containsVals = try container.decodeIfPresent([ValueSetExpansionContains].self, forKey: .contains) {
          // ValueSetExpansionContains: FHIRJSON
        }
        // String: String
        if let displayVal = try container.decodeIfPresent(String.self, forKey: .display) {
          self.display = displayVal
        }
        // String: String
        if let systemVal = try container.decodeIfPresent(String.self, forKey: .system) {
          self.system = systemVal
        }
        // String: String
        if let versionVal = try container.decodeIfPresent(String.self, forKey: .version) {
          self.version = versionVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.abstract.value, forKey: .abstract)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.contains.flatMap { $0 }, forKey: .contains)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["abstract"] {
				presentKeys.insert("abstract")
				if let val = exist as? Bool {
					self.abstract.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "abstract", wants: Bool.self, has: type(of: exist)))
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
			if let exist = js["contains"] {
				presentKeys.insert("contains")
				if let val = exist as? [FHIRJSON] {
					if let vals = ValueSetExpansionContains.instantiate(fromArray: val, owner: self) as? [ValueSetExpansionContains] {
						if let realm = self.realm { realm.delete(self.contains) }
						self.contains.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contains", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["display"] {
				presentKeys.insert("display")
				if let val = exist as? String {
					self.display = val
				}
				else {
					errors.append(FHIRJSONError(key: "display", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["system"] {
				presentKeys.insert("system")
				if let val = exist as? String {
					self.system = val
				}
				else {
					errors.append(FHIRJSONError(key: "system", wants: String.self, has: type(of: exist)))
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
		
		if let abstract = self.abstract.value {
			json["abstract"] = abstract.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if contains.count > 0 {
			json["contains"] = Array(contains.map() { $0.asJSON() })
		}
		if let display = self.display {
			json["display"] = display.asJSON()
		}
		if let system = self.system {
			json["system"] = system.asJSON()
		}
		if let version = self.version {
			json["version"] = version.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Parameter that controlled the expansion process.
 *
 *  A parameter that controlled the expansion process. These parameters may be used by users of expanded value sets to
 *  check whether the expansion is suitable for a particular purpose, or to pick the correct expansion.
 */
open class ValueSetExpansionParameter: BackboneElement {
	override open class var resourceType: String {
		get { return "ValueSetExpansionParameter" }
	}

    @objc public dynamic var name: String?
    public let valueBoolean = RealmOptional<Bool>()
    @objc public dynamic var valueCode: String?
    @objc public dynamic var valueDecimal: RealmDecimal?
    public let valueInteger = RealmOptional<Int>()
    @objc public dynamic var valueString: String?
    @objc public dynamic var valueUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(name: String) {
        self.init()
        self.name = name
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case valueBoolean = "valueBoolean"
        case valueCode = "valueCode"
        case valueDecimal = "valueDecimal"
        case valueInteger = "valueInteger"
        case valueString = "valueString"
        case valueUri = "valueUri"
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
        if let nameVal = try container.decodeIfPresent(String.self, forKey: .name) {
          self.name = nameVal
        }
        // Bool: Bool
        if let valueBooleanVal = try container.decodeIfPresent(Bool.self, forKey: .valueBoolean) {
          self.valueBoolean.value = valueBooleanVal
        }
        // String: String
        if let valueCodeVal = try container.decodeIfPresent(String.self, forKey: .valueCode) {
          self.valueCode = valueCodeVal
        }
        // RealmDecimal: NSNumber
        if let valueDecimalVal = try container.decodeIfPresent(RealmDecimal.self, forKey: .valueDecimal) {
          self.valueDecimal = valueDecimalVal
        }
        // Int: Int
        if let valueIntegerVal = try container.decodeIfPresent(Int.self, forKey: .valueInteger) {
          self.valueInteger.value = valueIntegerVal
        }
        // String: String
        if let valueStringVal = try container.decodeIfPresent(String.self, forKey: .valueString) {
          self.valueString = valueStringVal
        }
        // String: String
        if let valueUriVal = try container.decodeIfPresent(String.self, forKey: .valueUri) {
          self.valueUri = valueUriVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.valueBoolean.value, forKey: .valueBoolean)
        try container.encodeIfPresent(self.valueCode, forKey: .valueCode)
        try container.encodeIfPresent(self.valueDecimal, forKey: .valueDecimal)
        try container.encodeIfPresent(self.valueInteger.value, forKey: .valueInteger)
        try container.encodeIfPresent(self.valueString, forKey: .valueString)
        try container.encodeIfPresent(self.valueUri, forKey: .valueUri)
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
			else {
				errors.append(FHIRJSONError(key: "name"))
			}
			if let exist = js["valueBoolean"] {
				presentKeys.insert("valueBoolean")
				if let val = exist as? Bool {
					self.valueBoolean.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueBoolean", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueCode"] {
				presentKeys.insert("valueCode")
				if let val = exist as? String {
					self.valueCode = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueCode", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueDecimal"] {
				presentKeys.insert("valueDecimal")
				if let val = exist as? NSNumber {
					self.valueDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "valueDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueInteger"] {
				presentKeys.insert("valueInteger")
				if let val = exist as? Int {
					self.valueInteger.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueInteger", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueString"] {
				presentKeys.insert("valueString")
				if let val = exist as? String {
					self.valueString = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueString", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["valueUri"] {
				presentKeys.insert("valueUri")
				if let val = exist as? String {
					self.valueUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "valueUri", wants: String.self, has: type(of: exist)))
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
		if let valueBoolean = self.valueBoolean.value {
			json["valueBoolean"] = valueBoolean.asJSON()
		}
		if let valueCode = self.valueCode {
			json["valueCode"] = valueCode.asJSON()
		}
		if let valueDecimal = self.valueDecimal {
			json["valueDecimal"] = valueDecimal.asJSON()
		}
		if let valueInteger = self.valueInteger.value {
			json["valueInteger"] = valueInteger.asJSON()
		}
		if let valueString = self.valueString {
			json["valueString"] = valueString.asJSON()
		}
		if let valueUri = self.valueUri {
			json["valueUri"] = valueUri.asJSON()
		}
		
		return json
	}
*/
}

