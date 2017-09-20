    public override func populate(from other: Any) {
        guard let o = other as? {{ klass.name }} else {
            print("Tried to populate \(Swift.type(of: self)) with values from \(Swift.type(of: other)). Skipping.")
            return
        }
        
        super.populate(from: o)

{%- for prop in klass.properties %}
    {%- if prop.is_array %}

        for (index, t) in o.{{prop.name}}.enumerated() {
            guard index < self.{{prop.name}}.count else {
                self.{{prop.name}}.append(t)
                continue
            }
            self.{{prop.name}}[index].populate(from: t)
        }
    
        if self.{{prop.name}}.count > o.{{prop.name}}.count {
            for i in self.{{prop.name}}.count...o.{{prop.name}}.count {
                let objectToRemove = self.{{prop.name}}[i]
                self.{{prop.name}}.remove(objectAtIndex: i)
                try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
            }
        }
    {%- elif prop|populatable %}
        FireKit.populate(&self.{{ prop.name}}, from: o.{{ prop.name }})
    {%- elif prop|requires_realm_optional %}
        {{ prop.name }}.value = o.{{ prop.name }}.value
    {%- elif prop.is_native %}
        {{ prop.name }} = o.{{prop.name}}
    {%- endif %}
{%- endfor %}
    }