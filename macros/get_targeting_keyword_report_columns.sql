[0m03:19:23  {% macro get_targeting_keyword_report_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "acos_clicks_14_d", "datatype": dbt.type_float()},
    {"name": "acos_clicks_7_d", "datatype": dbt.type_float()},
    {"name": "ad_group_id", "datatype": dbt.type_int()},
    {"name": "ad_keyword_status", "datatype": dbt.type_string()},
    {"name": "attributed_sales_same_sku_14_d", "datatype": dbt.type_float()},
    {"name": "attributed_sales_same_sku_1_d", "datatype": dbt.type_float()},
    {"name": "attributed_sales_same_sku_30_d", "datatype": dbt.type_float()},
    {"name": "attributed_sales_same_sku_7_d", "datatype": dbt.type_float()},
    {"name": "campaign_budget_amount", "datatype": dbt.type_float()},
    {"name": "campaign_budget_currency_code", "datatype": dbt.type_string()},
    {"name": "campaign_budget_type", "datatype": dbt.type_string()},
    {"name": "campaign_id", "datatype": dbt.type_int()},
    {"name": "click_through_rate", "datatype": dbt.type_float()},
    {"name": "clicks", "datatype": dbt.type_int()},
    {"name": "cost", "datatype": dbt.type_float()},
    {"name": "cost_per_click", "datatype": dbt.type_float()},
    {"name": "date", "datatype": "date"},
    {"name": "impressions", "datatype": dbt.type_int()},
    {"name": "keyword_bid", "datatype": dbt.type_float()},
    {"name": "keyword_id", "datatype": dbt.type_int()},
    {"name": "keyword_type", "datatype": dbt.type_string()},
    {"name": "kindle_edition_normalized_pages_read_14_d", "datatype": dbt.type_int()},
    {"name": "kindle_edition_normalized_pages_royalties_14_d", "datatype": dbt.type_float()},
    {"name": "match_type", "datatype": dbt.type_string()},
    {"name": "purchases_14_d", "datatype": dbt.type_int()},
    {"name": "purchases_1_d", "datatype": dbt.type_int()},
    {"name": "purchases_30_d", "datatype": dbt.type_int()},
    {"name": "purchases_7_d", "datatype": dbt.type_int()},
    {"name": "purchases_same_sku_14_d", "datatype": dbt.type_int()},
    {"name": "purchases_same_sku_1_d", "datatype": dbt.type_int()},
    {"name": "purchases_same_sku_30_d", "datatype": dbt.type_int()},
    {"name": "purchases_same_sku_7_d", "datatype": dbt.type_int()},
    {"name": "roas_clicks_14_d", "datatype": dbt.type_float()},
    {"name": "roas_clicks_7_d", "datatype": dbt.type_float()},
    {"name": "sales_14_d", "datatype": dbt.type_float()},
    {"name": "sales_1_d", "datatype": dbt.type_float()},
    {"name": "sales_30_d", "datatype": dbt.type_float()},
    {"name": "sales_7_d", "datatype": dbt.type_float()},
    {"name": "sales_other_sku_7_d", "datatype": dbt.type_int()},
    {"name": "targeting", "datatype": dbt.type_string()},
    {"name": "units_sold_clicks_14_d", "datatype": dbt.type_int()},
    {"name": "units_sold_clicks_1_d", "datatype": dbt.type_int()},
    {"name": "units_sold_clicks_30_d", "datatype": dbt.type_int()},
    {"name": "units_sold_clicks_7_d", "datatype": dbt.type_int()},
    {"name": "units_sold_other_sku_7_d", "datatype": dbt.type_int()},
    {"name": "units_sold_same_sku_14_d", "datatype": dbt.type_int()},
    {"name": "units_sold_same_sku_1_d", "datatype": dbt.type_int()},
    {"name": "units_sold_same_sku_30_d", "datatype": dbt.type_int()},
    {"name": "units_sold_same_sku_7_d", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
