{% macro get_relation_cols(relation_var) %}

{% set query %}
    select *
    from {{ var(relation_var) }}
    limit 0
{% endset %}

{% if execute %}
    {{ return(run_query(query).columns) }}
{% endif %}

{% endmacro %}