{{ config (materialized = 'ephemeral') }}

with hosts as 
(
    select 
        host_id,
        host_name,
        host_since,
        is_superhost,
        RESPONSE_RATE_QUALITY,
        HOSTS_CREATED_AT
    from {{ ref('obt') }}
)
select * from hosts