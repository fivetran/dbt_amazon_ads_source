{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

select * 
from {{ var('ad_group_level_report') }}
