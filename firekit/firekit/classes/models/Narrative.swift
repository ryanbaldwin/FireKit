//
//  Narrative.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Narrative) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A human-readable formatted text, including images.
 */
open class Narrative: Element {
	override open class var resourceType: String {
		get { return "Narrative" }
	}

    @objc public dynamic var div: String?
    @objc public dynamic var status: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(div: String, status: String) {
        self.init()
        self.div = div
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case div = "div"
        case status = "status"
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

        self.div = try container.decodeIfPresent(String.self, forKey: .div)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.div, forKey: .div)
        try container.encodeIfPresent(self.status, forKey: .status)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["div"] {
				presentKeys.insert("div")
				if let val = exist as? String {
					self.div = val
				}
				else {
					errors.append(FHIRJSONError(key: "div", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "div"))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let div = self.div {
			json["div"] = div.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Narrative.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Narrative. Will return empty instance: \(error))")
		}
		return Narrative.init()
	}
}

