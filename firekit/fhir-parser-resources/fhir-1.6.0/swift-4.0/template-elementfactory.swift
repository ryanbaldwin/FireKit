//
//  FHIRAbstractBase+Factory.swift
//  SwiftFHIR
//
//  Generated from FHIR {{ info.version }} on {{ info.date }}.
//  {{ info.year }}, SMART Health IT.
//


/**
 *  Extension to FHIRAbstractBase to be able to instantiate by class name.
 */
 /*
extension FHIRAbstractBase {
	
	public class func factory(_ className: String, json: FHIRJSON, owner: FHIRAbstractBase?) -> FHIRAbstractBase {
		switch className {
		{%- for klass in classes %}{% if klass.resource_name %}
			case "{{ klass.resource_name }}":
				return {{ klass.name }}(json: json, owner: owner)
		{%- endif %}{% endfor %}
			default:
				return FHIRAbstractBase(json: json, owner: owner)
		}
	}
}
*/
extension FHIRAbstractBase {
  public class func resourceType(from className: String) -> FHIRAbstractBase.Type {
    switch className {
    {%- for klass in classes %}{% if klass.resource_name %}
      case "{{ klass.resource_name }}":
        return {{ klass.name }}.self
    {%- endif %}{% endfor %}
      default:
        return FHIRAbstractBase.self
    }
  }
}

struct UnkownFhirDecodingTypeError: Error {
    var className: String
}
extension KeyedDecodingContainerProtocol {
    func decodeFHIRAbstractBaseIfPresent(_ className: String, forKey key: Self.Key) throws -> FHIRAbstractBase? {
        switch className {
    {%- for klass in classes %}{% if klass.resource_name %}
      case "{{ klass.resource_name }}":
        return try decodeIfPresent({{ klass.name }}.self, forKey: key)
    {%- endif %}{% endfor %}
      default:
        throw UnkownFhirDecodingTypeError(className: className)
      }
    }
}

extension UnkeyedDecodingContainer {
    mutating func decodeFHIRAbstractBase(_ className: String) throws -> FHIRAbstractBase {
        switch className {
          {%- for klass in classes %}{% if klass.resource_name %}
            case "{{ klass.resource_name }}":
                return try decode({{ klass.name }}.self)
          {%- endif %}{% endfor %}
            default:
                throw UnkownFhirDecodingTypeError(className: className)
        }
    }
}