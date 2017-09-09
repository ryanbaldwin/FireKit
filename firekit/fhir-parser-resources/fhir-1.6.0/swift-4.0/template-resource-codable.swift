    // MARK: Codable
    {%- set has_codable_properties = klass.properties|length > 0 -%}
    {%- if has_codable_properties %}
    private enum CodingKeys: String, CodingKey {
      {%- for prop in klass.properties %}
        case {{ prop.name }} = "{{ prop.orig_name }}"
      {%- endfor %}
    }
    {%- endif %}
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
      {%- if has_codable_properties %}
        let container = try decoder.container(keyedBy: CodingKeys.self)
      {%- for prop in klass.properties %}
        {%- if prop.class_name == prop.json_class %}
        {%- if prop.is_array and prop.is_native %}

        {%- else %}
        self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %} = try container.decodeIfPresent({{ prop.class_name }}.self, forKey: .{{ prop.name }})
        {%- endif %}{%- endif %}
      {%- endfor -%}{%- endif %}
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
      {%- if has_codable_properties %}
        var container = encoder.container(keyedBy: CodingKeys.self)
      {%- for prop in klass.properties %}
      {%- if prop.is_array %}
        try container.encode(self.{{ prop.name }}.flatMap { {% if prop|is_realmlist_custom %}$0.value{% else %}$0{% endif %} }, forKey: .{{prop.name}})
      {%- else %}
        try container.encodeIfPresent(self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %}, forKey: .{{ prop.name }})
      {%- endif -%}{%- endfor -%}{%- endif %}
    }
