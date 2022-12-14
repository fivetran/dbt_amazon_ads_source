{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

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
        ad_group_id,
        asin,
        campaign_id,
        creation_date,
        id as ad_id,
        last_updated_date,
        serving_status,
        sku,
        state,
        row_number() over (partition by id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
