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
{% for prop in klass.properties %}
        {#- // is_array: {{ prop.is_array }} | class_name: {{ prop.class_name }} | json_class: {{ prop.class_name }} | is_native: {{ prop.is_native }} | requires_realm_optional: {{ prop|requires_realm_optional }} -#}
  {%- if prop.is_array %}
    {%- if prop.class_name == 'Resource' %}
        if container.contains(.contained) {
            // Need to loop through all the contained items twice.
            // First time through we grab the resource type
            // the second time through we decode the contained resource for the actual resource type
            // I cannot find a better way to do this in Apple's Decodable containers.
            // If there's a way to get at the raw data in a container without decoding it,
            // please let me know and I will buy you 🍻
            var inflatedContainers: [ContainedResource] = []
            var containedList = try container.nestedUnkeyedContainer(forKey: .contained)
            //print("Inflating \(containedList.count ?? 0) items.")
            while !containedList.isAtEnd {
                inflatedContainers.append(try containedList.decode(ContainedResource.self))
            }
            
            var secondPass = try container.nestedUnkeyedContainer(forKey: .contained)
            while !secondPass.isAtEnd {
                let containedResource = inflatedContainers[secondPass.currentIndex]
                let actualResource = try secondPass.decodeFHIRAbstractBase(containedResource.resourceType!)
                containedResource.json = try JSONEncoder().encode(actualResource)
            }
            
            self.contained.append(objectsIn: inflatedContainers)
        }
    {%- elif prop.class_name != prop|realm_listify %}{#- requires a wrapper, such as "RealmString", or "RealmInt", etc. #}
        self.{{ prop.name }}.append(objectsIn: try container.decodeIfPresent([{{ prop|realm_listify }}].self, forKey: .{{ prop.name }}) ?? [])
    {%- else %}
        self.{{ prop.name }}.append(objectsIn: try container.decodeIfPresent([{{ prop.class_name }}].self, forKey: .{{ prop.name }}) ?? [])
    {%- endif %}
  {%- else %}
    {%- if prop.class_name == 'Resource' %}

        if let {{ prop.name }}Contained = try container.decodeIfPresent(ContainedResource.self, forKey: .{{ prop.name }}),
           let resourceType = {{ prop.name }}Contained.resourceType {
            let actualResource = try container.decodeFHIRAbstractBaseIfPresent(resourceType, forKey: .{{ prop.name }})
            {{ prop.name }}Contained.json = try JSONEncoder().encode(actualResource)
            self.{{prop.name}} = {{prop.name}}Contained
        }
    {% else %}
        self.{{ prop.name }}{%- if prop|requires_realm_optional %}.value{%- endif %} = try container.decodeIfPresent({{ prop.class_name }}.self, forKey: .{{ prop.name }})
    {%- endif %}
  {%- endif %}
{%- endfor -%}
{%- endif %}
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
      {%- if has_codable_properties %}
        var container = encoder.container(keyedBy: CodingKeys.self)
      {%- for prop in klass.properties %}
      {%- if prop.is_array %}
        {%- if prop.class_name == 'Resource' %}
        let containedItems = Array(self.contained.flatMap { $0.resource })
        try container.encode({{prop.name}}Items, forKey: .contained)
        {%- else %}
        try container.encode(Array(self.{{ prop.name }}), forKey: .{{prop.name}})
        {%- endif %}
      {%- else %}
        try container.encodeIfPresent(self.{{ prop.name }}{% if prop|requires_realm_optional %}.value{% endif %}, forKey: .{{ prop.name }})
      {%- endif -%}{%- endfor -%}{%- endif %}
    }
