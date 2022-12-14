{{ config(enabled=fivetran_utils.enabled_vars(['ad_reporting__amazon_ads_enabled','amazon_ads__portfolio_history_enabled'])) }}

select * 
from {{ var('portfolio_history') }}
