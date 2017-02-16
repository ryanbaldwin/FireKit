//
//  Composition.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Composition) on 2017-02-16.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A set of resources composed into a single coherent clinical statement with clinical attestation.
 *
 *  A set of healthcare-related information that is assembled together into a single logical document that provides a
 *  single coherent statement of meaning, establishes its own context and that has clinical attestation with regard to
 *  who is making the statement. While a Composition defines the structure, it does not actually contain the content:
 *  rather the full content of a document is contained in a Bundle, of which the Composition is the first resource
 *  contained.
 */
open class Composition: DomainResource {
	override open class var resourceType: String {
		get { return "Composition" }
	}

	public let attester = RealmSwift.List<CompositionAttester>()
	
	public let author = RealmSwift.List<Reference>()
	
	public dynamic var class_fhir: CodeableConcept?
	
	public dynamic var confidentiality: String?
	
	public dynamic var custodian: Reference?
	
	public dynamic var date: DateTime?
	
	public dynamic var encounter: Reference?
	
	public let event = RealmSwift.List<CompositionEvent>()
	
	public dynamic var identifier: Identifier?
	
	public let section = RealmSwift.List<CompositionSection>()
	
	public dynamic var status: String?
	
	public dynamic var subject: Reference?
	
	public dynamic var title: String?
	
	public dynamic var type: CodeableConcept?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(author: [Reference], date: DateTime, status: String, subject: Reference, title: String, type: CodeableConcept) {
		self.init(json: nil)
		self.author.append(objectsIn: author)
		self.date = date
		self.status = status
		self.subject = subject
		self.title = title
		self.type = type
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["attester"] {
				presentKeys.insert("attester")
				if let val = exist as? [FHIRJSON] {
					if let vals = CompositionAttester.instantiate(fromArray: val, owner: self) as? [CompositionAttester] {
						if let realm = self.realm { realm.delete(self.attester) }
						self.attester.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "attester", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["author"] {
				presentKeys.insert("author")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.author) }
						self.author.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "author", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "author"))
			}
			if let exist = js["class"] {
				presentKeys.insert("class")
				if let val = exist as? FHIRJSON {
					if let class_fhir = self.class_fhir {
                        errors.append(contentsOf: class_fhir.populate(from: val) ?? [])
                    } else {
                        self.class_fhir = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "class", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["confidentiality"] {
				presentKeys.insert("confidentiality")
				if let val = exist as? String {
					self.confidentiality = val
				}
				else {
					errors.append(FHIRJSONError(key: "confidentiality", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["custodian"] {
				presentKeys.insert("custodian")
				if let val = exist as? FHIRJSON {
					if let custodian = self.custodian {
                        errors.append(contentsOf: custodian.populate(from: val) ?? [])
                    } else {
                        self.custodian = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "custodian", wants: FHIRJSON.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "date"))
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					if let encounter = self.encounter {
                        errors.append(contentsOf: encounter.populate(from: val) ?? [])
                    } else {
                        self.encounter = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? [FHIRJSON] {
					if let vals = CompositionEvent.instantiate(fromArray: val, owner: self) as? [CompositionEvent] {
						if let realm = self.realm { realm.delete(self.event) }
						self.event.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					if let identifier = self.identifier {
                        errors.append(contentsOf: identifier.populate(from: val) ?? [])
                    } else {
                        self.identifier = Identifier(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["section"] {
				presentKeys.insert("section")
				if let val = exist as? [FHIRJSON] {
					if let vals = CompositionSection.instantiate(fromArray: val, owner: self) as? [CompositionSection] {
						if let realm = self.realm { realm.delete(self.section) }
						self.section.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "section", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			else {
				errors.append(FHIRJSONError(key: "subject"))
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
			else {
				errors.append(FHIRJSONError(key: "title"))
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
			else {
				errors.append(FHIRJSONError(key: "type"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if attester.count > 0 {
			json["attester"] = Array(attester.map() { $0.asJSON() })
		}
		if author.count > 0 {
			json["author"] = Array(author.map() { $0.asJSON() })
		}
		if let class_fhir = self.class_fhir {
			json["class"] = class_fhir.asJSON()
		}
		if let confidentiality = self.confidentiality {
			json["confidentiality"] = confidentiality.asJSON()
		}
		if let custodian = self.custodian {
			json["custodian"] = custodian.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if event.count > 0 {
			json["event"] = Array(event.map() { $0.asJSON() })
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if section.count > 0 {
			json["section"] = Array(section.map() { $0.asJSON() })
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
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Attests to accuracy of composition.
 *
 *  A participant who has attested to the accuracy of the composition/document.
 */
open class CompositionAttester: BackboneElement {
	override open class var resourceType: String {
		get { return "CompositionAttester" }
	}

	public let mode = RealmSwift.List<RealmString>()
	
	public dynamic var party: Reference?
	
	public dynamic var time: DateTime?
	

	
	/** Convenience initializer, taking all required properties as arguments. */
	public convenience init(mode: [String]) {
		self.init(json: nil)
		self.mode.append(objectsIn: mode.map{ RealmString(value: [$0]) })
	}
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["mode"] {
				presentKeys.insert("mode")
				if let val = exist as? [String] {
					self.mode.append(objectsIn: val.map{ RealmString(value: [$0]) })
				}
				else {
					errors.append(FHIRJSONError(key: "mode", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "mode"))
			}
			if let exist = js["party"] {
				presentKeys.insert("party")
				if let val = exist as? FHIRJSON {
					if let party = self.party {
                        errors.append(contentsOf: party.populate(from: val) ?? [])
                    } else {
                        self.party = Reference(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "party", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["time"] {
				presentKeys.insert("time")
				if let val = exist as? String {
					self.time = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "time", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if mode.count > 0 {
			json["mode"] = Array(mode.map() { $0.value })
		}
		if let party = self.party {
			json["party"] = party.asJSON()
		}
		if let time = self.time {
			json["time"] = time.asJSON()
		}
		
		return json
	}
}


/**
 *  The clinical service(s) being documented.
 *
 *  The clinical service, such as a colonoscopy or an appendectomy, being documented.
 */
open class CompositionEvent: BackboneElement {
	override open class var resourceType: String {
		get { return "CompositionEvent" }
	}

	public let code = RealmSwift.List<CodeableConcept>()
	
	public let detail = RealmSwift.List<Reference>()
	
	public dynamic var period: Period?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.code) }
						self.code.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if code.count > 0 {
			json["code"] = Array(code.map() { $0.asJSON() })
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		
		return json
	}
}


/**
 *  Composition is broken into sections.
 *
 *  The root of the sections that make up the composition.
 */
open class CompositionSection: BackboneElement {
	override open class var resourceType: String {
		get { return "CompositionSection" }
	}

	public dynamic var code: CodeableConcept?
	
	public dynamic var emptyReason: CodeableConcept?
	
	public let entry = RealmSwift.List<Reference>()
	
	public dynamic var mode: String?
	
	public dynamic var orderedBy: CodeableConcept?
	
	public let section = RealmSwift.List<CompositionSection>()
	
	public dynamic var text: Narrative?
	
	public dynamic var title: String?
	

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
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
			if let exist = js["emptyReason"] {
				presentKeys.insert("emptyReason")
				if let val = exist as? FHIRJSON {
					if let emptyReason = self.emptyReason {
                        errors.append(contentsOf: emptyReason.populate(from: val) ?? [])
                    } else {
                        self.emptyReason = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "emptyReason", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["entry"] {
				presentKeys.insert("entry")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.entry) }
						self.entry.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "entry", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["orderedBy"] {
				presentKeys.insert("orderedBy")
				if let val = exist as? FHIRJSON {
					if let orderedBy = self.orderedBy {
                        errors.append(contentsOf: orderedBy.populate(from: val) ?? [])
                    } else {
                        self.orderedBy = CodeableConcept(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "orderedBy", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["section"] {
				presentKeys.insert("section")
				if let val = exist as? [FHIRJSON] {
					if let vals = CompositionSection.instantiate(fromArray: val, owner: self) as? [CompositionSection] {
						if let realm = self.realm { realm.delete(self.section) }
						self.section.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "section", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? FHIRJSON {
					if let text = self.text {
                        errors.append(contentsOf: text.populate(from: val) ?? [])
                    } else {
                        self.text = Narrative(json: val, owner: self)
                    }
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: FHIRJSON.self, has: type(of: exist)))
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
		if let emptyReason = self.emptyReason {
			json["emptyReason"] = emptyReason.asJSON()
		}
		if entry.count > 0 {
			json["entry"] = Array(entry.map() { $0.asJSON() })
		}
		if let mode = self.mode {
			json["mode"] = mode.asJSON()
		}
		if let orderedBy = self.orderedBy {
			json["orderedBy"] = orderedBy.asJSON()
		}
		if section.count > 0 {
			json["section"] = Array(section.map() { $0.asJSON() })
		}
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let title = self.title {
			json["title"] = title.asJSON()
		}
		
		return json
	}
}

