//
//  Signature.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Signature) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A digital Signature - XML DigSig, JWT, Graphical image of signature, etc..
 *
 *  A digital signature along with supporting context. The signature may be electronic/cryptographic in nature, or a
 *  graphical image representing a hand-written signature, or a signature process. Different Signature approaches have
 *  different utilities.
 */
open class Signature: Element {
	override open class var resourceType: String {
		get { return "Signature" }
	}

    @objc public dynamic var blob: Base64Binary?
    @objc public dynamic var contentType: String?
    public let type = RealmSwift.List<Coding>()
    @objc public dynamic var when: Instant?
    @objc public dynamic var whoReference: Reference?
    public func upsert(whoReference: Reference?) {
        upsert(prop: &self.whoReference, val: whoReference)
    }
    @objc public dynamic var whoUri: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(blob: Base64Binary, contentType: String, type: [Coding], when: Instant, whoReference: Reference, whoUri: String) {
        self.init()
        self.blob = blob
        self.contentType = contentType
        self.type.append(objectsIn: type)
        self.when = when
        self.whoReference = whoReference
        self.whoUri = whoUri
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case blob = "blob"
        case contentType = "contentType"
        case type = "type"
        case when = "when"
        case whoReference = "whoReference"
        case whoUri = "whoUri"
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

        self.blob = try container.decodeIfPresent(Base64Binary.self, forKey: .blob)
        self.contentType = try container.decodeIfPresent(String.self, forKey: .contentType)
        self.type.append(objectsIn: try container.decodeIfPresent([Coding].self, forKey: .type) ?? [])
        self.when = try container.decodeIfPresent(Instant.self, forKey: .when)
        self.whoReference = try container.decodeIfPresent(Reference.self, forKey: .whoReference)
        self.whoUri = try container.decodeIfPresent(String.self, forKey: .whoUri)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.blob, forKey: .blob)
        try container.encodeIfPresent(self.contentType, forKey: .contentType)
        try container.encode(Array(self.type), forKey: .type)
        try container.encodeIfPresent(self.when, forKey: .when)
        try container.encodeIfPresent(self.whoReference, forKey: .whoReference)
        try container.encodeIfPresent(self.whoUri, forKey: .whoUri)
    }
/*
	
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
			else {
				errors.append(FHIRJSONError(key: "blob"))
			}
			if let exist = js["contentType"] {
				presentKeys.insert("contentType")
				if let val = exist as? String {
					self.contentType = val
				}
				else {
					errors.append(FHIRJSONError(key: "contentType", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "contentType"))
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.type) }
						self.type.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
			if let exist = js["when"] {
				presentKeys.insert("when")
				if let val = exist as? String {
					self.when = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "when", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "when"))
			}
			if let exist = js["whoReference"] {
				presentKeys.insert("whoReference")
				if let val = exist as? FHIRJSON {
					upsert(whoReference: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whoReference", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["whoUri"] {
				presentKeys.insert("whoUri")
				if let val = exist as? String {
					self.whoUri = val
				}
				else {
					errors.append(FHIRJSONError(key: "whoUri", wants: String.self, has: type(of: exist)))
				}
			}
			
			// check if nonoptional expanded properties are present
			if nil == self.whoUri && nil == self.whoReference {
				errors.append(FHIRJSONError(key: "who*"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let blob = self.blob {
			json["blob"] = blob.asJSON()
		}
		if let contentType = self.contentType {
			json["contentType"] = contentType.asJSON()
		}
		if type.count > 0 {
			json["type"] = Array(type.map() { $0.asJSON() })
		}
		if let when = self.when {
			json["when"] = when.asJSON()
		}
		if let whoReference = self.whoReference {
			json["whoReference"] = whoReference.asJSON()
		}
		if let whoUri = self.whoUri {
			json["whoUri"] = whoUri.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Signature.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Signature. Will return empty instance: \(error))")
		}
		return Signature.init()
	}
}

