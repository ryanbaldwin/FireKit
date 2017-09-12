//
//  OperationOutcome.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/OperationOutcome) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Information about the success/failure of an action.
 *
 *  A collection of error, warning or information messages that result from a system action.
 */
open class OperationOutcome: DomainResource {
	override open class var resourceType: String {
		get { return "OperationOutcome" }
	}

    public let issue = RealmSwift.List<OperationOutcomeIssue>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(issue: [OperationOutcomeIssue]) {
        self.init()
        self.issue.append(objectsIn: issue)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case issue = "issue"
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

        self.issue.append(objectsIn: try container.decodeIfPresent([OperationOutcomeIssue].self, forKey: .issue) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.issue), forKey: .issue)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["issue"] {
				presentKeys.insert("issue")
				if let val = exist as? [FHIRJSON] {
					if let vals = OperationOutcomeIssue.instantiate(fromArray: val, owner: self) as? [OperationOutcomeIssue] {
						if let realm = self.realm { realm.delete(self.issue) }
						self.issue.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "issue", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "issue"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if issue.count > 0 {
			json["issue"] = Array(issue.map() { $0.asJSON() })
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationOutcome.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationOutcome. Will return empty instance: \(error))")
		}
		return OperationOutcome.init()
	}
}


/**
 *  A single issue associated with the action.
 *
 *  An error, warning or information message that results from a system action.
 */
open class OperationOutcomeIssue: BackboneElement {
	override open class var resourceType: String {
		get { return "OperationOutcomeIssue" }
	}

    @objc public dynamic var code: String?
    @objc public dynamic var details: CodeableConcept?
    public func upsert(details: CodeableConcept?) {
        upsert(prop: &self.details, val: details)
    }
    @objc public dynamic var diagnostics: String?
    public let location = RealmSwift.List<RealmString>()
    @objc public dynamic var severity: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(code: String, severity: String) {
        self.init()
        self.code = code
        self.severity = severity
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case details = "details"
        case diagnostics = "diagnostics"
        case location = "location"
        case severity = "severity"
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

        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.details = try container.decodeIfPresent(CodeableConcept.self, forKey: .details)
        self.diagnostics = try container.decodeIfPresent(String.self, forKey: .diagnostics)
        self.location.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .location) ?? [])
        self.severity = try container.decodeIfPresent(String.self, forKey: .severity)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.details, forKey: .details)
        try container.encodeIfPresent(self.diagnostics, forKey: .diagnostics)
        try container.encode(Array(self.location), forKey: .location)
        try container.encodeIfPresent(self.severity, forKey: .severity)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? String {
					self.code = val
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "code"))
			}
			if let exist = js["details"] {
				presentKeys.insert("details")
				if let val = exist as? FHIRJSON {
					upsert(details: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "details", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["diagnostics"] {
				presentKeys.insert("diagnostics")
				if let val = exist as? String {
					self.diagnostics = val
				}
				else {
					errors.append(FHIRJSONError(key: "diagnostics", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["location"] {
				presentKeys.insert("location")
				if let val = exist as? [String] {
					self.location.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "location", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["severity"] {
				presentKeys.insert("severity")
				if let val = exist as? String {
					self.severity = val
				}
				else {
					errors.append(FHIRJSONError(key: "severity", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "severity"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let details = self.details {
			json["details"] = details.asJSON()
		}
		if let diagnostics = self.diagnostics {
			json["diagnostics"] = diagnostics.asJSON()
		}
		if location.count > 0 {
			json["location"] = Array(location.map() { $0.value })
		}
		if let severity = self.severity {
			json["severity"] = severity.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(OperationOutcomeIssue.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy OperationOutcomeIssue. Will return empty instance: \(error))")
		}
		return OperationOutcomeIssue.init()
	}
}

