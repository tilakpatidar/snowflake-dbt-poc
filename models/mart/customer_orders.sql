with customer as (
    select *
    from {{ ref('stg_customer') }}
),
orders as (
select
    *
from {{ ref('stg_orders') }}
    ),
    state_map as (
select
    *
from {{ ref('stg_state') }}
    ),
    final as (
select
    customer.customer_unique_id,
    orders.order_id,
    case
    orders.order_status
    when 'delivered' then 1
    else 0
    end
    as order_status,
    state_map.state_name,
    case when greatest(
    case when order_purchase_timestamp is null then '1900-01-01 00:00:00' else order_purchase_timestamp end,
    case when order_approved_at is null then '1900-01-01 00:00:00' else order_approved_at end,
    case when order_delivered_carrier_date is null then '1900-01-01 00:00:00' else order_delivered_carrier_date end,
    case when order_delivered_customer_date is null then '1900-01-01 00:00:00' else order_delivered_customer_date end,
    case when order_estimated_delivery_date is null then '1900-01-01 00:00:00' else order_estimated_delivery_date end
    ) = '1900-01-01 00:00:00' then null else greatest(
    case when order_purchase_timestamp is null then '1900-01-01 00:00:00' else order_purchase_timestamp end,
    case when order_approved_at is null then '1900-01-01 00:00:00' else order_approved_at end,
    case when order_delivered_carrier_date is null then '1900-01-01 00:00:00' else order_delivered_carrier_date end,
    case when order_delivered_customer_date is null then '1900-01-01 00:00:00' else order_delivered_customer_date end,
    case when order_estimated_delivery_date is null then '1900-01-01 00:00:00' else order_estimated_delivery_date end
    ) end as updated_at
from orders
    inner join customer
on orders.customer_order_id = customer.customer_order_id
    inner join state_map on customer.customer_st = state_map.st
    )
select *
from final
