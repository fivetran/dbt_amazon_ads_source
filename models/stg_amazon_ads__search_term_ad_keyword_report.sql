{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_amazon_ads__search_term_ad_keyword_report_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__search_term_ad_keyword_report_tmp')),
                staging_columns=get_search_term_ad_keyword_report_columns()
            )
        }}
    from base
),

final as (
    
    select 
        cast(ad_group_id as {{ dbt.type_string() }}) as ad_group_id,
        ad_keyword_status,
        campaign_budget_amount,
        campaign_budget_currency_code,
        campaign_budget_type,
        cast(campaign_id as {{ dbt.type_string() }}) as campaign_id,
        clicks,
        cost,
        date as date_day,
        impressions,
        keyword_bid,
        cast(keyword_id as {{ dbt.type_string() }}) as keyword_id,
        search_term,
        targeting

        {{ fivetran_utils.fill_pass_through_columns('amazon_ads__search_term_ad_keyword_passthrough_metrics') }}
    from fields
)

select *
from final
