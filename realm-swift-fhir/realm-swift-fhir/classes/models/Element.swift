//
//  Element.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Element) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Base for all elements.
 *
 *  Base definition for all elements in a resource.
 */
open class Element: FHIRAbstractBase {
	override open class var resourceType: String {
		get { return "Element" }
	}

	public let extension_fhir = RealmSwift.List<Extension>()
	
	public dynamic var id: String?
	public dynamic var pk = UUID().uuidString
		override open static func primaryKey() -> String? {
			return "pk"
		}

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["id"] {
				presentKeys.insert("id")
				if let val = exist as? String {
					self.id = val
				}
				else {
					errors.append(FHIRJSONError(key: "id", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if extension_fhir.count > 0 {
			json["extension"] = Array(extension_fhir.map() { $0.asJSON() })
		}
		if let id = self.id {
			json["id"] = id.asJSON()
		}
		
		return json
	}
}

