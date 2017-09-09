//
//  SearchParameter.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/SearchParameter) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Search Parameter for a resource.
 *
 *  A search parameter that defines a named search item that can be used to search/filter on a resource.
 */
open class SearchParameter: DomainResource {
	override open class var resourceType: String {
		get { return "SearchParameter" }
	}

    @objc public dynamic var base: String?
    @objc public dynamic var code: String?
    public let contact = RealmSwift.List<SearchParameterContact>()
    @objc public dynamic var date: DateTime?
    @objc public dynamic var description_fhir: String?
    public let experimental = RealmOptional<Bool>()
    @objc public dynamic var name: String?
    @objc public dynamic var publisher: String?
    @objc public dynamic var requirements: String?
    @objc public dynamic var status: String?
    public let target = RealmSwift.List<RealmString>()
    @objc public dynamic var type: String?
    @objc public dynamic var url: String?
    @objc public dynamic var xpath: String?
    @objc public dynamic var xpathUsage: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(base: String, code: String, description_fhir: String, name: String, type: String, url: String) {
        self.init()
        self.base = base
        self.code = code
        self.description_fhir = description_fhir
        self.name = name
        self.type = type
        self.url = url
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case base = "base"
        case code = "code"
        case contact = "contact"
        case date = "date"
        case description_fhir = "description"
        case experimental = "experimental"
        case name = "name"
        case publisher = "publisher"
        case requirements = "requirements"
        case status = "status"
        case target = "target"
        case type = "type"
        case url = "url"
        case xpath = "xpath"
        case xpathUsage = "xpathUsage"
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
        if let baseVal = try container.decodeIfPresent(String.self, forKey: .base) {
          self.base = baseVal
        }
        // String: String
        if let codeVal = try container.decodeIfPresent(String.self, forKey: .code) {
          self.code = codeVal
        }
        if let contactVals = try container.decodeIfPresent([SearchParameterContact].self, forKey: .contact) {
          // SearchParameterContact: FHIRJSON
        }
        // DateTime: String
        if let dateVal = try container.decodeIfPresent(DateTime.self, forKey: .date) {
          self.date = dateVal
        }
        // String: String
        if let description_fhirVal = try container.decodeIfPresent(String.self, forKey: .description_fhir) {
          self.description_fhir = description_fhirVal
        }
        // Bool: Bool
        if let experimentalVal = try container.decodeIfPresent(Bool.self, forKey: .experimental) {
          self.experimental.value = experimentalVal
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
        if let targetVals = try container.decodeIfPresent([String].self, forKey: .target) {
          // String: String
        }
        // String: String
        if let typeVal = try container.decodeIfPresent(String.self, forKey: .type) {
          self.type = typeVal
        }
        // String: String
        if let urlVal = try container.decodeIfPresent(String.self, forKey: .url) {
          self.url = urlVal
        }
        // String: String
        if let xpathVal = try container.decodeIfPresent(String.self, forKey: .xpath) {
          self.xpath = xpathVal
        }
        // String: String
        if let xpathUsageVal = try container.decodeIfPresent(String.self, forKey: .xpathUsage) {
          self.xpathUsage = xpathUsageVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.base, forKey: .base)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.contact.flatMap { $0 }, forKey: .contact)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.description_fhir, forKey: .description_fhir)
        try container.encodeIfPresent(self.experimental.value, forKey: .experimental)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.publisher, forKey: .publisher)
        try container.encodeIfPresent(self.requirements, forKey: .requirements)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encode(self.target.flatMap { $0.value }, forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.xpath, forKey: .xpath)
        try container.encodeIfPresent(self.xpathUsage, forKey: .xpathUsage)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["base"] {
				presentKeys.insert("base")
				if let val = exist as? String {
					self.base = val
				}
				else {
					errors.append(FHIRJSONError(key: "base", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "base"))
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
					if let vals = SearchParameterContact.instantiate(fromArray: val, owner: self) as? [SearchParameterContact] {
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
			else {
				errors.append(FHIRJSONError(key: "description"))
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
			if let exist = js["url"] {
				presentKeys.insert("url")
				if let val = exist as? String {
					self.url = val
				}
				else {
					errors.append(FHIRJSONError(key: "url", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "url"))
			}
			if let exist = js["xpath"] {
				presentKeys.insert("xpath")
				if let val = exist as? String {
					self.xpath = val
				}
				else {
					errors.append(FHIRJSONError(key: "xpath", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["xpathUsage"] {
				presentKeys.insert("xpathUsage")
				if let val = exist as? String {
					self.xpathUsage = val
				}
				else {
					errors.append(FHIRJSONError(key: "xpathUsage", wants: String.self, has: type(of: exist)))
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
		if target.count > 0 {
			json["target"] = Array(target.map() { $0.value })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		if let url = self.url {
			json["url"] = url.asJSON()
		}
		if let xpath = self.xpath {
			json["xpath"] = xpath.asJSON()
		}
		if let xpathUsage = self.xpathUsage {
			json["xpathUsage"] = xpathUsage.asJSON()
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
open class SearchParameterContact: BackboneElement {
	override open class var resourceType: String {
		get { return "SearchParameterContact" }
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

