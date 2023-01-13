{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}
with base as (

    select * 
    from {{ var('ad_group_level_report') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=get_relation_cols('ad_group_level_report'),
                staging_columns=get_ad_group_level_report_columns()
            )
        }}
    from base
),

final as (
    
    select 
        ad_group_id,
        campaign_bidding_strategy,
        clicks,
        cost,
        date as date_day,
        impressions

        {{ fivetran_utils.fill_pass_through_columns('amazon_ads__ad_group_passthrough_metrics') }}
    from fields
)

select *
from final
