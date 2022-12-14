{{ config(enabled=var('ad_reporting__amazon_ads_enabled', True)) }}

select * 
from {{ var('search_term_ad_keyword_report') }}
