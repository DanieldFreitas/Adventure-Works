with
    int_salesreason as (
        select *
        from {{ ref('int_salesreason') }}
    )

select *
from int_salesreason