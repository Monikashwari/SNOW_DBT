{% snapshot dim_listings %}

    {{
        config(
            schema='gold',
            database='AIRBNB',
            unique_key='LISTING_ID',
            strategy='timestamp',
            updated_at='LISTING_CREATED_AT',
            dbt_valid_to_current="to_date('9999-12-31')"
        )
    }}

    select * from {{ ref('listings') }}

{% endsnapshot %}