//
//  {{ profile.targetname }}.swift
//  SwiftFHIR
//
//  Generated from FHIR {{ info.version }} ({{ profile.url }}) on {{ info.date }}.
//  {{ info.year }}, SMART Health IT.
//
// 	Updated for Realm support by Ryan Baldwin on {{ info.date }}
// 	Copyright @ {{ info.year }} Bunnyhug. All rights fall under Apache 2

import Foundation
import Realm
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
{% include 'template-resource-codable.swift' %}

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode({{ klass.name }}.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy {{ klass.name }}. Will return empty instance: \(error))")
		}
		return {{ klass.name }}.init()
	}

{% include 'template-resource-populatable.swift' %}
}
{% endfor %}

