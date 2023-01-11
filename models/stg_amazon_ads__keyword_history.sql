{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ var('keyword_history') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(
                    source('amazon_ads', var('amazon_ads_keyword_history_identifier', 'keyword_history'))
                    ),
                staging_columns=get_keyword_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        ad_group_id,
        bid,
        campaign_id,
        creation_date,
        id as keyword_id,
        keyword_text,
        last_updated_date,
        match_type,
        native_language_keyword,
        serving_status,
        state,
        row_number() over (partition by id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
