{{ config(enabled=fivetran_utils.enabled_vars(['ad_reporting__amazon_ads_enabled','amazon_ads__portfolio_history_enabled'])) }}

with base as (

    select * 
    from {{ var('portfolio_history') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=get_relation_cols(var('portfolio_history')),
                staging_columns=get_portfolio_history_columns()
            )
        }}
    from base
),

final as (
    
    select 
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
        state,
        row_number() over (partition by id order by last_updated_date desc) = 1 as is_most_recent_record
    from fields
)

select *
from final
