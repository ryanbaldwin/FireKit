//
//  List.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/List) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Information summarized from a list of other resources.
 *
 *  A set of information summarized from a list of other resources.
 */
open class List: DomainResource {
	override open class var resourceType: String {
		get { return "List" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var emptyReason: CodeableConcept?
    public func upsert(emptyReason: CodeableConcept?) {
        upsert(prop: &self.emptyReason, val: emptyReason)
    }
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    public let entry = RealmSwift.List<ListEntry>()
    public let identifier = RealmSwift.List<Identifier>()
    @objc public dynamic var mode: String?
    @objc public dynamic var note: String?
    @objc public dynamic var orderedBy: CodeableConcept?
    public func upsert(orderedBy: CodeableConcept?) {
        upsert(prop: &self.orderedBy, val: orderedBy)
    }
    @objc public dynamic var source: Reference?
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }
    @objc public dynamic var status: String?
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }
    @objc public dynamic var title: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(mode: String, status: String) {
        self.init()
        self.mode = mode
        self.status = status
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case date = "date"
        case emptyReason = "emptyReason"
        case encounter = "encounter"
        case entry = "entry"
        case identifier = "identifier"
        case mode = "mode"
        case note = "note"
        case orderedBy = "orderedBy"
        case source = "source"
        case status = "status"
        case subject = "subject"
        case title = "title"
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


        // CodeableConcept: FHIRJSON
        if let codeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .code) {
          self.code = codeVal
        }
        // DateTime: String
        if let dateVal = try container.decodeIfPresent(DateTime.self, forKey: .date) {
          self.date = dateVal
        }
        // CodeableConcept: FHIRJSON
        if let emptyReasonVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .emptyReason) {
          self.emptyReason = emptyReasonVal
        }
        // Reference: FHIRJSON
        if let encounterVal = try container.decodeIfPresent(Reference.self, forKey: .encounter) {
          self.encounter = encounterVal
        }
        if let entryVals = try container.decodeIfPresent([ListEntry].self, forKey: .entry) {
          // ListEntry: FHIRJSON
        }
        if let identifierVals = try container.decodeIfPresent([Identifier].self, forKey: .identifier) {
          // Identifier: FHIRJSON
        }
        // String: String
        if let modeVal = try container.decodeIfPresent(String.self, forKey: .mode) {
          self.mode = modeVal
        }
        // String: String
        if let noteVal = try container.decodeIfPresent(String.self, forKey: .note) {
          self.note = noteVal
        }
        // CodeableConcept: FHIRJSON
        if let orderedByVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .orderedBy) {
          self.orderedBy = orderedByVal
        }
        // Reference: FHIRJSON
        if let sourceVal = try container.decodeIfPresent(Reference.self, forKey: .source) {
          self.source = sourceVal
        }
        // String: String
        if let statusVal = try container.decodeIfPresent(String.self, forKey: .status) {
          self.status = statusVal
        }
        // Reference: FHIRJSON
        if let subjectVal = try container.decodeIfPresent(Reference.self, forKey: .subject) {
          self.subject = subjectVal
        }
        // String: String
        if let titleVal = try container.decodeIfPresent(String.self, forKey: .title) {
          self.title = titleVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.emptyReason, forKey: .emptyReason)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encode(self.entry.flatMap { $0 }, forKey: .entry)
        try container.encode(self.identifier.flatMap { $0 }, forKey: .identifier)
        try container.encodeIfPresent(self.mode, forKey: .mode)
        try container.encodeIfPresent(self.note, forKey: .note)
        try container.encodeIfPresent(self.orderedBy, forKey: .orderedBy)
        try container.encodeIfPresent(self.source, forKey: .source)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.subject, forKey: .subject)
        try container.encodeIfPresent(self.title, forKey: .title)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["emptyReason"] {
				presentKeys.insert("emptyReason")
				if let val = exist as? FHIRJSON {
					upsert(emptyReason: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "emptyReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["entry"] {
				presentKeys.insert("entry")
				if let val = exist as? [FHIRJSON] {
					if let vals = ListEntry.instantiate(fromArray: val, owner: self) as? [ListEntry] {
						if let realm = self.realm { realm.delete(self.entry) }
						self.entry.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "entry", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? String {
					self.mode = val
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "mode"))
			}
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? String {
					self.note = val
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["orderedBy"] {
				presentKeys.insert("orderedBy")
				if let val = exist as? FHIRJSON {
					upsert(orderedBy: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "orderedBy", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["source"] {
				presentKeys.insert("source")
				if let val = exist as? FHIRJSON {
					upsert(source: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "source", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["status"] {
				presentKeys.insert("status")
				if let val = exist as? String {
					self.status = val
				}
				else {
					errors.append(FHIRJSONError(key: "status", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "status"))
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["title"] {
				presentKeys.insert("title")
				if let val = exist as? String {
					self.title = val
				}
				else {
					errors.append(FHIRJSONError(key: "title", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let emptyReason = self.emptyReason {
			json["emptyReason"] = emptyReason.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if entry.count > 0 {
			json["entry"] = Array(entry.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if let note = self.note {
			json["note"] = note.asJSON()
		}
		if let orderedBy = self.orderedBy {
			json["orderedBy"] = orderedBy.asJSON()
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let status = self.status {
			json["status"] = status.asJSON()
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  Entries in the list.
 *
 *  Entries in this list.
 */
open class ListEntry: BackboneElement {
	override open class var resourceType: String {
		get { return "ListEntry" }
	}

    @objc public dynamic var date: DateTime?
    public let deleted = RealmOptional<Bool>()
    @objc public dynamic var flag: CodeableConcept?
    public func upsert(flag: CodeableConcept?) {
        upsert(prop: &self.flag, val: flag)
    }
    @objc public dynamic var item: Reference?
    public func upsert(item: Reference?) {
        upsert(prop: &self.item, val: item)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(item: Reference) {
        self.init()
        self.item = item
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case date = "date"
        case deleted = "deleted"
        case flag = "flag"
        case item = "item"
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


        // DateTime: String
        if let dateVal = try container.decodeIfPresent(DateTime.self, forKey: .date) {
          self.date = dateVal
        }
        // Bool: Bool
        if let deletedVal = try container.decodeIfPresent(Bool.self, forKey: .deleted) {
          self.deleted.value = deletedVal
        }
        // CodeableConcept: FHIRJSON
        if let flagVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .flag) {
          self.flag = flagVal
        }
        // Reference: FHIRJSON
        if let itemVal = try container.decodeIfPresent(Reference.self, forKey: .item) {
          self.item = itemVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.deleted.value, forKey: .deleted)
        try container.encodeIfPresent(self.flag, forKey: .flag)
        try container.encodeIfPresent(self.item, forKey: .item)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["deleted"] {
				presentKeys.insert("deleted")
				if let val = exist as? Bool {
					self.deleted.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "deleted", wants: Bool.self, has: type(of: exist)))
				}
			}
			if let exist = js["flag"] {
				presentKeys.insert("flag")
				if let val = exist as? FHIRJSON {
					upsert(flag: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "flag", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["item"] {
				presentKeys.insert("item")
				if let val = exist as? FHIRJSON {
					upsert(item: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "item", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "item"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let deleted = self.deleted.value {
			json["deleted"] = deleted.asJSON()
		}
		if let flag = self.flag {
			json["flag"] = flag.asJSON()
		}
		if let item = self.item {
			json["item"] = item.asJSON()
		}
		
		return json
	}
*/
}

