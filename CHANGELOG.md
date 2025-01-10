# dbt_amazon_ads_source version.version

## Documentation
- Added Quickstart model counts to README. ([#23](https://github.com/fivetran/dbt_amazon_ads_source/pull/23))
- Corrected references to connectors and connections in the README. ([#23](https://github.com/fivetran/dbt_amazon_ads_source/pull/23))

# dbt_amazon_ads_source v0.4.0
[PR #21](https://github.com/fivetran/dbt_amazon_ads_source/pull/21) includes the following updates:

## Feature Update: Conversion support
- We have added conversion metrics by default to the following staging models:
  - `stg_amazon_ads__ad_group_level_report`
  - `stg_amazon_ads__advertised_product_report`
  - `stg_amazon_ads__campaign_level_report`
  - `stg_amazon_ads__targeting_keyword_report`
  - `stg_amazon_ads__search_term_ad_keyword_report`

- The conversion metrics are the following:
  - `purchases_30_d`: Number of attributed conversion events occurring within 30 days of an ad click.
  - `sales_30_d`: Total value of sales occurring within 30 days of an ad click.
- To bring in other conversion fields (`purchases_same_sku_30_d`, `sales_14_d`, etc.), please refer to our [passthrough column variables](https://github.com/fivetran/dbt_amazon_ads_source?tab=readme-ov-file#passing-through-additional-metrics).

## Under the hood: Backwards compatibility
- In the event that you were already passing the above fields in via our [passthrough columns](https://github.com/fivetran/dbt_amazon_ads_source?tab=readme-ov-file#passing-through-additional-metrics), the package will dynamically avoid "duplicate column" errors.
- This was done via the new `amazon_ads_fill_pass_through_columns` and `amazon_ads_add_pass_through_columns` macros to ensure that the new conversion fields are backwards compatible with users who have already included them via passthrough fields.

> The above new field additions are **breaking changes** for users who were not already bringing in conversion fields via passthrough columns.

## Contributors
- [Seer Interactive](https://www.seerinteractive.com/?utm_campaign=Fivetran%20%7C%20Models&utm_source=Fivetran&utm_medium=Fivetran%20Documentation)

# dbt_amazon_ads_source v0.3.0
[PR #17](https://github.com/fivetran/dbt_amazon_ads_source/pull/17) includes the following updates:
## Feature update 🎉
- Unioning capability! This adds the ability to union source data from multiple amazon_ads connectors. Refer to the [Union Multiple Connectors README section](https://github.com/fivetran/dbt_amazon_ads_source/blob/main/README.md#union-multiple-connectors) for more details.

## Under the hood 🚘
- Updated tmp models to union source data using the `fivetran_utils.union_data` macro. 
- To distinguish which source each field comes from, added `source_relation` column in each staging model and applied the `fivetran_utils.source_relation` macro.
- Updated tests to account for the new `source_relation` column.

# dbt_amazon_ads_source v0.2.0
[PR #11](https://github.com/fivetran/dbt_amazon_ads_source/pull/11) includes the following updates:
## 🚨 Breaking changes
- This release is labeled breaking to reflect the Fivetran Amazon Ads connector's upgrade from version 2 to 3 of the Sponsored Products API. Further details are also available in the [June 2023 release notes](https://fivetran.com/docs/applications/amazon-ads/changelog#june2023).
- Removed:
  - Columns `campaign_type`, `daily_budget`, `placement`, and `premium_bid_adjustment` from the `campaign_history` table.
 ## 🎉 Features
- Added:
  - Columns `native_language_locale` to the `keyword_history` table.
  - Columns `budget`, `budget_type`, and `effective_budget` to the `campaign_history` table.
- Updated documentation with descriptions of the new columns.
 ## 🚘 Under the Hood
- Any `id` fields that were not already data type STRING have been casted to STRING. This ensures smoother joins in downstream models.
- `get_*_column` macros now set the data type of the `id` column from INTEGER to STRING.
- Updated testing seed data to reflect the column changes.
- Updated discrepancies between seed data and documentation.

[PR #8](https://github.com/fivetran/dbt_amazon_ads_source/pull/8) includes the following updates:
- Incorporated the new `fivetran_utils.drop_schemas_automation` macro into the end of each Buildkite integration test job.
- Updated the pull request [templates](/.github).

# dbt_amazon_ads_source v0.1.1
## Bug Fixes
- The `portfolio_history` source config has been adjusted to be more accurate and allow for full project compilation in dbt-core >=1.4.0. ([#5](https://github.com/fivetran/dbt_amazon_ads_source/pull/5))

# dbt_amazon_ads_source v0.1.0
🎉 This is the initial release of this package! 🎉
## 📣 What does this dbt package do?
- Materializes [Amazon Ads staging tables](https://fivetran.github.io/dbt_amazon_ads_source/#!/overview/amazon_ads_source/models/?g_v=1&g_e=seeds), which leverage data in the format described by [this ERD](https://fivetran.com/docs/applications/amazon-ads#schemainformation). These staging tables clean, test, and prepare your Amazon Ads data from [Fivetran's connector](https://fivetran.com/docs/applications/amazon-ads) for analysis by doing the following:
  - Names columns for consistency across all packages and for easier analysis
  - Adds freshness tests to source data
  - Adds column-level testing where applicable. For example, all primary keys are tested for uniqueness and non-null values.
- Generates a comprehensive data dictionary of your Amazon Ads data through the [dbt docs site](https://fivetran.github.io/dbt_amazon_ads_source/).
- These tables are designed to work simultaneously with our [Amazon Ads transformation package](https://github.com/fivetran/dbt_amazon_ads).
- For more information refer to the [README](/README.md).
