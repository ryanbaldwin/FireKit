//
//  {{ class.name }}Tests.swift
//  FireKit
//
//  Generated from FHIR {{ info.version }} on {{ info.date }}.
//  {{ info.year }}, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on {{ info.date }}
// Copyright @ {{ info.year }} Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class {{ class.name }}Tests: XCTestCase, RealmPersistenceTesting {    
    var realm: Realm!
    
    override func setUp() {
        realm = makeRealm()
    }

    func inflateFrom(filename: String) throws -> FireKit.{{ class.name }} {
        return try inflateFrom(data: try readJSONFile(filename))
    }
    
    func inflateFrom(data: Data) throws -> FireKit.{{ class.name }} {
        // print("Inflating FireKit.{{class.name}} from data: \(data)")
        let instance = try JSONDecoder().decode(FireKit.{{ class.name }}.self, from: data)
        XCTAssertNotNil(instance, "Must have instantiated a test instance")
        return instance
    }

    {%- for tcase in tests %}
    
    func test{{ class.name }}{{ loop.index }}() {   
        var instance: FireKit.{{ class.name }}?
        do {
            instance = try run{{ class.name }}{{ loop.index }}()
            try run{{ class.name }}{{ loop.index }}(try JSONEncoder().encode(instance!))    
        }
        catch let error {
            XCTAssertTrue(false, "Must instantiate and test {{ class.name }} successfully, but threw: \(error)")
        }

        test{{ class.name}}Realm{{ loop.index}}(instance!)
    }

    func test{{ class.name }}{{ loop.index }}Copying() {
        do {
            let instance = try run{{ class.name }}{{ loop.index }}()
            let copy = instance.copy() as? FireKit.{{ class.name }}
            XCTAssertNotNil(copy)
            XCTAssertNotEqual(instance.pk, copy?.pk)
            try run{{ class.name}}{{ loop.index }}(try JSONEncoder().encode(copy!))
        } catch let error {
            XCTAssertTrue(false, "Must copy and test {{ class.name }} successfully, but threw: \(error)")
        }
    }

    func test{{ class.name }}{{ loop.index }}Populatability() {
        do {
            let instance = try run{{ class.name }}{{ loop.index }}()
            let copy = FireKit.{{ class.name }}()
            copy.populate(from: instance)
            XCTAssertNotEqual(instance.pk, copy.pk)
            try run{{ class.name }}{{ loop.index }}(try JSONEncoder().encode(copy))
        }
        catch let error {
            XCTAssertTrue(false, "Must populate an test {{ class.name }} successfully, but threw: \(error)")
        }
    }

    func test{{ class.name}}{{loop.index }}NillingPopulatability() {
        do {
            let instance = try run{{ class.name }}{{ loop.index }}()
            try! realm.write { realm.add(instance) }
            try! realm.write { instance.populate(from: FireKit.{{ class.name }}()) }
        } catch let error {
            XCTAssertTrue(false, "Must populate a test {{ class.name }} successfully, but threw: \(error)")
        }
    }

    func test{{ class.name}}Realm{{ loop.index }}(_ instance: FireKit.{{class.name}}) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! run{{ class.name }}{{ loop.index }}(JSONEncoder().encode(realm.objects(FireKit.{{ class.name }}.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.{{ class.name }}.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.{{ class.name }}.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.{{ class.name }}()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        let existing = realm.object(ofType: FireKit.{{ class.name }}.self, forPrimaryKey: newInst.pk)!
        
        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.{{ class.name }}.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.{{ class.name }}.self).count)
    }
    
    @discardableResult
    func run{{ class.name }}{{ loop.index }}(_ data: Data? = nil) throws -> FireKit.{{ class.name }} {
        let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "{{ tcase.filename }}")
        {% for onetest in tcase.tests %}
        {%- if "String" == onetest.klass.name %}
        XCTAssertEqual(inst.{{ onetest.path|expand_test_path(tcase.klass) }}, "{{ onetest.value|replace('\t', '\\t')|replace('"', '\\"') }}")
        {%- else %}{% if "RealmDecimal" == onetest.klass.name %}
        XCTAssertTrue(inst.{{ onetest.path|expand_test_path(tcase.klass) }}! == RealmDecimal(string: "{{ onetest.value }}"))
        {%- else %}{% if "Int" == onetest.klass.name or "Double" == onetest.klass.name %}
        XCTAssertEqual(inst.{{ onetest.path|expand_test_path(tcase.klass) }}, {{ onetest.value }})
        {%- else %}{% if "UInt" == onetest.klass.name %}
        XCTAssertEqual(inst.{{ onetest.path|expand_test_path(tcase.klass) }}, UInt({{ onetest.value }}))
        {%- else %}{% if "Bool" == onetest.klass.name %}
        XCTAssert{% if onetest.value %}True{% else %}False{% endif %}(inst.{{ onetest.path|expand_test_path(tcase.klass) }} ?? {% if onetest.value %}false{% else %}true{% endif %})
        {%- else %}{% if "FHIRDate" == onetest.klass.name or "FHIRTime" == onetest.klass.name or "DateTime" == onetest.klass.name or "Instant" == onetest.klass.name %}
        XCTAssertEqual(inst.{{ onetest.path|expand_test_path(tcase.klass) }}{% if not onetest.array_item %}?{% endif %}.description, "{{ onetest.value }}")
        {%- else %}{% if "URL" == onetest.klass.name %}
        XCTAssertEqual(inst.{{ onetest.path|expand_test_path(tcase.klass) }}{% if not onetest.array_item %}?{% endif %}.absoluteString, "{{ onetest.value }}")
        {%- else %}{% if "Base64Binary" == onetest.klass.name %}
        XCTAssertTrue(inst.{{ onetest.path|expand_test_path(tcase.klass) }}! == Base64Binary(val: "{{ onetest.value }}"))
        {%- else %}
        // Don't know how to create unit test for "{{ onetest.path }}", which is a {{ onetest.klass.name }}
        {%- endif %}{% endif %}{% endif %}{% endif %}{% endif %}{% endif %}{% endif %}{% endif %}
        {%- endfor %}

        return inst
    }
    {%- endfor %}
}
