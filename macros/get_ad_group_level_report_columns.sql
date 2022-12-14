{% macro get_ad_group_level_report_columns() %}

{% set columns = [
    {"name": "ad_group_id", "datatype": dbt.type_int()},
    {"name": "campaign_bidding_strategy", "datatype": dbt.type_string()},
    {"name": "clicks", "datatype": dbt.type_int()},
    {"name": "cost", "datatype": dbt.type_float()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt.type_int()},
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('amazon_ads__ad_group_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
