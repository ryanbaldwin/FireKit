//
//  DeviceComponent.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/DeviceComponent) on 2017-02-22.
//  2017, SMART Health IT.
//

import Foundation
import RealmSwift


/**
 *  An instance of a medical-related component of a medical device.
 *
 *  Describes the characteristics, operational status and capabilities of a medical-related component of a medical
 *  device.
 */
open class DeviceComponent: DomainResource {
	override open class var resourceType: String {
		get { return "DeviceComponent" }
	}
    
    public dynamic var identifier: Identifier?        
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }    
    public dynamic var languageCode: CodeableConcept?        
    public func upsert(languageCode: CodeableConcept?) {
        upsert(prop: &self.languageCode, val: languageCode)
    }    
    public dynamic var lastSystemChange: Instant?        
        
    public dynamic var measurementPrinciple: String?        
        
    public let operationalStatus = RealmSwift.List<CodeableConcept>()    
    public dynamic var parameterGroup: CodeableConcept?        
    public func upsert(parameterGroup: CodeableConcept?) {
        upsert(prop: &self.parameterGroup, val: parameterGroup)
    }    
    public dynamic var parent: Reference?        
    public func upsert(parent: Reference?) {
        upsert(prop: &self.parent, val: parent)
    }    
    public let productionSpecification = RealmSwift.List<DeviceComponentProductionSpecification>()    
    public dynamic var source: Reference?        
    public func upsert(source: Reference?) {
        upsert(prop: &self.source, val: source)
    }    
    public dynamic var type: CodeableConcept?        
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(identifier: Identifier, lastSystemChange: Instant, type: CodeableConcept) {
        self.init(json: nil)
        self.identifier = identifier
        self.lastSystemChange = lastSystemChange
        self.type = type
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "identifier"))
			}
			if let exist = js["languageCode"] {
				presentKeys.insert("languageCode")
				if let val = exist as? FHIRJSON {
					upsert(languageCode: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "languageCode", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["lastSystemChange"] {
				presentKeys.insert("lastSystemChange")
				if let val = exist as? String {
					self.lastSystemChange = Instant(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "lastSystemChange", wants: String.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "lastSystemChange"))
			}
			if let exist = js["measurementPrinciple"] {
				presentKeys.insert("measurementPrinciple")
				if let val = exist as? String {
					self.measurementPrinciple = val
				}
				else {
					errors.append(FHIRJSONError(key: "measurementPrinciple", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["operationalStatus"] {
				presentKeys.insert("operationalStatus")
				if let val = exist as? [FHIRJSON] {
					if let vals = CodeableConcept.instantiate(fromArray: val, owner: self) as? [CodeableConcept] {
						if let realm = self.realm { realm.delete(self.operationalStatus) }
						self.operationalStatus.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "operationalStatus", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["parameterGroup"] {
				presentKeys.insert("parameterGroup")
				if let val = exist as? FHIRJSON {
					upsert(parameterGroup: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "parameterGroup", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["parent"] {
				presentKeys.insert("parent")
				if let val = exist as? FHIRJSON {
					upsert(parent: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "parent", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["productionSpecification"] {
				presentKeys.insert("productionSpecification")
				if let val = exist as? [FHIRJSON] {
					if let vals = DeviceComponentProductionSpecification.instantiate(fromArray: val, owner: self) as? [DeviceComponentProductionSpecification] {
						if let realm = self.realm { realm.delete(self.productionSpecification) }
						self.productionSpecification.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "productionSpecification", wants: Array<FHIRJSON>.self, has: type(of: exist)))
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
			if let exist = js["type"] {
				presentKeys.insert("type")
				if let val = exist as? FHIRJSON {
					upsert(type: CodeableConcept(json: val, owner: self))
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
		
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let languageCode = self.languageCode {
			json["languageCode"] = languageCode.asJSON()
		}
		if let lastSystemChange = self.lastSystemChange {
			json["lastSystemChange"] = lastSystemChange.asJSON()
		}
		if let measurementPrinciple = self.measurementPrinciple {
			json["measurementPrinciple"] = measurementPrinciple.asJSON()
		}
		if operationalStatus.count > 0 {
			json["operationalStatus"] = Array(operationalStatus.map() { $0.asJSON() })
		}
		if let parameterGroup = self.parameterGroup {
			json["parameterGroup"] = parameterGroup.asJSON()
		}
		if let parent = self.parent {
			json["parent"] = parent.asJSON()
		}
		if productionSpecification.count > 0 {
			json["productionSpecification"] = Array(productionSpecification.map() { $0.asJSON() })
		}
		if let source = self.source {
			json["source"] = source.asJSON()
		}
		if let type = self.type {
			json["type"] = type.asJSON()
		}
		
		return json
	}
}


/**
 *  Production specification of the component.
 *
 *  Describes the production specification such as component revision, serial number, etc.
 */
open class DeviceComponentProductionSpecification: BackboneElement {
	override open class var resourceType: String {
		get { return "DeviceComponentProductionSpecification" }
	}
    
    public dynamic var componentId: Identifier?        
    public func upsert(componentId: Identifier?) {
        upsert(prop: &self.componentId, val: componentId)
    }    
    public dynamic var productionSpec: String?        
        
    public dynamic var specType: CodeableConcept?        
    public func upsert(specType: CodeableConcept?) {
        upsert(prop: &self.specType, val: specType)
    }

	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["componentId"] {
				presentKeys.insert("componentId")
				if let val = exist as? FHIRJSON {
					upsert(componentId: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "componentId", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["productionSpec"] {
				presentKeys.insert("productionSpec")
				if let val = exist as? String {
					self.productionSpec = val
				}
				else {
					errors.append(FHIRJSONError(key: "productionSpec", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["specType"] {
				presentKeys.insert("specType")
				if let val = exist as? FHIRJSON {
					upsert(specType: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "specType", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let componentId = self.componentId {
			json["componentId"] = componentId.asJSON()
		}
		if let productionSpec = self.productionSpec {
			json["productionSpec"] = productionSpec.asJSON()
		}
		if let specType = self.specType {
			json["specType"] = specType.asJSON()
		}
		
		return json
	}
}

