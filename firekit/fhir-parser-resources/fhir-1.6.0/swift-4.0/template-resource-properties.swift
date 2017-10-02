{%- for prop in klass.properties %}    
    {%- if prop.is_array %}
    public let {{ prop.name }} = RealmSwift.List<{{ prop|realm_listify }}>()
    {%- elif prop|requires_realm_optional %}
    public let {{ prop.name }} = RealmOptional<{{ prop.class_name }}>()
    {%- elif prop.class_name == 'Resource'%}
    @objc public dynamic var {{ prop.name }}: ContainedResource?
    {%- else %}
    @objc public dynamic var {{ prop.name }}: {{ prop.class_name }}?        
    {%- if prop|can_upsert %}
    public func upsert({{ prop.name }}: {{ prop.class_name }}?) {
        upsert(prop: &self.{{ prop.name }}, val: {{ prop.name }})
    }
    {%- endif -%}
    {%- endif -%}    
    {#- any resource with an ID requires a pk for Realm primary keys -#}
    {%- if "id" == prop.name %}
    @objc public dynamic var pk = UUID().uuidString
    override open static func primaryKey() -> String? { return "pk" }    
    {%- endif -%}
{%- endfor %}