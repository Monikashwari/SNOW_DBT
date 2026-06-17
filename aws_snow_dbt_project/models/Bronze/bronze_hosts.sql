{# {% set increament_load = 1%}
{%set increament_col = CREATED_AT%}

select * from {{source('staging','hosts')}}

{%if increament_load == 1%}
       WHERE {{increament_col}} > (select coalesce(max({{increament_col}}),'1990-01-01') from {{ref('bronze_hosts')}}) 
{%endif%} #}

{{
  config(
    materialized = 'incremental',
    )
}}
select * from {{source('staging','hosts')}}

{% if is_incremental() %}
       WHERE CREATED_AT > (select coalesce(max(CREATED_AT),'1990-01-01') from {{this}}) 
{%endif%}
