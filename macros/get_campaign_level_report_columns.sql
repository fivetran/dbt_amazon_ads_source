{% macro get_campaign_level_report_columns() %}

{% set columns = [
    {"name": "campaign_applicable_budget_rule_id", "datatype": dbt.type_string()},
    {"name": "campaign_applicable_budget_rule_name", "datatype": dbt.type_string()},
    {"name": "campaign_bidding_strategy", "datatype": dbt.type_string()},
    {"name": "campaign_budget_amount", "datatype": dbt.type_float()},
    {"name": "campaign_budget_currency_code", "datatype": dbt.type_string()},
    {"name": "campaign_budget_type", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "campaign_rule_based_budget_amount", "datatype": dbt.type_float()},
    {"name": "clicks", "datatype": dbt.type_int()},
    {"name": "cost", "datatype": dbt.type_float()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt.type_int()},
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('amazon_ads__campaign_passthrough_metrics')) }}

{{ return(columns) }}

{% endmacro %}
