with 
    int_data as (
        select *
        from {{ ref('int_date') }}
    )
select *
from int_data