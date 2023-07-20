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
