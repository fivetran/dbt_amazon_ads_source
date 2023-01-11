{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ source('amazon_ads','campaign_history') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(source('amazon_ads','campaign_history')),
                staging_columns=get_campaign_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
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
        targeting_type,
        row_number() over (partition by id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
