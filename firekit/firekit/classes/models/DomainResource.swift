//
//  DomainResource.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DomainResource) on 2017-04-06.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A resource with narrative, extensions, and contained resources.
 *
 *  A resource that includes narrative, extensions, and contained resources.
 */
open class DomainResource: Resource {
	override open class var resourceType: String {
		get { return "DomainResource" }
	}
    
    public let contained = RealmSwift.List<ContainedResource>()    
    public let extension_fhir = RealmSwift.List<Extension>()    
    public let modifierExtension = RealmSwift.List<Extension>()    
    public dynamic var text: Narrative?        
    public func upsert(text: Narrative?) {
        upsert(prop: &self.text, val: text)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["contained"] {
				presentKeys.insert("contained")
				if let val = exist as? [FHIRJSON] {
					// 'Resource' == prop.class_name
					self.contained.append(objectsIn: val.map({ return ContainedResource(json: $0, owner: self)}))
				}
				else {
					errors.append(FHIRJSONError(key: "contained", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["extension"] {
				presentKeys.insert("extension")
				if let val = exist as? [FHIRJSON] {
					if let vals = Extension.instantiate(fromArray: val, owner: self) as? [Extension] {
						if let realm = self.realm { realm.delete(self.extension_fhir) }
						self.extension_fhir.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "extension", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["modifierExtension"] {
				presentKeys.insert("modifierExtension")
				if let val = exist as? [FHIRJSON] {
					if let vals = Extension.instantiate(fromArray: val, owner: self) as? [Extension] {
						if let realm = self.realm { realm.delete(self.modifierExtension) }
						self.modifierExtension.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "modifierExtension", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? FHIRJSON {
					upsert(text: Narrative(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if contained.count > 0 {
			json["contained"] = Array(contained.map() { $0.asJSON() })
		}
		if extension_fhir.count > 0 {
			json["extension"] = Array(extension_fhir.map() { $0.asJSON() })
		}
		if modifierExtension.count > 0 {
			json["modifierExtension"] = Array(modifierExtension.map() { $0.asJSON() })
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
	}
}

