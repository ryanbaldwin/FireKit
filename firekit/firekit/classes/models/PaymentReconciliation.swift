//
//  PaymentReconciliation.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/PaymentReconciliation) on 2017-04-06.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  PaymentReconciliation resource.
 *
 *  This resource provides payment details and claim references supporting a bulk payment.
 */
open class PaymentReconciliation: DomainResource {
	override open class var resourceType: String {
		get { return "PaymentReconciliation" }
	}
    
    public dynamic var created: DateTime?        
        
    public let detail = RealmSwift.List<PaymentReconciliationDetail>()    
    public dynamic var disposition: String?        
        
    public dynamic var form: Coding?        
    public func upsert(form: Coding?) {
        upsert(prop: &self.form, val: form)
    }    
    public let identifier = RealmSwift.List<Identifier>()    
    public let note = RealmSwift.List<PaymentReconciliationNote>()    
    public dynamic var organization: Reference?        
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }    
    public dynamic var originalRuleset: Coding?        
    public func upsert(originalRuleset: Coding?) {
        upsert(prop: &self.originalRuleset, val: originalRuleset)
    }    
    public dynamic var outcome: String?        
        
    public dynamic var period: Period?        
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }    
    public dynamic var request: Reference?        
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }    
    public dynamic var requestOrganization: Reference?        
    public func upsert(requestOrganization: Reference?) {
        upsert(prop: &self.requestOrganization, val: requestOrganization)
    }    
    public dynamic var requestProvider: Reference?        
    public func upsert(requestProvider: Reference?) {
        upsert(prop: &self.requestProvider, val: requestProvider)
    }    
    public dynamic var ruleset: Coding?        
    public func upsert(ruleset: Coding?) {
        upsert(prop: &self.ruleset, val: ruleset)
    }    
    public dynamic var total: Quantity?        
    public func upsert(total: Quantity?) {
        upsert(prop: &self.total, val: total)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(total: Quantity) {
        self.init(json: nil)
        self.total = total
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["created"] {
				presentKeys.insert("created")
				if let val = exist as? String {
					self.created = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "created", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["detail"] {
				presentKeys.insert("detail")
				if let val = exist as? [FHIRJSON] {
					if let vals = PaymentReconciliationDetail.instantiate(fromArray: val, owner: self) as? [PaymentReconciliationDetail] {
						if let realm = self.realm { realm.delete(self.detail) }
						self.detail.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "detail", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["disposition"] {
				presentKeys.insert("disposition")
				if let val = exist as? String {
					self.disposition = val
				}
				else {
					errors.append(FHIRJSONError(key: "disposition", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["form"] {
				presentKeys.insert("form")
				if let val = exist as? FHIRJSON {
					upsert(form: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "form", wants: FHIRJSON.self, has: type(of: exist)))
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
			if let exist = js["note"] {
				presentKeys.insert("note")
				if let val = exist as? [FHIRJSON] {
					if let vals = PaymentReconciliationNote.instantiate(fromArray: val, owner: self) as? [PaymentReconciliationNote] {
						if let realm = self.realm { realm.delete(self.note) }
						self.note.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "note", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["organization"] {
				presentKeys.insert("organization")
				if let val = exist as? FHIRJSON {
					upsert(organization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "organization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["originalRuleset"] {
				presentKeys.insert("originalRuleset")
				if let val = exist as? FHIRJSON {
					upsert(originalRuleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "originalRuleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? String {
					self.outcome = val
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? FHIRJSON {
					upsert(period: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					upsert(request: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestOrganization"] {
				presentKeys.insert("requestOrganization")
				if let val = exist as? FHIRJSON {
					upsert(requestOrganization: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "requestOrganization", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["requestProvider"] {
				presentKeys.insert("requestProvider")
				if let val = exist as? FHIRJSON {
					upsert(requestProvider: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "requestProvider", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["ruleset"] {
				presentKeys.insert("ruleset")
				if let val = exist as? FHIRJSON {
					upsert(ruleset: Coding(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "ruleset", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["total"] {
				presentKeys.insert("total")
				if let val = exist as? FHIRJSON {
					upsert(total: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "total", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "total"))
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let created = self.created {
			json["created"] = created.asJSON()
		}
		if detail.count > 0 {
			json["detail"] = Array(detail.map() { $0.asJSON() })
		}
		if let disposition = self.disposition {
			json["disposition"] = disposition.asJSON()
		}
		if let form = self.form {
			json["form"] = form.asJSON()
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if note.count > 0 {
			json["note"] = Array(note.map() { $0.asJSON() })
		}
		if let organization = self.organization {
			json["organization"] = organization.asJSON()
		}
		if let originalRuleset = self.originalRuleset {
			json["originalRuleset"] = originalRuleset.asJSON()
		}
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let requestOrganization = self.requestOrganization {
			json["requestOrganization"] = requestOrganization.asJSON()
		}
		if let requestProvider = self.requestProvider {
			json["requestProvider"] = requestProvider.asJSON()
		}
		if let ruleset = self.ruleset {
			json["ruleset"] = ruleset.asJSON()
		}
		if let total = self.total {
			json["total"] = total.asJSON()
		}
		
		return json
	}
}


/**
 *  Details.
 *
 *  List of individual settlement amounts and the corresponding transaction.
 */
open class PaymentReconciliationDetail: BackboneElement {
	override open class var resourceType: String {
		get { return "PaymentReconciliationDetail" }
	}
    
    public dynamic var amount: Quantity?        
    public func upsert(amount: Quantity?) {
        upsert(prop: &self.amount, val: amount)
    }    
    public dynamic var date: FHIRDate?        
        
    public dynamic var payee: Reference?        
    public func upsert(payee: Reference?) {
        upsert(prop: &self.payee, val: payee)
    }    
    public dynamic var request: Reference?        
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }    
    public dynamic var responce: Reference?        
    public func upsert(responce: Reference?) {
        upsert(prop: &self.responce, val: responce)
    }    
    public dynamic var submitter: Reference?        
    public func upsert(submitter: Reference?) {
        upsert(prop: &self.submitter, val: submitter)
    }    
    public dynamic var type: Coding?        
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(type: Coding) {
        self.init(json: nil)
        self.type = type
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["amount"] {
				presentKeys.insert("amount")
				if let val = exist as? FHIRJSON {
					upsert(amount: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "amount", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = FHIRDate(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["payee"] {
				presentKeys.insert("payee")
				if let val = exist as? FHIRJSON {
					upsert(payee: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "payee", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["request"] {
				presentKeys.insert("request")
				if let val = exist as? FHIRJSON {
					upsert(request: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "request", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["responce"] {
				presentKeys.insert("responce")
				if let val = exist as? FHIRJSON {
					upsert(responce: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "responce", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["submitter"] {
				presentKeys.insert("submitter")
				if let val = exist as? FHIRJSON {
					upsert(submitter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "submitter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
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
		
		if let amount = self.amount {
			json["amount"] = amount.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let payee = self.payee {
			json["payee"] = payee.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let responce = self.responce {
			json["responce"] = responce.asJSON()
		}
		if let submitter = self.submitter {
			json["submitter"] = submitter.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Note text.
 *
 *  Suite of notes.
 */
open class PaymentReconciliationNote: BackboneElement {
	override open class var resourceType: String {
		get { return "PaymentReconciliationNote" }
	}
    
    public dynamic var text: String?        
        
    public dynamic var type: Coding?        
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["text"] {
				presentKeys.insert("text")
				if let val = exist as? String {
					self.text = val
				}
				else {
					errors.append(FHIRJSONError(key: "text", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: Coding(json: val, owner: self))
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
		
		if let text = self.text {
			json["text"] = text.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}

