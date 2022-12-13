
with base as (

    select * 
    from {{ ref('stg_amazon_ads__ad_group_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__ad_group_history_tmp')),
                staging_columns=get_ad_group_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
[0m03:17:34          _fivetran_synced,
        campaign_id,
        creation_date,
        default_bid,
        id,
        last_updated_date,
        name,
        serving_status,
        state
    from fields
)

select *
from final
