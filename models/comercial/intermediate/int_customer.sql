with
    customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )

select *
from customer