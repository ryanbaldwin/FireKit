//
//  FHIRAbstractBase+Factory.swift
//  SwiftFHIR
//
//  Generated from FHIR {{ info.version }} on {{ info.date }}.
//  {{ info.year }}, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on {{ info.date }}
// Copyright @ {{ info.year }} Bunnyhug. All rights fall under Apache 2
//
import Foundation

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

struct UnknownFhirDecodingTypeError: Error {
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
        throw UnknownFhirDecodingTypeError(className: className)
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
                throw UnknownFhirDecodingTypeError(className: className)
        }
    }
}

extension JSONDecoder {
    func decode(_ resourceClassName: String, from data: Data) throws -> FHIRAbstractBase {
        switch resourceClassName {
            {%- for klass in classes %}{% if klass.resource_name %}
            case "{{ klass.resource_name }}":
                return try decode({{ klass.name }}.self, from: data)
            {%- endif %}{% endfor %}
            default:
                throw UnknownFhirDecodingTypeError(className: resourceClassName)
        }
    }
}