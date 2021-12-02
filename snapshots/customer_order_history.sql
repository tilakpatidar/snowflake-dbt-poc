{% snapshot customer_order_history %}

{{
    config(
      target_database='test',
      target_schema='public',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select *
from {{ source('public', 'customer_orders') }}

{% endsnapshot %}