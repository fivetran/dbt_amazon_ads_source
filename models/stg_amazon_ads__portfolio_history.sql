{{ config(enabled=fivetran_utils.enabled_vars(['ad_reporting__amazon_ads_enabled','amazon_ads__portfolio_history_enabled'])) }}

with base as (

    select * 
    from {{ ref('stg_amazon_ads__portfolio_history_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_amazon_ads__portfolio_history_tmp')),
                staging_columns=get_portfolio_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_synced,
        budget_amount,
        budget_currency_code,
        budget_end_date,
        budget_policy,
        budget_start_date,
        creation_date,
        id as portfolio_id,
        in_budget,
        last_updated_date,
        name as portfolio_name,
        profile_id,
        serving_status,
        state
    from fields
)

select *
from final
