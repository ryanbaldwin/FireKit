//
//  Basic.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Basic) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Resource for non-supported content.
 *
 *  Basic is used for handling concepts not yet defined in FHIR, narrative-only resources that don't map to an existing
 *  resource, and custom resources not appropriate for inclusion in the FHIR specification.
 */
open class Basic: DomainResource {
	override open class var resourceType: String {
		get { return "Basic" }
	}

	public dynamic var author: Reference?
	
	public dynamic var code: CodeableConcept?
	
	public dynamic var created: FHIRDate?
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var subject: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(code: CodeableConcept) {
		self.init(json: nil)
		self.code = code
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? FHIRJSON {
					if let author = self.author {
                        errors.append(contentsOf: author.populate(from: val) ?? [])
                    } else {
                        self.author = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					if let code = self.code {
                        errors.append(contentsOf: code.populate(from: val) ?? [])
                    } else {
                        self.code = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? [FHIRJSON] {
					if let vals = Identifier.instantiate(fromArray: val, owner: self) as? [Identifier] {
						if let realm = self.realm { realm.delete(self.identifier) }
						self.identifier.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					if let subject = self.subject {
                        errors.append(contentsOf: subject.populate(from: val) ?? [])
                    } else {
                        self.subject = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let author = self.author {
			json["author"] = author.asJSON()
		}
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
}

