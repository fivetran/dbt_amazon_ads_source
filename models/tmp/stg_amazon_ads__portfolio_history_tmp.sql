{{ config(enabled=var('amazon_ads__portfolio_history_enabled', True)) }}

select * 
from {{ var('portfolio_history') }}
