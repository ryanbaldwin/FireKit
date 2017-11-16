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
import RealmSwift

struct UnknownFhirDecodingTypeError: Error {
  var className: String
}

extension KeyedDecodingContainerProtocol {
  public func decodeFHIRAbstractBaseIfPresent(_ className: String, forKey key: Self.Key) throws -> FHIRAbstractBase? {
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
  public mutating func decodeFHIRAbstractBase(_ className: String) throws -> FHIRAbstractBase {
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
  public func decode(_ classname: String, from data: Data) throws -> FHIRAbstractBase {
    switch classname {
      {%- for klass in classes %}{% if klass.resource_name %}
      case "{{ klass.resource_name }}":
      return try decode({{ klass.name }}.self, from: data)
      {%- endif %}{% endfor %}
      default:
      throw UnknownFhirDecodingTypeError(className: classname)
    }
  }

  public func decodeResource(_ classname: String, from data: Data) throws -> Resource {
    switch classname {
      {%- for klass in classes %}{% if klass.superclass.name == "DomainResource" %}
      case "{{ klass.resource_name }}":
      return try decode({{ klass.name }}.self, from: data)
      {%- endif %}{% endfor %}
      default:
      throw UnknownFhirDecodingTypeError(className: classname)
    }
  }
}

extension Reference {
    /// Gets a tuple of the FHIR type and ID that makes up this Reference.
    public var parts: (fhirType: String, id: String)? {
        guard let parts = self.reference?.components(separatedBy: "/"),
        let fhirType = parts.first,
            let id = parts.last else {
                return nil
        }
        
        return (fhirType: fhirType, id: id)
    }

    /// Creates a new Reference and sets the actual `refernece` field with the provided `withReferenceId`
    ///
    /// - Parameter reference: The reference ID to be set on this new instance. e.g. `Patient/123`
    public convenience init?(withReferenceId reference: String?) {
        if let ref = reference {
            self.init()
            self.reference = ref
        } else {
            return nil
        }
    }

    /// Attempts to resolve this reference from the provided realm.
    ///
    /// - Parameter realm: The realm from which this reference is to be resolved
    /// - Returns: This resolved reference, if one exists; otherwise nil.
    public func resolve<T>(from realm: Realm) -> T? where T: Resource {
        guard let parts = parts else {
            return nil
        }

        switch parts.fhirType {
            {%- for klass in classes %}{% if klass.resource_name and klass.superclass.name|default('Poop') in ("Resource", "DomainResource") %}
            case "{{ klass.resource_name }}":
                return self.realm?.objects({{ klass.resource_name }}.self).filter("id = %@", parts.id).first as? T
            {%- endif %}{%- endfor %}
            default:
                print("Could not resolve Resource for type \(parts.fhirType), as it is unknown. Returning nil")
                return nil
        }
    }
}