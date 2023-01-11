{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ source('amazon_ads','ad_group_history') }}
),

fields as (
    
    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(source('amazon_ads','ad_group_history')),
                staging_columns=get_ad_group_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        campaign_id,
        creation_date,
        default_bid,
        id as ad_group_id,
        last_updated_date,
        name as ad_group_name,
        serving_status,
        state,
        row_number() over (partition by id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
