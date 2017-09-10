//
//  Coding.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Coding) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A reference to a code defined by a terminology system.
 */
open class Coding: Element {
	override open class var resourceType: String {
		get { return "Coding" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var display: String?
    @objc public dynamic var system: String?
    public let userSelected = RealmOptional<Bool>()
    @objc public dynamic var version: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case display = "display"
        case system = "system"
        case userSelected = "userSelected"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.system = try container.decodeIfPresent(String.self, forKey: .system)
        self.userSelected.value = try container.decodeIfPresent(Bool.self, forKey: .userSelected)
        self.version = try container.decodeIfPresent(String.self, forKey: .version)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.system, forKey: .system)
        try container.encodeIfPresent(self.userSelected.value, forKey: .userSelected)
        try container.encodeIfPresent(self.version, forKey: .version)
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
			if let exist = js["userSelected"] {
				presentKeys.insert("userSelected")
				if let val = exist as? Bool {
					self.userSelected.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "userSelected", wants: Bool.self, has: type(of: exist)))
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
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let display = self.display {
			json["display"] = display.asJSON()
		}
		if let system = self.system {
			json["system"] = system.asJSON()
		}
		if let userSelected = self.userSelected.value {
			json["userSelected"] = userSelected.asJSON()
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
			let clone = try JSONDecoder().decode(Coding.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Coding. Will return empty instance: \(error))")
		}
		return Coding.init()
	}
}

