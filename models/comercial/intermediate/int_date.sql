with 
    data as (
        select *
        from {{ ref('sgt_erp_date') }}
    )

select *
from data