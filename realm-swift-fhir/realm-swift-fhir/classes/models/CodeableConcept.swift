//
//  CodeableConcept.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/CodeableConcept) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Concept - reference to a terminology or just  text.
 *
 *  A concept that may be defined by a formal reference to a terminology or ontology or may be provided by text.
 */
open class CodeableConcept: Element {
	override open class var resourceType: String {
		get { return "CodeableConcept" }
	}
    
    public let coding = RealmSwift.List<Coding>()    
    public dynamic var text: String?        
    

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["coding"] {
				presentKeys.insert("coding")
				if let val = exist as? [FHIRJSON] {
					if let vals = Coding.instantiate(fromArray: val, owner: self) as? [Coding] {
						if let realm = self.realm { realm.delete(self.coding) }
						self.coding.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "coding", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if coding.count > 0 {
			json["coding"] = Array(coding.map() { $0.asJSON() })
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		
		return json
	}
}

