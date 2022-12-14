{% macro get_campaign_history_columns() %}

{% set columns = [
    {"name": "bidding_strategy", "datatype": dbt.type_string()},
    {"name": "campaign_type", "datatype": dbt.type_string()},
    {"name": "creation_date", "datatype": dbt.type_timestamp()},
    {"name": "daily_budget", "datatype": dbt.type_int()},
    {"name": "end_date", "datatype": "date"},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "last_updated_date", "datatype": dbt.type_timestamp()},
    {"name": "name", "datatype": dbt.type_string()},
    {"name": "placement", "datatype": dbt.type_string()},
    {"name": "portfolio_id", "datatype": dbt.type_int()},
    {"name": "premium_bid_adjustment", "datatype": "boolean"},
    {"name": "profile_id", "datatype": dbt.type_int()},
    {"name": "serving_status", "datatype": dbt.type_string()},
    {"name": "start_date", "datatype": "date"},
    {"name": "state", "datatype": dbt.type_string()},
    {"name": "targeting_type", "datatype": dbt.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
