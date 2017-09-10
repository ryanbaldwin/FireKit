//
//  Annotation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Annotation) on 2017-09-10.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Text node with attribution.
 *
 *  A  text note which also  contains information about who made the statement and when.
 */
open class Annotation: Element {
	override open class var resourceType: String {
		get { return "Annotation" }
	}

    @objc public dynamic var authorReference: Reference?
    public func upsert(authorReference: Reference?) {
        upsert(prop: &self.authorReference, val: authorReference)
    }
    @objc public dynamic var authorString: String?
    @objc public dynamic var text: String?
    @objc public dynamic var time: DateTime?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(text: String) {
        self.init()
        self.text = text
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case authorReference = "authorReference"
        case authorString = "authorString"
        case text = "text"
        case time = "time"
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

        self.authorReference = try container.decodeIfPresent(Reference.self, forKey: .authorReference)
        self.authorString = try container.decodeIfPresent(String.self, forKey: .authorString)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.time = try container.decodeIfPresent(DateTime.self, forKey: .time)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.authorReference, forKey: .authorReference)
        try container.encodeIfPresent(self.authorString, forKey: .authorString)
        try container.encodeIfPresent(self.text, forKey: .text)
        try container.encodeIfPresent(self.time, forKey: .time)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["authorReference"] {
				presentKeys.insert("authorReference")
				if let val = exist as? FHIRJSON {
					upsert(authorReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "authorReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["authorString"] {
				presentKeys.insert("authorString")
				if let val = exist as? String {
					self.authorString = val
				}
				else {
					errors.append(FHIRJSONError(key: "authorString", wants: String.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "text"))
			}
			if let exist = js["time"] {
				presentKeys.insert("time")
				if let val = exist as? String {
					self.time = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "time", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let authorReference = self.authorReference {
			json["authorReference"] = authorReference.asJSON()
		}
		if let authorString = self.authorString {
			json["authorString"] = authorString.asJSON()
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let time = self.time {
			json["time"] = time.asJSON()
		}
		
		return json
	}
*/
}

