{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_amazon_ads__campaign_level_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__campaign_level_report_tmp')),
                staging_columns=get_campaign_level_report_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        attributed_sales_same_sku_14_d,
        attributed_sales_same_sku_1_d,
        attributed_sales_same_sku_30_d,
        attributed_sales_same_sku_7_d,
        campaign_applicable_budget_rule_id,
        campaign_applicable_budget_rule_name,
        campaign_bidding_strategy,
        campaign_budget_amount,
        campaign_budget_currency_code,
        campaign_budget_type,
        campaign_id,
        campaign_rule_based_budget_amount,
        click_through_rate,
        clicks,
        cost,
        cost_per_click,
        date,
        impressions,
        kindle_edition_normalized_pages_read_14_d,
        kindle_edition_normalized_pages_royalties_14_d,
        purchases_14_d,
        purchases_1_d,
        purchases_30_d,
        purchases_7_d,
        purchases_same_sku_14_d,
        purchases_same_sku_1_d,
        purchases_same_sku_30_d,
        purchases_same_sku_7_d,
        sales_14_d,
        sales_1_d,
        sales_30_d,
        sales_7_d,
        spend,
        units_sold_clicks_14_d,
        units_sold_clicks_1_d,
        units_sold_clicks_30_d,
        units_sold_clicks_7_d,
        units_sold_same_sku_14_d,
        units_sold_same_sku_1_d,
        units_sold_same_sku_30_d,
        units_sold_same_sku_7_d
    from fields
)

select *
from final
