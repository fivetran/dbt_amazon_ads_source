{% macro get_relation_cols(relation_var) %}

{% set query %}
    select *
    from {{ var(relation_var) }}
{% endset %}

{% set results = run_query(query) %}

{% if execute %}
    {% set relation_columns = results.columns %}
{% endif %}

{{ return(relation_columns) }}

{% endmacro %}