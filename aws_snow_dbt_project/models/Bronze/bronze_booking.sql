{% set increament_load = 1 %}
{%set increament_col = 'CREATED_AT' %}

select * from {{source('staging','bookings')}}

{%if increament_load == 1 %}
       WHERE {{increament_col}} > (select coalesce(max({{increament_col}}),'1900-01-01') from {{this}} ) 
{%endif%}

{# {{
  config(
    materialized = 'increamental',
    )
}}
select * from {{source('staging','bookings')}}

{% if is_incremental() %}
       WHERE {{CREATED_AT}} > (select coalesce(max({{CREATED_AT}}),'1990-01-01') from {{ref('bronze_booking')}}) 
{%endif%} #}
