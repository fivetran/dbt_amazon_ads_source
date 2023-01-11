{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

with base as (

    select * 
    from {{ var('profile') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(
                    source('amazon_ads', var('amazon_ads_profile_identifier', 'profile'))
                    ),
                staging_columns=get_profile_columns()
            )
        }}
    from base
),

final as (
    
    select 
        id as profile_id,
        account_id,
        account_marketplace_string_id,
        account_name,
        account_sub_type,
        account_type,
        account_valid_payment_method,
        country_code,
        currency_code,
        daily_budget,
        timezone,
        _fivetran_deleted
    from fields
)

select *
from final
