extension {{ klass.name }} {
    public override func populate(from other: {{ klass.name }}) {
        super.populate(from: other)
{%- for prop in klass.properties %}
    {%- if prop.is_array %}
        // {{ prop.name }} array
    {%- elif prop|requires_realm_optional %}
        {{ prop.name }}.value = other.{{ prop.name }}.value
    {%- elif prop.class_name == 'Resource' %}
        if {{ prop.name }} == nil && other.{{ prop.name }} != nil {
            {{ prop.name }} = other.{{ prop.name }}
        } else if {{ prop.name }} != nil && other.{{ prop.name }} == nil {
            if realm != nil { 
                {{ prop.name }}.cascadeDelete()
            } else {
                {{ prop.name }} = nil
            }
        } else if {{ prop.name }} != nil && other.{{ prop.name }} != nil {
            {{ prop.name }}!.populate(from: other.{{ prop.name }}!)
        }
    {%- endif %}
{%- endfor %}
    }
}