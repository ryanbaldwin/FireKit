//
//  {{ class.name }}Tests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR {{ info.version }} on {{ info.date }}.
//  {{ info.year }}, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class {{ class.name }}Tests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.{{ class.name }} {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.{{ class.name }} {
		let instance = RealmSwiftFHIR.{{ class.name }}(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
{%- for tcase in tests %}
	
	func test{{ class.name }}{{ loop.index }}() {		
		var instance: RealmSwiftFHIR.{{ class.name }}?
		do {
			instance = try run{{ class.name }}{{ loop.index }}()
			try run{{ class.name }}{{ loop.index }}(instance!.asJSON()) 		
			let copy = instance!.copy() as? RealmSwiftFHIR.{{ class.name }}
			XCTAssertNotNil(copy)
			try run{{ class.name}}{{ loop.index }}(copy!.asJSON())            
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test {{ class.name }} successfully, but threw")
		}

		test{{ class.name}}Realm{{ loop.index}}(instance: instance!)
	}

    func test{{ class.name }}{{ loop.index }}RealmPK() {        
        do {
            let instance: RealmSwiftFHIR.{{ class.name }} = try run{{ class.name }}{{ loop.index }}()
            let copy = (instance.copy() as! RealmSwiftFHIR.{{ class.name }})

            XCTAssertNotEqual(instance.pk, copy.pk)
            try! realm.write { realm.add(instance) }
            try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            XCTAssertNotEqual(instance.pk, copy.pk)
            
            let prePopulatedCopyPK = copy.pk
            _ = copy.populate(from: instance.asJSON())
            XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            XCTAssertNotEqual(copy.pk, instance.pk)

        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test {{ class.name }}'s PKs, but threw: \(error)")
        }
    }

	func test{{ class.name}}Realm{{ loop.index }}(instance: RealmSwiftFHIR.{{class.name}}) {
		// ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
		try! realm.write {
                realm.add(instance)
            }
        try! run{{ class.name }}{{ loop.index }}(realm.objects(RealmSwiftFHIR.{{ class.name }}.self).first!.asJSON())
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.{{ class.name }}.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.{{ class.name }}.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = RealmSwiftFHIR.{{ class.name }}()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: RealmSwiftFHIR.{{ class.name }}.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! run{{ class.name }}{{ loop.index }}(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: RealmSwiftFHIR.{{ class.name }}.self, forPrimaryKey: newInst.pk)!
        try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        try! run{{ class.name }}{{ loop.index }}(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.{{ class.name }}.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.{{ class.name }}.self).count)
	}
	
	@discardableResult
	func run{{ class.name }}{{ loop.index }}(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.{{ class.name }} {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "{{ tcase.filename }}")
		{% for onetest in tcase.tests %}
		{%- if "String" == onetest.klass.name %}
		XCTAssertEqual(inst.{{ onetest.path }}, "{{ onetest.value|replace('"', '\\"') }}")
		{%- else %}{% if "RealmDecimal" == onetest.klass.name %}
		XCTAssertTrue(inst.{{ onetest.path }}! == RealmDecimal(string: "{{ onetest.value }}"))
		{%- else %}{% if "Int" == onetest.klass.name or "Double" == onetest.klass.name %}
		XCTAssertEqual(inst.{{ onetest.path }}, {{ onetest.value }})
		{%- else %}{% if "UInt" == onetest.klass.name %}
		XCTAssertEqual(inst.{{ onetest.path }}, UInt({{ onetest.value }}))
		{%- else %}{% if "Bool" == onetest.klass.name %}
		XCTAssert{% if onetest.value %}True{% else %}False{% endif %}(inst.{{ onetest.path }} ?? {% if onetest.value %}false{% else %}true{% endif %})
		{%- else %}{% if "FHIRDate" == onetest.klass.name or "FHIRTime" == onetest.klass.name or "DateTime" == onetest.klass.name or "Instant" == onetest.klass.name %}
		XCTAssertEqual(inst.{{ onetest.path }}{% if not onetest.array_item %}?{% endif %}.description, "{{ onetest.value }}")
		{%- else %}{% if "URL" == onetest.klass.name %}
		XCTAssertEqual(inst.{{ onetest.path }}{% if not onetest.array_item %}?{% endif %}.absoluteString, "{{ onetest.value }}")
		{%- else %}{% if "Base64Binary" == onetest.klass.name %}
		XCTAssertTrue(inst.{{ onetest.path }}! == Base64Binary(val: "{{ onetest.value }}"))
		{%- else %}
		// Don't know how to create unit test for "{{ onetest.path }}", which is a {{ onetest.klass.name }}
		{%- endif %}{% endif %}{% endif %}{% endif %}{% endif %}{% endif %}{% endif %}{% endif %}
		{%- endfor %}
		
		return inst
	}
{%- endfor %}
}
