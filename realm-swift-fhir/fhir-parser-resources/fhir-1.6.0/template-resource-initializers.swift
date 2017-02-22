{% if klass.has_nonoptional %}
    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(
    {%- for nonop in klass.properties|rejectattr("nonoptional", "equalto", false) %}
        {%- if loop.index is greaterthan 1 %}, {% endif -%}
        {%- if "value" == nonop.name %}val{% else %}{{ nonop.name }}{% endif %}: {% if nonop.is_array %}[{% endif %}{{ nonop.class_name }}{% if nonop.is_array %}]{% endif %}
    {%- endfor -%}
    ) {
        self.init(json: nil)
    {%- for nonop in klass.properties %}{% if nonop.nonoptional %}
        {%- if nonop.is_array and nonop.is_native %}
        self.{{ nonop.name }}.append(objectsIn: {{ nonop.name }}.map{ Realm{{ nonop.class_name }}(value: [$0]) })
        {%- elif nonop.is_array %}
        self.{{ nonop.name }}.append(objectsIn: {{ nonop.name }})
        {%- else %}
        self.{{ nonop.name }}{% if nonop|requires_realm_optional %}.value{% endif %} = {% if "value" == nonop.name %}val{% else %}{{ nonop.name }}{% endif %}
        {%- endif %}
    {%- endif %}{% endfor %}
    }
{% endif -%}