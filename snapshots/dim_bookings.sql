{% snapshot dim_bookings %}

{{
    config(
        target_schema='gold',
        target_database='airbnb',
        unique_key='booking_id',
        strategy='timestamp',
        updated_at='created_at',
        dbt_valid_to_current="TO_TIMESTAMP('9999-12-31')"
    )
}}

select *
from {{ ref('bookings') }}

{% endsnapshot %}