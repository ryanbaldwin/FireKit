//
//  HumanName.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/HumanName) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Name of a human - parts and usage.
 *
 *  A human's name with the ability to identify parts and usage.
 */
open class HumanName: Element {
	override open class var resourceType: String {
		get { return "HumanName" }
	}

    public let family = RealmSwift.List<RealmString>()
    public let given = RealmSwift.List<RealmString>()
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let prefix = RealmSwift.List<RealmString>()
    public let suffix = RealmSwift.List<RealmString>()
    @objc public dynamic var text: String?
    @objc public dynamic var use: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case family = "family"
        case given = "given"
        case period = "period"
        case prefix = "prefix"
        case suffix = "suffix"
        case text = "text"
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


        if let familyVals = try container.decodeIfPresent([String].self, forKey: .family) {
          // String: String
        }
        if let givenVals = try container.decodeIfPresent([String].self, forKey: .given) {
          // String: String
        }
        // Period: FHIRJSON
        if let periodVal = try container.decodeIfPresent(Period.self, forKey: .period) {
          self.period = periodVal
        }
        if let prefixVals = try container.decodeIfPresent([String].self, forKey: .prefix) {
          // String: String
        }
        if let suffixVals = try container.decodeIfPresent([String].self, forKey: .suffix) {
          // String: String
        }
        // String: String
        if let textVal = try container.decodeIfPresent(String.self, forKey: .text) {
          self.text = textVal
        }
        // String: String
        if let useVal = try container.decodeIfPresent(String.self, forKey: .use) {
          self.use = useVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.family.flatMap { $0.value }, forKey: .family)
        try container.encode(self.given.flatMap { $0.value }, forKey: .given)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(self.prefix.flatMap { $0.value }, forKey: .prefix)
        try container.encode(self.suffix.flatMap { $0.value }, forKey: .suffix)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.use, forKey: .use)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["family"] {
				presentKeys.insert("family")
				if let val = exist as? [String] {
					self.family.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "family", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["given"] {
				presentKeys.insert("given")
				if let val = exist as? [String] {
					self.given.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "given", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prefix"] {
				presentKeys.insert("prefix")
				if let val = exist as? [String] {
					self.prefix.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "prefix", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["suffix"] {
				presentKeys.insert("suffix")
				if let val = exist as? [String] {
					self.suffix.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "suffix", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if family.count > 0 {
			json["family"] = Array(family.map() { $0.value })
		}
		if given.count > 0 {
			json["given"] = Array(given.map() { $0.value })
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if prefix.count > 0 {
			json["prefix"] = Array(prefix.map() { $0.value })
		}
		if suffix.count > 0 {
			json["suffix"] = Array(suffix.map() { $0.value })
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let use = self.use {
			json["use"] = use.asJSON()
		}
		
		return json
	}
*/
}

