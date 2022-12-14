{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

select * 
from {{ var('keyword_history') }}
