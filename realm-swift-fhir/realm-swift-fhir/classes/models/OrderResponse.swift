//
//  OrderResponse.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/OrderResponse) on 2017-03-28.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  A response to an order.
 */
open class OrderResponse: DomainResource {
	override open class var resourceType: String {
		get { return "OrderResponse" }
	}
    
    public dynamic var date: DateTime?        
        
    public dynamic var description_fhir: String?        
        
    public let fulfillment = RealmSwift.List<Reference>()    
    public let identifier = RealmSwift.List<Identifier>()    
    public dynamic var orderStatus: String?        
        
    public dynamic var request: Reference?        
    public func upsert(request: Reference?) {
        upsert(prop: &self.request, val: request)
    }    
    public dynamic var who: Reference?        
    public func upsert(who: Reference?) {
        upsert(prop: &self.who, val: who)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(orderStatus: String, request: Reference) {
        self.init(json: nil)
        self.orderStatus = orderStatus
        self.request = request
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
			if let exist = js["description"] {
				presentKeys.insert("description")
				if let val = exist as? String {
					self.description_fhir = val
				}
				else {
					errors.append(FHIRJSONError(key: "description", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["fulfillment"] {
				presentKeys.insert("fulfillment")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.fulfillment) }
						self.fulfillment.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "fulfillment", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["orderStatus"] {
				presentKeys.insert("orderStatus")
				if let val = exist as? String {
					self.orderStatus = val
				}
				else {
					errors.append(FHIRJSONError(key: "orderStatus", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "orderStatus"))
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
			else {
				errors.append(FHIRJSONError(key: "request"))
			}
			if let exist = js["who"] {
				presentKeys.insert("who")
				if let val = exist as? FHIRJSON {
					upsert(who: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "who", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let description_fhir = self.description_fhir {
			json["description"] = description_fhir.asJSON()
		}
		if fulfillment.count > 0 {
			json["fulfillment"] = Array(fulfillment.map() { $0.asJSON() })
		}
		if identifier.count > 0 {
			json["identifier"] = Array(identifier.map() { $0.asJSON() })
		}
		if let orderStatus = self.orderStatus {
			json["orderStatus"] = orderStatus.asJSON()
		}
		if let request = self.request {
			json["request"] = request.asJSON()
		}
		if let who = self.who {
			json["who"] = who.asJSON()
		}
		
		return json
	}
}

