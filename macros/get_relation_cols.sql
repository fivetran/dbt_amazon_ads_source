{% macro get_relation_cols(custom_relation_string) %}
{# Takes a string that looks like this: "{{ source('amazon_ads','ad_group_history') }}" #}

stripped_custom_relation_string = custom_relation_string.strip('{').strip('}').strip(' ')
{# now it looks like this: "source('amazon_ads','ad_group_history')" #}

{% if 'source' in stripped_custom_relation_string %}
    {% set arg_text = stripped_custom_relation_string.strip('source(').strip(')') %}
    {# now it looks like this 'amazon_ads','ad_group_history'
    we can split it by the comma and then use first and second entries of the list #}
    {% set source_name = arg_text.split(',')[0] %}
    {% set model_name = arg_text.split(',')[1] %}
    {% set relation_columns = adapter.get_columns_in_relation(source('source_name','model_name')) %}

{% elif 'ref' in stripped_custom_relation_string %}
    {# easier when it's a ref since no parsing required #}
    {% set ref_name = stripped_custom_relation_string.strip('ref(').strip(')') %}
    {% set relation_columns = adapter.get_columns_in_relation(ref(ref_name)) %}

{% else %}
    {# return empty list if not valid relation #}
    {% set relation_columns = [] %}
{% endif %}

{{ return(relation_columns) }}

{% endmacro %}