//
//  Meta.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Meta) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Metadata about a resource.
 *
 *  The metadata about a resource. This is content in the resource that is maintained by the infrastructure. Changes to
 *  the content may not always be associated with version changes to the resource.
 */
open class Meta: Element {
	override open class var resourceType: String {
		get { return "Meta" }
	}
    
    public dynamic var lastUpdated: Instant?        
        
    public let profile = RealmSwift.List<RealmString>()    
    public let security = RealmSwift.List<Coding>()    
    public let tag = RealmSwift.List<Coding>()    
    public dynamic var versionId: String?        
    

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["lastUpdated"] {
				presentKeys.insert("lastUpdated")
				if let val = exist as? String {
					self.lastUpdated = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "lastUpdated", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["profile"] {
				presentKeys.insert("profile")
				if let val = exist as? [String] {
					self.profile.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "profile", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["security"] {
				presentKeys.insert("security")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.security) }
						self.security.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "security", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["tag"] {
				presentKeys.insert("tag")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.tag) }
						self.tag.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "tag", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["versionId"] {
				presentKeys.insert("versionId")
				if let val = exist as? String {
					self.versionId = val
				}
				else {
					errors.append(FHIRJSONError(key: "versionId", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let lastUpdated = self.lastUpdated {
			json["lastUpdated"] = lastUpdated.asJSON()
		}
		if profile.count > 0 {
			json["profile"] = Array(profile.map() { $0.value })
		}
		if security.count > 0 {
			json["security"] = Array(security.map() { $0.asJSON() })
		}
		if tag.count > 0 {
			json["tag"] = Array(tag.map() { $0.asJSON() })
		}
		if let versionId = self.versionId {
			json["versionId"] = versionId.asJSON()
		}
		
		return json
	}
}

