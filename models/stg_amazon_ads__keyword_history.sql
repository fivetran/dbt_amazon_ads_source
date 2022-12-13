
with base as (

    select * 
    from {{ ref('stg_amazon_ads__keyword_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__keyword_history_tmp')),
                staging_columns=get_keyword_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
[0m03:17:46          _fivetran_synced,
        ad_group_id,
        bid,
        campaign_id,
        creation_date,
        id,
        keyword_text,
        last_updated_date,
        match_type,
        native_language_keyword,
        serving_status,
        state
    from fields
)

select *
from final
