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
                // we should always copy in case the same source is being used across several targets
                // in a single transaction.
                let val = {{prop|realm_listify}}()
                val.populate(from: t)
                self.{{prop.name}}.append(val)
                continue
            }
            self.{{prop.name}}[index].populate(from: t)
        }
    
        while self.{{ prop.name }}.count > o.{{ prop.name }}.count {
            let objectToRemove = self.{{ prop.name }}.last!
            self.{{ prop.name }}.removeLast()
            try! (objectToRemove as? CascadeDeletable)?.cascadeDelete() ?? realm?.delete(objectToRemove)
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