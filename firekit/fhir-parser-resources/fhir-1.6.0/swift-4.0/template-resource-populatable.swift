    public override func populate(from other: Any) {
        guard let o = other as? {{ klass.name }} else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        super.populate(from: o)
{%- for prop in klass.properties %}
    {%- if prop.is_array %}
        // TODO: {{ prop.name }} array 
    {%- elif prop|populatable %}
        FireKit.populate(&self.{{ prop.name}}, from: o.{{ prop.name }})
    {%- elif prop|requires_realm_optional %}
        {{ prop.name }}.value = o.{{ prop.name }}.value
    {%- elif prop.is_native %}
        {{ prop.name }} = o.{{prop.name}}
    {%- endif %}
{%- endfor %}
    }