with
    fonte_categoria_produto as (
        select *
        from {{ source('erp_adventure-works', 'PRODUCTCATEGORY') }}
    )

    , renomeacao as (
        select 
         cast (PRODUCTCATEGORYID as int) as pk_categoria_produto
         , cast (NAME as varchar) as nome_categoria_produto
        from fonte_categoria_produto
    )

select * 
from renomeacao