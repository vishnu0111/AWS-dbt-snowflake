{% snapshot dim_listings %}

{{
    config(
        target_schema='gold',
        target_database='airbnb',
        unique_key='listing_id',
        strategy='timestamp',
        updated_at='listings_created_at',
        dbt_valid_to_current="TO_TIMESTAMP('9999-12-31')"
    )
}}

select *
from {{ ref('listings') }}

{% endsnapshot %}