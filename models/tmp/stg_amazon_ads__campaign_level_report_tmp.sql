{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

select * 
from {{ var('campaign_level_report') }}
