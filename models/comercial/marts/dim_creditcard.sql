with 
    int_creditcard as (
        select *
        from {{ ref('int_creditcard') }}
    )

select *
from int_creditcard