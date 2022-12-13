{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ ref('stg_amazon_ads__campaign_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__campaign_history_tmp')),
                staging_columns=get_campaign_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        bidding_strategy,
        campaign_type,
        creation_date,
        daily_budget,
        end_date,
        id as campaign_id,
        last_updated_date,
        name as campaign_name,
        placement,
        portfolio_id,
        premium_bid_adjustment,
        profile_id,
        serving_status,
        start_date,
        state,
        targeting_type
    from fields
)

select *
from final
