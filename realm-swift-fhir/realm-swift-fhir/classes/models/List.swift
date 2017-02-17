//
//  List.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/List) on 2017-02-17.
//  2017, SMART Health IT.
//

import Foundation
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

	public dynamic var code: CodeableConcept?						
		
		
			public func upsert(code: CodeableConcept?) {
				upsert(prop: &self.code, val: code)
			}
	
	public dynamic var date: DateTime?						
		
		
	
	public dynamic var emptyReason: CodeableConcept?						
		
		
			public func upsert(emptyReason: CodeableConcept?) {
				upsert(prop: &self.emptyReason, val: emptyReason)
			}
	
	public dynamic var encounter: Reference?						
		
		
			public func upsert(encounter: Reference?) {
				upsert(prop: &self.encounter, val: encounter)
			}
	
	public let entry = RealmSwift.List<ListEntry>()
	
	public let identifier = RealmSwift.List<Identifier>()
	
	public dynamic var mode: String?						
		
		
	
	public dynamic var note: String?						
		
		
	
	public dynamic var orderedBy: CodeableConcept?						
		
		
			public func upsert(orderedBy: CodeableConcept?) {
				upsert(prop: &self.orderedBy, val: orderedBy)
			}
	
	public dynamic var source: Reference?						
		
		
			public func upsert(source: Reference?) {
				upsert(prop: &self.source, val: source)
			}
	
	public dynamic var status: String?						
		
		
	
	public dynamic var subject: Reference?						
		
		
			public func upsert(subject: Reference?) {
				upsert(prop: &self.subject, val: subject)
			}
	
	public dynamic var title: String?						
		
		
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(mode: String, status: String) {
		self.init(json: nil)
		self.mode = mode
		self.status = status
	}
	
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

	public dynamic var date: DateTime?						
		
		
	
	public let deleted = RealmOptional<Bool>()
	
	public dynamic var flag: CodeableConcept?						
		
		
			public func upsert(flag: CodeableConcept?) {
				upsert(prop: &self.flag, val: flag)
			}
	
	public dynamic var item: Reference?						
		
		
			public func upsert(item: Reference?) {
				upsert(prop: &self.item, val: item)
			}
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(item: Reference) {
		self.init(json: nil)
		self.item = item
	}
	
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
}

