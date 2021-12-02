select customer_order_id,
       customer_unique_id,
       customer_zip_code_prefix,
       customer_city,
       customer_st
from {{ ref('customer') }}