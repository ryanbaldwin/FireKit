//
//  BackboneElement.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/BackboneElement) on 2017-01-27.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Base for elements defined inside a resource.
 *
 *  Base definition for all elements that are defined inside a resource - but not those in a data type.
 */
open class BackboneElement: Element {
	override open class var resourceType: String {
		get { return "BackboneElement" }
	}

	public let modifierExtension = RealmSwift.List<Extension>()

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["modifierExtension"] {
				presentKeys.insert("modifierExtension")
				if let val = exist as? [FHIRJSON] {
					if let vals = Extension.instantiate(fromArray: val, owner: self) as? [Extension] {
						self.modifierExtension.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "modifierExtension", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if modifierExtension.count > 0 {
			json["modifierExtension"] = Array(modifierExtension.map() { $0.asJSON() })
		}
		
		return json
	}
}

