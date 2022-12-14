{% macro get_advertised_product_report_columns() %}

{% set columns = [
    {"name": "ad_group_id", "datatype": dbt.type_int()},
    {"name": "ad_id", "datatype": dbt.type_int()},
    {"name": "advertised_asin", "datatype": dbt.type_string()},
    {"name": "advertised_sku", "datatype": dbt.type_string()},
    {"name": "campaign_budget_amount", "datatype": dbt.type_float()},
    {"name": "campaign_budget_currency_code", "datatype": dbt.type_string()},
    {"name": "campaign_budget_type", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "clicks", "datatype": dbt.type_int()},
    {"name": "cost", "datatype": dbt.type_float()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt.type_int()},
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('amazon_ads__advertised_product_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
