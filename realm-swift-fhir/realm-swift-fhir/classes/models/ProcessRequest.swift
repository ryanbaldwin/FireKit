//
//  ProcessRequest.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/ProcessRequest) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  Process request.
 *
 *  This resource provides the target, request and response, and action details for an action to be performed by the
 *  target on or about existing resources.
 */
open class ProcessRequest: DomainResource {
	override open class var resourceType: String {
		get { return "ProcessRequest" }
	}

	public dynamic var action: String?
	
	public dynamic var created: DateTime?
	
	public let exclude = RealmSwift.List<RealmString>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public let include = RealmSwift.List<RealmString>()
	
	public let item = RealmSwift.List<ProcessRequestItem>()
	
	public let nullify = RealmOptional<Bool>()
	
	public dynamic var organization: Reference?
	
	public dynamic var originalRuleset: Coding?
	
	public dynamic var period: Period?
	
	public dynamic var provider: Reference?
	
	public dynamic var reference: String?
	
	public dynamic var request: Reference?
	
	public dynamic var response: Reference?
	
	public dynamic var ruleset: Coding?
	
	public dynamic var target: Reference?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(action: String) {
		self.init(json: nil)
		self.action = action
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["action"] {
				presentKeys.insert("action")
				if let val = exist as? String {
					self.action = val
				}
				else {
					errors.append(FHIRJSONError(key: "action", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "action"))
			}
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["exclude"] {
				presentKeys.insert("exclude")
				if let val = exist as? [String] {
					self.exclude.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "exclude", wants: Array<String>.self, has: type(of: exist)))
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
			if let exist = js["include"] {
				presentKeys.insert("include")
				if let val = exist as? [String] {
					self.include.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "include", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? [FHIRJSON] {
					if let vals = ProcessRequestItem.instantiate(fromArray: val, owner: self) as? [ProcessRequestItem] {
						if let realm = self.realm { realm.delete(self.item) }
						self.item.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["nullify"] {
				presentKeys.insert("nullify")
				if let val = exist as? Bool {
					self.nullify.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "nullify", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["organization"] {
				presentKeys.insert("organization")
				if let val = exist as? FHIRJSON {
					if let organization = self.organization {
                        errors.append(contentsOf: organization.populate(from: val) ?? [])
                    } else {
                        self.organization = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "organization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["originalRuleset"] {
				presentKeys.insert("originalRuleset")
				if let val = exist as? FHIRJSON {
					if let originalRuleset = self.originalRuleset {
                        errors.append(contentsOf: originalRuleset.populate(from: val) ?? [])
                    } else {
                        self.originalRuleset = Coding(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "originalRuleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					if let period = self.period {
                        errors.append(contentsOf: period.populate(from: val) ?? [])
                    } else {
                        self.period = Period(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["provider"] {
				presentKeys.insert("provider")
				if let val = exist as? FHIRJSON {
					if let provider = self.provider {
                        errors.append(contentsOf: provider.populate(from: val) ?? [])
                    } else {
                        self.provider = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "provider", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["reference"] {
				presentKeys.insert("reference")
				if let val = exist as? String {
					self.reference = val
				}
				else {
					errors.append(FHIRJSONError(key: "reference", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					if let request = self.request {
                        errors.append(contentsOf: request.populate(from: val) ?? [])
                    } else {
                        self.request = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["response"] {
				presentKeys.insert("response")
				if let val = exist as? FHIRJSON {
					if let response = self.response {
                        errors.append(contentsOf: response.populate(from: val) ?? [])
                    } else {
                        self.response = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "response", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ruleset"] {
				presentKeys.insert("ruleset")
				if let val = exist as? FHIRJSON {
					if let ruleset = self.ruleset {
                        errors.append(contentsOf: ruleset.populate(from: val) ?? [])
                    } else {
                        self.ruleset = Coding(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "ruleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["target"] {
				presentKeys.insert("target")
				if let val = exist as? FHIRJSON {
					if let target = self.target {
                        errors.append(contentsOf: target.populate(from: val) ?? [])
                    } else {
                        self.target = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "target", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let action = self.action {
			json["action"] = action.asJSON()
		}
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if exclude.count > 0 {
			json["exclude"] = Array(exclude.map() { $0.value })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if include.count > 0 {
			json["include"] = Array(include.map() { $0.value })
		}
		if item.count > 0 {
			json["item"] = Array(item.map() { $0.asJSON() })
		}
		if let nullify = self.nullify.value {
			json["nullify"] = nullify.asJSON()
		}
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let originalRuleset = self.originalRuleset {
			json["originalRuleset"] = originalRuleset.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let provider = self.provider {
			json["provider"] = provider.asJSON()
		}
		if let reference = self.reference {
			json["reference"] = reference.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let response = self.response {
			json["response"] = response.asJSON()
		}
		if let ruleset = self.ruleset {
			json["ruleset"] = ruleset.asJSON()
		}
		if let target = self.target {
			json["target"] = target.asJSON()
		}
		
		return json
	}
}


/**
 *  Items to re-adjudicate.
 *
 *  List of top level items to be re-adjudicated, if none specified then the entire submission is re-adjudicated.
 */
open class ProcessRequestItem: BackboneElement {
	override open class var resourceType: String {
		get { return "ProcessRequestItem" }
	}

	public let sequenceLinkId = RealmOptional<Int>()
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(sequenceLinkId: Int) {
		self.init(json: nil)
		self.sequenceLinkId.value = sequenceLinkId
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["sequenceLinkId"] {
				presentKeys.insert("sequenceLinkId")
				if let val = exist as? Int {
					self.sequenceLinkId.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "sequenceLinkId", wants: Int.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "sequenceLinkId"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let sequenceLinkId = self.sequenceLinkId.value {
			json["sequenceLinkId"] = sequenceLinkId.asJSON()
		}
		
		return json
	}
}

