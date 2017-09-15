//
//  {{ profile.targetname }}.swift
//  SwiftFHIR
//
//  Generated from FHIR {{ info.version }} ({{ profile.url }}) on {{ info.date }}.
//  {{ info.year }}, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on {{ info.date }}
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
//

import Foundation
import RealmSwift
{% for klass in classes %}

/**
 *  {{ klass.short|wordwrap(width=116, wrapstring="\n *  ") }}.
{%- if klass.formal %}
 *
 *  {{ klass.formal|wordwrap(width=116, wrapstring="\n *  ") }}
{%- endif %}
 */
open class {{ klass.name }}: {{ klass.superclass.name|default('FHIRAbstractBase') }} {
{%- if klass.resource_name %}
	override open class var resourceType: String {
		get { return "{{ klass.resource_name }}" }
	}
{% endif -%}
{% include 'template-resource-properties.swift' %}
{% include 'template-resource-initializers.swift' %}
{% if klass.properties %}	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
		{%- for prop in klass.properties %}
			if let exist = js["{{ prop.orig_name }}"] {
				presentKeys.insert("{{ prop.orig_name }}")
				if let val = exist as? {% if prop.is_array %}[{% endif %}{{ prop.json_class }}{% if prop.is_array %}]{% endif %} {
					{%- if prop.class_name == prop.json_class %}
					{%- if prop.is_array and prop.is_native %}
					self.{{ prop.name }}.append(objectsIn: val.map{ Realm{{prop.class_name}}(value: [$0]) })
					{%- else %}
					self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %} = val
					{%- endif %}
					{%- else %}
					
					{%- if prop.is_array %}{% if prop.is_native or 'FHIRElement' == prop.class_name %}
					// is_native or 'FHIRElement'
					self.{{ prop.name }}.append(objectsIn: {{ prop.class_name }}.instantiate(fromArray: val))
					{%- elif 'Resource' == prop.class_name %}
					// 'Resource' == prop.class_name
					self.{{ prop.name }}.append(objectsIn: val.map({ return ContainedResource(json: $0, owner: self)}))
					{%- else %}
					if let vals = {{ prop.class_name }}.instantiate(fromArray: val, owner: self) as? [{{ prop.class_name }}] {
						if let realm = self.realm { realm.delete(self.{{ prop.name }}) }
						self.{{ prop.name }}.append(objectsIn: vals)
					}					
					{%- endif %}
					
					{%- else %}{% if prop.is_native %}
					self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %} = {{ prop.class_name }}({% if "String" == prop.json_class %}string{% else %}json{% endif %}: val)
					{%- else %}{% if "Resource" == prop.class_name %}
					self.{{ prop.name }} = Resource.instantiate(from: val, owner: self) as? Resource
					{%- else %}
					upsert({{ prop.name }}: {{ prop.class_name }}(json: val, owner: self))					
					{%- endif %}{% endif %}{% endif %}{% endif %}
				}
				else {
					errors.append(FHIRJSONError(key: "{{ prop.orig_name }}", wants: {% if prop.is_array %}Array<{% endif %}{{ prop.json_class }}{% if prop.is_array %}>{% endif %}.self, has: type(of: exist)))
				}
			}
			{%- if prop.nonoptional and not prop.one_of_many %}
			else {
				errors.append(FHIRJSONError(key: "{{ prop.orig_name }}"))
			}
			{%- endif %}
		{%- endfor %}
		{%- if klass.expanded_nonoptionals %}
			
			// check if nonoptional expanded properties are present
			{%- for exp, props in klass.sorted_nonoptionals %}
			if {% for prop in props %}nil == self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %}{% if not loop.last %} && {% endif %}{% endfor %} {
				errors.append(FHIRJSONError(key: "{{ exp }}*"))
			}
			{%- endfor %}
		{%- endif %}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		{% for prop in klass.properties %}
		{%- if prop.is_array %}
		if {{ prop.name }}.count > 0 {
			json["{{ prop.orig_name }}"] = Array({{ prop.name }}.map() { {% if prop|is_realmlist_custom %}$0.value{% else %}$0.asJSON(){% endif %} })
		}		
		{%- else %}
		if let {{ prop.name }} = self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %} {
			json["{{ prop.orig_name }}"] = {{ prop.name }}.asJSON()
		}
		{%- endif -%}
		{%- endfor %}
		
		return json
	}
{%- endif %}
}
{% endfor %}

