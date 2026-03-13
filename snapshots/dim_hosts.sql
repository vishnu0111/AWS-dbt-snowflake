{% snapshot dim_hosts %}

{{
    config(
        target_schema='gold',
        target_database='airbnb',
        unique_key='host_id',
        strategy='timestamp',
        updated_at='host_since',
        dbt_valid_to_current="TO_TIMESTAMP('9999-12-31')"
    )
}}

select *
from {{ ref('hosts') }}

{% endsnapshot %}