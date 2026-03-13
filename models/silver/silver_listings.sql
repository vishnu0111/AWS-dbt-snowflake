{{
  config(
    materialized = 'incremental',
    unique_key = 'listing_id'
  )
}}

select 
    listing_id,
    host_id,
    PROPERTY_TYPE,
    room_type,
    city,
    country,
    accommodates,
    bedrooms,
    bathrooms,
    price_per_night,
    
    {{ tag ('CAST(price_per_night AS INTEGER)')}} as price_category,
    created_at
from {{ ref("bronze_listings")}}
