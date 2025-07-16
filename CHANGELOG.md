[PR #25](https://github.com/fivetran/dbt_amazon_ads_source/pull/25) includes the following updates:

### Under the Hood - July 2025 Updates

- Updated conditions in `.github/workflows/auto-release.yml`.
- Added `.github/workflows/generate-docs.yml`.
- Added `+docs: show: False` to `integration_tests/dbt_project.yml`.
- Migrated `flags` (e.g., `send_anonymous_usage_stats`, `use_colors`) from `sample.profiles.yml` to `integration_tests/dbt_project.yml`.
- Updated `maintainer_pull_request_template.md` with improved checklist.
- Refreshed README tag block:
  - Standardized Quickstart-compatible badge set
  - Left-aligned and positioned below the H1 title.
- Updated Python image version to `3.10.13` in `pipeline.yml`.
- Added `CI_DATABRICKS_DBT_CATALOG` to:
  - `.buildkite/hooks/pre-command` (as an export)
  - `pipeline.yml` (under the `environment` block, after `CI_DATABRICKS_DBT_TOKEN`)
- Added `certifi==2025.1.31` to `requirements.txt` (if missing).
- Updated `.gitignore` to exclude additional DBT, Python, and system artifacts.

# dbt_amazon_ads_source v0.5.0

[PR #24](https://github.com/fivetran/dbt_amazon_ads_source/pull/24) includes the following updates:

## Breaking Change for dbt Core < 1.9.6
> *Note: This is not relevant to Fivetran Quickstart users.*

Migrated `freshness` from a top-level source property to a source `config` in alignment with [recent updates](https://github.com/dbt-labs/dbt-core/issues/11506) from dbt Core. This will resolve the following deprecation warning that users running dbt >= 1.9.6 may have received:

```
[WARNING]: Deprecated functionality
Found `freshness` as a top-level property of `amazon_ads` in file
`models/src_amazon_ads.yml`. The `freshness` top-level property should be moved
into the `config` of `amazon_ads`.
```

**IMPORTANT:** Users running dbt Core < 1.9.6 will not be able to utilize freshness tests in this release or any subsequent releases, as older versions of dbt will not recognize freshness as a source `config` and therefore not run the tests.

If you are using dbt Core < 1.9.6 and want to continue running Amazon Ads freshness tests, please elect **one** of the following options:
  1. (Recommended) Upgrade to dbt Core >= 1.9.6
  2. Do not upgrade your installed version of the `amazon_ads_source` package. Pin your dependency on v0.4.0 in your `packages.yml` file.
  3. Utilize a dbt [override](https://docs.getdbt.com/reference/resource-properties/overrides) to overwrite the package's `amazon_ads` source and apply freshness via the [old](https://github.com/fivetran/dbt_amazon_ads_source/blob/main/models/src_amazon_ads.yml#L11-L13) top-level property route. This will require you to copy and paste the entirety of the `src_amazon_ads.yml` [file](https://github.com/fivetran/dbt_amazon_ads_source/blob/main/models/src_amazon_ads.yml#L4-L369) and add an `overrides: amazon_ads_source` property.

## Under the Hood
- Updated the package maintainer PR template.

## Documentation
- Corrected references to connectors and connections in the README. ([#23](https://github.com/fivetran/dbt_amazon_ads_source/pull/23))
- Updated LICENSE.
- Updated README headers.

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
