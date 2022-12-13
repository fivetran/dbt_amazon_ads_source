
with base as (

    select * 
    from {{ ref('stg_amazon_ads__product_ad_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__product_ad_history_tmp')),
                staging_columns=get_product_ad_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
[0m03:17:57          _fivetran_synced,
        ad_group_id,
        asin,
        campaign_id,
        creation_date,
        id,
        last_updated_date,
        serving_status,
        sku,
        state
    from fields
)

select *
from final
