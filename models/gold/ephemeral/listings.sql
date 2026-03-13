{{config (materialized ='ephemeral')}}

with listings as 
(
    select 
        listing_id,
        property_type,
        room_type,
        city,
        country,
        price_per_night,
        listings_created_at
    from {{ ref('obt') }}
)

SELECT * FROM listings