//
//  RealmTypes.swift
//  SwiftFHIR
//
// Updated for Realm support by Ryan Baldwin on 2017-08-09
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation
import Realm
import RealmSwift

final public class RealmString: Object, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    @objc public dynamic var value: String = ""

    public convenience init(val: String) {
        self.init()
        self.value = val
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(val: try container.decode(String.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
    
    override open static func primaryKey() -> String? { return "pk" }
}

extension RealmString: Populatable {
    public func populate(from other: Any) {
        guard let o = other as? RealmString else {
            print("Tried to populate a RealmString from \(type(of: other)). Skipping.")
            return
        }
        value = o.value
    }
}

final public class RealmInt: Object, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    @objc public dynamic var value: Int = 0

    public convenience init(val: Int) {
        self.init()
        self.value = val
    }

    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(val: try container.decode(Int.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
    
    override open static func primaryKey() -> String? { return "pk" }
}

extension RealmInt: Populatable {
    public func populate(from other: Any) {
        guard let o = other as? RealmInt else {
            print("Tried to populate a RealmInt from \(type(of: other)). Skipping.")
            return
        }
        value = o.value
    }
}

final public class RealmDecimal: Object, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    @objc private dynamic var _value = "0"

    public var value: Decimal {
        get { return Decimal(string: _value)! }
        set { _value = String(describing: newValue) }
    }

    public convenience init(string val: String) {
        self.init()
        self._value = val
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        do {
            self.init(string: try container.decode(String.self))
            return
        } catch {
            // failed to decode RealmDecimal as String, try Double
        }
        
        do {
            self.init(string: "\(try container.decode(Double.self))")
            return
        } catch {
            // failed to decode RealmDecimal as Double, try Int
        }
        
        self.init(string: "\(try container.decode(Int.self))")
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["value"]
    }
    
    override open static func primaryKey() -> String? { return "pk" }

    public static func ==(lhs: RealmDecimal, rhs: RealmDecimal) -> Bool {
        return lhs.value.isEqual(to: rhs.value)
    }
    
    public static func ==(lhs: RealmDecimal?, rhs: RealmDecimal) -> Bool {
        if let lhs = lhs {
            return lhs == rhs
        }
        
        return false
    }
    
    public static func ==(lhs: RealmDecimal, rhs: RealmDecimal?) -> Bool {
        if let rhs = rhs {
            return lhs == rhs
        }
        
        return false
    }    
}

extension RealmDecimal: Populatable {
    public func populate(from other: Any) {
        guard let o = other as? RealmDecimal else {
            print("Tried to populate a RealmDecimal from \(type(of: other)). Skipping.")
            return
        }
        _value = o._value
    }
}

final public class RealmURL: Object, Codable {
    @objc public dynamic var pk: String = UUID().uuidString
    @objc private dynamic var _value: String?
    
    private var _url: URL? = nil
    public var value: URL? {
        get {
            if _url == nil {
                _url = URL(string: _value ?? "")
            }
            
            return _url
        }
        set {
            _url = newValue
            _value = newValue?.absoluteString ?? ""
        }
    }
    
    public convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.singleValueContainer()
        value = try container.decode(URL.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["value", "_url"]
    }
    
    override open static func primaryKey() -> String? { return "pk" }
}

extension RealmURL: Populatable {
    public func populate(from other: Any) {
        guard let o = other as? RealmURL else {
            print("Tried to populate a RealmURL from \(type(of: other)). Skipping.")
            return
        }
        _value = o._value
    }
}

/// Realm is limited in its polymorphism and can't contain a List of different
/// classes. As a result, for example, deserializing from JSON into a DomainResource
/// will fail if that resource has any contained resources.
///
/// In normal SwiftFHIR the `DomainResource.contained` works fine, but because of 
/// Realm's polymorphic limitations it fails. `DomainResource.contained: RealmSwift<Resource>` 
/// will blow up at runtime. The workaround is to create a `ContainedResource: Resource`
/// Which will store the same information as `Resource`, but will also provide functionality
/// to store the original JSON and inflate it on demand into the proper type.
final public class ContainedResource: Resource {
    private enum CodingKeys: String, CodingKey {
        case resourceType
    }
    
    @objc public dynamic var resourceType: String?
    @objc dynamic var json: Data?
    
    lazy public var resource: FHIRAbstractBase? = {
        guard let resourceType = self.resourceType, let json = self.json else {
            return nil
        }
        
        do {
            return try JSONDecoder().decode(resourceType, from: json)
        } catch let error {
            print("Failed to decode contained resource. Returning nil: \(error)")
        }
        
        return nil
    }()
    
    public override class func ignoredProperties() -> [String] {
        return ["resource"]
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resourceType = try container.decodeIfPresent(String.self, forKey: .resourceType)
    }
    
    public required init() {
        super.init()
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public override func encode(to encoder: Encoder) throws {
        guard let resource = resource else {
            return
        }
        
        try resource.encode(to: encoder)
    }
    
    public override func populate(from other: Any) {
        guard let o = other as? ContainedResource else {
            print("Tried to populate a ContainedResource from \(type(of: other)). Skipping")
            return
        }
        
        super.populate(from: other)
        resourceType = o.resourceType
        json = o.json
    }

    
    public override func copy(with zone: NSZone? = nil) -> Any {
        let copy = ContainedResource()
        copy._versionId = _versionId
        copy.id = id
        copy.implicitRules = implicitRules
        copy.language = language
        copy.upsert(meta: meta)
        copy.resourceType = resourceType
        copy.json = json
        return copy
    }
}
