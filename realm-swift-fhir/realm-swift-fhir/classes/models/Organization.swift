//
//  Organization.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Organization) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A grouping of people or organizations with a common purpose.
 *
 *  A formally or informally recognized grouping of people or organizations formed for the purpose of achieving some
 *  form of collective action.  Includes companies, institutions, corporations, departments, community groups,
 *  healthcare practice groups, etc.
 */
open class Organization: DomainResource {
	override open class var resourceType: String {
		get { return "Organization" }
	}

	public let active = RealmOptional<Bool>()
	
	public let address = RealmSwift.List<Address>()
	
	public let contact = RealmSwift.List<OrganizationContact>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var name: String?
	
	public dynamic var partOf: Reference?
	
	public let telecom = RealmSwift.List<ContactPoint>()
	
	public dynamic var type: CodeableConcept?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["active"] {
				presentKeys.insert("active")
				if let val = exist as? Bool {
					self.active.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "active", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? [FHIRJSON] {
					if let vals = Address.instantiate(fromArray: val, owner: self) as? [Address] {
						if let realm = self.realm { realm.delete(self.address) }
						self.address.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["contact"] {
				presentKeys.insert("contact")
				if let val = exist as? [FHIRJSON] {
					if let vals = OrganizationContact.instantiate(fromArray: val, owner: self) as? [OrganizationContact] {
						if let realm = self.realm { realm.delete(self.contact) }
						self.contact.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "contact", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? String {
					self.name = val
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["partOf"] {
				presentKeys.insert("partOf")
				if let val = exist as? FHIRJSON {
					if let partOf = self.partOf {
                        errors.append(contentsOf: partOf.populate(from: val) ?? [])
                    } else {
                        self.partOf = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "partOf", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["telecom"] {
				presentKeys.insert("telecom")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.telecom) }
						self.telecom.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "telecom", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					if let type = self.type {
                        errors.append(contentsOf: type.populate(from: val) ?? [])
                    } else {
                        self.type = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "type", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let active = self.active.value {
			json["active"] = active.asJSON()
		}
		if address.count > 0 {
			json["address"] = Array(address.map() { $0.asJSON() })
		}
		if contact.count > 0 {
			json["contact"] = Array(contact.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let partOf = self.partOf {
			json["partOf"] = partOf.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Contact for the organization for a certain purpose.
 */
open class OrganizationContact: BackboneElement {
	override open class var resourceType: String {
		get { return "OrganizationContact" }
	}

	public dynamic var address: Address?
	
	public dynamic var name: HumanName?
	
	public dynamic var purpose: CodeableConcept?
	
	public let telecom = RealmSwift.List<ContactPoint>()
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["address"] {
				presentKeys.insert("address")
				if let val = exist as? FHIRJSON {
					if let address = self.address {
                        errors.append(contentsOf: address.populate(from: val) ?? [])
                    } else {
                        self.address = Address(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "address", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["name"] {
				presentKeys.insert("name")
				if let val = exist as? FHIRJSON {
					if let name = self.name {
                        errors.append(contentsOf: name.populate(from: val) ?? [])
                    } else {
                        self.name = HumanName(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "name", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["purpose"] {
				presentKeys.insert("purpose")
				if let val = exist as? FHIRJSON {
					if let purpose = self.purpose {
                        errors.append(contentsOf: purpose.populate(from: val) ?? [])
                    } else {
                        self.purpose = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "purpose", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["telecom"] {
				presentKeys.insert("telecom")
				if let val = exist as? [FHIRJSON] {
					if let vals = ContactPoint.instantiate(fromArray: val, owner: self) as? [ContactPoint] {
						if let realm = self.realm { realm.delete(self.telecom) }
						self.telecom.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "telecom", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let address = self.address {
			json["address"] = address.asJSON()
		}
		if let name = self.name {
			json["name"] = name.asJSON()
		}
		if let purpose = self.purpose {
			json["purpose"] = purpose.asJSON()
		}
		if telecom.count > 0 {
			json["telecom"] = Array(telecom.map() { $0.asJSON() })
		}
		
		return json
	}
}

