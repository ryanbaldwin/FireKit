//
//  ConceptMap.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ConceptMap) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A map from one set of concepts to one or more other concepts.
 *
 *  A statement of relationships from one set of concepts to one or more other concepts - either code systems or data
 *  elements, or classes in class models.
 */
open class ConceptMap: DomainResource {
	override open class var resourceType: String {
		get { return "ConceptMap" }
	}

    public let contact = RealmSwift.List<ConceptMapContact>()
    @objc public dynamic var copyright: String?
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let element = RealmSwift.List<ConceptMapElement>()
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var sourceReference: Reference?
    public func upsert(sourceReference: Reference?) {
        upsert(prop: &self.sourceReference, val: sourceReference)
    }
    @objc public dynamic var sourceUri: String?
    @objc public dynamic var status: String?
    @objc public dynamic var targetReference: Reference?
    public func upsert(targetReference: Reference?) {
        upsert(prop: &self.targetReference, val: targetReference)
    }
    @objc public dynamic var targetUri: String?
    @objc public dynamic var url: String?
    public let useContext = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var version: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(sourceReference: Reference, sourceUri: String, status: String, targetReference: Reference, targetUri: String) {
        self.init()
        self.sourceReference = sourceReference
        self.sourceUri = sourceUri
        self.status = status
        self.targetReference = targetReference
        self.targetUri = targetUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case contact = "contact"
        case copyright = "copyright"
        case date = "date"
        case description_fhir = "description"
        case element = "element"
        case experimental = "experimental"
        case identifier = "identifier"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case sourceReference = "sourceReference"
        case sourceUri = "sourceUri"
        case status = "status"
        case targetReference = "targetReference"
        case targetUri = "targetUri"
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

        self.contact.append(objectsIn: try container.decodeIfPresent([ConceptMapContact].self, forKey: .contact) ?? [])
        self.copyright = try container.decodeIfPresent(String.self, forKey: .copyright)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.description_fhir = try container.decodeIfPresent(String.self, forKey: .description_fhir)
        self.element.append(objectsIn: try container.decodeIfPresent([ConceptMapElement].self, forKey: .element) ?? [])
        self.experimental.value = try container.decodeIfPresent(Bool.self, forKey: .experimental)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        self.requirements = try container.decodeIfPresent(String.self, forKey: .requirements)
        self.sourceReference = try container.decodeIfPresent(Reference.self, forKey: .sourceReference)
        self.sourceUri = try container.decodeIfPresent(String.self, forKey: .sourceUri)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.targetReference = try container.decodeIfPresent(Reference.self, forKey: .targetReference)
        self.targetUri = try container.decodeIfPresent(String.self, forKey: .targetUri)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.useContext.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .useContext) ?? [])
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encodeIfPresent(self.copyright, forKey: .copyright)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encode(self.element.flatMap { $0 }, forKey: .element)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.sourceReference, forKey: .sourceReference)
        try container.encodeIfPresent(self.sourceUri, forKey: .sourceUri)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.targetReference, forKey: .targetReference)
        try container.encodeIfPresent(self.targetUri, forKey: .targetUri)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encode(self.useContext.flatMap { $0 }, forKey: .useContext)
        try container.encodeIfPresent(self.version, forKey: .version)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConceptMapContact.instantiate(fromArray: val, owner: self) as? [ConceptMapContact] {
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
			if let exist = js["element"] {
				presentKeys.insert("element")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConceptMapElement.instantiate(fromArray: val, owner: self) as? [ConceptMapElement] {
						if let realm = self.realm { realm.delete(self.element) }
						self.element.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "element", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["sourceReference"] {
				presentKeys.insert("sourceReference")
				if let val = exist as? FHIRJSON {
					upsert(sourceReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "sourceReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["sourceUri"] {
				presentKeys.insert("sourceUri")
				if let val = exist as? String {
					self.sourceUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "sourceUri", wants: String.self, has: type(of: exist)))
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
			if let exist = js["targetReference"] {
				presentKeys.insert("targetReference")
				if let val = exist as? FHIRJSON {
					upsert(targetReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "targetReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["targetUri"] {
				presentKeys.insert("targetUri")
				if let val = exist as? String {
					self.targetUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "targetUri", wants: String.self, has: type(of: exist)))
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
			
			// check if nonoptional expanded properties are present
			if nil == self.sourceUri && nil == self.sourceReference {
				errors.append(FHIRJSONError(key: "source*"))
			}
			if nil == self.targetUri && nil == self.targetReference {
				errors.append(FHIRJSONError(key: "target*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
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
		if element.count > 0 {
			json["element"] = Array(element.map() { $0.asJSON() })
		}
		if let experimental = self.experimental.value {
			json["experimental"] = experimental.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
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
		if let sourceReference = self.sourceReference {
			json["sourceReference"] = sourceReference.asJSON()
		}
		if let sourceUri = self.sourceUri {
			json["sourceUri"] = sourceUri.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let targetReference = self.targetReference {
			json["targetReference"] = targetReference.asJSON()
		}
		if let targetUri = self.targetUri {
			json["targetUri"] = targetUri.asJSON()
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
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMap.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMap. Will return empty instance: \(error))")
		}
		return ConceptMap.init()
	}
}


/**
 *  Contact details of the publisher.
 *
 *  Contacts to assist a user in finding and communicating with the publisher.
 */
open class ConceptMapContact: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapContact" }
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
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapContact. Will return empty instance: \(error))")
		}
		return ConceptMapContact.init()
	}
}


/**
 *  Mappings for a concept from the source set.
 *
 *  Mappings for an individual concept in the source to one or more concepts in the target.
 */
open class ConceptMapElement: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapElement" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var codeSystem: String?
    public let target = RealmSwift.List<ConceptMapElementTarget>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeSystem = "codeSystem"
        case target = "target"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.codeSystem = try container.decodeIfPresent(String.self, forKey: .codeSystem)
        self.target.append(objectsIn: try container.decodeIfPresent([ConceptMapElementTarget].self, forKey: .target) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encode(self.target.flatMap { $0 }, forKey: .target)
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
			if let exist = js["codeSystem"] {
				presentKeys.insert("codeSystem")
				if let val = exist as? String {
					self.codeSystem = val
				}
				else {
					errors.append(FHIRJSONError(key: "codeSystem", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConceptMapElementTarget.instantiate(fromArray: val, owner: self) as? [ConceptMapElementTarget] {
						if let realm = self.realm { realm.delete(self.target) }
						self.target.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if let codeSystem = self.codeSystem {
			json["codeSystem"] = codeSystem.asJSON()
		}
		if target.count > 0 {
			json["target"] = Array(target.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapElement.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapElement. Will return empty instance: \(error))")
		}
		return ConceptMapElement.init()
	}
}


/**
 *  Concept in target system for element.
 *
 *  A concept from the target value set that this concept maps to.
 */
open class ConceptMapElementTarget: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapElementTarget" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var codeSystem: String?
    @objc public dynamic var comments: String?
    public let dependsOn = RealmSwift.List<ConceptMapElementTargetDependsOn>()
    @objc public dynamic var equivalence: String?
    public let product = RealmSwift.List<ConceptMapElementTargetDependsOn>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(equivalence: String) {
        self.init()
        self.equivalence = equivalence
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeSystem = "codeSystem"
        case comments = "comments"
        case dependsOn = "dependsOn"
        case equivalence = "equivalence"
        case product = "product"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.codeSystem = try container.decodeIfPresent(String.self, forKey: .codeSystem)
        self.comments = try container.decodeIfPresent(String.self, forKey: .comments)
        self.dependsOn.append(objectsIn: try container.decodeIfPresent([ConceptMapElementTargetDependsOn].self, forKey: .dependsOn) ?? [])
        self.equivalence = try container.decodeIfPresent(String.self, forKey: .equivalence)
        self.product.append(objectsIn: try container.decodeIfPresent([ConceptMapElementTargetDependsOn].self, forKey: .product) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encodeIfPresent(self.comments, forKey: .comments)
        try container.encode(self.dependsOn.flatMap { $0 }, forKey: .dependsOn)
        try container.encodeIfPresent(self.equivalence, forKey: .equivalence)
        try container.encode(self.product.flatMap { $0 }, forKey: .product)
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
			if let exist = js["codeSystem"] {
				presentKeys.insert("codeSystem")
				if let val = exist as? String {
					self.codeSystem = val
				}
				else {
					errors.append(FHIRJSONError(key: "codeSystem", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["comments"] {
				presentKeys.insert("comments")
				if let val = exist as? String {
					self.comments = val
				}
				else {
					errors.append(FHIRJSONError(key: "comments", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["dependsOn"] {
				presentKeys.insert("dependsOn")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConceptMapElementTargetDependsOn.instantiate(fromArray: val, owner: self) as? [ConceptMapElementTargetDependsOn] {
						if let realm = self.realm { realm.delete(self.dependsOn) }
						self.dependsOn.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "dependsOn", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["equivalence"] {
				presentKeys.insert("equivalence")
				if let val = exist as? String {
					self.equivalence = val
				}
				else {
					errors.append(FHIRJSONError(key: "equivalence", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "equivalence"))
			}
			if let exist = js["product"] {
				presentKeys.insert("product")
				if let val = exist as? [FHIRJSON] {
					if let vals = ConceptMapElementTargetDependsOn.instantiate(fromArray: val, owner: self) as? [ConceptMapElementTargetDependsOn] {
						if let realm = self.realm { realm.delete(self.product) }
						self.product.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "product", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		if let codeSystem = self.codeSystem {
			json["codeSystem"] = codeSystem.asJSON()
		}
		if let comments = self.comments {
			json["comments"] = comments.asJSON()
		}
		if dependsOn.count > 0 {
			json["dependsOn"] = Array(dependsOn.map() { $0.asJSON() })
		}
		if let equivalence = self.equivalence {
			json["equivalence"] = equivalence.asJSON()
		}
		if product.count > 0 {
			json["product"] = Array(product.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapElementTarget.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapElementTarget. Will return empty instance: \(error))")
		}
		return ConceptMapElementTarget.init()
	}
}


/**
 *  Other elements required for this mapping (from context).
 *
 *  A set of additional dependencies for this mapping to hold. This mapping is only applicable if the specified element
 *  can be resolved, and it has the specified value.
 */
open class ConceptMapElementTargetDependsOn: BackboneElement {
	override open class var resourceType: String {
		get { return "ConceptMapElementTargetDependsOn" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var codeSystem: String?
    @objc public dynamic var element: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, codeSystem: String, element: String) {
        self.init()
        self.code = code
        self.codeSystem = codeSystem
        self.element = element
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case codeSystem = "codeSystem"
        case element = "element"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.codeSystem = try container.decodeIfPresent(String.self, forKey: .codeSystem)
        self.element = try container.decodeIfPresent(String.self, forKey: .element)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.codeSystem, forKey: .codeSystem)
        try container.encodeIfPresent(self.element, forKey: .element)
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
			if let exist = js["codeSystem"] {
				presentKeys.insert("codeSystem")
				if let val = exist as? String {
					self.codeSystem = val
				}
				else {
					errors.append(FHIRJSONError(key: "codeSystem", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "codeSystem"))
			}
			if let exist = js["element"] {
				presentKeys.insert("element")
				if let val = exist as? String {
					self.element = val
				}
				else {
					errors.append(FHIRJSONError(key: "element", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "element"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let codeSystem = self.codeSystem {
			json["codeSystem"] = codeSystem.asJSON()
		}
		if let element = self.element {
			json["element"] = element.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ConceptMapElementTargetDependsOn.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ConceptMapElementTargetDependsOn. Will return empty instance: \(error))")
		}
		return ConceptMapElementTargetDependsOn.init()
	}
}

